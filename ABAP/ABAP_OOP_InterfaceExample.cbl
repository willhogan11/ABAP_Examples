*&---------------------------------------------------------------------*
*& Report  Z_INTERFACE_EXAMPLE
*&---------------------------------------------------------------------*
*&* ABAP OOP Interface Declaration and Implementation Example
*&* Author: Will Hogan 21-07-17
*&---------------------------------------------------------------------*

REPORT Z_INTERFACE_EXAMPLE.


* ABAP OOP Interface Declaration and Implementation Example
INTERFACE my_interface1.
  METHODS msg.
ENDINTERFACE.

CLASS num_counter DEFINITION.
  
  PUBLIC SECTION.
  INTERFACES  my_interface1.
  
  METHODS add_number.
  
  PRIVATE SECTION.
    DATA num type i.
  
ENDCLASS.


CLASS num_counter IMPLEMENTATION.

  METHOD my_interface1~msg.
    WRITE: / 'The number is: ', num.
  ENDMETHOD.

  METHOD add_number.
    ADD 7 TO num.
  ENDMETHOD.

ENDCLASS.


CLASS drive1 Definition. 
  
  PUBLIC Section. 
  INTERFACES my_interface1. 
  Methods speed1.
  
  PRIVATE Section.
    Data wheel1 Type I. 
  
ENDCLASS. 


CLASS drive1 Implementation.
  
  METHOD my_interface1~msg.
    WRITE: / 'Total number of wheels is: ', wheel1.
  ENDMETHOD.
  
  METHOD speed1.
    ADD 4 to wheel1.
  ENDMETHOD.
  
ENDCLASS.


* Run the program
START-OF-SELECTION.

  data object1 type ref to num_counter.
  create object object1.
  
  CALL METHOD object1->add_number.
  CALL METHOD object1->my_interface1~msg.
  
  Data object2 Type Ref To drive1. 
  Create Object object2.
 
  CALL Method object2->speed1. 
  CALL Method object2->my_interface1~msg. 
  
END-OF-SELECTION.