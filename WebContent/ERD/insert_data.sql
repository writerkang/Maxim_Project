--시퀀스를 안쓰는게 나은 테이블도 있음!

--tb_user 값 입력 예시

INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_EMAILHASH , USER_EMAILCHECKED , USER_NICKNAME, USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'aaa@nasver.com', 'abcd', '사자d호랑이', sysdate, '0101545678', '#123456889789789', '0', '메롱', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_EMAILHASH , USER_EMAILCHECKED , USER_NICKNAME, USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'bbb@daum.com', 'tjfj', '이예지', sysdate, '01016165828', '#12456872589', '0', '곰돌이', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
SELECT * FROM tb_USER;

--tb_category 값 입력 예시
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (1, 'Java')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (2, '안드로이드')
;

SELECT * FROM TB_CATEGORY;

--tb_board 값 입력 예시
INSERT INTO TB_BOARD (BOARD_UID , BAORD_NAME )
VALUES (1, '자유게시판')
;
INSERT INTO TB_BOARD (BOARD_UID , BAORD_NAME )
VALUES (2, '팁게시판')
;

SELECT * FROM TB_BOARD;



--tb_post 값 입력 예시
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'ab;labfb', sysdate, 0, 1, 1, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '자바스크립트 끝내기~~~~~~~~~~~~~~~~~~', '자바스크립트는 좋고 편하고~~~~~~~', sysdate, 0, 2, 3, 1)
;

SELECT * FROM TB_POST;


--tb_comment 값 입력 예시
INSERT INTO TB_COMMENT VALUES (comment_seq.nextval, 'hihi', SYSDATE, 1, 1);
SELECT * FROM TB_COMMENT;

SELECT USER_NAME FROM 
(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM TB_USER ORDER BY USER_UID DESC) T) 
WHERE RNUM >= 1 AND RNUM < 6

SELECT USER_NAME FROM TB_USER WHERE USER_UID = 1;