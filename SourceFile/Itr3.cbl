       identification division.
       program-id. Itr3.

       environment division.
       
       data division.
           local-storage section.
           01 n pic 99.
           01 counter pic 99 value 1.
           01 dispCounter pic Z9.
       procedure division.
       
           display "Enter end: " with no advancing
           accept n

           perform until counter >= n
                   if function mod(counter, 2) = 0
                       move counter to dispCounter
                       display dispCounter
                   end-if
               add 1 to counter
           end-perform


       exit program.
       