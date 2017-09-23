*&---------------------------------------------------------------------*
*& Report  Z_TEST_OOP
*&
*&---------------------------------------------------------------------*
*& Testing Purposes
*&
*&---------------------------------------------------------------------*

REPORT Z_TEST_OOP.


* Class Definition
CLASS lcl_vehicle DEFINITION .

* Public class, Defines which types can be transferred
PUBLIC SECTION .

METHODS:
    set_attributes
      IMPORTING iv_make   TYPE s_make
                iv_model  TYPE s_model, 
                display_attributes .
CLASS-METHODS display_n_o_vehicles .

* Preserve Encapsulation
PRIVATE SECTION .
* Instance Variable Declaration..
  DATA:
    mv_make TYPE s_make,
    mv_model TYPE s_model .

* Static Attribute / Variable,
* Exist once per class and defined using the CLASS-DATA keywords
  CLASS-DATA:
    gv_n_o_vehicles TYPE i .
ENDCLASS .



* Class Implementation
CLASS lcl_vehicle IMPLEMENTATION .
  
*Getters / Setters??
  METHOD set_attributes .
    my_make = iv_make .
    my_model = iv_model .
    
    gv_n_o_vehicles = gv_n_o_vehicles + 1 .
  ENDMETHOD .

* Display the vehicle make and model Attributes
  METHOD display_n_o_vehicles .
    WRITE: / 'Make', mv_make, 
           / 'Model', mv_model .
  ENDMETHOD .
  
  METHOD display_n_o_vehicles .
      WRITE: 'Number of Vehicles: ' . gv_n_o_vehicles .
  ENDMETHOD .
ENDCLASS .