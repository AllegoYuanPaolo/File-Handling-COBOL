       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL6.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                       select outputFile
                           assign to "Sel6.dat"
                           organization is line sequential
                           file status is OFStat.

       DATA DIVISION.
           file section.
               fd outputFile. 
                   01 bufferLine pic x(64).
           local-STORAGE SECTION.
           01 prelim pic 9(3).
           01 midterm pic 9(3).
           01 finals pic 9(3).

           01 ave pic 9(3).

           01 dispAve pic zz9.

           01 dispPre pic zz9.
           01 dispMid pic zz9.
           01 dispFin pic zz9.

           01 result pic x(4).

           01 OFStat pic xx.

       PROCEDURE DIVISION.
           display "Enter prelim: "
           accept prelim

           display "Enter midterm: "
           accept midterm

           display "Enter finals: "
           accept finals
     

           compute ave = (prelim + midterm + finals) / 3
           move ave to dispAve
           move prelim to dispPre
           move midterm to dispMid
           move finals to dispFin

           display "Average: " dispAve

           display "______________"
           
           if ave >= 97 and ave <=100
               move "1.0" to result
           else if ave >= 94 and ave <=96
               move "1.25" to result
           else if ave >= 91 and ave <= 93
               move "1.5" to result
           else if ave >= 88 and ave <= 90
               move  "1.75" to result
           else if ave >= 86 and ave <= 87
               move  "2.0" to result
           else if ave >= 82 and ave <= 85
               move  "2.25" to result
           else if ave >= 79 and ave <= 81
               move  "2.5" to result
           else if ave >= 76 and ave <= 78
               move  "2.75" to result
           else if ave = 75
               move "3.0" to result
           else
               move "5.0" to result
           end-if.

           display "Your grade is: " result

               open input outputFile
                   if OFStat = '00'
                       close outputFile
                       open extend outputFile
                    else
                       open output outputFile
                    end-if.

                   move spaces to bufferLine 
                    string "Prelim: " delimited by size
                           function trim(dispPre) delimited by size
                           " | Midterm: " delimited by size
                           function trim(dispMid) delimited by size
                           " | Finals: " delimited by size
                           function trim(dispFin) delimited by size 
                           into bufferLine
                     end-string
                           write bufferLine

                        move spaces to bufferLine

                        string "Average: " delimited by size
                               function trim(dispAve) delimited by size
                               into bufferLine
                        end-string
                               write bufferLine

                       move spaces to bufferLine

                           string "Your grade is: " delimited by size
                                function trim(result) delimited by size
                                into bufferLine
                           end-string
                               write bufferLine

                               write bufferLine from "-----------------"
                               write bufferLine from space

                   close outputFile
                
            


       goback. 
