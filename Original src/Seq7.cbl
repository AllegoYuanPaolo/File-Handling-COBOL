       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq7.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 sName PIC X(20).
           01 sNumber PIC 9(6).
           01 unitSold PIC 9(3).
           01 uPrice PIC 9(3).
           
           01 tSale PIC 9(6).
           01 dispTotal PIC $ZZZ,ZZZ .
       PROCEDURE DIVISION.
           
           DISPLAY "Enter Salesman name: " with no advancing.
           accept sName.

           DISPLAY "Enter salesman number: " with no advancing.
           accept sNumber.

           DISPLAY "Enter units sold: " with no advancing.
           accept unitSold.

           display "Unit Price: " with no advancing.
           accept uPrice.

           compute  tSale = uPrice * unitSold.
           move tSale to dispTotal.

           Display "___________________________________________".
           display "Total Sales: " dispTotal.
        
        call "SYSTEM" using "PAUSE".
        exit program.
        