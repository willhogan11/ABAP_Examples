*&---------------------------------------------------------------------*
*& Report  Z_TEST_REPORT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_TEST_REPORT .

* Variable Declaration and initialisation
DATA: lv_name TYPE STRING VALUE 'Will',
      lv_age  TYPE I VALUE 41 .

WRITE / lv_name .
WRITE / lv_age .

* Conditional Statements example
IF lv_age < 40 .
  WRITE / 'Age is below 40' .
ELSEIF lv_age > 40 .
  WRITE / 'Age is above 40' .
ELSE .
  WRITE / 'Age is 40' .
ENDIF .


**********************************************************

* Taking in User Input
PARAMETERS: lv_num1 TYPE I,
            lv_num2 TYPE I .

DATA gv_result TYPE I .
gv_result = lv_num1 + lv_num2 .

WRITE: 'Result'(res), gv_result .

**********************************************************

* Loop Statements

DATA: lv_num TYPE I VALUE 0.

WHILE lv_num <> 10 .
  WRITE: / '', lv_num .
  lv_num = lv_num + 1 .
ENDWHILE.