{-# LANGUAGE TemplateHaskell #-}

module Visual where


import Numeric
import Data.Char
import Data.Bits

{-	Visual 	-}

-- | ByteSize determines how many visual bits
--   used to represent an Integer
data ByteSize  = Bit8  | Bit16  | Bit32      deriving Show

-- | Base ---------------------------
data Base      = Binary | 
                 Dec    | 
                 Hex    | 
                 Oct    
                 deriving Show
-------------------------------------

-- | ShowBit. data type for visual representation
--   from converting between bases
-- * The actual number to represent
-- * Maybe ByteSize - if we're showing bits
-- * base
data ShowBit   = ShowBit {
                   nr  :: Integer 
                  ,btSz :: (Maybe ByteSize)
                  ,base :: Base
                 }
                 deriving Show


getBase :: Base -> Integer
getBase Binary = 2
getBase Oct    = 8
getBase Dec    = 10
getBase Hex    = 16

-- The default ShowBit value
-- Takes an Integer x and converts to binary
-- Shows with 8 bits representation
defShowBit :: Integer -> ShowBit
defShowBit x = ShowBit x (Just Bit8) Binary
---------------------------------------

-- bitsIO, gets a value to represent
-- and a showBit (Example: bitsIO 1 Bit8 Dec >>> [00000001])
bitsIO :: ShowBit -> IO ()
bitsIO sb = represent (getBase (base sb)) (nr sb)

represent :: Integer -> Integer -> IO ()
represent b str = (putStr . format) xstr
	where format x = "[ " ++ x ++ " ]\n"
              xstr = showSingleAtBase b str

-- base - list -> result IO()
-- for the moment, call replist
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

