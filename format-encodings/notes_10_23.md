# COMP122 Lecture Notes: October 23, 2024

## Announcements:
   1. https://www.csun.edu/~steve/classes/integers-conversion-encoding/
      - student proceduced
      - errors in the floating point page



## Today's Agenda:

  1. Lecture
     1. Review Conversions between Bases
     1. Mathematical Review 
        - Base 10
        - Base 2

  1. Lab: 
     1. Integer Representations:
     1. Binary Addition
     1. Binary Subtraction (via 2's complement)


## Questions from Last Lecture/Lab, etc.:
   * M/W
     - What is a binary real?
       * real number in base 2  2# 101011110.0101101011

   * T/R
     - nothing.


---
# Today's Lecture Material
  1. Review
     - Conversions between Bases:
       - Power's of two
         * Convert to base 2^1  (lookup table)
         * Convert to base 2^N  (reverse lookup table)
       - Base N to Base 10
         * Expanded Notation


       - 16# 3E5.34E  ->

       |glyph| digit_10 |          |     |     |
       |-----|----------|----------|-----|-----|
       |   3 |   3      | * 16^ 2  |  =  |     |
       |   E |  14      | * 16^ 1  |  =  |     |
       |   5 |   5      | * 16^ 0  |  =  |     |
       |   3 |   3      | * 16^ -1 |  =  |     |
       |   4 |   4      | * 16^ -2 |  =  |     |
       |   E |  14      | * 16^ -3 |  =  |     |
                                         _______
             sum                         |     |

       - 16# 3E5  ->

       |   v   | = |   v   | * 16   + | digit_10 | glyph | code |
       |------:|:-:|------:|:--------:|---------:|:-----:|:----:|
       |       | = |   0   | * 16   + |    3     |    3  |      |
       |       | = |       | * 16   + |   14     |    E  |      |
       |       | = |       | * 16   + |    5     |    5  |      |

       Answer:      

       - Base 10 to Base N (whole)
         * successives integer division of N: 
           - number / N = quotient, remainder
         * remainders form the number
          - concatation in reverse order of remainder
       - Base 10 to Base N (fraction)
         * successives multiplications N: 
           - number * N = overflow, product
         * overflows form the number
           - concatation in order of overflows
         * if number == dddd, then max = 1, 0000


 - Example: 0.7543 -> 4# 0.3001

   ```response
    number =   7543
    max =  1,  0000
       7543 * 4 = 3, 0172 
       0172 * 4 = 0, 0688
       0688 * 4 = 0, 2752
       2752 * 4 = 1, 1008

    answer: 3001     (read overflows from top to bottom)
   ```

- Example: 0.7543 -> 2# 0.1100 000000 1
  ```response
     number =   7543
     max =  1,  0000
        7543 * 2 = 1, 5086
        5086 * 2 = 1, 0172
        0172 * 2 = 0, 0344
        0344 * 2 = 0, 0688
        0688 * 2 = 0, 1376

     answer: 1100 000000 1   (read overflows from top to bottom)
  ```

  * into Scientific Notation: 2# 0.1100 000000 1
    - 1.100 000000 1  x 2^ - 1
    - | 0 | 0xxx xxxx | 100 000000 1 000000000000000000.. |
      - -1 + 127 == 126 

  1. Base 10: Mathematical Review
     - see slides: base10-mathematical-review.pdf 
 


  1. Base 2: 
     1. Java `unsigned int X;` 
        - Nope does not have it
        - Use the next size up!
        - But if it did!
          * nibble| 1/b byte |       |         | 0 .. 2^4 -1  | 0 to 15
          * unsigned char    | .byte | 1 byte  | 0 .. 2^8 -1  | 0 to 255  
          * unsigned short   | .half | 2 bytes | 0 .. 2^16 -1 | 0 .. 64K 
          * unsigned int     | .word | 4 bytes | 0 .. 2^32 -1 | 0 .. 4GB  

     1. Java: `int X;`
        - nibble| 1/b byte |        | -  2^3 ..  2^3 -1 | -8 to 7
        - byte  | 1 byte   | .byte  | -  2^7 ..  2^7 -1 | -128 to 127
        - char  | 2 bytes  | .half  | - 2^15 .. 2^15 -1 | -32,768 to 32,767
        - short | 2 bytes  | .half  | - 2^15 .. 2^15 -1 | -32,768 to 32,767
        - int   | 4 bytes  | .word  | - 2^31 .. 2^31 -1 | -2,147,483,648 to 2,147,483,647
        - long  | 8 bytes  | .dword | - 2^63 .. 2^63 -1 | 


     - Encoding Tables:  Signed and Unsign Numbers: Prep
       - Half the range is giving to negative numbers

       |  # |  binary number | unsigned |   1's  |   2's  | bias 8 |
       |---:|:--------------:|:--------:|:------:|:------:|:------:|
       | -8 |   2# - 1000    |   ---    |  ----  |  1000  |  0000  |
       | -7 |   2# - 0111    |   ---    |  1000  |  1001  |  0001  |
       | -6 |   2# - 0110    |   ---    |  1001  |  1010  |  0010  |
       | -5 |   2# - 0101    |   ---    |  1010  |  1011  |  0011  |
       | -4 |   2# - 0100    |   ---    |  1011  |  1100  |  0100  |
       | -3 |   2# - 0011    |   ---    |  1100  |  1101  |  0101  |
       | -2 |   2# - 0010    |   ---    |  1101  |  1110  |  0110  |
       | -1 |   2# - 0001    |   ---    |  1110  |  1111  |  0111  |
       | -0 |      --        |          |        |        |        |  
       |  0 |   2# + 0000    |  0000    |  0000  |  0000  |  1000  |
       |  1 |   2# + 0001    |  0001    |  0001  |  0001  |  1001  |
       |  2 |   2# + 0010    |  0010    |  0010  |  0010  |  1010  |
       |  3 |   2# + 0011    |  0011    |  0011  |  0011  |  1011  |
       |  4 |   2# + 0100    |  0100    |  0100  |  0100  |  1100  |
       |  5 |   2# + 0101    |  0101    |  0101  |  0101  |  1101  |
       |  6 |   2# + 0110    |  0110    |  0110  |  0110  |  1110  |
       |  7 |   2# + 0111    |  0111    |  0111  |  0111  |  1111  |
       |  8 |   2# + 1000    |  1000    |  ---   |  ----  |        |
       |  9 |   2# + 1001    |  1001    |  ---   |  ----  |        |
       | 10 |   2# + 1010    |  1010    |  ---   |  ----  |        |
       | 11 |   2# + 1011    |  1011    |  ---   |  ----  |        |
       | 12 |   2# + 1100    |  1100    |  ---   |  ----  |        |
       | 13 |   2# + 1101    |  1101    |  ---   |  ----  |        |
       | 14 |   2# + 1110    |  1110    |  ---   |  ----  |        |
       | 15 |   2# + 1111    |  1111    |  ---   |  ----  |        |

       |  # |  binary number | unsigned |   1's  |   2's  | bias 8 |
       |---:|:--------------:|:--------:|:------:|:------:|:------:|  
       | -8 |   2# - 1000    |   ---    | ----   |        |        |
       | -7 |   2# - 0111    |   ---    |        |        |        |
       | -6 |   2# - 0110    |   ---    |        |        |        |
       | -5 |   2# - 0101    |   ---    |        |        |        |
       | -4 |   2# - 0100    |   ---    |        |        |        |
       | -3 |   2# - 0011    |   ---    |        |        |        |
       | -2 |   2# - 0010    |   ---    |        |        |        |
       | -1 |   2# - 0001    |   ---    |        |        |        |
       | -0 |      --        |          |        |        |        |  


     - see slides: base2-encoding-and-mathematical-operations.pdf



# Today's Lab Material

  1. Integer Representations:
     * Java `unsigned int X;` 
       - Nope does not have it
       - Use the next size up!
       - But if it did!
         * unsigned char  | .byte | 1 byte  | 0 .. 2^8-1   | 0 to 255  
         * unsigned short | .half | 2 bytes | 0 .. 2^16 -1 | 0 .. 64K 
         * unsigned int   | .word | 4 bytes | 0 .. 2^32 -1 | 0 .. 4GB  


     * Java: `int X;`
       * byte  | 1 byte  | .byte  | -  2^7 ..  2^7 -1 | -128 to 127
       * char  | 2 bytes | .half  | - 2^15 .. 2^15 -1 | -32,768 to 32,767
       * short | 2 bytes | .half  | - 2^15 .. 2^15 -1 | -32,768 to 32,767
       * int   | 4 bytes | .word  | - 2^31 .. 2^31 -1 | -2,147,483,648 to 2,147,483,647
       * long  | 8 bytes | .dword | - 2^63 .. 2^63 -1 | 


  1. Encodings:
     1. One's complement:   ~X
     1. Two's complement:   ~X + 1   ===   - X

     1. 4-bit:

     | number |  unsigned  | 1's comp  | 2's comp  |
     |-------:|:----------:|:---------:|:---------:|
     |    0   |       0000 |      0000 |      0000 | 
     |    3   |       0011 |      0011 |      0011 | 
     |   -3   |       ---- |      1100 |      1101 | 
     |   -8   |       ---- |      ---- |      1000 | 0 1000 --> 1 0111 + 1 
     |   -7   |       ---- |      1000 |      1001 | 
     |    5   |       0101 |      0101 |      0101 | 
     |   -4   |       ---- |      1011 |      1100 |
     |    7   |       0111 |      0111 |      0111 |
     |   -6   |       ---- |      1001 |      1010 |


        - recall the bit pattern is: s xxx
          * 1001 : is a negative number, i.e., -7
            - flip all the bits (0110) and then add one (0111)
          * 0111 : is a positive number, i.e., 7

     1. 8-bit:

        | number |  unsigned  | 1's comp  | 2's comp  |
        |-------:|:----------:|:---------:|:---------:|
        |      0 |  0000 0000 | 0000 0000 | 0000 0000 | 
        |     -8 |  ---- ---- | 1111 0111 | 1111 1000 |      
        |        |            |           |           |      
        |    17  |  0001 0001 | 0001 0001 | 0001 0001 |      
        |   -17  |  ---- ---- | 1110 1110 | 1110 1111 | 
        |   -6   |  ---- ---- | 1111 1001 | 1111 1010 |


        - Notice the pattern for the representation of a negative number within different sizes:
          *   -6 :                                     1010
          *   -6 :                                1111 1010
          *   -6 :                      1111 1111 1111 1010
          *   -6 :  1111 1111 1111 1111 1111 1111 1111 1010

  1. Binary Addition
     * Example 1:

       ```response
         1 1101  1100              <!-- response: carries -->
           1010  1110              <!-- response: op1 encoding -->
         + 0110  0110              <!-- response: op2 encoding -->
         ------  ----          
         1 0001  0100              <!-- response: sum encoding -->

         C: 1; V: 0; S: 0; Z: 0
       ```

     * Example 2:

       ```response
         1 1111  1110              <!-- response: carries -->
           1111  1111              <!-- response: op1 encoding -->
         + 0101  0101              <!-- response: op2 encoding -->
         ------  ----          
         1 0101  0100              <!-- response: sum encoding -->

         C: 1; V: 0; S: 0; Z: 0
        ```

     * Example 3:  0x6F - 0x34
       - + 0x65       :  0110  1111
       - + 0x34       :  0011  0100
       - 1's comp 0x34:  1100  1011
       - 2'2 comp 0x34:  1100  1100
       - - 0x34       :  1100  1100

       ```response
         1 1001  1000              <!-- response: carries -->
           0110  1111              <!-- response: op1 encoding -->
         + 1100  1100              <!-- response: op2 encoding -->
         ------  ----          
         x 0011  1011              <!-- response: sum encoding -->

         C: 1; V: 0; S: 0; Z: 0
       ```

       1. use 2's comp
          ```response
          0 1111  1110              <!-- response: carries -->
            0110  1111              <!-- response: op1 encoding -->
          + 0011  0101              <!-- response: op2 encoding -->
          ------  ----          
          0 1010  0100              <!-- response: sum encoding -->

          C: 0; V: 1; S: 1; Z: 0
          ```

       1. use 1's comp
          ```response
            0 1111  1111              <!-- response: carries -->
              0110  1111              <!-- response: op1 encoding -->
          +   0011  0100              <!-- response: op2 encoding -->
            ------  ----          
            0 1010  0100              <!-- response: sum encoding -->

          C: 0; V: 1; S: 1; Z: 0
          ```

     1.  43 - 56   : -0x 2b - 0x38
         -   43: 0010 1011
         -   56: 0011 1000
         - ~ 56: 1100 0111
         - - 56: 1100 1000

         1. 43 + -56

            ```response
              xxxx xxx0 
              0010 1011
            + 1100 1000 
            ------ ---- 
              xxxx xxxx 

            Final Answer: 
            ```

         1. 43 + ~56 + 1
            ```response
              xxxx xxx1 
              0010 1011
            + 1100 0111
            ------ ---- 
              xxxx xxxx 

            Final Answer: 
            ```



  1. Status Bits: Re-explained
     - ../tidbits/status_bits_explained.gif
     - V = C ^ previous C
     - consider
       ```mips_cli
         (mips) assign $t1, 0x7FFFFFFF
         (mips) addi $t0, $t1, 1
          cin:                   1111 1111 1111 1111 1111 1111 1111 1110; "cin=0"
           t1:     2147483647; 0b0111 1111 1111 1111 1111 1111 1111 1111;
          imm:              1; 0b0000 0000 0000 0000 0000 0000 0000 0001; "1"
                 +   --------- ------------------------------------------
           t0:    -2147483648; 0b1000 0000 0000 0000 0000 0000 0000 0000;

         C: 0; V: 1; S: 1; Z: 0
       ```



  1. Binary Subtraction
     * 0x3F - 0x2F
       * 0x3F + - 0x2F
       * 0x3F:   0011 1111
       * 0x2F:   0010 1111
       * -0x2F : 1101 0001 

     ```response
     x xxxx  xxxx              <!-- response: carries -->
       0011  1111              <!-- response: op1 encoding -->
     + 1101  0001              <!-- response: op2 encoding -->
     ------  ----          
     y yyyy  yyyy              <!-- response: sum encoding -->

     C: ?; V: ?; S: ?; Z: ?
     ```



---
## Resources

  1. Encodings: unsigned, 1's complement, 2's complement, bias 8

   | #  |  binary number | unsigned |   1's  |   2's  | bias 8 |
   |---:|:--------------:|:--------:|:------:|:------:|:------:|
   | -8 |   2# - 1000    |    --    |   --   |  1000  |  0000  |
   | -7 |   2# - 0111    |    --    |  1000  |  1001  |  0001  |
   | -6 |   2# - 0110    |    --    |  1001  |  1010  |  0010  |
   | -5 |   2# - 0101    |    --    |  1010  |  1011  |  0011  |
   | -4 |   2# - 0100    |    --    |  1011  |  1100  |  0100  |
   | -3 |   2# - 0011    |    --    |  1100  |  1101  |  0101  |
   | -2 |   2# - 0010    |    --    |  1101  |  1110  |  0110  |
   | -1 |   2# - 0001    |    --    |  1110  |  1111  |  0111  |
   | -0 |      --        |    --    |  1111  |   --   |   --   |  
   |  0 |   2# + 0000    |   0000   |  0000  |  0000  |  1000  |
   |  1 |   2# + 0001    |   0001   |  0001  |  0001  |  1001  |
   |  2 |   2# + 0010    |   0010   |  0010  |  0010  |  1010  |
   |  3 |   2# + 0011    |   0011   |  0011  |  0011  |  1011  |
   |  4 |   2# + 0100    |   0100   |  0100  |  0100  |  1100  |
   |  5 |   2# + 0101    |   0101   |  0101  |  0101  |  1101  |
   |  6 |   2# + 0110    |   0110   |  0110  |  0110  |  1110  |
   |  7 |   2# + 0111    |   0111   |  0111  |  0111  |  1111  |
   |  8 |   2# + 1000    |   1000   |   --   |   --   |   --   |
   |  9 |   2# + 1001    |   1001   |   --   |   --   |   --   |
   | 10 |   2# + 1010    |   1010   |   --   |   --   |   --   |
   | 11 |   2# + 1011    |   1011   |   --   |   --   |   --   |
   | 12 |   2# + 1100    |   1100   |   --   |   --   |   --   |
   | 13 |   2# + 1101    |   1101   |   --   |   --   |   --   |
   | 14 |   2# + 1110    |   1110   |   --   |   --   |   --   |
   | 15 |   2# + 1111    |   1111   |   --   |   --   |   --   |



---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


