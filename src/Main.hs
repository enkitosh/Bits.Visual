-- | Main entry point to the application.
module Main where

import           Visual

-- | The main entry point.
main :: IO ()
main = do
    let x   = 144 :: Integer
    -- Represent single number as Hex
    -- represent :: base -> Integer -> Result :: String
    represent 16 x
    --Operate on a list
    let lis = [201..210 :: Integer]
    representL 2 lis
    putStrLn "Done"
