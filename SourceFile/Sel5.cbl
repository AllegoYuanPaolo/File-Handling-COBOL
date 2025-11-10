       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL5.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel5.dat"
                       organization is line sequential
                       file status is OFStat.

       DATA DIVISION.
           file section. 
               fd outputFile.
                   01 bufferLine pic x(64).

           local-STORAGE SECTION.
           01 num1 PIC s9(3).
           01 num2 PIC s9(3).
           01 num3 PIC s9(3).

           01 ZNum1 pic zzz.
           
           01 disp PIC ZZZ.
           01 alpDisp pic x(4).

           01 frmt.
               02 FSym pic x.
               02 FNum pic x(3).

           01 OFStat pic xx.

           01 result pic x(32).

       PROCEDURE DIVISION.
           DISPLAY "Enter number 1: " with no advancing
           accept num1
           
           display "Enter number 2: " with no advancing
           accept num2

           display "Enter number 3: " with no advancing
           accept num3

           display "________________"
               
                if num1 < num2
                   if num1 < num3
                       move num1 to disp
                   else  
                       move num3 to disp
                   end-if
              else if num2 < num3 
                     move num2 to disp
              else 
                   move num3 to disp
              end-if.
               display "DEBUG| disp: " disp

                           
                 unstring disp delimited by all spaces
                       into FSym FNum
               end-unstring

               string FSym delimited by space
                      FNum delimited by space
                      into alpDisp
               end-string

               string "The smallest number is: " delimited by size
                       function trim(alpDisp) delimited by space
                       into result
               end-string

              display result

               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                    else
                       open output outputFile
                    end-if
                   
                   string "Num 1: " delimited by size
                           function trim()

                    close outputFile
                   

           goback. 
               