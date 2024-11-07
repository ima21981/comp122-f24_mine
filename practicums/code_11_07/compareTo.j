
static char[] B = string2charArray("This is a string!");

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

