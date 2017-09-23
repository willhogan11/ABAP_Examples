*&---------------------------------------------------------------------*
*& Report  Z_STRINGREVERSE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_STRINGREVERSE.

* Option 1 using the inbuilt reverse function
PARAMETERS: lv_param(100) TYPE c.

DATA : lv_str(100),
       lv_rev(100).

lv_str = lv_param.


CALL FUNCTION 'STRING_REVERSE'
  EXPORTING
    string    = lv_str
    lang      = sy-langu
  IMPORTING
    rstring   = lv_rev
  EXCEPTIONS
    too_small = 1
    OTHERS    = 2.

WRITE : lv_rev.


* Option 2 using a more manual reverse method
DATA: int TYPE i,
s TYPE i.
int = strlen( ' willhogan' ).
DATA: ch(20) TYPE c,
ch1 TYPE c.
ch = 'willhogan'.

DO int TIMES.
  int = int - 1.
  s = int.
  ch1 = ch+s(1).
  WRITE: ch1.
ENDDO.