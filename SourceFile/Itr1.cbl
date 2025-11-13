       identification division.
       program-id. Itr1.

       environment division.
           input-output section.
               file-control. 
                   select optional outputFile
                       assign to "Itr1.dat"
                       organization is line sequential.
                       

       data division.
           file section.
               fd outputFile.
               01 bufferLine pic x(64).
           local-storage section.
           01 counter pic 9 value 1.

       procedure division.
           open extend outputFile
               perform until counter > 5
                   display "Yuan Allego"
                   write bufferLine from "Yuan Allego"
                   add 1 to counter
               end-perform.
               write bufferLine from spaces
           close outputFile
          

       exit program.

       