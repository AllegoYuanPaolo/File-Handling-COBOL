       identification division.
       program-id. Itr9.

       environment division.

       data division.
           local-storage section.
           
           01 num pic 9(3).

           01 i pic 9(3) value 3.

       procedure division.
     

           display "Enter number: " with no advancing
           accept num

               if num <= 1
                   display "Not a prime"
                   exit program
               else if
                    num = 2
                   display "Prime number"    
                   exit program
               
              else if function mod(num, 2) = 0
                   display "Not a prime"
                   exit program

                else if function mod(num, i) = 0
                   display "Not a prime"
                   exit program
                else
                   perform until function mod(num, i) = 0
                          add 2 to i
                   end-perform
                      display "Prime number"
                end-if.
          
       exit program.
