--시퀀스를 안쓰는게 나은 테이블도 있음!

--tb_user 값 입력 예시

INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'aaa@nasver.com', 'abcd', '사자d호랑이', sysdate, '0101545678', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , USER_SNS , USER_SNSID , USER_EMAIL2 )
VALUES (user_seq.nextval, 'bbb@daum.com', 'tjfj', '이예지', sysdate, '01016165828', 'F', 'G', 10, 'facebook', 'lkh', 'ddd@dasdfum.net')
;
SELECT * FROM tb_USER;

SELECT * FROM TB_POST tp ;

--tb_category 값 입력 예시
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (1, 'FrontEnd')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (2, 'BackEnd')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (3, 'Java')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (4, 'Android')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (5, 'JavaScript')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (6, 'HTML5')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (7, 'CSS')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (8, '잡담')
;
INSERT INTO TB_CATEGORY (CATEGORY_UID , CATEGORY_NAME )
VALUES (9, '기타')
;

SELECT * FROM TB_CATEGORY;

--tb_board 값 입력 예시

INSERT INTO TB_BOARD (BOARD_UID , BAORD_NAME )
VALUES (1, '공지사항')
;
INSERT INTO TB_BOARD (BOARD_UID , BAORD_NAME )
VALUES (2, '자유게시판')
;
INSERT INTO TB_BOARD (BOARD_UID , BAORD_NAME )
VALUES (3, '팁게시판')
;
INSERT INTO TB_BOARD (BOARD_UID , BAORD_NAME )
VALUES (4, '질문게시판')
;

SELECT * FROM TB_BOARD;
DELETE FROM TB_BOARD;


--tb_post 값 입력 예시
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'ab;labfb', sysdate, 0, 1, 1, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '자바스크립트 끝내기~~~~~~~~~~~~~~~~~~', '자바스크립트는 좋고 편하고~~~~~~~', sysdate, 0, 2, 1, 1)
;
INSERT INTO TB_POST (POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES ('자바스크립트 끝내기~~~~~~~~~~~~~~~~~~', '자바스크립트는 좋고 편하고~~~~~~~', sysdate, 0, 2, 1, 1)
;

--자료 대량 삽입
INSERT INTO TB_POST (POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
SELECT POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID , USER_UID , CATEGORY_UID FROM tb_post
;

SELECT * FROM TB_POST ORDER BY post_uid desc;


--tb_comment 값 입력 예시
INSERT INTO TB_COMMENT VALUES (comment_seq.nextval, 'hihi', SYSDATE, 1, 1);
SELECT * FROM TB_COMMENT;

SELECT USER_NAME FROM 
(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM TB_USER ORDER BY USER_UID DESC) T); 

SELECT tp.*, tu.USER_NAME FROM TB_POST tp , TB_USER tu 
WHERE tp.USER_UID = tu.USER_UID AND tp.POST_SUBJECT LIKE '%자바%' ORDER BY tp.post_uid DESC

SELECT * FROM tb_page;



SELECT * FROM 
(
SELECT rownum AS rnum, tb_page.* 
FROM ( 
SELECT tp.*, tu.USER_NAME, tc.comments_count 
FROM TB_POST tp JOIN TB_USER tu 
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
ON tp.POST_UID = tc.POST_UID
WHERE tu.USER_NAME LIKE '%홍%'
ORDER BY tp.POST_UID DESC 
) tb_page 
) 
WHERE rnum >= 1 AND RNUM < 1 + 5;


SELECT * FROM 
			(
			SELECT rownum AS rnum, tb_page.* 
			FROM ( 
			SELECT tp.*, tu.USER_NAME, tc.comments_count 
			FROM TB_POST tp JOIN TB_USER tu 
			ON tp.USER_UID = tu.USER_UID 
			LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
			ON tp.POST_UID = tc.POST_UID
			WHERE tp.POST_CONTENT LIKE '%aa%'
			ORDER BY tp.POST_UID DESC 
			) tb_page 
			) 
			WHERE rnum >= 1 AND RNUM < 1 + 5;

SELECT POST_SUBJECT , POST_CONTENT FROM 
			(
			SELECT rownum AS rnum, tb_page.* 
			FROM ( 
			SELECT tp.*, tu.USER_NAME, tc.comments_count 
			FROM TB_POST tp JOIN TB_USER tu 
			ON tp.USER_UID = tu.USER_UID 
			LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
			ON tp.POST_UID = tc.POST_UID
			WHERE tp.USER_UID LIKE 1
			ORDER BY tp.POST_UID DESC 
			) tb_page 
			);
			
			
			SELECT POST_SUBJECT , POST_CONTENT FROM 
( 
SELECT rownum AS rnum, tb_page.* 
FROM ( 
SELECT tp.*, tu.USER_NAME, tc.comments_count 
FROM TB_POST tp JOIN TB_USER tu 
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
ON tp.POST_UID = tc.POST_UID 
WHERE tp.USER_UID LIKE  
ORDER BY tp.POST_UID DESC 
) tb_page 
) 