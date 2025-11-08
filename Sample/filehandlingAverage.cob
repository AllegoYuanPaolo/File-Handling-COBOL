      ******************************************************************
      * Author: Gecilie Almiranez
      * Date: January 27, 2022
      * Purpose: Storing info in a file
      *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AVERAGE.
       AUTHOR. Programmer
       INSTALLATION.
       DATE-WRITTEN.
       DATE-COMPILED.
       SECURITY. PRIVATE.
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. LENOVO.
       OBJECT-COMPUTER. LENOVO.
      * Syntax for input output section
      * INPUT-OUTPUT SECTION.
      *  FILE-CONTROL.
      *       SELECT file-name ASSIGN TO dd-name-jcl
      *       ORGANIZATION IS SEQUENTIAL
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
          SELECT GRADE-FILE
          ASSIGN TO "C:\Users\Gecilie\Downloads\cobolprograms\GRADE.DAT"
          ORGANIZATION IS LINE SEQUENTIAL.

      ********************************
       DATA DIVISION.
       FILE SECTION.
       FD  GRADE-FILE
           LABEL RECORD IS STANDARD
           DATA RECORD IS GRADE-REC.
       01  GRADE-REC.
           05  PRELIM      PIC 9(3).
           05  MIDTERM     PIC 9(3).
           05  FINALS      PIC 9(3).
           05  AVE         PIC 9(3)V9(3).
           05  AVERAGE     PIC 9(3).9(3).
      *********************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * syntax for open statement  OPEN "mode" file-name.
            OPEN Extend GRADE-FILE.
            DISPLAY " AVERAGE "
            DISPLAY "Prelim Score: "
            ACCEPT PRELIM.
            DISPLAY "Midterm Score: "
            ACCEPT MIDTERM.
            DISPLAY "Finals Score: "
            ACCEPT FINALS.

            COMPUTE AVE = (PRELIM+MIDTERM+FINALS)/3.
            MOVE AVE TO AVERAGE.
            DISPLAY "AVERAGE = " AVERAGE.
      * syntax for  write statement   WRITE record-buffer [FROM ws-file-structure]
            WRITE GRADE-REC.
      * syntax for close statement   CLOSE file-name.
            CLOSE GRADE-FILE.
            STOP RUN.
       END PROGRAM AVERAGE.
