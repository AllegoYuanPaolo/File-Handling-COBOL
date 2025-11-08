$set sourceformat"free"

       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq5.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile 
                       assign to "Seq5.dat"
                       organization is line sequential
                       file status is OFStat.
       
       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).

           WORKING-STORAGE SECTION.
           
           01 rawData.
               02 prelim PIC 9(3).
               02 midterm PIC 9(3).
               02 finals PIC 9(3).
           
           01 formatData.
               02 formatPrelim pic zz9.
               02 formatMidterm pic zz9.
               02 formatFinals pic zz9.
           

           01 ave PIC 9(3)V99 .
           01 dispAve PIC ZZ.ZZ .

           01 OFStat pic xx.
           01 ptr pic s9(4) comp.


       PROCEDURE DIVISION.
       
       DISPLAY "Enter Prelim grades: " no advancing
       accept prelim
       
       DISPLAY "Enter Midterm grades: " no advancing
       accept midterm
       
       DISPLAY "Enter Finals grades: " no advancing
       accept finals
           
       display "=================================="

           compute ave = (prelim + midterm + finals) / 3
           move ave to dispAve

           MOVE prelim  TO formatPrelim
           MOVE midterm TO formatMidterm
           MOVE finals  TO formatFinals

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
                       function trim(formatPrelim) delimited by space
                       " | Midterms: " delimited by size
                       function trim(formatMidterm) delimited by space
                       " | Finals: " delimited by size
                       function trim(formatFinals) delimited by space
                       into bufferLine
                       with pointer ptr
                 end-string
                       write bufferLine

                 move space to bufferLine
                 move 1 to ptr

                 string "Average Grade: " delimited by size
                        function trim(dispAve) delimited by space
                        into bufferLine
                        with pointer ptr
                end-string
                   write bufferLine

                   write bufferLine from "------------------"

               close outputFile
                 display "Prelims: " function trim(formatPrelim) " | Midterms: " function trim(formatMidterm) " | Finals: " function trim(formatFinals) " |" 
        display "_______________".
        display "Average grade: " function trim(dispAve)    


       exit program.

       