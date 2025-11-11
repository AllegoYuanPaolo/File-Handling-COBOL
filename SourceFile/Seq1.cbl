       IDENTIFICATION DIVISION.
       PROGRAM-ID. Seq1.

       ENVIRONMENT DIVISION.
           input-output section.
               file-control.

               select outputFile
                   assign to "Seq1.dat"
                   organization is sequential
                   file status is OFStat.

       DATA DIVISION.
           file section.
           fd outputFile.
               01 buffer pic X(16).
            working-storage section.
            01 OFStat pic xx.
       
       PROCEDURE DIVISION.
             open extend outputFile
                   if OFStat not = "00"
                       display "ERROR: "OFStat
                       goback
                   end-if
                   
               move "Yuan Allego" to buffer
               write buffer
               write buffer
               write buffer
               write buffer
               write buffer
             close outputFile

             display "Yuan Allego"
             display "Yuan Allego"
             display "Yuan Allego"
             display "Yuan Allego"
             display "Yuan Allego"
             display "Yuan Allego"
        goback.
        