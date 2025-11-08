       identification division.
       program-id. SEL10.

       environment division.

       data division.
       local-storage section.
       
           01 letter pic x.

       procedure division.
       
           display "enter letter: " with no advancing
           accept letter


           if  letter = 'A' or letter = 'E' OR letter = 'O'             -
            OR letter = 'I' OR letter ='U'
               Display "Your letter is a vowel"
           else if letter = 'a' or letter = 'e' OR letter =             -
           'o' OR letter = 'i' OR letter = 'u'
               display "Your letter is a vowell"
           else 
               display "Your letter is a consonant"
           end-if.

       goback. 
