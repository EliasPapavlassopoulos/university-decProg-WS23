{-# LANGUAGE TemplateHaskell #-}

module Unification
  ( testUnification
  , -- unify
  ) where


import Data.Maybe

import Test.QuickCheck

-- Properties

{- Uncomment this to test the properties when all required functions are implemented

-- Does  a variable occur in a term?
occurs :: VarName -> Term -> Bool
occurs v t = v `elem` allVars t

-- The disagreement set of a term with itself is empty
prop_1 :: Term -> Bool
prop_1 t = isNothing (ds t t)

-- The disagreement set of two different terms is not empty
prop_2 :: Term -> Term -> Property
prop_2 t1 t2 = isJust (ds t1 t2) ==> t1 /= t2

-- If a variable v occurs in a term t (other than the variable itself),
-- then the unification of v and t should fail due to the occur check
prop_3 :: VarName -> Term -> Property
prop_3 v t = occurs v t && t /= Var v ==> isNothing (unify (Var v) t)

-- If two terms t1 and t2 are unifiable, then the disagreement set of the mgu
-- applied to t1 and t2 is empty
prop_4 :: Term -> Term -> Property
prop_4 t1 t2 =
  let mMgu = unify t1 t2
  in isJust mMgu ==> let mgu = fromJust mMgu
                     in isNothing (ds (apply mgu t1) (apply mgu t2))
-}

-- Run all tests
testUnification :: IO Bool
testUnification = undefined