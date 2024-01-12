module SLD
  ( SLDTree (..),
    -- sld,
    -- Strategy,
    -- dfs,
    -- bfs,
    -- solveWith,
  )
where

import Base.Type
import Subst

-- Data type for an SLD tree
data SLDTree = SLDTree Goal [(Subst, SLDTree)]
  deriving (Show)