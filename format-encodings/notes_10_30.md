# COMP122 Lecture Notes: October 30, 2024

## Announcements:

   1. "To solve a problem, you often have to change your perspective."  

   1. I had an epiphany (a moment of sudden revelation or insight)
      - related to explaining the if, if-else, transformation
      - prior approach: 
        - keep it simple: just use the 'if-else' statement
        - make the 'if' statement a special case
      - new approach: 
        - focus on a chain of "if else-if" statements
        - thus unifing all conditional statements into one approach
   1. What does this mean?
      * I changed to the TAC transform algorithm for Conditional Statements
      * New files:
        - reference/TAC2mips_revised.md
        - reference/TAC_transformation/conditional2TAC.md

   1. Recall Last time
      * Practicum
        - int bit2int()
        - int binary2int()
        - Manual Testing:
          - echo 0 | java_subroutine bit2int

## Today's Agenda:

  1. Lecture
     1. Conditional statement transformation into TAC form
        * If_then, if_then_else, if_else-if_else Statements

     1. switch/case statement 
        * Is this not a Conditional statement?

     1. Practicum
        - int glyph2int()
        - int nextInt(int radix);

  1. Lab: 
     * Continue the Practicum

## Questions from Last Lecture/Lab, etc.:
   * M/W
     - Why is code_10_28 private?   
       * Error on my part... Fixed!
     - 

   * T/R
     - Will the old way work on if-then-else still work?  Yes. 

## Any Review?

---
# Today's Lecture Material

  1. Lecture
     1. Practicums: 
        * Versions
          - the Prof's version
            ```bash
            cd ~/classes/comp122/practicums
            git clone git@github.com:COMP122/code_10_30.git 
            git clone git@github.com:COMP122/code_10_31.git 
            ```

     1. Conditional Transformation
        - a review or update (well update)

        - rewrite bit2int into tetrad2int
          * tetrad: a group of four: 0, 1, 2, 3

          1. sequence of if-then-else statements

             ```java  
             mips.read_c();
             digit = mips.retval();
             
             if (digit == '0') {
               value = 0;
             } else {
               if (digit == '1') {
                 value = 1;
               } else {
                 if (digit == '2') {
                   value = 2;
                 } else {
                   if (digit = '3') {
                     value = 3;
                   } else {
                     value = -1
                   }
                 }
               }
             }
             return value;
             ```

          1. change my style
             ```java
             if (digit == '0') {
               value = 0;
             } 
             else 
             if (digit == '1') {
                 value = 1;
             } 
             else 
             if (digit == '2') {
                 value = 2;
             } 
             else 
             if (digit = '3') {
                 value = 3;
             } 
             else {
               value = -1
             }       
             ````

        - transformation into java tac
          * updated on Oct 31
          * Note treating else-if in a special way
            * consider it one keyword...
            * but put them on two different lines
            * associated a label with the 'if' statement

          ```java tac
          init:     ;
          cond:     if (digit == '0') {
          next_0:     ;
                      value = 0;
                      break cond;
                    } 
                    else 
          next_1:   if (digit == '1') {
                      value = 1;
                      break cond;
                    } 
                    else 
          next_2:   if (digit == '2') {
                      value = 2;
                      break cond;
                    } 
                    else 
          next_3:   if (digit == '3') {
                      value = 3;
                      break cond;
                    } 
                    else {
          next_4:     ;                      
                      value = -1
                      break cond;
                   }
          next_5:  ;
          done:    ;     
          ```
          * note the locations of:
            - next_0 and next_4
            - next_1, next_2, next_3
            

     1. Java switch/case statement
        - reference/TAC_transformation/switch.png
        - Example
          ```java
           switch(expression) {
                   
             case x:
                 ; // code block
                 break; 
                   
             case y:
                 ; // code block
                 break;

             case z:
                 ; // code block
                 break;
                   
             default:
                 ;    // code block
                 break;
            }
          ```

        - Java TAC transformation
          - blocks:
            * init
            * body
            * done
            * each "case"
          - mips.next("{value}")
          - mips.merge("{value}") 
          - Example:
            ```java tac
            init:  ;
                   {var} = expression;
            split: switch( {var} ) {
                   
                      case x:
                          mips.next("y");
                          ; // code block
                          break split; 
                          mips.merge("y");
                            
                      case y:
                          mips.next("default");
                          ; // code block
                          break split;
                          mips.merge("default");

                      default:
                          ;    // code block
                          break split;
                     }
            done:  ; 
            ```

     1. C Switch Statement
        ```c
        switch (input) {
          case '0'...'9' :   digit = input - '0';
                             break;

          case 'A'...'Z' :   digit = input - 'A' 
                             digit = input + 10;
                             break;

          case 'a'...'z' :   digit = input - 'a' 
                             digit = input + 10;
                             break;
          default:           digit = -1;
        }
        if (digit > (radix - 1)) {
          digit = -1;
        }
        return digit;
        ```

        - Java Equivalent Statement (partially done)

          ```java
          switch (input) {

              case '0':
              case '1':
              case '2':
              case '3':
              case '4':
              case '5':
              case '6':
              case '7':
              case '8':
              case '9':   digit = input - '0';
                                 break;

              case 'A'...'Z' :   digit = input - 'A' 
                                 digit = digit + 10;
                                 break;

              case 'a'...'z' :   digit = input - 'a' 
                                 digit = digit + 10;
                                 break;

              default:           digit = -1;
          }
          ```


        - Java Rewrite with in_range
          * in_range(value, '0', '9')

          ```java
          if ('0' <= input <= '9') {
             digit = input - '0';
          }
          else if ('A' <= input <= 'Z') {
             digit = input - 'A';
             digit = digit + 10;

          }
          else if('a' <= input <= 'z') {
             digit = input - 'a';
             digit = digit + 10;
          }
          else {
            digit = -1;
          }
          ```

     1. Practicum
        - int glyph2int(int radix);
          - reads an ASCII char
          - returns 
            * 0 if '0'
            * 1 if '1'
            * etc.
            * -1 otherwise

        - int nextInt(int radix);   (deferred)
          - returns number
          ```psudeo 
          number = number * radix + glyph2int(radix)
          ```

 
# Today's Lab Material

  1. Continuation of Practicum

---
## Resources

  1. Previous
     * reference/TAC_transformation.md
     * reference/TAC2mips.md

  1. Rework for Conditional
     * reference/TAC2mips_revised.md
     * reference/TAC_transformation/conditional2TAC.md

---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


