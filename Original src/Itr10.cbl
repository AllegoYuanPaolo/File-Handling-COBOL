       IDENTIFICATION DIVISION.
       PROGRAM-ID. Itr10.

       DATA DIVISION.
       local-STORAGE SECTION.
           01 deci pic 9(3).
           01 bi pic x(32) value spaces.
           01 i pic 9(16).
           01 remain pic 9(1).
           01 dispBi pic X(32).

           01 revCtr pic 9(3).

           01 revBi pic x(32).

           01 pos pic 9(32) value 1.
       procedure division.
              
     
           display "Decimal: " with no advancing
           accept deci
           display " "

               
                    
               if deci = 0
                   display "Binary: 0"
                    exit program        
               else 
                   perform until deci = 0
                     divide deci by 2 giving deci remainder remain 
                       move remain to bi(pos:1) *> bi = bi + rem
                       
                       add 1 to pos
                   end-perform
                end-if.
                   
                  

                   move function reverse(bi) to revBi
                   move function trim(revBi) to revBi
                   display "Binary: " revBi

                   
       exit program.
