-- 테이블 및 시퀀스 삭제.
DROP TABLE USER_TBL;
DROP SEQUENCE USER_TBL_SEQ;

-- USER_TBL 생성
CREATE TABLE USER_TBL (
    USER_NO     NUMBER              NOT NULL,           -- 회원번호
    USER_ID     VARCHAR2(30 BYTE)   NOT NULL UNIQUE,    -- 회원 아이디
    USER_PW     VARCHAR2(30 BYTE)   NOT NULL,           -- 회원 비밀번호
    USER_EMAIL  VARCHAR2(100 BYTE)  UNIQUE,             -- 회원 이메일
    USER_DATE   DATE,                                   -- 회원 가입날짜
    USER_CLASS  VARCHAR2(20 BYTE) CHECK(USER_CLASS IN('VIP', 'GOLD', 'SILVER')), -- 회원 등급
    REG_DATE    DATE,       -- 등록일자
    CHNG_DATE   DATE        -- 수정일자
);

-- USER_TBL의 시퀀스 생성
CREATE SEQUENCE USER_TBL_SEQ NOCACHE;
    