       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq4.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           
           01 Num1 pic 9(10).
           01 Num2 pic 9(10).

           01 answers.
               02 sumAns pic 9(10). 
               02 diffAns pic S9(10). 
               02 prodAns pic 9(10). 
               02 quoAns pic 9(10)v99 comp-3. 
           
           01 DisplayAnswers.
               02 sumDisp pic Z,ZZZ,ZZZ,ZZ9 . 
               02 diffDisp pic +Z,ZZZ,ZZZ,ZZ9 . 
               02 prodDisp pic Z,ZZZ,ZZZ,ZZ9 . 
               02 quoDisp pic Z,ZZZ,ZZZ,ZZ9.99 .
           
           01 noSpaceDiff PIC X(4).

           
       PROCEDURE DIVISION.
           
           Display "Enter num1: " with no advancing.
           accept Num1.

           Display "Enter num2: " with no advancing.
           accept Num2.


           compute sumAns of answers= num1 + num2.
           compute diffAns of answers= num1 - num2.
           compute prodAns of answers = num1 * num2.
           compute quoAns of answers = num1 / num2.
           
           move sumAns to sumDisp.
           move diffAns to diffDisp.
           move prodAns to prodDisp.
           move quoAns to quoDisp.

           move diffDisp to noSpaceDiff.
           move function trim(noSpaceDiff) to noSpaceDiff.

        Display "Sum: " sumDisp " | Diff: " diffDisp.
        Display "Prod: " prodDisp " | Quo: " quoDisp.
           
           
                
        call "SYSTEM" using "PAUSE".
       exit program.
