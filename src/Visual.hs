module Visual where


import Numeric
import Data.Char
import Data.Bits

{-	Visual 	-}

-- | ByteSize determines how many visual bits
--   used to represent an Integer
data ByteSize  = Bit8  | Bit16  | Bit32 deriving Show

-- | Bases---------------------------
data Base      = Binary | 
                 Dec    | 
                 Hex    | 
                 Oct    
                 deriving (Show, Eq)
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
defShowBit :: ShowBit
defShowBit  = ShowBit 0 (Just Bit8) Binary
---------------------------------------
--represent
--we use this function as
--base for other functions
represent :: ShowBit -> String
represent sb = do
  format xstr
	where format x    = "[ " ++ zbit ++ x ++ " ]" ++ " : " ++ (show (nr sb))
              xstr    = showSingleAtBase (getBase(base sb)) (nr sb)
              zbit    = fill (zeroOut - (length xstr))
              zeroOut = case(btSz sb) of
                        Just Bit8  -> 8
                        Just Bit16 -> 16
                        Just Bit32 -> 32
                        Nothing    -> 0

reprInt :: ShowBit -> IO ()
reprInt sb = putStrLn $ represent sb

reprSingle :: Integer -> Base -> IO ()
reprSingle i b 
  | b == Binary = reprInt $ ShowBit i (Just Bit8) b
  | otherwise   = reprInt $ ShowBit i Nothing b

-- Construct a list of bits
constructL :: [Integer] -> ShowBit -> [String]
constructL [] _ = [] 
constructL (x:xs) sb = represent (ShowBit x
                                 (btSz sb)
                                 (base sb)) : constructL xs sb

-- represent a binary list, default behaviour
-- shows 8 bits at a time..
representLdef :: [Integer] -> IO ()
representLdef xs = mapM_ putStrLn $ constructL xs defShowBit

representL :: [Integer] -> ShowBit -> IO ()
representL xs sb = mapM_ putStrLn $ constructL xs sb

showSingleAtBase :: Integer -> Integer -> String
showSingleAtBase b x = showIntAtBase b intToDigit x ""

-- base -> [List] -> [Result : @base]
showAtBaseL :: Integer -> [Integer] -> [String]
showAtBaseL b = map (\x -> showIntAtBase b intToDigit x "")

fill :: Int -> String
fill n = replicate n '0'

printBit :: ShowBit -> IO ()
printBit b = putStrLn $ represent b

{-Bunch of wrappers-}

b8 :: Integer -> IO ()
b8 b = printBit $ ShowBit b (Just Bit8) Binary

b16 :: Integer -> IO ()
b16 b = printBit $ ShowBit b (Just Bit16) Binary

b32 :: Integer -> IO ()
b32 b = printBit $ ShowBit b (Just Bit32) Binary

b8L :: [Integer] -> IO ()
b8L b = representL b $ ShowBit 0 (Just Bit8) Binary

b16L :: [Integer] -> IO ()
b16L b = representL b $ ShowBit 0 (Just Bit16) Binary

b32L :: [Integer] -> IO ()
b32L b = representL b $ ShowBit 0 (Just Bit32) Binary

{-   Helpers   -}

-- Perform bit operation on a list
-- function
-- list
-- elements to map against
bitL :: Bits a => (t -> a -> b) -> [a] -> t -> [b]
bitL f xs d =  map((f) d) xs

