       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq6.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   
                   select outputFile
                       assign to "Seq6.dat"
                       organization is line sequential
                       file status is OFStat.

       
       DATA DIVISION.
           FILE SECTION.
               
               fd outputFile.
                   01 bufferLine pic x(64).

          WORKING-STORAGE SECTION.
           01 num PIC 9(3).
           01 formatNum pic ZZZ.
           01 cube PIC 9(3).
           01 square PIC 9(3).

           01 dispCube PIC ZZZ .
           01 dispSquare PIC ZZZ .

           01 OFStat pic xx.
           01 ptr pic s9(4) comp.

        PROCEDURE DIVISION.
        
        DISPLAY "Enter number: " with no advancing
        accept num

        compute cube = num * num * num
        compute square = num * num
           
       
       move num to formatNum
       move cube to dispCube
       move square to dispSquare
       

           open input outputFile
               if OFStat = "00"
                   close outputFile
                   open extend outputFile
               else 
                   open output outputFile
               end-if          
               
                    move spaces to bufferLine
                    move 1 to ptr
                    string "Number: " delimited by size
                            function trim(formatNum) delimited by space
                            into bufferLine
                            with pointer ptr
                    end-string
                       write bufferLine
                   
                    move spaces to bufferline 
                     move 1 to ptr
                     string "Square: " delimited by size
                           function trim (dispSquare) delimited by space
                            " | Cube: " delimited by size
                            function trim(dispCube) delimited by space
                            into bufferLine
                            with pointer ptr
                     end-string
                       write bufferLine

                       write bufferLine from "-------------------"


               close outputFile

        display "______________________________________"
        display "Square: " dispSquare " | Cube: " dispCube

        
     
        exit program.

