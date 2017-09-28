*&---------------------------------------------------------------------*
*& Report  Z_BASICMETHOD
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_BASICMETHOD.


DATA: V_IMP TYPE I,
      V_CHA TYPE I VALUE 100.


*Define the class.
CLASS CL_LC DEFINITION.
  PUBLIC SECTION.
    METHODS: DISPLAY IMPORTING A TYPE I
                     EXPORTING B TYPE I
                     CHANGING C TYPE I.
ENDCLASS.


*Implement the class.
CLASS CL_LC IMPLEMENTATION.
  METHOD DISPLAY.
    B = A + 20.
    C = A + 30.
  ENDMETHOD.
ENDCLASS.


*Create the object.
DATA OBJ TYPE REF TO CL_LC.

START-OF-SELECTION.
  CREATE OBJECT OBJ.
  CALL METHOD OBJ->DISPLAY
    EXPORTING
      A = 10
    IMPORTING
      B = V_IMP
    CHANGING
      C = V_CHA.
  WRITE:/ 'OUTPUT PARAMETR',    V_IMP,
          'CHANGING PARAMETER', V_CHA.