# COMP122 Lecture Notes: Nov 19, 2024

## Announcements:
   1. None

## Today's Agenda:

## Questions from Last Lecture/Lab, etc.:
   * M/W
     - none

   * T/R
     - none


## Any Review?

---

## Today's Agenda:
   1. Syscalls for reading aggregate data

   1. Big 0 notation

   1. Multiplication



## Questions from Last Lecture/Lab, etc.:
   * M/W 
     - none

   * T/R 
     - none


---
# Today's Lecture Material

   1. Review Syscalls for reading aggregate data
      -  bytes_read = read_s(buffer, bytes_requested)
      -  bytes_read = read(fd, buffer, bytes_requested)

         - bytes_read:  if < 0, error
         - bytes_read:  if == 0, no more data to read
         - bytes_read:  if <= bytes_read, success


  1. Big 0 notation
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
  - play with utf8 and/or base64
  

---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  

