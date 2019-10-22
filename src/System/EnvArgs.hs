-- | Source program arguments from the environment in a predictable way.

module System.EnvArgs where

import Data.Char
import Data.List
import System.Environment

-- | Run m with arguments sourced from environment variables starting
-- with PREFIX. Underscores are swapped with hyphens and letters are
-- lower-cased.
withEnvArgs :: String -> IO a -> IO a
withEnvArgs prefix m = do
  env <- getEnvironment
  args <- getArgs
  withArgs
    (args ++
     concatMap
       (\(k, v) -> maybe [] (\arg -> ["--" ++ map rep (map toLower arg), v]) (stripPrefix prefix k))
       env)
    m
  where
    rep ('_') = '-'
    rep c = c
