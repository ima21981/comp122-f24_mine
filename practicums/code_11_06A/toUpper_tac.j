
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
fi:            if ( b == true ) {
fi_next_0:       ;   
                 unicode = value - 'a'; 
                 unicode = unicode + 'A';
                 value = (char) unicode;
                 break fi_done;
               }
fi_next_1:     ;
fi_done:       ;               
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