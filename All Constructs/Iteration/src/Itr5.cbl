       identification division.
       program-id. Itr5.

       environment division.
           input-output section.
               file-control.
                   select optional outputFile
                       assign to "Itr5.dat"
                       organization is line sequential.

       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-storage section.
           01 startNum pic 99.
           01 endNum pic 99.
           01 ZStart pic zz.
           01 ZEnd pic zz.

           01 sumTotal pic 9999 value 0.
           01 dispSum pic Z,ZZ9.

           01 ptr pic s9(4) comp.
       procedure division.
       
           display "Enter Start: " with no advancing
           accept startNum

           display "Enter End: " with no advancing
           accept endNum
           
           move startNum to ZStart
           move endNum to ZEnd

               open extend outputFile
                   
                   if startNum > endNum
                       display "Start number cannot be greater than end"
                       close outputFile
                       exit program
                   end-if

                   move spaces to bufferLine
                   string "Start: " delimited by size
                          function trim(ZStart) delimited by size
                          " | End: " delimited by size
                          function trim(ZEnd) delimited by size
                          into bufferLine
                   end-string
                       write bufferLine
                       
                       move spaces to bufferLine
                       move 1 to ptr

           perform until startNum > endNum
                   
                   if function mod(startNum, 2) not = 0
                       move startNum to dispSum
                       add startNum to sumTotal
                   end-if
               add 1 to startNum
           end-perform
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
       