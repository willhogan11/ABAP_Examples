*&---------------------------------------------------------------------*
*& Report  Z_TESTFLIGHT_SQL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_TESTFLIGHT_SQL.


DATA: BEGIN OF localTable,
      connId TYPE SPFLI-CONNID,
      cityFrom TYPE SPFLI-CITYFROM,
      cityTo TYPE SPFLI-CITYTO,
      END OF localTable.

DATA c1 TYPE SPFLI-CARRID VALUE 'LH'.

EXEC SQL PERFORMING loop_output.
  SELECT connId, cityFrom, cityTo
  INTO :localTable
    FROM SPFLI
    WHERE carrid = :c1
ENDEXEC.


FORM loop_output.
  write: / localTable-CONNID, localTable-CITYFROM, localTable-CITYTO.
ENDFORM.


**********************************************************************************************************


DATA: BEGIN OF localStructure,
      testId TYPE i,
      testName TYPE string,
      testAddr TYPE string,
END OF localStructure.

localStructure-testId = 1.
localStructure-testName = 'Will'.
localStructure-testAddr = 'Galway'.

WRITE: / 'Test',  localStructure-testId, localStructure-testName, localStructure-testAddr.


**********************************************************************************************************


* Another Example...
DATA: BEGIN OF linv Occurs 0,
      Name(20) TYPE C,
      ID_Number TYPE I,
END OF linv.

DATA table1 LIKE TABLE OF linv.
linv-Name = 'Melissa'.
linv-ID_Number = 105467.

APPEND linv TO table1.

LOOP AT table1 INTO linv.
  Write: / linv-name, linv-ID_Number.
ENDLOOP.