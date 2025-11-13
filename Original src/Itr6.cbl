       identification division.
       program-id. Itr6.

       environment division.
       
       data division.
           local-storage section.
           
           01 i pic 9(3) value 1.

           01 fct pic 9(5) value 1.

           01 num pic 9(3).

           01 dispFCT pic ZZ,ZZZ. 

       procedure division.
           display "Enter num: " with no advancing
           accept num

               if num < 0 
                   display "Cannot factorial negatives"
                   exit program
               end-if.
        
               perform until i > num
                   compute fct = fct * i
                   add 1 to i
               end-perform.
                   move fct to dispFCT
                   display "factorial: " dispFCT

       
       exit program.
       