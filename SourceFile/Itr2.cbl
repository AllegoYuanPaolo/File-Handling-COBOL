       identification division.
       program-id. Itr2.

       environment division.
           input-output section.
            file-control.
               select optional outputFile
                   assign to "Itr2.dat"
                   organization is line sequential.
       
       data division.
           file section.
               fd outputFile.
                   01 bufferLine pic x(64).
           local-storage section.
           01 counter pic 9 value 1.
       procedure division.
           open output outputFile
               perform until counter > 5
                   display counter
                   write bufferLine from counter
                   add 1 to counter
               end-perform.
               write bufferLine from spaces
           close outputFile
     

       exit program.

       