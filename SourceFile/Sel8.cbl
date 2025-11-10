       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL8.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
           local-STORAGE SECTION.
           01 SName pic X(20).
           01 SNum pic 9(6).
           01 uSold pic 9(3)v99.
           01 uPrice pic 9(3)v99.
           
           01 tSales pic 9(5)v99.
           01 comm pic 9(5)v99 value 0.
           01 commRate pic 9V99.

           01 dispTSales pic ZZ,zzz value zeroes.
           01 dispComm pic zzz,zz9.99 value zeroes.

       PROCEDURE DIVISION.
           display "Enter Employee name: " with no advancing
           accept SName

           display "Enter Employee number: " with no advancing
           accept SNum

           display "Enter units sold: " with no advancing
           accept uSold

           display "Enter unit price: " with no advancing
           accept uPrice

      

           compute tSales = uSold * uPrice
           move tSales to dispTSales
           display "Total Sales: " dispTSales

    
           
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

     
           display "comm: " comm
           move comm to dispComm
           display "Commission:" dispComm       



       goback. 

