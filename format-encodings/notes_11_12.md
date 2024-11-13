# COMP122 Lecture Notes: Nov 12, 2024

## Announcements:

   1. No class on Monday, Nov 11
      - Veterans Day


## Today's Agenda:

  1. Lecture
     * Binary Numbers and Binary Encodings Recap

     * Base64 (see slides)

  1. Practicum Base64

## Questions from Last Lecture/Lab, etc.:
   * M/W
     - 

   * T/R
     - 


## Any Review?

---
# Today's Lecture Material

  1. Binary Numbers and Binary Encodings Recap
     -  16# - 45   //  a negative base 16 integer
        - 2# - 0100 0101  // base 2 number -- or binary number
        -      1011 1010  // 1's complement encoding
        -      1011 1011  // 2's complement encoding
        -      Not applicable // binary encoding
     -  8# + 464
        - 2# + 000 100 101 100 // base 2 number -- or binary number
        -      000 100 101 100 // 1's complement encoding
        -      000 100 101 100 // 2's complement encoding
        -      000 100 101 100 // binary encoding

     -  16# - 45.FE // a negative base 16 real number
        - 2# - 0100 0101 . 1111 1110
        -    - 01.00 0101  1111 1110  x 2^ 110  // 6
        - // binary32 encoding
          - | s | eeee eeee | mmmm mmmm mmmm mmmm mmmm mmm |
          - sign: "-" -> 1
          - exponent: 110 : 6 + 127 = 133 
             ``` 
                  1111 1100
                  0111 1111
                + 0000 0110
                -----------
                  1000 0101
             ```  
          - mantissa     .0001 0111 1111 1000 0000 000       
            *            ^  implicit radix point
          - encoding
            - | 1 | 1000 0101 | 0001 0111 1111 1000 0000 000 |



  1. Base64
     - https://docs.google.com/spreadsheets/d/1Jlo2GmWvl4bxlPN9GzXsKnl4acyppBWYQjX2S_Bm9oQ/

     - $ ascii.index \*
     - $ printf "%x\n" $(ascii.index \*)
     - $ base64_char 63

     - format_encodings/slide_presentations/base64-encoding.pdf


# Today's Lab Material

  1. Practicum Base64

  


---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


