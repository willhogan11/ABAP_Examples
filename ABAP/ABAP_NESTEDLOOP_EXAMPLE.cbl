*&---------------------------------------------------------------------*
*& Report  Z_NESTEDLOOP_EXAMPLE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_NESTEDLOOP_EXAMPLE.

DATA: a TYPE i,
      b TYPE i,
      c TYPE i.

WHILE a <> 15.
  a = a + 1.
  WRITE: / 'Outer loop cycle : ', a.
  b = 0.
  WHILE b <> 10.
    b = b + 1.
    WRITE: / 'Inner loop cycle : ', b.
  ENDWHILE.
  c = c + b.
ENDWHILE.

c = c + a.
WRITE: / 'Total Iterations : ', c.