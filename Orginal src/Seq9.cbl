       *> Missing area as output
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq9.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 len PIC 9(3). 
           01 wid PIC 9(3).
           
           01 peri PIC 9(3).
           01 ar pic 9(3).

           01 dispAr PIC ZZZ .
           01 dispPeri PIC ZZZ .
       PROCEDURE DIVISION.
       
       DISPLAY "Enter Width: " with no advancing.
       ACCEPT wid.

       display "Enter Length: " with no advancing.
       accept len.

       compute peri = 2 * (len + wid).
       move peri to dispPeri.
       compute ar = len * wid.
       move ar to dispAr.

       display "______________________________________".
       display "Perimeter: " dispPeri.
       display "Area     : " dispAr.
       
       call "SYSTEM" using "PAUSE".
       exit program. 

       