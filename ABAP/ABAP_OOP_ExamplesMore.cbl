*&---------------------------------------------------------------------*
*& Report  Z_TEST_OOP1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_TEST_OOP1.

CLASS lcl_airplane DEFINITION .

  PUBLIC SECTION .

    METHODS:
      set_attributes
        IMPORTING
          iv_name TYPE string
          iv_planetype TYPE string,
          display_attributes .

    CLASS-METHODS:
      display_n_o_airplanes .

  PRIVATE SECTION .
    CONSTANTS: c_pos_1 TYPE i VALUE 10 .

    DATA: mv_name TYPE string,
          mv_planetype TYPE string .

    CLASS-DATA:
      gv_n_o_airplanes TYPE i .

ENDCLASS .



CLASS lcl_airplane IMPLEMENTATION .

  METHOD set_attributes .
    mv_name = iv_name .
    mv_planetype = iv_planetype.

    gv_n_o_airplanes = gv_n_o_airplanes + 1 .
  ENDMETHOD.

  METHOD display_attributes .
    WRITE: / icon_ws_plane AS ICON,
           / 'Name of Airplane: '(001), AT c_pos_1 mv_name,
           / 'Type of Airplane: '(002), AT c_pos_1 mv_planetype .
  ENDMETHOD .

  METHOD display_n_o_airplanes .
    SKIP.
    WRITE: / 'Number of airplanes:'(ca1),
    AT c_pos_1 gv_n_o_airplanes LEFT-JUSTIFIED .
  ENDMETHOD .

ENDCLASS .


DATA: go_airplane1 TYPE REF TO lcl_airplane .
*      go_airplane2 TYPE REF TO lcl_airplane .

* The actual running of the program
* 1. Create a plane object
* 2. Set the planes attributes
* 3. Display the Objects attributes when run
START-OF-SELECTION .

  CREATE OBJECT go_airplane1 .

  go_airplane1->set_attributes(
    iv_name = 'TestName'
    iv_planetype = 'TestPlaneType'
  ) .

  go_airplane1->display_attributes( ) .

END-OF-SELECTION .