       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq9.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Seq9.dat"
                           organization is line sequential
                           file status is OFStat.

       
       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).

           WORKING-STORAGE SECTION.
           01 len PIC 9(3). 
           01 wid PIC 9(3).
           
           01 peri PIC 9(3).
           01 ar pic 9(3).

           01 dispLen pic zzz.
           01 dispWid pic zzz.
           01 dispAr PIC ZZZ .
           01 dispPeri PIC ZZZ .

           01 OFStat pic xx.
           01 ptr pic s9(4) comp.
       PROCEDURE DIVISION.
       
       DISPLAY "Enter Width: " with no advancing
       ACCEPT wid

       display "Enter Length: " with no advancing
       accept len

       move len to dispLen
       move wid to dispWid

       compute peri = 2 * (len + wid)
       move peri to dispPeri

       compute ar = len * wid
       move ar to dispAr

           open input outputFile
               if OFStat = "00"
                   close outputFile
                   open extend outputFile
               else
                   open output outputFile
               end-if
                   move spaces to bufferLine
                   move 1 to ptr
                   
                   string "Width: " delimited by size
                           function trim(dispWid) delimited by space
                           " | Length: " delimited by size
                           function trim(dispLen) delimited by space
                           into bufferLine
                           with pointer ptr
                     end-string
                       write bufferLine

                       move spaces to bufferLine
                       move 1 to ptr

                       write bufferLine from "=============="

                       string "Perimeter: " delimited by size
                           function trim(dispPeri) delimited by space
                           " | Area: " delimited by size
                           function trim(dispAr) delimited by size
                           into bufferLine
                           with pointer ptr
                       end-string
                           write bufferLine

                           write bufferLine from "-------------------"
                           write bufferLine from spaces

               close outputFile

       display "______________________________________"
       display "Perimeter: " dispPeri
       display "Area     : " dispAr
       
       exit program. 

       