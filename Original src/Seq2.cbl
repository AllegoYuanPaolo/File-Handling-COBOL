       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq2.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 A PIC 99  VALUE 5.
           01 B PIC 99 VALUE 10.
           
           01 C PIC 9(2) VALUE 0.
           01 D PIC 9(2) VALUE 0.
           
           01 DisplayA pic ZZ. 
           01 DisplayB pic zz. 

       PROCEDURE DIVISION.
           
           
           move A to DisplayA.
           move B to DisplayB.

           display "A: " DisplayA "| B: " DisplayB.

           COMPUTE C = A + B - A.
           COMPUTE D = A + B - B.

           move C to A.
           move D to B.

           move A to DisplayA.
           move B to DisplayB.

           display "A: " DisplayA "| B: " DisplayB.
                
        call "SYSTEM" using "PAUSE".
       exit program.
