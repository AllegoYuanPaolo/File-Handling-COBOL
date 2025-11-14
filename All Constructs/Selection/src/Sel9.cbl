       identification division.
       program-id. SEL9.

       environment division.
           input-output section.
               file-control. 
                   select outputFile
                       assign to "Sel9.dat"
                       organization is line sequential
                       file status is OFStat.

       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-storage section.
           01 num pic 9.

           01 OFStat pic xx.
           01 result pic x(16).

       procedure division.
       display "Enter num: " with no advancing
       accept num

           if num = 1
               move "Monday" to result
           else if num = 2
               move "Tuesday" to result
           else if num = 3
               move "Wednesday" to result
           else if num = 4
               move "Thursday" to result
           else if num = 5
               move "Friday" to result
           else if num = 6
               move "Saturday" to result
           else if num = 7
               move "Sunday" to result
           end-if.

           display "The day is: " result

               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                   else
                       open output outputFile
                   end-if.


                   move spaces to bufferLine
                   string "Num: " delimited by size
                           num delimited by size
                           into bufferLine
                   end-string
                       write bufferLine

                       move spaces to bufferLine
                       string "Day: " delimited by size
                              function trim(result) delimited by space
                              into bufferLine
                       end-string
                           write bufferLine
                               
                           write bufferLine from "---------------------"
                           write bufferLine from spaces

                   close outputFile
       
       
       goback. 
