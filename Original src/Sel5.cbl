       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL5.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
           local-STORAGE SECTION.
           01 num1 PIC 99.
           01 num2 PIC 99.
           01 num3 PIC 99.

           01 disp PIC ZZ.
       PROCEDURE DIVISION.
           DISPLAY "Enter number 1: " with no advancing
           accept num1
           
           display "Enter number 2: " with no advancing
           accept num2

           display "Enter number 3: " with no advancing
           accept num3

           display "________________"
               
               if num1 < num2
                   if num1 < num3
                       move num1 to disp
                   else  
                       move num3 to disp
                   end-if
              else if num2 < num3 
                     move num2 to disp
              else 
                   move num2 to disp
              end-if

              display "The smalled number is: " disp
           goback. 
               