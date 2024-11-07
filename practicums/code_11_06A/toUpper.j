
static char[] C = new char[256];


public static int toUpper(char[] A) {

   int i;
   char value;
   int unicode;
   
   for(i=0; ;i++) {
      value = A[i];

      if ('a' <= value && value <= 'z') {
        unicode = value - 'a' + 'A';
        value = (char) unicode;
      }
      C[i] = value;
      if (value == '\0') break;
   }

    mips.print_s(C);
    mips.print_ci('\n');
    return i;

}