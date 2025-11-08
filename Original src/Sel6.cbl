       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL6.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
           local-STORAGE SECTION.
           01 prelim pic 9(3).
           01 midterm pic 9(3).
           01 finals pic 9(3).

           01 ave pic 9(3).

           01 dispAve pic zz.

       PROCEDURE DIVISION.
           display "Enter prelim: "
           accept prelim

           display "Enter midterm: "
           accept midterm

           display "Enter finals: "
           accept finals
     

           compute ave = (prelim + midterm + finals) / 3
           move ave to dispAve

           display "Average: " dispAve

           display "______________"
           display "Your grade is: " with no advancing
           if ave >= 97 and ave <=100
               display "1.0"
           else if ave >= 94 and ave <=96
               display "1.25"
           else if ave >= 91 and ave <= 93
               display "1.5"
           else if ave >= 88 and ave <= 90
               display "1.75"
           else if ave >= 86 and ave <= 87
               display "2.0"
           else if ave >= 82 and ave <= 85
               display "2.25"
           else if ave >= 79 and ave <= 81
               display "2.5"
           else if ave >= 76 and ave <= 78
               display "2.75"
           else if ave = 75
               display "3.0"
           else
               display "5.0"
           end-if.
                
            


       goback. 
