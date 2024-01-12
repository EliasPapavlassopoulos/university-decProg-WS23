{-# LANGUAGE TemplateHaskell #-}

module Rename
  ( testRename
  , --rename,
  )
where

import Data.List (intersect, nub)

import Test.QuickCheck

-- Properties

{- Uncomment this to test the properties when all required functions are implemented

-- All variables in the renamed rule are fresh
prop_1 :: [VarName] -> Rule -> Bool
prop_1 xs r = null (allVars (rename xs r) `intersect` allVars r)

-- All variables in the renamed rule are not in the blocklist
prop_2 :: [VarName] -> Rule -> Bool
prop_2 xs r = null (allVars (rename xs r) `intersect` xs)

-- The number of variable names in the renamed rule equals number of variable names in the original rule
prop_3 :: [VarName] -> Rule -> Bool
prop_3 xs r = length (nub (allVars (rename xs r))) == length (nub (allVars r))

-}

-- Run all tests
testRename :: IO ()
testRename = undefined