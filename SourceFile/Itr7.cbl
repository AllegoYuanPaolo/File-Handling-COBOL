       identification division.
       program-id. Itr7.

       environment division.
       
       data division.
           local-storage section.
           01 num pic 9(3).

           01 sumTotal pic 9(3) value 0.

           01 i pic 9(3) value 0.

           01 dispSum pic ZZZ.

       procedure division.

           display "Enter num: " no advancing
           accept num
           
               if num < 0 
                   display "Cannot do negative"
              end-if.
           
           perform until i > num
               add i to sumTotal
               add 1 to i
           end-perform.
               move sumTotal to dispSum
               display "Sum: " dispSum
           
       exit program.
      
       