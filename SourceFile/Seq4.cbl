       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq4.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Seq4.dat"
                       organization is line sequential
                       file status is OFStat.
       
       DATA DIVISION.
           File section.
           fd outputFile.
           01 bufferLine pic x(64).

           WORKING-STORAGE SECTION.
           
           01 Num1 pic 9(10).
           01 Num2 pic 9(10).
           01 formatNum1 pic z,zzz,zzz,zz9.
           01 formatNum2 pic z,zzz,zzz,zz9.

           01 answers.
               02 sumAns pic 9(10). 
               02 diffAns pic S9(10). 
               02 prodAns pic 9(10). 
               02 quoAns pic 9(10)v99 comp-3. 
           
           01 DisplayAnswers.
               02 sumDisp pic Z,ZZZ,ZZZ,ZZ9 . 
               02 diffDisp pic +Z,ZZZ,ZZZ,ZZ9 . 
               02 prodDisp pic Z,ZZZ,ZZZ,ZZ9 . 
               02 quoDisp pic Z,ZZZ,ZZZ,ZZ9.99 .
           
            01 diff.
               02 diffSymbol pic X(1).
               02 diffNum PIC X(9).
               02 alpDiff pic x(11).
           
           01 OFStat pic xx.
           01 ptr pic s9(4) comp.
           
       PROCEDURE DIVISION.
           
           Display "Enter num1: " with no advancing
           accept Num1

           Display "Enter num2: " with no advancing
           accept Num2

           

           compute sumAns of answers= num1 + num2
           compute diffAns of answers= num1 - num2
           compute prodAns of answers = num1 * num2
           compute quoAns of answers = num1 / num2
           
           
           move num1 to formatNum1
           move num2 to formatNum2
           move sumAns to sumDisp
           move diffAns to diffDisp
           move prodAns to prodDisp
           move quoAns to quoDisp

               unstring diffDisp delimited by all space
                   into diffSymbol
                        diffNum
                end-unstring

                string diffSymbol delimited by space
                       diffNum delimited by space
                       into alpDiff
                 end-string

               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                   else 
                       open output outputFile
                   end-if
                  
       
       move function concatenate("Num1: ", function trim(formatNum1))   -
        to bufferLine
                   write bufferLine
       
       move function concatenate("Num2: ", function trim(formatNum2))   -
       to bufferLine
                   write bufferLine
                
                move spaces to bufferLine
                move 1 to ptr
                string "Sum: " delimited by size
                       function trim(sumDisp) delimited by space
                       "| Difference: " delimited by size
                       function trim(alpDiff) delimited by space
                       into bufferLine
                       with pointer ptr
                 end-string
                   
                   write bufferLine

               move spaces to bufferLine
               move 1 to ptr 
               string "Product: " delimited by size
                       function trim(prodDisp) delimited by space
                       "| Quotient: " delimited by size
                       function trim(quoDisp) delimited by space
                       into bufferLine
                       with pointer ptr
               end-string

                       write bufferLine
                       write bufferLine from "----------"
                   
                   close outputFile
           
       exit program.
