Data.Bits.Visual
==================

Binary conversion and representation

Example
-------

Represent binary from conversion

    Data.Bits.Visual> represent $ showSingleAtBase 2 44
    				> [ 101100 ]


L denotes operation on lists:

	Data.Bits.Visual> let lis = [250 .. 253 :: Integer]
	Data.Bits.Visual> representL $ showWithNrOfBitsL 8 $ showAtBaseL 2 lis
					> [ 11111010 ]
					  [ 11111011 ]
					  [ 11111100 ]
					  [ 11111101 ]

Use any of the Data.Bits functions

	-- Maps bitOperation over a list
	Data.Bits.Visual> let oneToTen = [1..10 :: Integer]
	Data.Bits.Visual> representL $ showAtBaseL 2 (bitL (.&.) oneToTen 1)
					> [ 1 ]
					  [ 0 ]
					  [ 1 ]
					  [ 0 ] ... etc ...



