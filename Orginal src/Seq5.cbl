       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq5.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 prelim PIC 9(2).
           01 midterm PIC 9(2).
           01 finals PIC 9(2).

           01 ave PIC 9(2)V99 .
           01 dispAve PIC ZZ.ZZ .


       PROCEDURE DIVISION.
       
       DISPLAY "Enter Prelim grades: ".
       accept prelim.
       
       DISPLAY "Enter Midterm grades: ".
       accept midterm.
       
       DISPLAY "Enter Finals grades: ".
       accept finals.

       display "==================================".

           compute ave = (prelim + midterm + finals) / 3.
           move ave to dispAve.
       display "Prelims: " prelim " | Midterms: " midterm               -
       " | Finals: " finals " |" 
        display "_______________".
        display "Average grade: " dispAve.
       call "SYSTEM" using "PAUSE".
       exit program.

       