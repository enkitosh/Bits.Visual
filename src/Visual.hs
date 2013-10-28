module Visual where


import Numeric
import Data.Char
import Data.Bits

{-	Visual 	-}

represent :: Integer -> Integer -> IO ()
represent b str = (putStr . format) xstr
	where format x = "[ " ++ x ++ " ]\n"
              xstr = showSingleAtBase b str

representL :: Integer -> [Integer] -> IO () 
representL b xs = mapM_ (putStr . format) xlis
	where format x = "[ " ++ x ++ " ]\n"
              xlis = showAtBaseL b xs

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