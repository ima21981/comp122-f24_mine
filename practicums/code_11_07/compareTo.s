                .globl compareTo

                .data
B:              .asciiz  "This is a string!"   # static char[] B = string2charArray("This is a string!");
                                # 
                                # // returns  0 if A == B
                                # // returns -1 if A < B
                                # // return   1 if A > B

                .text

compareTo:      nop             # public static  int compareTo(char[] A){
                # a0: A         # 
                # t0: i;        #     int i;
                # t1: result;   #     int result;
                # t2: a;        #     int a;
                # t3: b;        #     int b;
                # t4: diff;     #     int diff;
                #----------
                # t5: p_A
                # t6: p_B
                                # 
                                #     result = 0;
                                # 
init:                           #     ;
                                #     i=0;
loop:                           #     for(;  ; ) {
               move $t5, $a0    #        a = A[i];
               add $t5, $t5, $t0
               lbu $t2 0($t5)

               lbu $t3, B($t0)  #        b = B[i];


               la $t6, B        #        b = B[i];
               add $t6, $t6, $t0
               lbu $t3, 0($t6)
                                # 
                                #        diff = a - b; 
                                # 
if1:                            #        if (diff < 0) {
if1_next_0:                     #           ;                  
                                #           result = -1;
                                #           break loop;
                                #           // break if1;
                                #        }
if1_next_1:                     #        ;
if1_done:                       #        ;       
                                # 
                                # 
if2:                            #        if (diff > 0) {
if2_next_0:                     #           ;   
                                #           result =  1;
                                #           break loop;
                                #           // break if2;
                                #        }
if2_next_1:                     #        ;
if2_done:                       #        ;               
                                # 
                                #        if (a == '\0') break loop;
                                #        i++;
                                #     }
done:                           #     ;            
                                # 
                                #     return result;
}                    #     

