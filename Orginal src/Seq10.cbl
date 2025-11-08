       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq10.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 base PIC 9(3).
           01 hei PIC 9(3).
           01 a pic 9(3)V99.
           01 compArea pic 9(3)V99. 
           01 peri pic 9(3)v99.

           01 base2 PIC 9(3).
           01 hei2 PIC 9(3).

           01 dispArea PIC ZZZ.ZZ.
           01 dispPeri PIC ZZZ.ZZ.

       PROCEDURE DIVISION.
       
       DISPLAY "Enter Base: " with no advancing.
       accept base.

       DISPLAY "Enter Height: " with no advancing.
       accept hei.

       compute base2 = base * base.
       compute hei2 = hei * hei.

       compute a = function sqrt(base2 + hei2).
       compute compArea = (1/2) * base * hei.
       compute peri = base + hei + a.

       move compArea to dispArea.
       move peri to dispPeri.

       display "_______________________________".
       display "Area: " dispArea " | Perimeter: " dispPeri.
    
        call "SYSTEM" using "PAUSE".
       exit program.

       