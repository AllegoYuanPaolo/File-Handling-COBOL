       identification division.
       program-id. Itr6.

       environment division.
           input-output section.
               file-control.
                   select optional outputFile
                       assign to 'Itr6.dat'
                       organization is line sequential.
       
       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-storage section.
           
           01 i pic 9(3) value 1.

           01 fct pic 9(5) value 1.


           01 num pic 9(3).
           01 ZNum pic ZZ9.

           01 dispFCT pic ZZ,ZZZ. 

       procedure division.
           display "Enter num: " with no advancing
           accept num
           
           move num to ZNum

           open extend outputFile
               if num < 0 
                   display "Cannot factorial negatives"
                   close outputFile
                   exit program
               end-if.

               move spaces to bufferLine 
               string "Num: " delimited by size
                      function trim(ZNum) delimited by size
                      into bufferLine
               end-string 
                   write bufferLine
                   move spaces to bufferLine
        
               perform until i > num
                   compute fct = fct * i
                   add 1 to i
               end-perform.
                   move fct to dispFCT
                   string "Factorial: " delimited by size
                           function  trim(dispFCT) delimited by size
                           into bufferLine
                   end-string
                       write bufferLine
                       write bufferLine from spaces
                   display "factorial: " dispFCT
                   
           close outputFile
       exit program.
       