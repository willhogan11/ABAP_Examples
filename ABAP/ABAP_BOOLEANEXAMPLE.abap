*&---------------------------------------------------------------------*
*& Report  Z_BOOLEANEXAMPLE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_BOOLEANEXAMPLE.

* An example of using Booleans in ABAP
DATA is_found TYPE abap_bool.

is_found = abap_true.

IF ( is_found = abap_true ).
  WRITE 'Its True!'.
ELSE.
  WRITE 'Its False'.
ENDIF.