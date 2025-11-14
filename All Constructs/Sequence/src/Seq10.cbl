       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq10.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Seq10.dat"
                        organization is line sequential
                        file status is OFStat.
       
       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           WORKING-STORAGE SECTION.
           01 base PIC 9(3).
           01 hei PIC 9(3).
           01 a pic 9(3)V99.
           01 compArea pic 9(3)V99. 
           01 peri pic 9(3)v99.

           01 base2 PIC 9(3).
           01 hei2 PIC 9(3).

           01 dispBase pic ZZ9. 
           01 dispHei pic zz9.
           01 dispArea PIC ZZZ.ZZ.
           01 dispPeri PIC ZZZ.ZZ.

           01 OFStat pic xx.
           01 ptr pic s9(4) comp.

       PROCEDURE DIVISION.
       
       DISPLAY "Enter Base: " with no advancing
       accept base

       DISPLAY "Enter Height: " with no advancing
       accept hei

       compute base2 = base * base
       compute hei2 = hei * hei

       compute a = function sqrt(base2 + hei2)
       compute compArea = (1/2) * base * hei
       compute peri = base + hei + a

       
       move base to dispBase
       move hei to dispHei
       move compArea to dispArea
       move peri to dispPeri

           open input outputFile
               if OFStat = "00"
                   close outputFile
                    open extend outputFile
                else 
                   open output outputFile
                end-if

                move spaces to bufferLine
                move 1 to ptr

                string "Base: " delimited by size
                       function trim(dispBase) delimited by space
                       " | Height: " delimited by size
                       function trim(dispHei) delimited by space
                       into bufferLine
                       with pointer ptr
               end-string
                   write bufferLine

                move spaces to bufferLine
                move 1 to ptr

                write bufferLine from "_______________________________"

                string "Area: " delimited by size
                       function trim(dispArea) delimited by size
                       " | Perimeter: " delimited by size
                       function trim(dispPeri) delimited by space
                       into bufferLine
                       with pointer ptr
                 end-string

                   write bufferLine

                   write bufferLine from "-------------------------"
                   write bufferLine from spaces

               close outputFile
       display "_______________________________"
       display "Area: " dispArea " | Perimeter: " dispPeri
    
     
       exit program.

       