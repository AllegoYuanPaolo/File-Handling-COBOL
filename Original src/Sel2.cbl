       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL2.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           local-STORAGE SECTION.
           01 num pic S9(2).
       PROCEDURE DIVISION.
           
           display "Enter number: " with no advancing
           accept num

           display "____________________"
           if num < 0 
               display "Your number is negative"
           else 
               display "Your number is postive"
            end-if 


       goback. 
       