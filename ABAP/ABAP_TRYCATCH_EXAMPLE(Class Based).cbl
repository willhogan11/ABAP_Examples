REPORT znp_oo_exce_demo.
*
CLASS lcx_mandatory_missing DEFINITION
  INHERITING FROM CX_STATIC_CHECK.
ENDCLASS.                    
* lcx_mandatory_missing  DEFINITION
 

CLASS lcl_test_exceptions DEFINITION.
  PUBLIC SECTION.
    METHODS: calculate IMPORTING iv_num1 TYPE i OPTIONAL
                               iv_num2 TYPE i OPTIONAL
                     RETURNING VALUE(rv_calc) TYPE i
                     RAISING   lcx_mandatory_missing
                               cx_sy_arithmetic_error.
  PRIVATE SECTION.
    METHODS: do_div RAISING cx_sy_arithmetic_error.
    METHODS: do_check RAISING  lcx_mandatory_missing.
    DATA: v_num1 TYPE i,
          v_num2 TYPE i,
          v_result TYPE i.
ENDCLASS.                    
* lcl_test_exceptions DEFINITION

CLASS lcl_test_exceptions IMPLEMENTATION.
  METHOD calculate.
    v_num1 = iv_num1.
    v_num2 = iv_num2.
    me->do_check( ).
    me->do_div( ).
    rv_calc = v_result.
  ENDMETHOD.                    
 
* calculate

  METHOD do_check.
    IF v_num1 IS INITIAL.
      RAISE EXCEPTION TYPE lcx_mandatory_missing.
    ENDIF.
  ENDMETHOD. 
*do_check
 
METHOD do_div.
      v_result = v_num1 DIV v_num2.
  ENDMETHOD.                    
* do_sum
ENDCLASS.                    


*lcl_test_exceptions IMPLEMENTATION
 
START-OF-SELECTION.
  DATA: lo_obj TYPE REF TO lcl_test_exceptions.
  DATA: lo_exc_root TYPE REF TO CX_ROOT.
  DATA: lv_msg TYPE STRING.
  CREATE OBJECT lo_obj.
  TRY .
      lo_obj->calculate( iv_num1 = 10 ).
    CATCH lcx_mandatory_missing.
      WRITE: /  'Mandatory Parameter is missing'.
    CATCH CX_ROOT INTO lo_exc_root.
      lv_msg = lo_exc_root->get_text( ).
      WRITE: / lv_msg.
  ENDTRY.