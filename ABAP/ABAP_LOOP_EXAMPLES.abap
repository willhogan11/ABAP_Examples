*&---------------------------------------------------------------------*
*& Report  Z_LOOP_CNTR_EXAMPLE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_LOOP_CNTR_EXAMPLE.

* Basic Counter using a local variable
DATA: lv_counter TYPE i VALUE 1,
      lv_test TYPE i.

DO 10 TIMES.
  WRITE: / lv_counter.
  lv_counter = lv_counter + 1.
ENDDO.


WRITE:/ 'Using sy-index instead'.

* The same as above, but using sy-index which holds the value at each pass
DO 10 TIMES.
  WRITE:/ SY-INDEX.
  lv_test = sy-index.
ENDDO.

WRITE:/ 'The value of sy-index is: ', lv_test.