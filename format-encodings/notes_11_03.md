# COMP122 Lecture Notes: October 30, 2024

## Announcements:

   1. More Grading Done
      - make test_{task}    -- to run your code in the current state
      - make confirm_{task} -- to run the Prof's view of your code

## Today's Agenda:

  1. Lecture
     * Strings and Arrays

  1. Lab: 
     * Complete last Practicum
     * Refactor NextInt to read a string
     * And then

## Questions from Last Lecture/Lab, etc.:
   * M/W

   * T/R


## Any Review?

---
# Today's Lecture Material

  1. Arrays: 
     - Memory is an array of bytes!
     - Hence, we are talking about memory
     - A reference is stored in a register
       * A refence is either an address (lval) or a label
     - Consider the memory below:
       1. What is the value stored in memory at location `0x0100 000A`: 
          - 
       1. What is the label associated with location `0x0100 0005` in memory
          - 
       1. What is the lval associated with `B`:  
          - 
       1. What is the rval associated with `B`:
          - 
       1. What is the rval associated with `D[0]`:
          - 
       1. What is the rval associated with `A[3]`:
          - 
       1. What is the lval associated with `A[-3]`:

       | labels | memory     | address     |   
       |--------|-----------:| ------------|   
       |        | 253 (0xfd) | 0x0100 000A |   
       | C:     |  42 (0x2a) | 0x0100 0009 |   
       |        |   0 (0x00) | 0x0100 0008 |   
       | A:     |   1 (0x01) | 0x0100 0007 |   
       |        |   2 (0x02) | 0x0100 0006 |   
       | D:     |   3 (0x03) | 0x0100 0005 |   
       |        |  77 (0x49) | 0x0100 0004 |   
       | B:     | 202 (0xca) | 0x0100 0003 |   
       |        |  54 (0x36) | 0x0100 0002 |   
       |        | 123 (0x7b) | 0x0100 0001 |   


  1. MIPS Operations:
       ```mips
            .data           # MIPS is Little Endian
            .byte 123
            .byte 54
       B:   .byte 202, 77
       D:   .byte 3, 2
       A:   .byte 1, 0
       C:   .byte 42, 253     

            .text
            la $t0, B
            lb $t1, 0($t0)   #  $t1 == 0xFF FF FF ca
            lh $t2, 0($t0)   #  $t2 == 0x00 00 49 ca
            lw $t3, 0($t0)   #  $t3 == 0x02 03 49 ca
            lbu $t4, 0($t0)  #  $t4 == 0x00 00 00 ca
       ```

  1. Array Indexing
     - x = A[imm];
       - load the address of A into a register: `la $t0, A`
       - "load" "byte" into the register:       `lbu x, imm($t0)`

     - x = A[i];
       - load the address of A into a register:  `la $t0, A`
       - add the index to the address of A:      `add $t0, $t0, i`
       - "load" "byte" into the register:        `lbu x, 0($t0)`

   
   | TAC String Equations          | MIPS Instruction          |
   |-------------------------------|---------------------------|
   | `x = A[imm];`                 | `la p, A`                 |
   |                               | `lbu x, imm(p)`           |
   |                               |                           |
   | `x = A[v];`                   | `la p, A`                 |
   |                               | `add p, p, v`             |
   |                               | `lbu x, 0(p)`             |
   |                               |                           |
   | `A[imm] = x;`                 | `la p, A`                 |
   |                               | `sb x, imm(p)`            |
   |                               |                           |
   | `A[v] = x;`                   | `la p, A`                 |
   |                               | `add p, p, v`             |
   |                               | `sb x, 0(p)`              |
   |                               |                           |
   | `p = & A;`                    | `la p, A`                 |
   | `x = (* p);`                  | `lbu x, 0(p)`             |
   | `(* p) = x;`                  | `sb x, 0(p)`              |

   - Pointer Notation:
     - `p = & A;`  :  `&A`    == lval(A) == A.lval()
     - `x = (* p)` :  `(* p)` == rval(p) == p.rval();


  1. Java String Processing: three independent types
     1. A string is an object that contains an array of characters
     1. A string is an constant array of characters 
     1. A char[] is a fixed sized array of characters

     ```java
      String O = new String( "A string!"); // An object
      String S = "A string!";              // A constant array (+ stuff?)
      char[] A = S.toCharArray();          // An array 
      
      int len_1 = A.length;                // A property: Computed or Stored?
      int len_2 = S.length();
      ```

  1. MIPS Declaration of a String
     ```mips
             .data
     A:     .ascii "A str"
     B:     .ascii "ing!"
            .asciiz "\n"
     Big:   .space 10
     Ints:  .word 4, 5, 6, 7
     ```


   1. Java: A.length  versus  C: strlen(char * A)
      - man strlen
      - man -k string | grep ^str

      ```java
      for(i=0; A[i]!='\0'; i++){
        ;
      }
      
      return i;
      ```

   1. Practicum:  strchr()
     - Prototype: `char[] strchr(char[] A, int c);`
     - Description: locate a char in a string

       ```java
          match:  for(i=0; A[i]!='\0'; i++) {
                    if (A[i] == c) {
                      break match;
                    }
                  }
       ```      

   1. [String Processing](https://docs.google.com/presentation/d/1fg9BuWtyZ9PARK0gDE5ZcbjOiudRSrVP2s1iuSIDYXw/edit#slide=id.g199d0a137fe_0_29)


# Today's Lab Material

  1. Complete last Practicum
  1. Refactor NextInt to read a string
  1. Macros for ASCII Chars (https://www.javatpoint.com/java-string-touppercase)


---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


