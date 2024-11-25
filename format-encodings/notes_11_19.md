# COMP122 Lecture Notes: Nov 19, 2024

## Announcements:
   1. 40- assignment decided
      - formal presentation next Lab
      - you can get a head start today

   1. Today's material is NOT covered on 20-


## Today's Agenda:
   1. Big O notation

   1. Multiplication


## Questions from Last Lecture/Lab, etc.:
   * M/W 
     - none

   * T/R 
     - none

## Any Review?

   - Arrays in MIPS
     - java: x = A[5];  C: x = A[5];
     - Ada : x = A(5);
     - C:  A[5] == 5[A] == &A + 5 == 5 + &A
     - MIPS   
       ```
       move $t0, $a0
       la $t0, A     # &A  lval(A)
       5($t0)
       ```

    - X= pos_msb(a, b, c)  --> call pos_msb a b c
                               move X, $v0 


---
# Today's Lecture Material

  1. Time to Solve a problem:
     - add two numbers together?
     - search for an item in a list?
     - search for an item in an ordered list?
     - sort a list of items?
       - Bucket List
       - Bubble List
       - QuickSort
       - MergeSort
    - add two matrices?
    - multiple two matrices?


  1. Big O notation
     ```gnuplot
     log2(n) = log(n)/log(2)
     plot [x=0:8][y=0:8] x              # O(n)       Search a list
     replot 5                           # O(c)       MIPS R instruction, addition
     plot [x=0:8][y=0:8] log2(x)        # O(log_2 n) Search an ordered list
     plot [x=0:16][y=0:16] x            # O(n)       Search a list
                                        # O(n)       multiplication (n= wordsize)

     replot x * log2(x)  # O(n log_2 n)   Quicksort, Mergesort
     replot x*x          # O(n^2)         BubbleSort
     replot x*x*x        # O(n^3)         Matrix Multiplication
     #                                  ! O(n^x)         NP-hard Traveling Salesman Problem
     ```

     # O(1)           MIPS R instruction, addition
     # O(n)           multiplication (n= wordsize)

     ```
     x = x * 2;    x = x << 1;
     x = x * 4;    x = x << 2;
     x = x * 8;    x = x << 3;
     x = x * 16;   x = x << 4;

     x = x * 10;   x = 8*x + 2*x;   x = (x << 3) + (x << 1 )
     ```

  1. Multiplication
     - Supporting Slides: multiplication.pdf
     - Issues:
       1. Overflow: 
          - Consider: 127 * 127 = 16,129 
            ```java java/mult_size.j
            public static int mult_size() {
               byte a = 127;
               byte b = 127;
               
               byte c = a * b;
               return c;
            }   
            ``` 
          - java_subroutine mult_size
            ```
            mult_size.j:5: error: incompatible types: possible lossy conversion from int to byte
            ```
      
          - Recall: 
            - `byte`  valid range:    -128 to    127  | max 2^7-1
            - `short` valid range: -32,768 to 32,767  | max 2^15 -1

       1. Execution Time:
          - Successive Additions
            - See slide 1
            - java_subroutine mult_loop a b

            ```java java/mult_loop.j
            public static int mult_loop(int a, int b) {
            
                 int $v0 = 0;
                 for(int i = 1 ; i <= b; i++){
            add:       $v0 = $v0 + a;
                 }
                 return $v0;
            }
            ```
          - Notice line: `add` above
            - It is executed `b` times.

  1. Long Multiplication: Base 10
     - See Slide 2
     - View the number as an array of digits;
     
     ```java java/long_mult.j
     public static int long_mult(int a, int b){
       int[] B = digits(b);

       int sum = 0;
       for (int d = 0 ; d < B.length ; d ++ ) {
         sum += a * B[d];
         a = a * 10 ;
       }
       return sum;
     }
     ```

     ```bash
     cd java
     java_subroutine long_mult 23 10
     ```

  1. Long Multiplication: Base 2
     - See Slide 3
     - Leverage:
       - x * 0 == 0
       - x << 1 ==  x * 2
       - x >>> 1 == x / 2

     ```java java/long_mult_bin
     public static int long_mult_bin(int a, int b){
       int[] B = binary_digits(b);
     
       int sum = 0;
       for (int d = 0 ; d < 32 ; d ++ ) {
         if (B[d] == 1) {
           sum += a;
         }
         a = a << 1;
       }
       return sum;
     }
     ```
     ```bash
     cd java
     java_subroutine long_mult_bin 23 10
     ```

  1. Long Multiplication: Base 2
     - See Slide 4
     - View the register as a stack

     ```java java/multiplication.j
     public static int multiplication(int a, int b){
       // Algorithmic Complexity: O(word_size)

       int sum = 0;
       int bit = 0;

       for (; b != 0 ; ) {
         // pop off a bit from b
         bit = b & 0x01;  
         b = b >>> 1;

         if ( bit == 1 ) {
           sum += a;
         }
         a = a << 1;
       }
       return sum;
     }
     ```

     ```bash
     cd java
     java_subroutine multiplication 23 10
     ```


  1. Specialized Hardware (Mult/Add unit)
     - native instructions 
       - mul $t0, $t1   #  {hi, lo} = $t0 *  $t1
       - div $t0, $t1   #  { r,  q} = $t0 / $t1   
       - mfhi $t0       #  $t0 = {hi/r}
       - mflo $t0       #  $t1 = {lo/q}
       - mul a, x ; madd b, x; madd c, x;
         *  `a*x + b*x + c*x` 
     - pseudo instructions
       - mult, div, rem, etc.

# Today's Lab Material

  1. Using a register as a stack!
     - empty:  $t0 == 0
     - pop:    b = $t0 & 0x01, $t0 = $t0 >>> 1
     - push:   $t0 = $t0 << 1, $t0 = $t0 | b

  1. Get a head start on 40-

  1. Create a file, 'play.j' with four methods
     1. public static int loop1();
     1. public static int loop2();
     1. public static int required_bytes(int value);
     1. public static int bytes_to_read(int value);

  1. Initial Specification
     1. loop1:  
        - reads a list of hex values from stdin
          * Stops when you read the value -1
          * validates each value is in the range 0..0x10FFFF 
          - performs the main task
        - returns
          -  0  if all are in the correct range
          - -1 if if NOT all are in the correct range
      
     1. loop2:
        - Same as loop2 but for values in the range 0..2^8-1
        
        
     1. required_bytes(value):
        - copy the pos_msb code from a previous assignment
        - refactor the code to return the number of required bytes, b
          * recall p is the value returned by pos_msb
      
            | Condition | l = length | b = bytes |
            |-----------|-----------:|----------:|
            | p <= 7    |        7   |      1    |
            | p <= 11   |       11   |      2    |
            | p <= 16   |       16   |      3    |
            | p <= 21   |       21   |      4    |
        
      
     1. bytes_to_read(v):
      
        | Condition               | b = bytes |
        |-------------------------|----------:|
        | 0x0000 <= v <=     0x7F |     1     |
        | 0x0080 <= v <=    0x7FF |     2     |
        | 0x0800 <= v <=   0xFFFF |     3     |
        | 0x1000 <= v <= 0x10FFFF |     4     |
        | otherwise               |    -1     |        

  1. Write some test cases for bytes_to_read() and required_bytes:
     - cat bytes_to_read.sth_case
       ```
       [default]
       DRIVER=java_subroutine
       OPTIONS="-L play.j"
       ENTRY=bytes_to_read

       [case]
       ARGS="0"
       EXIT_STATUS=1
       ```

     - cat required_bytes.sth_case
       ```
       [default]
       DRIVER=java_subroutine
       ENTRY=required_bytes
       OPTIONS="-L play.j"

       [case]
       ARGS="0x08FF"
       EXIT_STATUS=3
       ```

  1. Get ready to have test cases for the methods morphed from loop1() and loop2():
     - cat loop1.sth_case
       ```
       [default]
       DRIVER=java_subroutine
       ENTRY=loop1
       OPTIONS="-L play.j"

       [case]
       INPUT="loop1.input"
       EXIT_STATUS=0
       ```

     - cat loop1.input
       ```
       10FFFF 
       ABA
       A2
       FFFFFFFF
       ```
  
---
## Resources

   * format-encodings/slide_presentations/multiplication.pdf

---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  

