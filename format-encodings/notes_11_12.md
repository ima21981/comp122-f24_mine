# COMP122 Lecture Notes: Nov 12, 2024

## Announcements:

   1. No class on Monday, Nov 11
      - Veterans Day

   1. Exam 20-
      - Nov 20, & 21, 2024
      - During lecture session, 75 minutes. 
      - Follow the process, it is part of the exam
      - Coverage:  Format and Encodings
      - Study Guide: The one you been preparing
      - Focus: 
         - homework assignments
         - lecture material
         - concepts covered by programming assignments
      - DRES accommodations: see me

   1. Quiz 30-
      - Follow the process, it is part of the quiz
      - Released at 18:59 PST on Dec 6 (Friday)
        * URL Invitation link posted on #fitzgerald-f24
      - Closed at 23:59 PST on Dec 8 (Sunday)
      - Time limit: 60 minutes.
        * you are responsible for timing yourself
      - DRES accommodations:
        * make sure you inform me out of band

   1. Exam 40-, a take home programming assignment
      - Assignment walk through on Nov 20 & 21
      - Follow the process, it is part of the exam
      - Due Dec 10 23:59 PST


## Today's Agenda:

  1. Lecture
     * Binary Numbers and Binary Encodings Recap

     * Base64 (see slides)

  1. Practicum Base64

## Questions from Last Lecture/Lab, etc.:
   * M/W
     - none

   * T/R
     - none


## Any Review?

---
# Today's Lecture Material

  1. Binary Numbers and Binary Encodings Recap
     - 8# - 752, - 0752, - 0o752,
       - 2# - 000 111 101 010
       -      111 000 010 101  // 1's complement
       -      111 000 010 110  // 2's complement
       -      not applicable   // binary encoding

     - 4# + 32103
       - 2# 00 00 00 11 10 01 00 11               
       -    00 00 00 11 10 01 00 11   // 1's complement
       -    00 00 00 11 10 01 00 11   // 2's complement
       -    00 00 00 11 10 01 00 11   // binary encoding

     - 16# - 7F2.3A
       - 2#  - 0111 1111 0010 . 0011 1010
       -     - 01 . 11 1111 0010 0011 1010  x 2^1010    // 10
       - binary32:
         - pattern: | s | eeee eeee | mmmm mmmm mmmm mmmm mmmm mmm |
         - sign:  '-' ->  1
         - mantissa: 1111 1100 1000 1110 1000 000
           - . 11 1111 0010 0011 1010 0000 0
           - ^ implicit
         - exponent: 10 + 127 == 137 
           ```
            0 1111 1100
              0111 1111
           +  0000 1010
              ---------
              1000 1001      Notice: 128 + (10 - 1)
            ```
      - pattern:  | s | eeee eeee | mmmm mmmm mmmm mmmm mmmm mmm |
      - encoding: | 1 | 1000 1001 | 1111 1100 1000 1110 1000 000 |


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
                  1000 0101        # Notice: 128 + (6 - 1)
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

     - format-encodings/slide_presentations/base64-encoding.pdf


# Today's Lab Material

  1. Practicum Base64

  


---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


