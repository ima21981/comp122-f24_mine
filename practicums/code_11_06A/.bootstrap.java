
class toUpper {
   static MIPS_library mips = new MIPS_library();
// #line 0 "toUpper_tac.j"

static char[] C = new char[256];


public static int toUpper(char[] A) {

            int i;
            char value;
            int unicode;
            boolean b;
            boolean b1;
            boolean b2;
   
tini:       ;
            i=0;
rof:        for(; ;) {
               value = A[i];

               b1 = value >= 'a';
               b2 = value <= 'z';
               b  = b1 && b2;
               if ( b == true ) {
                 unicode = value - 'a'; 
                 unicode = unicode + 'A';
                 value = (char) unicode;
               }
               C[i] = value;
               if (value == '\0') break rof;

               i++;
               continue rof;
            }
enod:       ;            

            mips.print_s(C);
            mips.print_ci('\n');
            return i;

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
    String string_0 = "He^&%^#@llo woffrld 34";
    char $a0[] = string2charArray(string_0);

    // Marshal the stack arguments:

    // List of BEFORE actions


    // Make the primary call to the subroutine
    int $v0 = toUpper($a0);
    int $f0 = $v0;
    exit_status = $v0;

    // List of AFTER actions

    // Print the return value from the routine
    mips.println_d($v0);
    mips.exit(exit_status);
    return;
  }
}
