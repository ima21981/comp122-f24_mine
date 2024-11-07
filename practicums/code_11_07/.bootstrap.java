
class compareTo {
   static MIPS_library mips = new MIPS_library();
// #line 0 "compareTo.j"

static char[] B = string2charArray("This is a string! ");

// returns  0 if A == B
// returns -1 if A < B
// return   1 if A > B
public static  int compareTo(char[] A){

            int i;
            int result;
            int a;
            int b;
            int diff;

            result = 0;

init:       ;
            i=0;
loop:       for(;  ; ) {
               a = A[i];
               b = B[i];

               diff = a - b; 

mips.print_d(diff);
mips.print_ci('\n');

if1:           if (diff < 0) {
if1_next_0:       ;                  
                  result = -1;
                  break loop;
                  // break if1;
               }
if1_next_1:    ;
if1_done:      ;       


if2:           if (diff > 0) {
if2_next_0:       ;   
                  result =  1;
                  break loop;
                  // break if2;
               }
if2_next_1:    ;
if2_done:      ;               

               if (a == '\0') break loop;
               i++;
            }
done:       ;            

            return result;
}



  public static char[] string2charArray(String text) {
    int index;
    char [] A = new char[ text.length() + 2];

    for (index=0; index < A.length - 2; index++ ) {
      A[index] = (text).charAt(index);
    }
    A[index]   = '\0' ;   // the Null character
    A[index+1] = '\7' ;   // the Alert character
    return A;
  }

  public static void main(String[] args) {
  
    int index;
    int exit_status = 0;
    String string_0 = "This is a string!";
    char $a0[] = string2charArray(string_0);

    // Marshal the stack arguments:

    // List of BEFORE actions


    // Make the primary call to the subroutine
    int $v0 = compareTo($a0);
    int $f0 = $v0;
    exit_status = $v0;

    // List of AFTER actions

    // Print the return value from the routine
    mips.println_d($v0);
    mips.exit(exit_status);
    return;
  }
}
