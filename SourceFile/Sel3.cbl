       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL3.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel3.dat"
                       organization is line sequential
                       file status is OFStat.


       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).

           local-STORAGE SECTION.
           01 num PIC 9(3).
           01 ZNum pic zz9.

           01 result pic x(32).

           01 OFStat pic xx.
       PROCEDURE DIVISION. 
           DISPLAY "Enter number: " no advancing
           ACCEPT num

           move num to ZNum
           
               display "________________________"
               if function mod(num, 2) = 0 
                   move "Your number is even" to result
               else 
                   move  "Your number is odd" to result
                end-if
                display result


                   open input outputFile
                       if OFStat = "00"
                           close outputFile
                           open extend outputFile
                       else 
                           open output outputFile
                       end-if
                       
                       move spaces to bufferLine
                       string "Number: " delimited by size
                              function trim(ZNum) delimited by space
                              into bufferLine
                        end-string
                           write bufferLine

                           move spaces to bufferLine

                           write bufferLine from result
                           write bufferLine from "---------------------"
                           write bufferLine from spaces

                  close outputFile
       goback.  
           