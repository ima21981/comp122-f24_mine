# COMP122 Lecture Notes: Nov 05, 2024

## Announcements:

   1. No class on Monday, Nov 11
      - Veterans Day

   1. Name: nextInt (atoi)
      - Status: Assigned
      - Deliverable ID: 44-
      - Invitation URL: https://classroom.github.com/a/HaJo4HOr
      - Due Date: Nov 17 23:59 PDT
        - you have two weeks, but don't procrastinate
        - work on the java code ASAP to make sure you understand
          - the specification,
          - the solution, and
          - the associated material

  

## Today's Agenda:

  1. Lecture
     * Walk through of the 44-nextInt Spec

     * Syscalls: read(file, buff, size) and read_s(buff, size)

     * A.length and A.indexOf into MIPS

     * More examples on Strings

  1. Lab: 
     * Pick up where we leave off


## Questions from Last Lecture/Lab, etc.:
   * M/W

   * T/R


## Any Review?

---
# Today's Lecture Material

   1. Walk through of the 44-nextInt Spec
      1. Base N to Base 10 Examples:
         - 16#   3C2 

           |   v   | = |   v   | * 16   + | digit_10 | glyph | code |
           |------:|:-:|------:|:--------:|---------:|:-----:|:----:|
           |    3  | = |   0   | * 16   + |    3     |   3   |  51  |
           |   60  | = |   3   | * 16   + |   12     |   C   |  67  |
           |  962  | = |  60   | * 16   + |    2     |   2   |  50  |
  
           Answer: 962
 

      ```java
      public static int nextInt (int radix) {
          int number;
          int digit;
      
          digit = glyph2int(radix);
          for(number=0; digit != -1 ;) {
            number = (number * radix) + digit ; 
            digit = glyph2int(radix);
          }
      
          return number;
      }
      ```


   1. Syscalls: read(file, buff, size) and read_s(buff, size)

      - man 2 read
        ```java
        char [] buffer = new char[256];

        mips.read(0, buffer, 256);
        bytes_read = mips.retval();
        ```

      - man fgets
        ```java
        char [] buffer = new char[n];

        mips.read_s(buffer, n);      // Follows semantics of UNIX 'fgets'.  
        //   Reads at most n-1 characters. 
        //   A newline ('\n') is placed as the last character read, and then
        //   it is padded with a null character ('\0').
        //   If n = 1, input is ignored, and a null byte written to the buffer.
        //   If n <=1, input is ignored, and nothing is written to the buffer.
        // The return value is a void.
        ```

     * A.length and A.indexOf into MIPS
       - A.length
         ```java
         for(i=0;   ; i++){
            if (A[i] == '\0') break;
         }
         return i;
         ```
   
         ```java tac
         init: ;
               i=0;
         loop: for(;   ;){
                  v = A[i];
                  if (v == '\0') break loop;
                  i++;
                  continue loop;
               }
         done: ;
               return i;
         ```

         - mips version: see format-encodings/length.s

       - A.indexOf
         ```java        
         match:  for(i=0; ; i++) {
                   v = A[i];
                   if (v =='\0') break match;
                   if (v ==  c ) break match;
                 }
         ```           

          ```java tac       
          init:   i = 0; 
          match:  for(; ;) {
                     v = A[i];
                     if (v =='\0') break match;
                     if (v ==  c ) break match;
                     i++;
                  }
          done:  ;
          ```     
          - mips version: see format-encodings/indexOf.s      

     * More examples on Strings
       1. Macros for ASCII Chars (https://www.javatpoint.com/java-string-touppercase)

 

# Today's Lab Material

  1. Pickup where we leave off


---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


