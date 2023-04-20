-- 사원번호를 전달하면 해당 사원의 이름을 반환하는 함수 만들기

CREATE OR REPLACE FUNCTION GET_NAME(EMPNO EMPLOYEE_TBL.EMP_NO%TYPE) -- 1001이 이쪽으로 제일 처음 저장됨.
RETURN VARCHAR2
IS
    EMPNAME EMPLOYEE_TBL.NAME%TYPE; -- 사원명을 반환하기위해 설정하는 부분
BEGIN
    SELECT NAME
      INTO EMPNAME  -- 선별한 구창민이 이쪽으로 저장하기위해 변수를 만들어준곳!
      FROM EMPLOYEE_TBL
     WHERE EMP_NO = EMPNO;  -- 1001이 이쪽으로 오고 구창민을 선별해준다.
     RETURN EMPNAME;
END;

-- 사원명
-- 구창민

SELECT GET_NAME(1001) AS 사원명    -- 1001이 맨위에 EMPNO에 저장되고
  FROM EMPLOYEE_TBL                
 WHERE EMP_NO = 1001;   -- DISTINCT 를 사용해 1번만 보여지게 코드를 구현할 수 있다.
  
SELECT GET_NAME(EMP_NO) AS 사원명    -- 전체 사원을 조회하려면 EMP_NO를 넣으면된다.
  FROM EMPLOYEE_TBL;
