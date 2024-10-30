# COMP122 Lecture Notes: October 30, 2024

## Announcements:
   1. I had an epiphany (a moment of sudden revelation or insight)
      - related to explain the if, if-else, transformation
      - prior approach: 
        - keep it simple: just use the 'if-else' statement
        - make the 'if' statement a special case
      - new approach: 
        - focus on a chain of "if else-if" statements
        - thus unifing all conditional statements into one approach
   1. What does this mean?
      * A change to the TAC transform algorithm for Conditional Statements
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
     1. Conditional transformation from Java --> Java TAC
        * If_then, if_then_else, if_else-if_else Statements

     1. switch/case statement

     1. Practicum
        - int glyph2int()
        - int nextInt(int radix);

  1. Lab: 
     * Continue the Practicum

## Questions from Last Lecture/Lab, etc.:
   * M/W

   * T/R

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
             ```

          1. change my style
             ```java
             ````

        - transformation into java tac
          ```java tac

          ```


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
                          mips.next(y);
                          ; // code block
                          break split; 
                          mips.merge(y);
                            
                      case y:
                          mips.next("default");
                          ; // code block
                          break;
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
          case '0'...'9' :   digit = digit - '0';
                             break;

          case 'A'...'F' :   digit = digit - 'A' 
                             digit = digit + 10;
                             break;

          case 'a'...'f' :   digit = digit - 'a' 
                             digit = digit + 10;
                             break;
          default:           digit = -1;
        }
        if (digit > (radix - 1)) {
          digit = -1;
        }
        return digit;
        ```

        - Java Equivalent Statement

       ```java
       ```


        - Java Rewrite with in_range
          * in_range(value, '0', '9')


     1. Practicum
        - int glyph2int(int radix);
          - reads an ASCII char
          - returns 
            * 0 if '0'
            * 1 if '1'
            * etc.
            * -1 otherwise
        - int nextInt(int radix);
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


