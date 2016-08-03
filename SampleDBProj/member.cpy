        IDENTIFICATION DIVISION.
        PROGRAM-ID. CBLNAM01
        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
        DATA DIVISION.
        LINKAGE SECTION.


       01  MEMBER.
         05 POLICYNUM    PIC X(8).
         05 POLICYTYPE   PIC X(4).
         05 FIRSTNAME    PIC X(16).
         05 LASTNAME     PIC X(16).
         05 STREETNUM    PIC X(4).
         05 STREETNAME   PIC X(20).
         05 CITY         PIC X(20).
         05 PCODE        PIC X(4).
         05 AGE          PIC X(3).