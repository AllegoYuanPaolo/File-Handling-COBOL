       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL3.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
           local-STORAGE SECTION.
           01 num PIC 9(3).
           01 ZNum pic zz9.

           01 result pic x(32).

           01 OFStat pic xx.
       PROCEDURE DIVISION. 
           DISPLAY "Enter number: "
           ACCEPT num

               display "________________________"
               if function mod(num, 2) = 0 
                   display "Your number is even"
               else 
                   display "Your number is odd"
       goback.  
           