       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq7.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.
                   
                   select outputFile
                       assign to "Seq7.dat"
                       organization is line sequential
                       file status is OFStat.
       
       DATA DIVISION.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).

           WORKING-STORAGE SECTION.
           01 sName PIC X(20).
           01 sNumber PIC 9(6).
           01 unitSold PIC 9(5).
           01 uPrice PIC 9(5).
           
           01 formatSNumber pic ZZZZZ9.
           01 formatSold pic ZZ,zz9.
           01 formatPrice pic $ZZ,zz9.
           
           01 tSale PIC 9(9).
           01 dispTotal PIC $ZZZ,ZZZ,ZZ9 .

            01 currencyFormat.
               02 currSym pic x.
               02 currNum pic x(11).
           
           01 alpFormPrice pic x(7).
           01 alpTotal pic x(13).
           
           01 OFStat pic xx.
           01 ptr pic s9(4) comp.
           
       PROCEDURE DIVISION.
           
           DISPLAY "Enter Salesman name: " with no advancing
           accept sName

           DISPLAY "Enter salesman number: " with no advancing
           accept sNumber

           DISPLAY "Enter units sold: " with no advancing
           accept unitSold

           display "Unit Price: " with no advancing
           accept uPrice

           compute  tSale = uPrice * unitSold
           move tSale to dispTotal
           move unitSold to formatSold
           move uPrice to formatPrice
           move sNumber to formatSNumber


               unstring formatPrice delimited by all spaces
                   into currSym
                        currNum
                end-unstring

            move function concatenate(currSym,currNum) to alpFormPrice

               move spaces to currencyFormat

               unstring dispTotal delimited by all spaces
                   into currSym
                        currNum
               end-unstring
             
            move function concatenate(currSym,currNum) to alpTotal

            

               open input outputFile
                   if OFStat = "00"
                       close outputFile
                       open extend outputFile
                   else
                       open output outputFile
                  end-if
                   
                   move spaces to bufferLine
                   move 1 to ptr

                   string "Salesman: " delimited by size
                          function trim(sName) delimited by size
                         " | ID: " delimited by size
                         function trim(formatSNumber) delimited by space
                         into bufferLine
                         with pointer ptr
                    end-string
                       write bufferLine

                       move spaces to bufferLine
                       move 1 to ptr

                     string "Units Sold: " delimited by size
                           function  trim(formatSold) delimited by space
                           " | Unit Price: " delimited by size
                          function trim(alpFormPrice) delimited by space
                           into bufferLine
                           with pointer ptr
                     end-string
                       write bufferLine

                       move spaces to bufferLine
                       move 1 to ptr 

                       write bufferLine from "________________"

                       string "Total Sales: " delimited by size
                              function trim(alpTotal) delimited by space
                              into bufferLine
                              with pointer ptr
                       end-string
                               write bufferLine
                        
                        write bufferLine from "--------------------"

                        write bufferLine from spaces

                  close outputFile
           
           

           Display "___________________________________________"
           display "Total Sales: " alpTotal
        

        exit program.
        