{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use newtype instead of data" #-}
module Base.Type
  ( VarName (VarName),
    CombName,
    Term (Var, Comb),
    Rule (Rule),
    Prog (Prog),
    Goal (Goal),
  )
where

import Data.List (nub)
import Test.QuickCheck
  ( Arbitrary (arbitrary),
    choose,
    elements,
    frequency,
    suchThat,
  )

-- Data type for variable names
data VarName = VarName String
  deriving (Eq, Ord, Show)

-- Generator for variable names.
-- Variables named '_X' are treated as normal variables, similar to
-- how we renamed anonymous variables in the exercise classes.
instance Arbitrary VarName where
  arbitrary = VarName <$> elements ["A", "B", "_0", "_1"]

-- Alias type for combinators
type CombName = String

-- Data type for terms
data Term = Var VarName | Comb CombName [Term]
  deriving (Eq, Show)

-- Generator for terms
instance Arbitrary Term where
  -- We use `frequency` to generate larger term structures
  -- by choosing variables with less probability than combinators.
  arbitrary = do
    arity <- choose (0, 2)
    frequency
      [ (2, Var <$> arbitrary),
        (3, Comb <$> elements ["f", "g"] <*> replicateM arity arbitrary)
      ]

-- replicateM repeats a monadic action n times and returns a monadic
-- action that produces the list of results.
replicateM :: Monad m => Int -> m a -> m [a]
replicateM 0 _ = return []
replicateM n m = do
  x <- m
  xs <- replicateM (n - 1) m
  return (x : xs)

-- Data type for program rules
data Rule = Rule Term [Term]
  deriving (Show)

-- Generator for rules
instance Arbitrary Rule where
  arbitrary =
    Rule <$> arbitrary <*> (choose (0, 2) >>= \n -> replicateM n arbitrary)

-- Data type for programs
data Prog = Prog [Rule]
  deriving (Show)

-- Data type for goals
data Goal = Goal [Term]
  deriving (Show)