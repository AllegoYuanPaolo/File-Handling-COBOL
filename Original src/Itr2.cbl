       identification division.
       program-id. Itr2.

       environment division.
       
       data division.
           local-storage section.
           01 counter pic 9 value 1.
       procedure division.
           perform until counter > 5
               display counter
               add 1 to counter
           end-perform.

     

       exit program.

       