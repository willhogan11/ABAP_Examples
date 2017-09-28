*&---------------------------------------------------------------------*
*& Report  Z_PRIMETEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_PRIMETEST.

PARAMETERS : start(16) TYPE p DECIMALS 0 DEFAULT 1,
             endnum(16) TYPE p DECIMALS 0 OBLIGATORY DEFAULT 100.


TYPES ans(16) TYPE p DECIMALS 0.
DATA ans(16) TYPE p DECIMALS 0.
DATA itab TYPE TABLE OF ans.
DATA wa TYPE ans.
DATA wa_1(16) TYPE p DECIMALS 0.
DATA wa_2 TYPE ans.
DATA wa_3(16) TYPE p DECIMALS 0.
DATA wa_4(16) TYPE p DECIMALS 0.

DATA result TYPE i VALUE 24.


START-OF-SELECTION.
  DO .
    CLEAR wa_4.
    wa_3 = 1.
    wa_1 = sqrt( wa_2 ).
    WHILE wa_3 <> 0.
      ADD 1 TO wa_4.
      IF wa_4 > wa_1 AND wa_2 <> 4.
        EXIT.
      ENDIF.
      IF wa_4 > 1.
        wa_3 = wa_2 MOD wa_4.
      ENDIF.
    ENDWHILE.
    IF wa_3 <> 0 and wa_2 > 0.
      APPEND wa_2 TO itab.
    ENDIF.
    ADD 1 TO wa_2.
    IF wa_2 = endnum.
      EXIT.
    ENDIF.
  ENDDO.


  IF sy-subrc = 0.
    WRITE:/ 'Records Present'.
    LOOP AT itab INTO wa.
      WRITE: / sy-tabix, wa.
    ENDLOOP.
  ELSE.
    WRITE:/ 'No Records'.
  ENDIF.