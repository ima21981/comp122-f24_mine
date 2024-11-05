# Java to Java Tac Transformation Checklist

For our Java code, the Java compiler helps us by flagging any errors.  If we forget to declare a variable, or write a statement incorrectly, we get an error message.  We can then fix our code to ensure its 'proper' java.

But for our Java TAC code, we have no automated mechanism to determine if it is 'proper' or not.  That is to say, we might forget something that is needed to ensure we can transliterate our code into MIPS.  To minimize the possible of forgetting something, here is a simple checklist we should review before we conclude our work on our Java Tac.

## Precursors to Java Tac Transformation
   1. Ensure all variables are declared at the top of our method
      - do not initialize the variables
   1. Ensure all variables are initialized (as appropriate) *after* the variable declarations.

   1. Ensure that all Conditionals are of the form:
      ```java
      if (a <comp> b) {

      }
      else if (a <comp> b) {

      }
      ...
      else if (a <comp> b) {

      }
      else {

      }
      ```

   1. Ensure all Control flow statements use blocks ({}) 
      - exceptions include:
        * `if ({comp}) break;`
        * `if ({comp}) continue;`

   1. Review our comparison statements to ensure they are simplified.

## Transformation Steps
   1. Split all "else if" keyword across two lines
   1. Apply PEMDAS to all statements.
   1. Apply the transformation algorithm for all control flow statements

## Transformation checklist
   1. Ensure all variables are declared at the top of our method
      - do not initialize the variables
   1. Ensure all variables are initialized (as appropriate) *after* the variable declarations.

   1. Ensure labels have be inserted for all control flow statements
   1. Ensure each label is associated with 
       - the null statement (`;`), or
       - a control flow statement: `if`, `for`, `while`, `do`, etc.
   1. Ensure a `break` or `continue` is at the end of code blocks (`{}`)
   1. Ensure that the control arms of a control-flow statement has been simplified.
   1. Ensure that immediate values are located in the last operand position


