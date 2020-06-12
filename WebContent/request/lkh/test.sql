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

SELECT * FROM TB_STAR;

SELECT * FROM TB_USER;
UPDATE TB_USER SET USER_POINT = USER_POINT + 10 WHERE USER_UID = 1;

SELECT USER_UID FROM TB_POST WHERE POST_UID = 7536;

SELECT * FROM TB_COMMENT;
SELECT * FROM TB_COMMENT WHERE COMMENT_SELECTED = 'T';
UPDATE TB_COMMENT SET COMMENT_SELECTED = 'T' WHERE COMMENT_UID = 232;


SELECT * FROM 
(
SELECT rownum AS rnum, tb_page.* 
FROM ( 
SELECT tp.*, tu.USER_NAME, tc.comments_count, tc.sel_comments
FROM TB_POST tp JOIN TB_USER tu 
ON tp.USER_UID = tu.USER_UID 
LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count, COUNT(CASE WHEN tc.COMMENT_SELECTED = 'T' THEN 1 END) AS sel_comments FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc 
ON tp.POST_UID = tc.POST_UID 
WHERE tp.BOARD_UID = 4
ORDER BY tp.POST_UID DESC 
) tb_page 
) 
WHERE rnum >= 1 AND RNUM < 1 + 5
;


--질문게시판 글 삽입
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '계약서 없이 일하고있는데 sp 날리고 철수해도될까요', 
'지난 5월 중순부터 지금까지 무급으로 계약서 없이 일하고있습니다

계약서 쓸때 구두로 합의했던거랑 계약내용이 다르면 제가 만들어놓은 sp들 드랍시키고 나가도 될까요', 
4, 1, 8)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '개발과 실제 배포시의 다른 url, 어떻게 처리하시나요?', 
'전 보통 개발을 localhost를 이용하는 경우가 많습니다.

하지만 실제 서버에 배포를 하면 그 서버의 ip주소를 써줘야 작동합니다.

그래서 보통 이런식으로 배포용, 개발용 url 2개 만들어놓고 배포할 때 바꿔끼는데

배포할 때마다 가끔씩 까먹어서 바꾸는걸 잊어버리네요;

이런 개발과 배포시의 url을 자동으로 해결해주는 기존 방법이 있나요?

키워드만 알려주시면 찾아서 공부해보겠습니다.', 
4, 1, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '컨트롤러에서 자바스크립트로 값을 가져오는 방법이 있을까요?', 
'안녕하세요 간단한 질문 올립니다.

컨트롤러에서 모델로 member 객체를 넣어서 뷰로 보내고

뷰에서 버튼을 클릭하면 비어있는 input 칸에 member 객체의 값들을 넣고 싶습니다.

그런데 바로 

$("#btn").click(function(){

  $("#name").val(${memberInfo.name});

});

 로 하면 값이 안 들어가지더라구요.

좋은 방법이 있을까요?



추가로

어떤 글에서  이런 방법으로 하라고 하여서 써봤는데 ObjectMapper가 임포트가 되지 않네요..', 
4, 1, 5)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'for문과 list에 대한 질문 드립니다.', 
'현재 Spring MVC를 이용하여 구현 중에 있습니다.

DAO 에서 DB에서 읽어온 데이터 => process를  로 split 후 list와 for문을 사용하여 콘솔에 출력하였을때는 모든 데이터를 읽어왔지만

Model에 저장 후 view에서 읽어왔을 때는 process 데이터의 가장 마지막 줄 밖에 읽어오지 못합니다.

어떻게 하면 모든 데이터를 model에 저장 후 view에서 읽어 올 수 있을지 조언 부탁 드립니다!

<DAO>', 
4, 1, 3)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'Java 간단 계좌관리프로그램... 왜 null일까요 ..?', 
'위에가 필드값들이고 ... 아래에서 while문안에서



1번 입력시 createAccount() 메소드를 통해 계좌를 생성하는데요..



2번 입력해서 목록을 찍어보면... 계좌 번호는 제대로 나오는데

계좌주는 null값이, 초기금액은 0값이 나오네요 ...

무슨 문제일까요 ? ? ... ㅠㅠ', 
4, 1, 3)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '오라클 쿼리 질문', 
'오라클에서 B는 다르지만 C는 같은데이터를 찾고 싶습니다.



A   B   C

TA  24  25

TA  26  25

TC  2   3

TC  4   3

TB  3   4

TB  5   6



예제에서 TA의 B컬럼이 24, 26으로 다르지만 C는 25,25로 같고

TC도 같은데 TB는 다르죠. 즉 TA,TC만 나오게 하고 싶은데

어떻게 쿼리를 짜야 할지 모르겠습니다.', 
4, 1, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'html 링크 연결하기. 텝기능 안되서 여쭈어봅니다.', 
'주석 첫번째 yes 24 에서 인문 소설 어린이 클릭시 해당 페이지로 tab을 합니다 그러나 인문에서 소설 어린이 종합을 클릭시 반응이없습니다 . 해결방안좀요 ㅠㅠ ', 
4, 1, 6)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '오라클 쿼리 질문', 
'오라클에서 B는 다르지만 C는 같은데이터를 찾고 싶습니다.



A   B   C

TA  24  25

TA  26  25

TC  2   3

TC  4   3

TB  3   4

TB  5   6



예제에서 TA의 B컬럼이 24, 26으로 다르지만 C는 25,25로 같고

TC도 같은데 TB는 다르죠. 즉 TA,TC만 나오게 하고 싶은데

어떻게 쿼리를 짜야 할지 모르겠습니다.', 
4, 1, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'html 링크 연결하기. 텝기능 안되서 여쭈어봅니다.', 
'주석 첫번째 yes 24 에서 인문 소설 어린이 클릭시 해당 페이지로 tab을 합니다 그러나 인문에서 소설 어린이 종합을 클릭시 반응이없습니다 . 해결방안좀요 ㅠㅠ ', 
4, 1, 6)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'html/css 하는데 prefix 써야될까요?', 
'css에서  표준규약이 아닌 속성들은

앞에 각 브라우저에 해당하는 접두사를 각각 붙여주는 반복작업을 해야 한다고 들었습니다.



예를 들면,

column-count라는 속성은 표준 규약이 아니기 때문에,

-webkit-column-count:3;

-moz-column-count:3;

-o-column-count:3;

-ms-column-count:3;



이런식으로 각 브라우저에 해당하는 접두사를 붙여줘야 한다고 하는데.

이걸 간편하게 하기 위해서 prefix라는 파일을 이용한다는걸 봤습니다. 책에서요.



 이거 html css 하면 거의 무조건적으로 쓰는 파일인가요? ', 
4, 1, 7)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '안드로이드 스프링연동?', 
'안드로이드와 스프링을 연동하는 이유가 따로 있을까요?

그리고 인터넷에 안드로이드와 스프링을 연동한 예제나 강의가 많이안보이는데..

혹시 이 부분은 어떻게 공부 할 수 있을까요?', 
4, 1, 4)
;