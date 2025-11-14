       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL7.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel7.dat"
                       organization is line sequential
                       file status is OFStat.

       DATA DIVISION.
           File section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-STORAGE SECTION.
           01 result pic x(16).
           01 temp pic 9(3).
           01 Ztemp pic zz9.
           01 OFStat pic xx.
       PROCEDURE DIVISION.
           DISPLAY "Enter temperature: " with no advancing
           accept temp

           if temp < 0
               move  "Freezing Weather" to result
           else if temp > 0 and temp < 10
               move "Very Cold Weather" to  result
           else if temp > 10 and temp < 20
                move  "Cold Weather" to result
           else if temp > 20   and temp < 30
               move "Normal" to result
           else if temp > 30 and temp < 40
               move "It's Hot" to result
           else if temp >= 40 
                move "It's Very Hot" to result
           end-if.

           display result

               open input outputFile
                   if OFStat = '00'
                       close outputFile
                       open extend outputFile
                   else 
                       open output outputFile
                   end-if.
                   
                   move temp to Ztemp
                   move spaces to bufferLine
                   string "Temperature: " delimited by size
                          function trim(Ztemp) delimited by space
                          into bufferLine
                    end-string
                           write bufferLine

                       write bufferLine from function trim(result)
                       write bufferLine from "-------------------"
                       write bufferLine from space

               close outputFile

       goback. 
