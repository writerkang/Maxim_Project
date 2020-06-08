SELECT * FROM TB_POST tb ;
SELECT * FROM TB_USER tu ;
SELECT * FROM TB_COMMENT tc ;

SELECT tp.*, tu.USER_NAME, tc.comments_count
FROM TB_POST tp JOIN TB_USER tu
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc
ON tp.POST_UID = tc.POST_UID 
ORDER BY tp.POST_UID DESC 
;

SELECT tc.COMMENT_UID , tc.POST_UID  
FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc 
ON tp.POST_UID = tc.POST_UID 
;

SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID;

SELECT tp.*, tu.USER_NAME FROM TB_POST tp , TB_USER tu WHERE tp.USER_UID = tu.USER_UID AND tp.POST_UID = 3;


페이징 구현
SELECT * FROM 
(
SELECT ROWNUM AS rnum, tp.*
FROM (SELECT * FROM TB_POST ORDER BY POST_UID DESC ) tp 
)
WHERE rnum >= 6 AND RNUM < 6 + 5
;


--페이징 구현
SELECT * FROM 
(
SELECT rownum AS rnum, tb_page.*
FROM (
SELECT tp.*, tu.USER_NAME, tc.comments_count
FROM TB_POST tp JOIN TB_USER tu
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc
ON tp.POST_UID = tc.POST_UID 
ORDER BY tp.POST_UID DESC 
) tb_page
)
WHERE rnum >= 1 AND RNUM < 1 + 5
;

SELECT count(POST_UID ) FROM TB_POST;

SELECT count(POST_UID) AS count_post FROM TB_POST;

--검색기능 구현
SELECT * FROM TB_POST tp
WHERE POST_SUBJECT LIKE '%1%'
;

SELECT * FROM 
(
SELECT rownum AS rnum, tb_page.* 
FROM ( 
SELECT tp.*, tu.USER_NAME, tc.comments_count 
FROM TB_POST tp JOIN TB_USER tu 
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
ON tp.POST_UID = tc.POST_UID
WHERE tp.POST_SUBJECT LIKE '%1%'
ORDER BY tp.POST_UID DESC 
) tb_page 
) 
WHERE rnum >= 1 AND RNUM < 1 + 5
;

SELECT * FROM 
(
SELECT rownum AS rnum, tb_page.* 
FROM ( 
SELECT tp.*, tu.USER_NAME, tc.comments_count 
FROM TB_POST tp JOIN TB_USER tu 
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
ON tp.POST_UID = tc.POST_UID 
WHERE tp.BOARD_UID = 2 
ORDER BY tp.POST_UID DESC 
) tb_page 
) 
WHERE rnum >= 1 AND RNUM < 1 + 5
;

SELECT * FROM 
(
SELECT rownum AS rnum, tb_page.* 
FROM ( 
SELECT tp.*, tu.USER_NAME, tc.comments_count 
FROM TB_POST tp JOIN TB_USER tu 
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
ON tp.POST_UID = tc.POST_UID 
WHERE tp.board_uid = 2 AND tp.post_subject LIKE '%할랑%' 
ORDER BY tp.POST_UID DESC 
) tb_page 
) 
WHERE rnum >= 1 AND RNUM < 1 + 5
;

CREATE TRIGGER tb_page_insert
BEFORE INSERT 
ON tb_post FOR EACH ROW 
BEGIN 
	SELECT post.seq.nextval INTO :NEW.post_uid FROM dual;
END;

DROP TRIGGER tb_page_insert;

SELECT * FROM TB_POST tp, TB_USER tu 
WHERE tp.USER_UID = tu.USER_UID 
AND tu.USER_NAME LIKE '%사자%'
;