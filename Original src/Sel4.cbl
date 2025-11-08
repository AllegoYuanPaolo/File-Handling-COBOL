       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL4.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
           local-STORAGE SECTION.
           01 num1 PIC 9(2).
           01 num2 PIC 9(2).

           01 disp1 PIC ZZ.
           01 disp2 PIC ZZ.

       PROCEDURE DIVISION.
           DISPLAY "Enter num1: " with no advancing
           accept num1

           display "Enter num2: " with no advancing
           accept num2

           display "_______________"
           move num1 to disp1
           move num2 to disp2
           
               if num1 > num2 
                   display "Num1: " disp1 " is greater than " disp2
               else 
                   display "Num2: " disp2 " is greater than " disp1
           

       goback. 
               