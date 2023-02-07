-- 테이블 구조 파악 (DESCRIBE 코드) 사원들 목록을 대충 미리 확인가능.
DESC EMPLOYEES;     -- 4글자 지워도 사용가능 그래서 DESC만 사용함.

-- 1. EMPLOYEES 테이블에서 FIRST_NAME, LAST_NAME 조회하기
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;
  
-- 2. EMPLOYEES 테이블에서 DEPARTMENT_ID를 중복 제거하고 조회하기
-- DISTINCT -> 같은 옵션의 중복된 코드를 1개 코드로 제거해서 보여주는 코드이다.
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- 3. EMPLOYEES 테이블에서 EMPLOYEE_ID가 150인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 150;   -- WHERE절(조건)의 등호(=)는 비교 연산자이다.




