       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL4.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel4.dat"
                       organization is line sequential
                       file status is OFStat.

       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-STORAGE SECTION.
           01 num1 PIC S9(3) comp.
           01 num2 PIC S9(3) comp.

           01 disp1 PIC +ZZZ.
           01 disp2 PIC +ZZZ.
           01 alp1 pic x(4).
           01 alp2 pic x(4).

           01 frmt.
              02 FSym pic x.
              02 FNum pic x(4).

           01 OFStat pic xx.

           01 result pic x(64).
       PROCEDURE DIVISION.
           DISPLAY "Enter num1: " with no advancing
           accept num1

           display "Enter num2: " with no advancing
           accept num2

           display "_______________"
           move num1 to disp1
           move num2 to disp2

                unstring disp1 delimited by all spaces 
                       into FSym FNum
                end-unstring

                string FSym delimited by space
                       FNum delimited by space
                       into alp1
                end-string
               
              
               move spaces to frmt

               unstring disp2 delimited by all spaces 
                       into FSym FNum
                end-unstring

                string FSym delimited by space
                       FNum delimited by space
                       into alp2
                end-string

           
               if num1 > num2 
                   display "Num1: " function trim(alp1)                 -
                    " is greater than " function trim(alp2)
                   
                    string "Num 1: " delimited by size
                           function trim(alp1) delimited by size
                           " is greater than " delimited by size
                           function trim(alp2) delimited by size
                           into result
                      end-string
               else 
                    display "Num2: " function trim(alp2)                -
                    " is greater than " function trim(alp1)
                      
                      string "Num 2: " delimited by size
                           function trim(alp2) delimited by size
                           " is greater than " delimited by size
                           function trim(alp1) delimited by size
                           into result
                      end-string
               end-if

                   open input outputFile
                       if OFStat = "00"
                           close outputFile
                           open extend outputFile
                        else
                           open output outputFile
                        end-if
                       
                       move spaces to bufferLine
                       string "Num 1: " delimited by size
                              function trim(disp1) delimited by size
                              " | Num 2: " delimited by size
                              function trim(disp2) delimited by size
                              into bufferLine
                        end-string
                           write bufferLine
                           
                           write bufferLine from "____________"
                           write bufferLine from result
                           write bufferLine from "---------------"
                           write bufferLine from spaces

                        close outputFile
                           

       goback. 
               