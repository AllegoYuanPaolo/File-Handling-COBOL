       identification division.
       program-id. SEL9.

       environment division.

       data division.
           local-storage section.
           01 num pic 9.

       procedure division.
       display "enter num: " with no advancing
       accept num

           if num = 1
               display "Monday"
           else if num = 2
               display "Tuesday"
           else if num = 3
               display "Wednesday"
           else if num = 4
               display "Thursday"
           else if num = 5
               display "Friday"
           else if num = 6
               display "Saturday"
           else if num = 7
               display "Sunday"
           end-if.
       
       
       goback. 
