{-# LANGUAGE ScopedTypeVariables #-}

module Base.Parser
  ( parse, parseFile
  ) where

import Control.Exception (SomeException, catch)

import Data.Functor
import Data.Maybe

import Text.Parsec hiding (parse)

import Base.Type

-- Type class for parsing
class Parse a where
  parse :: String -> Either String a

-- Try to parse a goal
instance Parse Goal where
  parse = adjustErrorMessage . simpleParse goal
    where adjustErrorMessage (Left e) = Left ("Parse error (goal" ++ drop 19 e)
          adjustErrorMessage r        = r

-- Try to parse a program
instance Parse Prog where
  parse = simpleParse prog

-- Try to parse a file
parseFile :: Parse a => FilePath -> IO (Either String a)
parseFile fn =
  let f = reverse . dropWhile (== ' ')
  in catch (parse <$> readFile (f (f fn)))
       (\ (_ :: SomeException) -> return (Left "Could not read file."))

-- INTERNAL

-- Parser type
type Parser a = Parsec String () a

-- Apply a parser to a string
simpleParse :: Parser a -> String -> Either String a
simpleParse p =
  either (Left . ("Parse error " ++) . show) Right . runParser p () ""

-- Parse a goal
goal :: Parser Goal
goal = Goal <$> (whitespaces *>
  (try ((: []) <$> var <* symbol ".") <|> commaSep lit <* symbol ".") <* eof)

-- Parse a program
prog :: Parser Prog
prog = Prog <$> (whitespaces *> many rule <* eof)

-- Parse a rule
rule :: Parser Rule
rule = Rule <$> lhs <*> rhs

-- Parse the left hand side of a rule
lhs :: Parser Term
lhs = try (parens lhs) <|> comb

-- Parse the right hand side of a rule
rhs :: Parser [Term]
rhs = symbol "." $> [] <|> symbol ":-" *> commaSep lit <* symbol "."

-- Parse a literal
lit :: Parser Term
lit = try (parens lit) <|> comb

-- Parse a term
term :: Parser Term
term = parens term <|> var <|> list <|> comb

-- Parse a variable term
var :: Parser Term
var = Var <$> varName

-- Parse a variable name
varName :: Parser VarName
varName = VarName <$>
  ((:) <$> upper <*> many (letter <|> digit <|> char '_') <|>
    (:) <$> char '_' <*> many1 (letter <|> digit <|> char '_')) <* whitespaces

-- Parse a list
list :: Parser Term
list = symbol "[" *> whitespaces *> do
  let nil = Comb "[]" []
      cons x xs = Comb "." [x, xs]
  try (flip (foldr cons) <$> term `sepBy1` symbol "," <* symbol "|" <*>
        term <* symbol "]") <|>
    foldr cons nil <$> commaSep term <* symbol "]"

-- Parse a combination term
comb :: Parser Term
comb = do
  f <- atom
  args <- fromMaybe [] <$> optionMaybe (parens (commaSep term))
  whitespaces
  pure (Comb f args)

-- Parse an atom
atom :: Parser String
atom = (:) <$> lower <*> many (letter <|> digit <|> char '_') <|>
  number <|> (many1 (oneOf "+-*/<=>'\\:.?@#$&^~") <?> "symbol")

-- Parse a number
number :: Parser String
number = try ((:) <$> char '-' <*> (try float <|> int)) <|> try float <|> int
  where float = (++) <$> int <*>
          ((:) <$> char '.' <*> (reverse . trim . reverse <$> many1 digit))
        int   = trim <$> many1 digit
        trim  = show . (read :: String -> Integer)

-- Parse a symbol
symbol :: String -> Parser ()
symbol s = string s *> whitespaces

-- Parse a comment
comment :: Parser ()
comment = () <$ (char '%' *> many (noneOf "\n") *> char '\n') <?> "comment"

-- Parse whitespaces or a comment
whitespaces :: Parser ()
whitespaces =  skipMany (() <$ space <|> comment)

-- Parse a list separated by commas
commaSep :: Parser a -> Parser [a]
commaSep p = p `sepBy` symbol ","

-- Parse something enclosed in parentheses
parens :: Parser a -> Parser a
parens = between (symbol "(") (symbol ")")
