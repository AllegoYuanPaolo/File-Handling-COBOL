       identification division.
       program-id. Itr3.

       environment division.
           input-output section.
               file-control.
                   select optional outputFile
                       assign to 'Itr3.dat'
                       organization is line sequential.
       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-storage section.
           01 n pic 99.
           01 ZN pic z9.
           01 counter pic 99 value 1.
           01 dispCounter pic Z9.
           01 ptr pic s9(4) comp.
       procedure division.
       
           display "Enter end: " with no advancing
           accept n
           open extend outputFile
               move n to ZN
               
               move spaces to bufferLine
               string "Num: " delimited by size
                       function trim(ZN) delimited by size
                       into bufferLine
               end-string
                   write bufferLine

                   move spaces to bufferLine
                   move 1 to ptr

               perform until counter > n
                       if function mod(counter, 2) = 0
                           move counter to dispCounter
                           
                     string function trim(dispCounter) delimited by size
                            ", " delimited by size
                            into bufferLine
                            with pointer ptr
                      end-string

                           display dispCounter
                       end-if
                   add 1 to counter
               end-perform
               write bufferLine
               write bufferLine from spaces

           close outputFile
    

       exit program.
       