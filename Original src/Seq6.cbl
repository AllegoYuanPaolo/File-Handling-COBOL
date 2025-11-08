       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq6.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
          WORKING-STORAGE SECTION.
           01 num PIC 9(3).
           01 cube PIC 9(3).
           01 square PIC 9(3).

           01 dispCube PIC ZZZ .
           01 dispSquare PIC ZZZ .

        PROCEDURE DIVISION.
        
        DISPLAY "Enter number: " with no advancing.
        accept num.

        compute cube = num * num * num.
        compute square = num * num.
           
       move cube to dispCube.
       move square to dispSquare.

        display "______________________________________".
        display "Square: " dispSquare " | Cube: " dispCube.

        
         call "SYSTEM" using "PAUSE".
        exit program.

