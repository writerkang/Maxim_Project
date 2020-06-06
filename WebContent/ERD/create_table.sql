--테이블 삭제
DROP TABLE tb_email CASCADE CONSTRAINT purge;
DROP TABLE tb_user CASCADE CONSTRAINT purge;
DROP TABLE tb_category CASCADE CONSTRAINT purge;
DROP TABLE tb_attach CASCADE CONSTRAINT purge;
DROP TABLE tb_post CASCADE CONSTRAINT purge;
DROP TABLE tb_comment CASCADE CONSTRAINT purge;
DROP TABLE tb_mypage CASCADE CONSTRAINT purge;
DROP TABLE tb_scrap CASCADE CONSTRAINT purge;
DROP TABLE tb_star CASCADE CONSTRAINT purge;
DROP TABLE tb_board CASCADE CONSTRAINT purge;
DROP TABLE tb_site CASCADE CONSTRAINT purge;

DROP SEQUENCE user_seq;
DROP SEQUENCE post_seq;


--생성된 테이블 확인
SELECT tname FROM tab;

--시퀀스 생성
CREATE SEQUENCE site_seq;
CREATE SEQUENCE category_seq;
CREATE SEQUENCE attach_seq;
CREATE SEQUENCE user_seq;
CREATE SEQUENCE post_seq;
CREATE SEQUENCE comment_seq;
CREATE SEQUENCE mypage_seq;
CREATE SEQUENCE scrap_seq;
CREATE SEQUENCE star_seq;
CREATE SEQUENCE board_seq;


--외래키 제약 설정 필요!
--TODO

--테이블 생성
-- 1. 이메일 인증 
CREATE TABLE tb_email
(
	user_email 			VARCHAR2(50) NOT NULL UNIQUE,
	user_emailHash 		VARCHAR2(70) NOT NULL UNIQUE,
	user_emailChecked  	VARCHAR2(1)  NOT NULL
 );
SELECT * FROM tb_email;
DELETE FROM tb_email;



CREATE TABLE tb_user
(
    user_uid        NUMBER          PRIMARY KEY, 
    user_email      VARCHAR2(30)    UNIQUE NOT NULL, 
    user_pw         VARCHAR2(60)    NOT NULL, 
    user_name       VARCHAR2(30)    UNIQUE NOT NULL, 
    user_regdate    DATE            DEFAULT SYSDATE NOT NULL, 
    user_phone      VARCHAR2(20)    UNIQUE NOT NULL, 
    user_isvalid    CHAR(1)         DEFAULT 'F' NOT NULL, 
    user_auth       CHAR(1)         DEFAULT 'G' NOT NULL, 
    user_point      NUMBER          DEFAULT 10 NOT NULL, 
    user_sns        VARCHAR2(20)    , 
    user_snsid      VARCHAR2(20)    , 
    user_email2     VARCHAR2(30)  	  
    );
SELECT * FROM TB_USER;
DELETE FROM TB_USER;


SELECT * FROM tb_post;


CREATE TABLE tb_category
(
    category_uid     NUMBER          PRIMARY KEY, 
    category_name    VARCHAR2(30)
);

CREATE TABLE tb_board
(
    board_uid     NUMBER          PRIMARY KEY, 
    baord_name    VARCHAR2(30)     
);

CREATE TABLE tb_post
(
    post_uid        NUMBER          PRIMARY KEY, 
    post_subject    VARCHAR2(60)    NOT NULL, 
    post_content    CLOB            NOT NULL, 
    post_regdate    DATE            DEFAULT SYSDATE NOT NULL, 
    post_viewcnt    NUMBER          DEFAULT 0 NOT NULL, 
    board_uid       NUMBER          NOT NULL, 
    user_uid        NUMBER          NOT NULL, 
    category_uid    NUMBER          NOT NULL,
    --외래키설정
  	CONSTRAINT FKP_user FOREIGN KEY(user_uid)  
  	REFERENCES tb_user(user_uid),
  	CONSTRAINT FKP_board FOREIGN KEY(board_uid)  
  	REFERENCES tb_board(board_uid),
  	CONSTRAINT FKP_category FOREIGN KEY(category_uid)  
  	REFERENCES tb_category(category_uid)
);

CREATE TABLE tb_mypage
(
    mypage_uid        NUMBER          PRIMARY KEY, 
    mypage_subject    VARCHAR2(60)    , 
    mypage_content    CLOB            , 
    user_uid          NUMBER          NOT NULL,
    --외래키설정
    CONSTRAINT FKM_user FOREIGN KEY(user_uid)  
  	REFERENCES tb_user(user_uid)
);
SELECT * FROM TB_MYPAGE ;

CREATE TABLE tb_scrap
(
    scrap_uid    NUMBER    PRIMARY KEY, 
    user_uid     NUMBER    NOT NULL, 
    post_uid     NUMBER    NOT NULL
);

CREATE TABLE tb_comment
(
    comment_uid        NUMBER    PRIMARY KEY, 
    comment_content    CLOB      NOT NULL, 
    comment_regdate    DATE      DEFAULT SYSDATE NOT NULL, 
    post_uid           NUMBER    NOT NULL, 
    user_uid           NUMBER    NOT NULL,
    --외래키설정
    CONSTRAINT FKC_user FOREIGN KEY(user_uid)  
  	REFERENCES tb_user(user_uid),
  	CONSTRAINT FKC_post FOREIGN KEY(post_uid)  
  	REFERENCES tb_post(post_uid)
);

CREATE TABLE tb_attach
(
    attach_uid           NUMBER           PRIMARY KEY, 
    attach_oriname       VARCHAR2(60)     NOT NULL, 
    attach_servername    VARCHAR2(60)     NOT NULL, 
    attach_type          VARCHAR2(50)     NOT NULL, 
    attach_url           VARCHAR2(100)    NOT NULL, 
    attach_regdate       DATE             DEFAULT SYSDATE NOT NULL, 
    attach_size          NUMBER           NOT NULL, 
    post_uid             NUMBER           , 
    mypage_uid           NUMBER            
);
SELECT * FROM TB_ATTACH;
CREATE TABLE tb_site
(
    site_uid        NUMBER           PRIMARY KEY, 
    site_url        VARCHAR2(100)    NOT NULL, 
    site_subject    VARCHAR2(60)     NOT NULL, 
    site_desc       CLOB             , 
    category_uid    NUMBER           
);

CREATE TABLE tb_star
(
    star_uid    number    PRIMARY key, 
    star_cnt    NUMBER    DEFAULT 0 NOT NULL, 
    user_uid    NUMBER    NOT NULL, 
    post_uid    NUMBER    NOT NULL
);
