       IDENTIFICATION DIVISION.
       PROGRAM-ID. Itr10.

       environment division.
           input-output section.
               file-control.
                   select optional outputFile
                       assign to "Itr10.dat"
                       organization is line sequential.

       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
       local-STORAGE SECTION.
           01 deci pic 9(3).
           01 ZDeci pic ZZ9.

           01 bi pic x(32) value spaces.
           01 i pic 9(16).
           01 remain pic 9(1).
           01 dispBi pic X(32).

           01 revCtr pic 9(3).

           01 revBi pic x(32).

           01 pos pic 9(32) value 1.
       procedure division.
              
     
           display "Decimal: " with no advancing
           accept deci
           display " "

           move deci to ZDeci
               open extend outputFile
                    move spaces to bufferLine
                    string "Decimal: " delimited by size
                           function trim(ZDeci) delimited by size
                           into bufferLine
                   end-string
                       write bufferLine
                       move spaces to bufferLine

               if deci = 0
                   display "Binary: 0"
                   write bufferLine from "Binary: 0"
                   close outputFile
                    exit program        
               else 
                   perform until deci = 0
                     divide deci by 2 giving deci remainder remain 
                       move remain to bi(pos:1) *> bi = bi + rem
                       
                       add 1 to pos
                   end-perform
                end-if.
                   
                  

                   move function reverse(bi) to revBi
                   move function trim(revBi) to revBi
                   display "Binary: " revBi

                   string "Binary: " delimited by size
                       function trim(revBi) delimited by size
                       into bufferLine
                   end-string
                       write bufferLine
                       write bufferLine from spaces

           close outputFile
       exit program.
