       identification division.
       program-id. Itr7.

       environment division.
           input-output section.
               file-control.
                   select optional outputFile
                       assign to 'Itr7.dat'
                       organization is line sequential.
       
       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-storage section.
           01 num pic 9(3).
           01 ZNum pic zzz.

           01 sumTotal pic 9(3) value 0.

           01 i pic 9(3) value 0.

           01 dispSum pic ZZZ.

       procedure division.

           display "Enter num: " no advancing
           accept num
           
           open extend outputFile
               move spaces to bufferLine
               if num < 0 
                   display "Cannot do negative"
                   close outputFile
                   exit program 
              end-if.
           move num to ZNum
               string "Num: " delimited by size
                   function trim(ZNum) delimited by size
                   into bufferLine
               end-string
                   write bufferLine
                       move spaces to bufferLine


               perform until i > num
                   add i to sumTotal
                   add 1 to i
               end-perform.
                   move sumTotal to dispSum
                   display "Sum: " dispSum
               string "Sum: " delimited by size
                   function trim(dispSum) delimited by size
                   into bufferLine
               end-string
                   write bufferLine
                   write bufferLine from spaces
           
           close outputFile
           
       exit program.
      
       