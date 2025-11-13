       identification division.
       program-id. Itr4.

       environment division.

       data division.
           local-storage section.
           01 startNum pic 99.
           01 endNum pic 99.
           01 dispCount pic Z9.
       procedure division.
       
           display "Enter Start: " with no advancing
           accept startNum

           display "Enter End: " with no advancing
           accept endNum
                   
                   if startNum > endNum
                       display "Start number cannot be greater than end"
                       exit program
                   end-if

           perform until startNum >= endNum
                   
                   if function mod(startNum, 2) = 0
                       move startNum to dispCount
                       display dispCount
                   end-if
               add 1 to startNum
           end-perform
       


       exit program.
       