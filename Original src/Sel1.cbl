       IDENTIFICATION DIVISION. 
       PROGRAM-ID. SEL1.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           local-STORAGE SECTION.
           01 prelim pic 9(3).
           01 midterm pic 9(3).
           01 finals pic 9(3).

           01 ave pic 9(3)v99.

           01 dispAve pic Z(3).
       PROCEDURE DIVISION.
           Display "Enter prelim grades: " with no advancing
           accept prelim

           display "Enter midterms: " with no advancing
           accept midterm

           display "Enter Finals: " with no advancing
           accept finals

           compute ave = (prelim + midterm + finals) / 3
           move ave to dispAve
               
              

           display "_______________________"
           display "Your average is " dispAve
            IF ave >= 75 
                   display "You pass!"
           else 
               display "You fail"
           end-if
       
       goback. 
