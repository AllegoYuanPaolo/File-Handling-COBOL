       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq8.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Seq8.dat"
                       organization is line sequential
                       file status is OFStat.

       
       DATA DIVISION.
           File section.
               fd outputFile.
                   01 bufferLine pic x(64).

           WORKING-STORAGE SECTION.
           01 diameter PIC 9(3).

           01 compArea PIC 9(5)V99 comp.
           01 compCirc PIC 9(5)V99 comp.

           01 dispDiameter pic ZZ9.
           01 dispArea PIC ZZ,ZZZ.ZZ .
           01 dispCirc PIC ZZ,ZZZ.ZZ .

           01 OFStat pic xx.
           01 ptr pic S9(4) comp.

            01 radius PIC 9(5)V99 .
       PROCEDURE DIVISION.
       
       DISPLAY "Enter Diameter: " with no advancing.
       accept diameter.

          
           compute radius = diameter / 2.
           compute compArea = 3.14 * (radius * radius)
           compute compCirc = 3.14 * diameter
           
           move diameter to dispDiameter
           move compArea to dispArea
           move compCirc to dispCirc

               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                   else
                       open output outputFile
                   end-if
                   
                   move spaces to bufferLine
                   move 1 to ptr
                   string "Diameter: " delimited by size
                          function trim(dispDiameter) delimited by space
                          into bufferLine
                          with pointer ptr
                   end-string
                       write bufferLine

                       move spaces to bufferLine
                       move 1 to ptr

                       write bufferLine from "_______________"

                       string "Area: " delimited by size
                            function  trim(dispArea) delimited by space
                            " | Circumference: " delimited by size
                            function trim(dispCirc) delimited by space
                            into bufferLine
                            with pointer ptr
                        end-string
                           write bufferLine
                           
                           write bufferLine from "-----------------"
                           write bufferLine from spaces

                   close outputFile

        display "_________________________________"
        display "Area: " function trim(dispArea)  no advancing
        display " | Circumeference: " function trim(dispCirc)
           

       exit program.
