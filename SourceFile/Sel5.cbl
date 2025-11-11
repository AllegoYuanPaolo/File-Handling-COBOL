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

           01 disp PIC +ZZ9.
           01 alpDisp pic x(4).


           01 ZNum1 pic +zz9.
           01 ZNum2 pic +zz9.
           01 ZNum3 pic +zz9.
           01 alpNum1 pic x(4).
           01 alpNum2 pic x(4).
           01 alpNum3 pic x(4).

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
         
           
           move num1 to ZNum1
           move num2 to ZNum2
           move num3 to ZNum3
               
           
                           
                 unstring disp delimited by all spaces
                       into FSym FNum
               end-unstring

               

               string FSym delimited by space
                      FNum delimited by space
                      into alpDisp
               end-string

                   move spaces to FSym
                   move space to FNum

                   unstring ZNum1 delimited by all spaces
                           into FSym FNUm
                   end-unstring

                   

                   string FSym delimited by space
                          FNum delimited by space
                          into alpNum1
                   end-string
                   
                   move spaces to FSym
                   move space to FNum

                   unstring ZNum2 delimited by all spaces
                            into FSym FNum
                   end-unstring

          

                   string FSym delimited by space
                          FNum delimited by space
                          into alpNum2
                   end-string
                   
                 move spaces to FSym
                   move space to FNum

                   unstring ZNum1 delimited by all spaces
                            into FSym FNum
                   end-unstring
                       
                 
                   string FSym delimited by space
                          FNum delimited by space
                          into alpNum3
                   end-string


               string "The smallest number is: " delimited by size
                       function trim(alpDisp) delimited by space
                       into result
               end-string

              display result


               display spaces
             
               
               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                    else
                       open output outputFile
                    end-if
                   
                   move space to bufferLine
                   string "Num 1: " delimited by size
                           function trim(alpNum1) delimited by space
                           " | Num 2: " delimited by size
                           function trim(alpNum2) delimited by space
                           " | Num 3: " delimited by size
                           function trim(alpNum3) delimited by space
                           into bufferLine
                   end-string
                           write bufferLine

                           write bufferLine from "------------------"

                           write bufferLine from result
                           write bufferLine from "------------------"
                           write bufferLine from space

                    close outputFile
                   

           goback. 
               
     
