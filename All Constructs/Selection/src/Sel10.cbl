       identification division.
       program-id. SEL10.

       environment division.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel10.dat"
                       organization is line sequential
                       file status is OFStat.

       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
       local-storage section.
       
           01 letter pic x.
           01 OFStat pic xx.
           01 result pic x(32).

       procedure division.
       
           display "enter letter: " with no advancing
           accept letter


           if  letter = 'A' or letter = 'E' OR letter = 'O'             -
            OR letter = 'I' OR letter ='U'
               move "Your letter is a vowel" to result
           else if letter = 'a' or letter = 'e' OR letter =             -
           'o' OR letter = 'i' OR letter = 'u'
               move "Your letter is a vowel" to result
           else 
               move  "Your letter is a consonant" to result
           end-if.

           display result

               open input outputFile
                   if OFStat = "00"
                       close outputFile 
                       open extend outputFile
                   else
                       open output outputFile
                   end-if.
                   
                   move spaces to bufferLine
                   string "Letter: " delimited by size
                          letter delimited by size
                          into bufferLine
                   end-string
                       write bufferLine

                       move spaces to bufferLine
                   write bufferLine from result
                   write bufferLine from "-----------------------"
                   write bufferLine from spaces

               close outputFile

       goback. 
