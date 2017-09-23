*&---------------------------------------------------------------------*
*& Report  Z_TESTPARAMMETHODS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_TESTPARAMMETHODS.

* Example 1:
CLASS c1 DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS do_something.
ENDCLASS.


CLASS c1 IMPLEMENTATION.
  METHOD do_something.
    WRITE: / 'Calling a Static Method'.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.
  c1=>do_something( ).


***********************************************************************
* Example 2: Calls a method with an input parameter

CLASS c2 DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS do_something1 IMPORTING p type i.
ENDCLASS.

CLASS c2 IMPLEMENTATION.
  METHOD do_something1.
    WRITE: / 'Num is: ', p.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  c2=>do_something1( 333 ).




***********************************************************************
* Example 3:

CLASS c3 DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS do_something2 IMPORTING p1 type i
                                         p2 type i
                                EXPORTING result TYPE i.
ENDCLASS.

CLASS c3 IMPLEMENTATION.
  METHOD do_something2.
    result = p1 + p2.
    WRITE: / 'Result of p1 + p2 = ', result.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  c3=>do_something2( p1 = 5 p2 = 2 ).




***********************************************************************
* Example 4:

CLASS c4 DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS do_something IMPORTING p1 type i
                                         p2 type i
                               EXPORTING p3 TYPE i
                                         p4 TYPE i
                               RETURNING VALUE(r) type i.
ENDCLASS.

CLASS c4 IMPLEMENTATION.
  METHOD do_something.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  c4=>do_something( EXPORTING p1 = 333
                              p2 = 444
                    IMPORTING p3 = DATA(a1)
                              p4 = DATA(a2)
                    RECEIVING r  = DATA(a3) ).