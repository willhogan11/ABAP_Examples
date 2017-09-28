*&---------------------------------------------------------------------*
*& Report  Z_TRYCATCH_EXAMPLE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_TRYCATCH_EXAMPLE.


PARAMETERS Num_1 TYPE I.

DATA res_1 TYPE P DECIMALS 2.
DATA orf_1 TYPE REF TO CX_ROOT.
DATA txt_1 TYPE STRING.


START-OF-SELECTION. 

  Write: / 'Square Root and Division with:', Num_1.
  write: /.

  TRY.
      IF ABS( Num_1 ) > 150.
        RAISE EXCEPTION TYPE CX_DEMO_ABS_TOO_LARGE.
      ENDIF.

      TRY.
          res_1 = SQRT( Num_1 ).
          Write: / 'Result of square root:', res_1.
          res_1 = 1 / Num_1.

          Write: / 'Result of division:', res_1.
        CATCH CX_SY_ZERODIVIDE INTO orf_1.
          txt_1 = orf_1->GET_TEXT( ).
        CLEANUP.
          CLEAR res_1.
      ENDTRY.

    CATCH CX_SY_ARITHMETIC_ERROR INTO orf_1.
      txt_1 = orf_1->GET_TEXT( ).

    CATCH CX_ROOT INTO orf_1.
      txt_1 = orf_1->GET_TEXT( ).
  ENDTRY.
  
  IF NOT txt_1 IS INITIAL.
    Write / txt_1.
  ENDIF.
  Write: / 'Final Result is:', res_1.
  
END-OF-SELECTION. 