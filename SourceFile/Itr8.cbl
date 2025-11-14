       identification division.
       program-id. Itr8.

       environment division.
           input-output section.
               file-control.
                   select optional outputFile
                       assign to 'Itr8.dat'
                       organization is line sequential.
       
       data division.
           file section. 
               fd outputFile.
                   01 bufferLine pic x(128).
           local-storage section.
           01 num pic 9(3).
           01 ZNUm pic zz9.

           01 a pic 9(4) value 0.
           01 ZA pic Z,ZZ9.
           01 b pic 9(4) value 1.
           01 ZB pic z,zz9.
           

           01 i pic 9(4) value 0.
           
           01 nT pic 9(4) value 0.
           
           01 dispTerm PIC Z,ZZ9.

           01 ptr pic s9(4) comp.
       procedure division.
       

           display "Enter nth term: " with no advancing
           accept num

           move num to ZNUm
           
           open extend outputFile
           
           move a to ZA
           move b to ZB

                  if num <= 0
                      display "Cannot proceed"
                      exit program 
                  end-if.
   
                   move spaces to bufferLine
                   string 'Num: ' delimited by size
                       function trim(ZNUm) delimited by size
                       into bufferLine
                   end-string
                       write bufferLine
                       move spaces to bufferLine
                       move 1 to ptr




   
                  if num = 2
                       display "A: "ZA
                       display "B: "ZB
                       string a delimited by size
                             ", " delimited by size
                             b delimited by size
                             into bufferLine
                       end-string
                           write bufferLine
                           write bufferLine from spaces
                      close outputFile
                      exit program
                  end-if.    
                       
                       display ZA
                       display ZB
                       string function trim(ZA) delimited by size
                              ', ' delimited by size
                               function trim(ZB) delimited by size
                              ', ' delimited by size
                              into bufferLine
                              with pointer ptr
                       end-string
               perform until i = num
                  compute nT = a + b
                  move b to a
                  move nT to b
                  
   
                  move nT to dispTerm
                  string function trim(dispTerm) delimited by size
                       ', ' delimited by size
                       into bufferLine
                       with pointer ptr
                   end-string
                  display dispTerm
                 
   
                  add 1 to i
               end-perform.
               write bufferLine
               write bufferLine from spaces
           
           close outputFile
       exit program.
           