*&---------------------------------------------------------------------*
*& Report  Z_GRADEPROGRAM
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_GRADEPROGRAM.

PARAMETERS: pv_a TYPE i,
            pv_b TYPE i,
            pv_c TYPE i,
            pv_d TYPE i,
            pv_e TYPE i.

DATA: lv_aveResult TYPE i.

lv_aveResult = ( pv_a + pv_b + pv_c + pv_d + pv_e ) / 5.

WRITE:/ 'Your scores entered were: ', pv_a, pv_b, pv_c, pv_d, pv_e.
WRITE:/ 'Your GPA is: ', lv_aveResult.

IF lv_aveResult < 40.
  WRITE:/ 'You Failed!'.
ELSEIF lv_aveResult > 41 AND lv_aveResult < 60.
  WRITE:/ 'Your score was average'.
ELSEIF lv_aveResult > 61 AND lv_aveResult < 80.
  WRITE:/ 'Your score was better than average'.
ELSEIF lv_aveResult > 81 AND lv_aveResult < 100.
  WRITE:/ 'You Scored a distinction'.
ENDIF.