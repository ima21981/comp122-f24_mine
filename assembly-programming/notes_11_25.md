# COMP122 Lecture Notes: Nov 25, 2024

## Announcements:
   1. M/T : Lecture on Subroutine Construction
   1. W : Asynchronous Lecture
      - Big O notation 
      - Multiplication
      - See Notes_11_19.md
      - See video #video 


## Today's Agenda:
   1. Subroutine Construction

   1. (some) Time to work on 40-


## Questions from Last Lecture/Lab, etc.:
   * M/W 

   * T/R 

## Any Review?

---
# Today's Lecture Material

  1. Branch and Jump instructions
     - Branch: `b{cond} $reg0, $reg1, label`
       -  conditional, relative change in the PC
         * `b label` :  `beq $zero, $zero, label`
      - label is encoded as +/- 2^16

     - Jump: `j label`, `jr $reg`, and `jal label`, `jalr $reg`
       - unconditional, absolute change in the PC


  1. Macro review: (see macros_stack.pdf)
     - Definition: one or more statements that are expanded in place

     - Defining a macro "name"
     ```
     .macro name( arg_0, ... arg_n-1)
     .end macro
     ```

     - Example Usage:
       ```
       # average                  # $t0 = ($t1 + t2 ) >> 1;
       average $t0, $t1, $t2      # Used as a pseudo instruction
       average ($t1, $t2)         # Used to mimic a subroutine call
       move $t0, $v0         
       ```


 1. Subroutine Construction
    - The call macro:
      ```mips
      .macro call(%sub, %arg0)
        save_state()
        push $a0
        move $a0, %arg0
        jal %sub
        pop $a0
        restore_state()
      .end_macro
      ```

    - Elements of the Call Macro:
      * Use of $a{0..3} and $v{0,1} registers
      * Push and Pop
      * Jump and Link (jal)
      * save_state and restore_state

  1. Consider:  bit2int and binary2int
     ```
     bit2int:       nop            # public static int bit2int() {
            # a0
            # a1
            # a2
            # a3
            # v0: {return value}

            # t0: value             # int value;
            # t1: result            # int result;
            # t2: ascii_0           # int ascii_0;
            # t3: ascii_1           # int ascii_1;

            ...
            move $v0, result
            jr $ra
 
     binary2int:     nop           # public static int binary2int () {
            # a0
            # a1
            # a2
            # a3
            # v0: {return value}
            # t0: digit            #  int digit;
            # t1: number           #  int number;
            # t2: neg_one          #  int neg_one;

            ...
            call bit2int 
            move $t0, $v0
            ...

            jr $ra
          ```


  1. Slide presentation: assembly-programming/slide*/subroutine*.pdf


# Today's Lab Material

  1. Finish and Review Subroutine Construction

  
---
## Resources

   * assembly-programming/slide_presentations/subroutine_construction.pdf

---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  

