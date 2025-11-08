      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics:
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CIRCLE.
       AUTHOR.
       INSTALLATION.
       DATE-WRITTEN.
       DATE-COMPILED.
       SECURITY.
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. LENOVO.
       OBJECT-COMPUTER. LENOVO.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
          SELECT CIRCLE-FILE
          ASSIGN TO"C:\Users\Gecilie\Downloads\cobolprograms\CIRCLE.dat"
          ORGANIZATION IS LINE SEQUENTIAL.
      ********************************
       DATA DIVISION.
       FILE SECTION.
       FD  CIRCLE-FILE
           LABEL RECORD IS STANDARD
           DATA RECORD IS CIRCLE-REC.
       01  CIRCLE-REC.
           05  RADIUS   PIC 99.
           05  AREA-C   PIC 9(3)v9(2).
           05  AREA-CIR PIC 9(3).9(2).
           05  CIRCUM   PIC 9(2).9(2).
       WORKING-STORAGE SECTION.
       01  PIE      PIC 9V9(4) VALUE IS 3.1416.


      **********************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            OPEN Extend CIRCLE-FILE.
            DISPLAY " Area and Circumference of a Circle "
            DISPLAY " Enter radius: "
            ACCEPT RADIUS.

            COMPUTE AREA-C = PIE * (RADIUS*RADIUS).
            MOVE AREA-C TO AREA-CIR.
            COMPUTE CIRCUM = 2 * PIE * RADIUS.

            DISPLAY " Area = " AREA-C.
            DISPLAY " Circumference = " CIRCUM.
            WRITE CIRCLE-REC.
            CLOSE CIRCLE-FILE.
            STOP RUN.
       END PROGRAM CIRCLE.
