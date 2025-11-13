       identification division.
       program-id. Itr8.

       environment division.
       
       data division.
           local-storage section.
           01 num pic 9(3).

           01 a pic 9(5) value 0.
           01 dispA pic ZZZZ9.
           01 b pic 9(5) value 1.
           01 dispB pic ZZzz9.

           01 i pic 9(3) value 0.
           
           01 nT pic 9(4) value 0.
           
           01 dispTerm PIC Z,ZZ9.
       procedure division.
       

           display "Enter nth term: " with no advancing
           accept num

               if num <= 0
                   display "Cannot proceed"
                   exit program 
               end-if.

               move a to dispA
               move b to dispB

               display "  "dispA
               display "  "dispB

               if num = 2
                   display "2"
                   exit program
               end-if.    
           
           perform until i = num
               compute nT = a + b
               move b to a
               move nT to b
               

               move nT to dispTerm
               display dispTerm
              

               add 1 to i
           end-perform.
     
       exit program.
           