       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq2.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
               
               select outputFile 
                   assign to "Seq2.dat"
                   organization is line sequential
                   file status is OFStat.
       
       DATA DIVISION.
           file section.
               fd outputFile.
               01 buffer pic x(64).
           
           WORKING-STORAGE SECTION.
           
           01 OFStat pic xx.
           
           01 A PIC 99  VALUE 5.
           01 B PIC 99 VALUE 10.
           
           01 C PIC 9(2) VALUE 0.
           01 D PIC 9(2) VALUE 0.
           
           01 DisplayA pic Z9. 
           01 DisplayB pic z9. 

           01 ptr pic s9(4) comp.
           

       PROCEDURE DIVISION.
           
           open output outputFile
               if OFStat not = "00"
                   display "ERROR: " OFStat
                   goback
               end-if

           move A to DisplayA
           move B to DisplayB

           display "Before Swap: "
           display "A: " DisplayA " | B: " DisplayB
           
           move "Before Swap" to buffer
           write buffer
           
           move 1 to ptr
           string "A: " delimited by size 
                 displayA delimited by size
                 "| B: " delimited by size
                 displayB delimited by size

                 into buffer
                 with pointer ptr
           end-string

                 write buffer

               

           COMPUTE C = A + B - A
           COMPUTE D = A + B - B

           move C to A
           move D to B

           move A to DisplayA
           move B to DisplayB

           display "After Swap: "
           display "A: " DisplayA " | B: " DisplayB

           move "After Swap" to buffer
           write buffer

           move 1 to ptr
           string "A: " delimited by size 
                 DisplayA delimited by size
                 "| B: " delimited by size
                 DisplayB delimited by size
                 into buffer
                 with pointer ptr
           end-string

                 write buffer                
           close outputFile
       exit program.
