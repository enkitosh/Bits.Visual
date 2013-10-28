module Data.Bits.Visual where

import Numeric
import Data.Char
import Data.Bits


{-	Visual 	-}

represent :: String -> IO ()
represent str = (putStr . format) str
	where format x = "[ " ++ x ++ " ]\n"

representL :: [String] -> IO () 
representL xs = mapM_ (putStr . format) xs
	where format x = "[ " ++ x ++ " ]\n" 

showSingleAtBase :: Integer -> Integer -> String
showSingleAtBase b x = showIntAtBase b intToDigit x ""

-- base -> [List] -> [Result : @base]
showAtBaseL :: Integer -> [Integer] -> [String]
showAtBaseL b = map (\x -> showIntAtBase b intToDigit x "")

sd :: String -> Int -> Int
sd str n = n - length str

fill :: Int -> String
fill n = concat (take n $ repeat "0") 


-- This is to return fixed length of bits
showWithNrOfBits :: Int -> String -> String
showWithNrOfBits n xs = fill(sd xs n) ++ xs

showWithNrOfBitsL :: Int -> [String] -> [String]
showWithNrOfBitsL n xs = map (\x -> fill (sd x n)  ++ x) xid
	where xid = xs


{-   Helpers   -}

-- Perform bit operation on a list
-- function
-- list
-- element (if any) to map against
bitL :: Bits a => (t -> a -> b) -> [a] -> t -> [b]
bitL f xs d =  map((f) d) xs


-- Convert binary representation of strings to Integers
cnvrtBinL :: [String] -> [Integer]
cnvrtBinL [] = [] 
cnvrtBinL xs = map read xs
