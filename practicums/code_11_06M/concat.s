         .text
         .globl concat

         .include "include/stack.s"
         .include "include/syscalls.s"

         .data
A:       .asciiz "this is a string;"    #   char[] A = string2charArray("this is a string;");
B:       .asciiz "and so is this"       #   char[] B = string2charArray("and so is this");
C:       .space 256                     #   char[] C = new char[256];

         .text

concat:     nop                     # public static int concat() {


            # t0: i                 #   int i;
            # t1: j                 #   int j;
            # t2: v                 #   char v;

                                    #   //string copy
l1_i:       nop                     #   ; 
            li $t0, 0               #   i=0;         
l1:         nop                     #   for(; ;) {
              lbu $t2,  A($t1)      #      v = A[i];
            

              sb $t2, C($t1)        #      C[i] = v;
            
              beq $t2, $zero, l1_d  #      if ( v == '\0' ) break;
              addi $t0, $t0, 1      #      i++;
            b l1                    #      continue l1;
                                    #   }
l1_d:       nop                     #   ;

                                    #   ////  string append
l2_i:       nop                     #   ;
            li $t1, 0               #   j = 0;
l2:         nop                     #   for(;  ;) {
              lbu $t2, B($t1)       #      v = B[j];

              sb $t2, C($t1)        #      C[i] = v;

              beq $t2, $zero, l2_d  #      if (v == '\0' ) break;
              addi $t1, $t1, 1      #      j++;
              addi $t0, $t0, 1      #      i++;
            b l2                    #      continue l2;
                                    #   }
l2_d:       nop                     #   ;       
            print_si(C)              #   mips.print_s(C);
            print_ci('\n')          #   mips.print_ci('\n');
            move $v0, $t0           #   return i;
            jr $ra
                                    # }






