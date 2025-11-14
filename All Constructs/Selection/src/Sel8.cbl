        IDENTIFICATION DIVISION.
        PROGRAM-ID. Sel8.
           
        environment division.
           input-output section.
               file-control.
                   select outputFile
                       assign to "Sel8.dat"
                       organization is line sequential
                       file status is OFStat.
       
        DATA DIVISION.
           File section.
               fd outputFile.
                   01 bufferLine pic x(64).

           LOCAL-STORAGE SECTION.
           01 Sname pic x(20).
           01 SNum pic 9(6).
           01 uSold pic 9(3)v99.
           01 uPrice pic 9(3).


           01 ZuSold pic $ZZZ.
           01 ZuPrice Pic $zzz.

           01 alpSold pic x(4).
           01 alpPrice pic x(4).

           01 tSales pic 9(5)v99.
           01 comm pic 9(5)v99.
           01 commRate pic 9v99.

           01 ZTsales pic $ZZ,ZZ9.
           01 ZComm pic $ZZZ,zz9.99.

           01 alpTsales pic x(11).
           01 alpComm pic x(11).

           01 frmt.
               02 FSym pic x.
               02 FNum pic x(12).

           01 spaceCount pic 99 value 0.

           01 OFStat pic xx.

        PROCEDURE DIVISION.
           display "Enter Employee Name: " no advancing
           accept SName

           display "Enter Employee number: " no advancing
           accept SNum

           display "Enter Units Sold: " no advancing
           accept uSold

           display "Enter Unit Price: "
           accept uPrice
           
           compute tSales = uSold * uPrice
           move tSales to ZTsales

           move uSold to ZuSold
           move uPrice to ZuPrice

            if tSales <= 15000
                   compute comm = tSales * 0.15
               else if tSales <= 20000
                   compute comm = tSales * 0.20
              else if tSales <= 25000
                   compute comm = tSales * 0.25
              else if tSales <= 30000
                   compute comm = tSales * 0.30
              else 
                   compute comm = tSales * 0.40
              end-if.
           
           move comm to ZComm
           display "Comm: " Zcomm

                   inspect ZuSold tallying spaceCount for all spaces
                   if spaceCount > 0
                       unstring ZuSold delimited by all space
                                into FSym FNum
                       end-unstring
                       
                       string FSym delimited by space
                              FNum delimited by space
                              into alpSold
                       end-string
                   else
                       move ZuSold to alpSold
                   end-if.

                       move 0 to spaceCount
                       move spaces to frmt

                   inspect ZuPrice tallying spaceCount for all spaces
                   if spaceCount > 0
                       unstring ZuPrice delimited all spaces
                                into FSym FNum
                       end-unstring
    
                       string FSym delimited by space
                              FNum delimited by space
                              into alpSold
                       end-string
                   else 
                       move ZuPrice to alpPrice
                   end-if.

                   move 0 to spaceCount    
                   move spaces to frmt 

                   
                   inspect ZTsales tallying spaceCount for all space
                   
                   if spaceCount not =  0
                       unstring ZTsales delimited by all space
                                into FSym FNum
                       end-unstring
    
                       string FSym delimited by space
                              FNum delimited by space
                              into alpTSales
                       end-string
                   else
                       move ZTsales to alpTsales
                   end-if.
                    

                   move space to frmt

                   unstring ZComm delimited by all spaces
                            into FSym FNum
                   end-unstring

                   string FSym delimited by space
                          FNum delimited by space
                          into alpComm
                   end-string

           display "Total Sales: " alpTsales
           display "Commission: " alpComm

                       open input outputFile
                           if OFStat = '00'
                               close outputFile
                               open extend outputFile
                           else 
                               open output outputFile
                           end-if.

                           move spaces to bufferLine
                       string "Name: " delimited by size
                           function trim(Sname) delimited by size
                           " | ID: " delimited by size
                           function trim(SNum) delimited by size
                           into bufferLine
                       end-string
                           write bufferLine
                           
                           move spaces to bufferLine
                       string "Units Sold: " delimited by size
                           function trim(alpSold) delimited by space
                           " | Unit Price: " delimited by size
                           function trim(alpPrice) delimited by size
                           into bufferLine
                       end-string 
                           write bufferLine

                           move spaces to bufferLine
                       write bufferLine from "=============="

                       string "Total Sales: " delimited by size
                           function trim(alpTsales) delimited by size
                           " | Commission: " delimited by size
                           function trim(alpComm) delimited by size
                           into bufferLine
                       end-string
                           write bufferLine

                           write bufferLine from "-------------------"
                           write bufferLine from spaces

                   close outputFile


       STOP RUN.
 