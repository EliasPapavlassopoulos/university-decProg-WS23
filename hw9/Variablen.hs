-- create type VarName
type VarName = String

-- create predefined types Term, Rule, Prog, Goal
newtype Term = Term VarName
newtype Rule = Rule VarName
newtype Prog = Prog VarName
newtype Goal = Goal VarName

-- create type class Vars that return all variables in a data type
class Vars a where
    allVars :: a -> [VarName]
    -- Soll alle in einem Datentyp vorkommenden Variablen zurückgeben (ohne Duplikate)



-- create instance Term for Vars
instance Vars Term where
    allVars (Term x) = [x]

-- create instance Rule for Vars
instance Vars Rule where
    allVars (Rule x) = [x]

-- create instance Prog for Vars
instance Vars Prog where
    allVars (Prog x) = [x]

-- create instance Goal for Vars
instance Vars Goal where
    allVars (Goal x) = [x]


-- define function freshVars that returns a list with variable names that are valid in progl

freshVars :: [VarName]
freshVars = undefined -- soll eine Liste von Variablennamen zurückgeben, die in progl gültig sind