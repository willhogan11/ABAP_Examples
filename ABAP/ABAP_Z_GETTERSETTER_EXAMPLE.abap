*&---------------------------------------------------------------------*
*& Report  Z_GETTERSETTER_EXAMPLE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_GETTERSETTER_EXAMPLE.

* Class Definition
CLASS cl_car DEFINITION.

  PUBLIC SECTION.
    METHODS:
      get_speed
        RETURNING
          VALUE(r_speed) TYPE i,
      set_speed
        IMPORTING
          i_speed TYPE i,
      display_speed,
      increase_speed,
      decrease_speed.

  PRIVATE SECTION.
    DATA: speed TYPE i.

ENDCLASS.


* Class Implementation
CLASS cl_car IMPLEMENTATION.

  METHOD get_speed.
    r_speed = me->speed.
  ENDMETHOD.

  METHOD set_speed.
    me->speed = i_speed.
  ENDMETHOD.

  METHOD increase_speed.
    ADD 1 TO speed.
  ENDMETHOD.

  METHOD decrease_speed.
    me->speed = speed - 1.
  ENDMETHOD.

  METHOD display_speed.
    WRITE: / 'Current Speed is: ', me->speed.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  DATA go_speed TYPE REF TO cl_car.
  CREATE OBJECT go_speed.

  go_speed->set_speed( 10 ).
  go_speed->get_speed( ).
  go_speed->display_speed( ). 
  
  WRITE:/ 'Speed Increased: '.
  go_speed->increase_speed( ).
  go_speed->display_speed( ).

  WRITE:/ 'Speed Decreased: '.
  go_speed->decrease_speed( ).
  go_speed->display_speed( ).
  
  WRITE:/ 'Stop Car'.
  go_speed->stop_car( ).
  go_speed->display_speed( ).

END-OF-SELECTION.