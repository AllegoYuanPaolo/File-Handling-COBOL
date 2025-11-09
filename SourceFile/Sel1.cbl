       IDENTIFICATION DIVISION. 
       PROGRAM-ID. SEL1.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel1.dat"
                       organization is line sequential
                       file status is OFStat.
       
       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-STORAGE SECTION.
           01 rawData.    
               02 prelim pic 9(3).
               02 midterm pic 9(3).
               02 finals pic 9(3).

           01 ave pic 9(3)v99 comp.

           01 dispAve pic Z(3).zz.

           01 formatData.
               02 fPrelim pic ZZZ.
               02 fMidterm pic zzz.
               02 fFinals pic zzz.

           01 result pic x(64).

           01 OFStat pic xx.
           01 ptr pic s9(4) comp.

       PROCEDURE DIVISION.
           Display "Enter prelim grades: " with no advancing
           accept prelim

           display "Enter midterms: " with no advancing
           accept midterm

           display "Enter Finals: " with no advancing
           accept finals

           compute ave = (prelim + midterm + finals) / 3
           move ave to dispAve
           move prelim to fPrelim
           move midterm to fMidterm
           move finals to fFinals
               
           display "_______________________"
           display "Your average is " dispAve
            IF ave >= 75 
                   move "You pass!" to result
           else 
                   move "You fail" to result
           end-if
               display result

               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                    else
                       open output outputFile
                    end-if
                       move spaces to bufferLine
                       move 1 to ptr

                       string "Prelims: " delimited by size
                          function trim(fPrelim) delimited by size
                          " | Midterms: " delimited by size
                          function trim(fMidterm) delimited by size
                          " | Finals: " delimited by size
                          function trim(fFinals) delimited by size
                          into bufferLine
                          with pointer ptr
                       end-string
                           write bufferLine

                       move spaces to bufferLine
                       move 1 to ptr
                        string "Average: " delimited by size
                              function trim(dispAve) delimited by size
                              " | " delimited by size
                              function trim(result) delimited by size
                              into bufferLine
                              with pointer ptr
                         end-string
                           write bufferLine
                           
                           write bufferLine from "--------------"
                           write bufferLine from spaces



                    close outputFile

               
       
       goback. 
