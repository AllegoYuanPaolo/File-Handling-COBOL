       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEL7.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
           local-STORAGE SECTION.

           01 temp pic 9(3).
       PROCEDURE DIVISION.
           DISPLAY "Enter temperature: " with no advancing
           accept temp

           if temp < 0
               display "Freezing Weather"
           else if temp > 0 and temp < 10
               display "Very Cold Weather"
           else if temp > 10 and temp < 20
                display "Cold Weather"
           else if temp > 20   and temp < 30
               display "Normal"
           else if temp > 30 and temp < 40
               display "It's Hot"
           else if temp >= 40 
                display "It's Very Hot"
           end-if.

       goback. 
