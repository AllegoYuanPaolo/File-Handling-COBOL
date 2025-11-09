       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL2.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel2.dat"
                       organization is line sequential
                       file status is OFStat.
       
       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).

           local-STORAGE SECTION.
           01 num pic S9(3).

           01 formatNum.
               02 FZNum pic +zz9.
               02 FSym pic x.
               02 FNum pic x(3).
               02 alpNum pic x(4).

           01 result pic x(32).

           01 OFStat pic xx.
           01 ptr pic s9(4) comp. 
           
       PROCEDURE DIVISION.
           
           display "Enter number: " with no advancing
           accept num

           display "____________________"
           if num < 0 
               move "Your number is negative" to result
           else 
               move "Your number is postive" to result
            end-if 

            display result

               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                   else
                       open output outputFile
                   end-if
                   
                   move num to FZNum
                   unstring FZNum delimited by all spaces
                            into FSym FNum
                   end-unstring

                   string FSym delimited by space
                          FNum delimited by space
                          into alpNum
                   end-string    


               move spaces to bufferLine
               move 1 to ptr
                   string "Number: " delimited by size
                          function trim(alpNum) delimited by size
                           into bufferLine
                           with pointer ptr
                   end-string
                       write bufferLine

                       write bufferLine from "============"

                       move spaces to bufferLine

                       write bufferLine from result
                       write bufferLine from "------------"
                       write bufferLine from space


                close outputFile
       goback. 
       