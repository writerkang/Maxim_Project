--시퀀스를 안쓰는게 나은 테이블도 있음!

--tb_user 값 입력 예시

INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_EMAILHASH , USER_EMAILCHECKED , USER_NICKNAME, USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'aaa@nasver.com', 'abcd', '사자d호랑이', sysdate, '0101545678', '#123456889789789', '0', '메롱', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_EMAILHASH , USER_EMAILCHECKED , USER_NICKNAME, USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'bbb@daum.com', 'tjfj', '이예지', sysdate, '01016165828', '#12456872589', '0', '곰돌이', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_EMAILHASH , USER_EMAILCHECKED , USER_NICKNAME, USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'ccc@naver.com', 'ewrew', '임상빈', sysdate, '01026265959', '#1225631489789789', '0', '루돌프', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_EMAILHASH , USER_EMAILCHECKED , USER_NICKNAME, USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'ddd@naver.com', 'uiy', '한수빈', sysdate, '01045457878', '#1234965843789', '0', '산타', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_EMAILHASH , USER_EMAILCHECKED , USER_NICKNAME, USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'eee@gmail.com', 'cxz12', '홍성용', sysdate, '0108989636', '#116572356889789789', '0', '원숭이', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
--DELETE FROM TB_USER WHERE USER_UID = '4';

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
VALUES (post_seq.nextval, 'MVC 패턴 강좌', 'MVC 패턴은 좋고 편하고~~~~~~~', sysdate, 0, 1, 1, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '자바스크립트 끝내기~~~~~~~~~~~~~~~~~~', '자바스크립트는 좋고 편하고~~~~~~~', sysdate, 0, 2, 1, 1)
;

SELECT * FROM TB_POST;


--tb_comment 값 입력 예시
INSERT INTO TB_COMMENT VALUES (comment_seq.nextval, 'hihi', SYSDATE, 1, 1);
SELECT * FROM TB_COMMENT;