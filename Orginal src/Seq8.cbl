       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq8.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 diameter PIC 9(3).

           01 compArea PIC 9(5)V99 .
           01 compCirc PIC 9(5)V99 .

           01 dispArea PIC ZZZZZ.ZZ .
           01 dispCirc PIC ZZZZZ.ZZ .

            01 radius PIC 9(5)V99 .
       PROCEDURE DIVISION.
       
       DISPLAY "Enter Diameter: " with no advancing.
       accept diameter.

          
           compute radius = diameter / 2.
           compute compArea = 3.14 * (radius * radius).
           compute compCirc = 3.14 * diameter.
           
           move compArea to dispArea.
           move compCirc to dispCirc.

        display "_________________________________"
        display "Area: " dispArea " | Circumeference: " dispCirc.
           
        call "SYSTEM" using "PAUSE".
       exit program.
