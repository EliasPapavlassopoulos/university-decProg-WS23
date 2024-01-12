module Base.IOHelper (flushBuffer, getKeypress) where

import System.IO

-- Flush the output buffer (e.g. to print a prompt)
flushBuffer :: IO ()
flushBuffer = hFlush stdout

-- Get a single keypress without waiting for a newline
getKeypress :: IO Char
getKeypress = do
  hSetBuffering stdin NoBuffering
  c <- getChar
  hSetBuffering stdin LineBuffering
  return c