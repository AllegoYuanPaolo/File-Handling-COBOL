       identification division.
       program-id. Itr9.

       environment division.
           input-output section.
               file-control.
                      select optional outputFile
                           assign to "Itr9.dat"
                           organization is line sequential.

       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-storage section.
           
           01 num pic 9(3).
           01 ZNum pic ZZ9.

           01 i pic 9(3) value 3.


       procedure division.
     
           
           display "Enter number: " with no advancing
           accept num

           move num to ZNum
           
           open extend outputFile

                  move spaces to bufferLine
                  string "Enter number: " delimited by size   
                       function trim(ZNum) delimited by size
                       into bufferLine
                   end-string
                       write bufferLine
                       move space to bufferLine

                   if num <= 1
                       display "Not a prime"
                       write bufferLine from "Not a prime"
                       close outputFile
                       exit program
                   else if
                        num = 2
                       display "Prime number"    
                       write bufferLine from "Prime Number"
                       close outputFile
                       exit program
                   
                   else if function mod(num, 2) = 0
                       display "Not a prime"
                       write bufferLine from "Not a prime"
                       close outputFile
                       exit program
    
                    else if function mod(num, i) = 0
                       display "Not a prime"
                       write bufferLine from "Not a prime"
                       close outputFile
                       exit program
                    else
                       perform until function mod(num, i) = 0
                              add 2 to i
                       end-perform
                          display "Prime number"
                          write bufferLine from "Prime number"
                    end-if.
                    write bufferLine from spaces
           close outputFile          
       exit program.
