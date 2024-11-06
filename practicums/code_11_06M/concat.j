public static int concat() {

         char[] A = string2charArray("this is a string;");
         char[] B = string2charArray("and so is this");
         char[] C = new char[256];

         int i;
         int j;
         char v;

         //string copy
l1_i:    ; 
         i=0;         
l1:      for(; ;) {
            v = A[i];
            C[i] = v;
            if ( v == '\0' ) break;
            i++;
            continue l1;
         }
l1_d:    ;

         ////  string append
l2_i:    ;
         j = 0;
l2:      for(;  ;) {
            v = B[j];
            C[i] = v;
            if (v == '\0' ) break;
            j++;
            i++;
            continue l2;
         }
l2_d:    ;       
         mips.print_s(C);
         mips.print_ci('\n');
         return i;
}






