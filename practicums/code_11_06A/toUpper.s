          .globl toUpper

          .data
C:        .space 256                      # static char[] C = new char[256];


          .text
          .include "include/stack.s"
          .include "include/syscalls.s"

          .eqv  true 1


toUpper:  nop                           # public static int toUpper(char[] A) {
          # a0: &A
          # t0: i                       #   int i;
          # t1: value                   #   char value;
          # t2: unicode;                #   int unicode;
          # t3: b;                      #   boolean b;
          # t4: b1;                     #   boolean b1;
          # t5: b2;                     #   boolean b2;
          # ------------
          # t6: p
   
tini:     nop                           #   ;
          li $t0, 0                     #   i=0;
rof:      nop                           #   for(; ;) {

            move $t6, $a0               #      value = A[i];
            add  $t6, $t6, $t0
            lbu $t1, 0($t6)

            sge $t4, $t1, 'a'           #      b1 = value >= 'a';
            sle $t5, $t1, 'z'           #      b2 = value <= 'z';
            and $t3, $t4, $t5           #      b  = b1 && b2;

fi:         beq $t3, $zero, fi_done     #     if ( b != false) {
fi_next_0:    nop                       #        ;   
              subi $t2, $t1, 'a'        #        unicode = value - 'a'; 
              addi $t2, $t2, 'A'        #        unicode = unicode + 'A';
              move $t1, $t2             #        value = (char) unicode;
            b fi_done                   #        break fi_done;
                                        #      }
fi_next_1:  nop                         #      ;
fi_done:    nop                         #      ; 

            # lbu $t1, C($t1)           #      C[i] = value;
            la $t6, C
            add $t6, $t6, $t0
            sb $t1, 0($t6)


            beq $t1, $zero, enod       #      if (value == '\0') break rof;

            addi $t0, $t0, 1            #      i++;
          b rof                         #      continue rof;
                                        #   }
enod:                                   #   ;            

          print_si(C)                   #   mips.print_s(C);
          print_ci('\n')                #   mips.print_ci('\n');
          move $v0, $t0                 #   return i;
          jr $ra 

                                        # }