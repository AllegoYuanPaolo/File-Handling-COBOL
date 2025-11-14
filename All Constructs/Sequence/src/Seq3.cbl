       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq3.

       ENVIRONMENT DIVISION.
           input-output section.
           file-control.
               select outputFile
                   assign to "Seq3.dat"
                   organization is line sequential
                   file status is OFStat.
       
       DATA DIVISION.
           file section.
               fd outputFile.
                   01 buffer pic x(64).
           
           WORKING-STORAGE SECTION.

           01 celciusInput pic 9(3).
           01 formatCel pic ZZ9.

           01 fahr pic 9(3)v99 comp-3.

           01 DisplayFahr PIC ZZZ.ZZ.

           01 ptr pic s9(4) comp.

           01 OFStat pic xx.

       PROCEDURE DIVISION.

           display "Enter Celsius to convert: " with no advancing.
           accept celciusInput.

           compute fahr = (9/5) * celciusInput + 32.

           move fahr to DisplayFahr.

           open input outputFile
               if OFStat = "00"
                   close outputFile
                   open extend outputFile
               else 
                   open output outputFile
               end-if

              write buffer from "------------"
              move spaces to buffer
              

              move celciusInput to formatCel
              move 1 to ptr
               string "Celsius: " delimited by size
                      function trim(formatCel) delimited by size 
                      "| Fahrenheit: " delimited by size
                      DisplayFahr delimited by size
                      into buffer
                      with pointer ptr
                end-string 
               
  
                 write buffer
                  

           close outputFile

           display "___________________"
            display "Fahrenheit: " function trim(DisplayFahr)
           
  
       exit program.
