--테이블 삭제
DROP TABLE tb_email CASCADE CONSTRAINT purge;
DROP TABLE tb_user CASCADE CONSTRAINT purge;
DROP TABLE tb_category CASCADE CONSTRAINT purge;
DROP TABLE tb_post CASCADE CONSTRAINT purge;
DROP TABLE tb_comment CASCADE CONSTRAINT purge;
DROP TABLE tb_star CASCADE CONSTRAINT purge;
DROP TABLE tb_board CASCADE CONSTRAINT purge;
--시퀀스 삭제
DROP SEQUENCE user_seq;
DROP SEQUENCE post_seq;
DROP SEQUENCE comment_seq;
DROP SEQUENCE star_seq;

--시퀀스 생성
CREATE SEQUENCE user_seq;
CREATE SEQUENCE post_seq;
CREATE SEQUENCE comment_seq;
CREATE SEQUENCE star_seq;

--테이블 생성
CREATE TABLE tb_email
(
	user_email 			VARCHAR2(50) NOT NULL UNIQUE,
	user_emailHash 		VARCHAR2(70) NOT NULL UNIQUE,
	user_emailChecked  	VARCHAR2(1)  NOT NULL
 );

CREATE TABLE tb_user
(
    user_uid        NUMBER          PRIMARY KEY, 
    user_email      VARCHAR2(30)    UNIQUE NOT NULL, 
    user_pw         VARCHAR2(200)   NOT NULL, 
    user_name       VARCHAR2(30)    UNIQUE NOT NULL, 
    user_regdate    DATE            DEFAULT SYSDATE NOT NULL, 
    user_phone      VARCHAR2(20)    NOT NULL, 
    user_isvalid    CHAR(1)         DEFAULT 'F' NOT NULL, 
    user_auth       CHAR(1)         DEFAULT 'G' NOT NULL, 
    user_point      NUMBER          DEFAULT 10 NOT NULL, 
    mypage_subject    VARCHAR2(60) , 
    mypage_content    CLOB
    );
    
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
    post_subject    VARCHAR2(200)    NOT NULL, 
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

CREATE TABLE tb_comment
(
    comment_uid        NUMBER    PRIMARY KEY, 
    comment_content    CLOB      NOT NULL, 
    comment_regdate    DATE      DEFAULT SYSDATE NOT NULL, 
    comment_selected   CHAR(1)   DEFAULT 'F' NOT NULL,
    post_uid           NUMBER    NOT NULL, 
    user_uid           NUMBER    NOT NULL,
    --외래키설정
    CONSTRAINT FKC_user FOREIGN KEY(user_uid)  
  	REFERENCES tb_user(user_uid),
  	CONSTRAINT FKC_post FOREIGN KEY(post_uid)  
  	REFERENCES tb_post(post_uid)
);

CREATE TABLE tb_star
(
    star_uid    number    PRIMARY key, 
    user_uid    NUMBER    NOT NULL, 
    post_uid    NUMBER    NOT NULL,
    --외래키설정
    CONSTRAINT FKS_user FOREIGN KEY(user_uid)  
  	REFERENCES tb_user(user_uid),
  	CONSTRAINT FKS_post FOREIGN KEY(post_uid)  
  	REFERENCES tb_post(post_uid)
);

--tb_category 값 입력
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

--유저생성
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT ) 
VALUES (user_seq.nextval, 'kdash111@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '이강혁', sysdate, '0101545678', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'aaa@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '고유성', sysdate, '01067584532', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'bbb@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '조현주', sysdate, '01077869908', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'ccc@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '이승환', sysdate, '01018996767', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'ddd@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '임상빈', sysdate, '01089674567', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'eee@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '한수빈', sysdate, '01009876565', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'qywhs121@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '장수영', sysdate, '01032564556', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'yesJam98@daum.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '윤지우', sysdate, '01067567867', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'space4885@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '최현주', sysdate, '01089896767', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'haha@nate.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '홍성용', sysdate, '01078786565', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;
INSERT INTO TB_USER (USER_UID , USER_EMAIL , USER_PW , USER_NAME , USER_REGDATE , USER_PHONE , USER_ISVALID , USER_AUTH , USER_POINT , MYPAGE_SUBJECT , MYPAGE_CONTENT )
VALUES (user_seq.nextval, 'biresd@naver.com', '3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b', '장윤성', sysdate, '01056564343', 'F', 'G', 10, '안녕하세요', '자기소개를 해주세요')
;

--질문게시판 글 입력
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

--자유게시판 글 입력
