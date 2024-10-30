# Conversion of the Conditional into TAC Style[^1]

[^1 This is result of reworking the if-the-else statement.]

The conditional statement is common to every programming language. It allows one of a series of code blocks to be executed based upon the result of a Boolean expression.  

## The 'if then' Statement

In the simpliest form, there is only one code block--and this form is refered to simply as an if-then statement.  "If" the given Boolean expression is TRUE, "then" the code block is executed.  The following is an example in Java:

  ```java
  if (a <= b) {
    x = a;
  }
  ```

## The 'if then else' Statement

We can extend this statement to provide two code blocks.  In this form, the second code block is executed, as an alternative, when the preceeding Boolean expression is FALSE.  The two code blocks are typically named:
  1. the consquence code block, or simply the `cons`
  1. the alternative code block, or simply the `alt` 

The `cons` block is executed whenever the Boolean expression is evaluated as TRUE, alternatively the `alt` block is executed. 

Consider the following example of an if-then-else statement, and its control flow graph.

  ```java
  if ( a <= b ) {
    a = a + 1;
  } else {
    b = b - a;
  }
  ```

![Control Flow Graph for an if-then-else statement](if-then-else.png)

Notice that the control flow graph depicts a box of code for the entire if-then-else statement, and within this block there is five blocks of code that are directly associated with if-then-else statement.  The names of these blocks are:

  1. {init}: the implicit first line of code executed as part of the if-then-else statement.
  1. {cond}: the block of code associated with the conditional statement.
  1. {cons}: the consequence code block for the if-then-else statement.
  1. {alt}:  the alternative code block for the if-then-else statement.
     * for an if-then statement, this block of code implicitly exists as a `null` block.
  1. {done}: the implicit last line of code executed as part of if-then-else statement.
     * we insert a `null` statement into the statement to explicitly depict this line of code.

Transforming the control flow graph into equivalent code, using the TAC style, results in the following:

  ```java tac
  init:   ;
  cond:   if ( a <= b ) {
  cons:     ;
            a = a + 1;
            break cond;
          } else {
  alt:      ;
            b = b - a;
            break cond;
          }
  done:   ; 
  ```

Notice that labels have been inserted into the code to explicitly denote the start of each block.  Additionally, a `break` statement has been inserted at the end of both the `cons` and `alt` blocks to explicitly indicate the intended control flow. In the example above, the `break cond` statement forces the next line of code to be executed is the line after the instruction named: `cond`.  That is to say, the next line of code to be executed is the line named `done`.

Notice that the semantics of the original Java statement and the resulting statement in TAC form are identical. While the second form (TAC style) is more tedious to write, it is closer to assembly code -- which is our goal.


## The Generalized Conditional Statement

In the most generalized form, the Conditional statement can execute a series of code block. This type of conditional statement is a more readable form then writing a series of embedded if-then-else statements.  Consider the following two examples that are equivalent:

  ```java
  if (a == '3') {
    x = 3;
  } else {
    if ( a == '2') {
      x = 2;
    } else {
      if (a == '1') {
        x = 1;
      } else {
        if (a == '0') {
          x = 0;
        else {
          x = -1;
        }
      }
    }
  }
  ```

  ```java
  if (a == '3') {
    x = 3; 
  }
  else if (a == '2') {
    x = 2;
  } 
  else if (a == '1') {
    x = 1;
  } 
  else if (a == '0') {
    x = 0;
  } 
  else {
    x = -1;
  }
  ```

In the second form, we altered the programming style make the "else if" appear as a special keyword.  Python for example, includes the elif keyword.  In Java, however, this is just a programming style. Under the programming style, we can then more easily convert the conditional statement into the TAC style.  The result TAC code is as follows:

  ```java
  cond:    if (a == '3') {
  next_0:     ;
              x = 3;
              break cond; 
            }
            else if (a == '2') {
  next_1:     ;
              x = 2;
              break cond;
            }     
            else if (a == '1') {
  next_2:     ;
              x = 1;
              break cond;
            }     
            else if (a == '0') {
  next_3:     
              x = 0;
              break cond;
            }     
            else {
  next_4:     ;
              x = -1;
              break cond;
            }
  next_5:   ;
  done:     ;
  ```




## Algorithm: Conditional Statement--> TAC Transformation 

Consider the following code template:

   ```java
   if ( <test 0> ) {
     <consequence block>
     }
   else if (<test 1>) {   
     <alternative block 1>
    ...
    else if (<test n-2>) {
      <alternative block n>
    }
    else {
      <alternative block n-1>
    }
   }
   ```

   1. Insert the {init} label, with a null statement, before the start of the conditional statement

   1. Append the {done} label, with a null statement, after the end of the conditional statement

   1. Prepend the {cond} label on the line that starts the conditional statement

   1. For each of the N code blocks, within the conditional statement:
      1. Insert the {next_n} label, with a null statement, at top of each block.
         - where "n" in the label is the number of the code block from 0..N-1.
      1. Append 'break {cond};' at the end of the code block.
      1. Transform the code within the code block to conform to the TAC style.

   1. After the last code block, and before the {done} label, add the {next_n} label.
      - where "n" is the equal to then number of code blocks.

   1. For each of the `<test n>` expressions, transform them into TAC style
      * If the test expression is of the form `a <comp> b`, you are done!
      * Otherwise, simplify the Boolean expression into three parts
        - evaluate the left-hand side into $l
          - move the evaluation of $l into the {init} block
        - evaluate the right-hand side into $r
          - move the evaluation of $r into the {init} block
        - replace the boolean expression with a simple test: `$l <comp> $r`
          - yielding either:
            *  `cond:  if ( $l <comp> $r ) {` 
            *  `       else if ( $l_n <comp x> $r_n`


Applying the above algorithm results in the following template:

   ```java tac
   init:       ;
               $l = ...;
               $r = ...;
               ... 
   cond:       if ( <test 0> ) {
   next_0:       ;
                 <consequence block>
                 break cond;
               }
               else if (<test 1>) { 
   next_1:       ;  
                 <alternative block 1>
                 break cond;
               }
               ...
               
               else if (<test n-2>) {
   next_n-2:   ;
                 <alternative block n-2>
                 break cond;
               }
               else {
   next_n-1:      ;
                 <alternative block n-1>
                 break cond;
               }
   next_n:   ;
   done:       ;
   ```

