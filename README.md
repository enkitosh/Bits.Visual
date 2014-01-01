Bits.Visual
==================

Binary conversion and representation

Examples
-------

Represent single decimal number in base 16

    reprSingle 20 Hex
    >>> [ 14 ] : 20
    
Console prints out [ number^base ] : Original Value

This can be handy when printing out lists

Use any of the shortcut functions 

    ...(b8L, b16L, b32L) for different byte representation
    
    b8L [ 22, 29, 33, 95, 88, 110, 221 ]
    >>> 
        [ 00010110 ] : 22
        [ 00011101 ] : 29
        [ 00100001 ] : 33
        [ 01011111 ] : 95
        [ 01011000 ] : 88
        [ 01101110 ] : 110
        [ 11011101 ] : 221

Likewise you can use single byte representation
with more bits involved. Bit8 is just the default
so reprSingle x Binary will always only print 8 bits.
but you can use

    b16 222
    >>> [ 0000000011011110 ] : 222
    b32 292292929
    >>> [ 00010001011011000000100101000001 ] : 292292929




