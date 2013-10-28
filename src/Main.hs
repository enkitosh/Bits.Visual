-- | Main entry point to the application.
module Main where

import           Visual

-- | The main entry point.
main :: IO ()
main = do
    let lis = [201..220 :: Integer]
    representL $ showWithNrOfBitsL 8 $ showAtBaseL 2 lis
    putStrLn "Done"
