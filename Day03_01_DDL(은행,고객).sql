/*
    DDL
    1. Data Definition Language
    2. 데이터 정의어
    3. 데이터베이스 객체(user, table, sequence, view, index 등)를 생성/수정/삭제하는 언어이다.
    4. 완료된 작업을 취소할 수 없다.(COMMIT(저장)할 필요가 없다. ROLLBACK(취소)을 할 수 없다.)
    5. 종류
        1) CREATE   : 생성
        2) ALTER    : 수정
        3) DROP     : 삭제
*/


-- 테이블 삭제
DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;

-- BANK_TBL 테이블 생성
CREATE TABLE BANK_TBL (
    BANK_CODE VARCHAR2(20 BYTE) NOT NULL,
    BANK_NAME VARCHAR2(30 BYTE),
    CONSTRAINT PK_BANK_CODE PRIMARY KEY(BANK_CODE)
);

-- CUSTOMER_TBL 테이블 생성
CREATE TABLE CUSTOMER_TBL (
    NO          NUMBER              NOT NULL,
    NAME        VARCHAR2(30 BYTE)   NOT NULL,
    PHONE       VARCHAR2(30 BYTE)   UNIQUE,
    AGE         NUMBER              CHECK(AGE BETWEEN 0 AND 100),
    BANK_CODE   VARCHAR2(20 BYTE),
    CONSTRAINT PK_NO PRIMARY KEY(NO),
    CONSTRAINT FK_BANK_CODE FOREIGN KEY(BANK_CODE) REFERENCES BANK_TBL(BANK_CODE)
);

/*
    테이블 변경하기
    1. 칼럼 추가        : ALTER TABLE 테이블명 ADD 칼럼명 데이터타입 [제약조건]
    2. 칼럼 삭제        : ALTER TABLE 테이블명 DROP COLUMN 칼럼명
    3. 칼럼 수정        : ALTER TABLE 테이블명 MODIFY(수정한다) 칼럼명 데이터타입 [제약조건]
    4. 칼럼 이름(변경)  : ALTER TABLE 테이블명 RENAME COLUMN 기존칼럼명 TO 신규칼럼명
    5. 테이블 이름(변경): ALTER TABLE 테이블명 RENAME TO 신규테이블명
*/

-- 1. BANK_TBL 테이블에 연락처(BANK_TEL) 칼럼을 추가하시오.
ALTER TABLE BANK_TBL
    ADD BANK_TEL VARCHAR2(20 BYTE) NOT NULL;

-- 2. CUSTOMER_TBL 테이블에서 나이(AGE) 칼럼을 삭제하시오.
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN AGE;
    
-- 3. BANK_TBL 테이블의 은행명(BANK_NAME) 칼럼의 데이터타입을 VARCHAR2(15 BYTE)으로 변경하시오.
ALTER TABLE BANK_TBL
    MODIFY BANK_NAME VARCHAR2(15 BYTE);

-- 4. COSTOMER_TBL 테이블에서 고객명(NAME) 칼럼의 이름을 CUST_NAME으로 변경하시오.
ALTER TABLE CUSTOMER_TBL
    RENAME COLUMN NAME TO CUST_NAME;

-- 개인실습.

-- 5. CUSTOMER_TBL 테이블에 GRADE 칼럼을 추가하시오.

--    GRADE 칼럼은 'VIP', 'GOLD', 'SILVER', 'BRONZE' 중 하나의 값만 가질 수 있도록 CHECK 제약조건을 지정하시오.
ALTER TABLE CUSTOMER_TBL
    ADD GRADE VARCHAR2(6 BYTE) CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE'));

-- 6. BANK_TBL 테이블의 BANK_NAME 칼럼에 NOT NULL 제약조건을 추가하시오.(수정)
ALTER TABLE BANK_TBL
    MODIFY BANK_NAME VARCHAR2(15 BYTE) NOT NULL;

-- 7. CUSTOMER_TBL 테이블의 NO 칼럼의 이름을 CUST_NO로 변경하시오.
ALTER TABLE CUSTOMER_TBL
    RENAME COLUMN NO TO CUST_NO;

-- 8. CUSTOMER_TBL 테이블의 PHONE 칼럼을 삭제하시오.
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN PHONE;

-- 9. CUSTOMER_TBL 테이블의 CUST_NAME 칼럼의 NOT NULL 제약조건을 NULL 제약조건으로 변경하시오.
ALTER TABLE CUSTOMER_TBL
    MODIFY CUST_NAME VARCHAR2(30 BYTE) NULL; -- NULL 명시를 반드시 해야 한다. (명시 안할시 이전꺼 그대로 사용한다고 생각할 수 있다.)

