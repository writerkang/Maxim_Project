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
4, 7, 8)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '개발과 실제 배포시의 다른 url, 어떻게 처리하시나요?', 
'전 보통 개발을 localhost를 이용하는 경우가 많습니다.

하지만 실제 서버에 배포를 하면 그 서버의 ip주소를 써줘야 작동합니다.

그래서 보통 이런식으로 배포용, 개발용 url 2개 만들어놓고 배포할 때 바꿔끼는데

배포할 때마다 가끔씩 까먹어서 바꾸는걸 잊어버리네요;

이런 개발과 배포시의 url을 자동으로 해결해주는 기존 방법이 있나요?

키워드만 알려주시면 찾아서 공부해보겠습니다.', 
4, 8, 2)
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
4, 9, 5)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'for문과 list에 대한 질문 드립니다.', 
'현재 Spring MVC를 이용하여 구현 중에 있습니다.

DAO 에서 DB에서 읽어온 데이터 => process를  로 split 후 list와 for문을 사용하여 콘솔에 출력하였을때는 모든 데이터를 읽어왔지만

Model에 저장 후 view에서 읽어왔을 때는 process 데이터의 가장 마지막 줄 밖에 읽어오지 못합니다.

어떻게 하면 모든 데이터를 model에 저장 후 view에서 읽어 올 수 있을지 조언 부탁 드립니다!

<DAO>', 
4, 8, 3)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'Java 간단 계좌관리프로그램... 왜 null일까요 ..?', 
'위에가 필드값들이고 ... 아래에서 while문안에서



1번 입력시 createAccount() 메소드를 통해 계좌를 생성하는데요..



2번 입력해서 목록을 찍어보면... 계좌 번호는 제대로 나오는데

계좌주는 null값이, 초기금액은 0값이 나오네요 ...

무슨 문제일까요 ? ? ... ㅠㅠ', 
4, 7, 3)
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
4, 6, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'html 링크 연결하기. 텝기능 안되서 여쭈어봅니다.', 
'주석 첫번째 yes 24 에서 인문 소설 어린이 클릭시 해당 페이지로 tab을 합니다 그러나 인문에서 소설 어린이 종합을 클릭시 반응이없습니다 . 해결방안좀요 ㅠㅠ ', 
4, 5, 6)
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
4, 4, 2)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, 'html 링크 연결하기. 텝기능 안되서 여쭈어봅니다.', 
'주석 첫번째 yes 24 에서 인문 소설 어린이 클릭시 해당 페이지로 tab을 합니다 그러나 인문에서 소설 어린이 종합을 클릭시 반응이없습니다 . 해결방안좀요 ㅠㅠ ', 
4, 3, 6)
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
4, 2, 7)
;
INSERT INTO TB_POST (POST_UID , POST_SUBJECT , POST_CONTENT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '안드로이드 스프링연동?', 
'안드로이드와 스프링을 연동하는 이유가 따로 있을까요?

그리고 인터넷에 안드로이드와 스프링을 연동한 예제나 강의가 많이안보이는데..

혹시 이 부분은 어떻게 공부 할 수 있을까요?', 
4, 1, 4)
;

--자유게시판 글 입력
--tb_post 값 입력 예시
INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '청주에 LG관련 프로젝트 어떤가요?',
'청주에 있는 LG프로젝트 어떤가요? 물론 케바케이긴 하지만 분위기나 단가나 여러가지로 말씀해주시면 감사하겠습니다.<br>
그리고 아이X에쓰 라는 업체가 LG 1차 업체라고 하던대 여기에서 근무해보신적 있나요?',
sysdate, 0, 2, 1, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '앞으로 뜰것으로 보이는 언어',
'러스트, wasm..<br>
지금부터 잘배워서 전문가 되면 고액연봉을 받을수도.<br>
개인적 생각입니다.',
sysdate, 0, 2, 2, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '이제 배우려고합니다',
'25살이 되서 이제 막 개발보다는 운영쪽으로 배우고싶은데 어디서부터 시작해야될지모르겠습니다<br>
시작하면 방향은 잡힐줄알았는데 막상 시작하려니 갈피를 못잡겠네여...ㅠ<br>  
기초적인 책부터 추천좀 해주셨으면 합니다<br> 
학원도 알려주시면 감사드리구요!!!',
sysdate, 0, 2, 3, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '초보개발자 iOS앱을 출시했어요.',
'안녕하세요. 항상 눈팅은 많이 하는데 글을 남기는 건 처음이네요.<br> 
저는 잘 다니던 회사를 때려치고 30대 중반에 프리랜서(사실은 백수)로 전향한 초보개발자입니다.<br> 
원래는 기업 오퍼레이션 컨설팅 업무를 해왔는데, 어쩌다가 IT프로젝트 배정받고 어깨넘어로 본 코딩에 빠져버렸습니다.<br> 
그렇게 빠진 IT 프로젝트에서 개발자 분들하고 동고동락하며 그 분들을 동경해온게 3년.<br> 
더 이상 하고 싶은 것을 미룰 수 없다는 생각에 올해 초 과감히 회사를 그만두고 개발공부를 시작했습니다.<br> 
당장 밥 굶어도 하고싶은 것 하며 살자 라는게 유일한 동기였네요.<br>
소소하게 만들고 싶은 것을 만들다가, 드디어 iOS를 배워 제일 만만한 계산기 어플을 만들었습니다.<br> 
특별히 쓸 수 있는 라이브러리를 찾지 못해 + - * / 이외에는<br>
전부 순수 로직으로 만들어 보았는데 아직 100프로 확신은 없습니다. :)<br> 
어플의 이름은 ''소프트계산기'' 입니다. 일단 셀링포인트는 디자인입니다.<br> 
디자인에도 관심이 많아 드리블을 자주 보는데 요새 뉴모피즘 (Neumorphism)이라는 디자인이 트렌디하더라구요.<br> 
하지만 정작 이 디자인이 사용된 예는 보지 못해 직접 적용해보았습니다.<br> 
버튼이 많고, 단순한 인터페이스에 잘 어울리는 디자인인데, 계산기에 딱일거라 생각했어요.<br>
물론 훌륭한 계산기 어플도 많지만 대부분의 경우 디자인이 지나치게 남성스럽고 딱딱해서<br>
감성 중시하는 아이폰 유저들을 만족시키기에는 부족할거라 보았거든요.<br> 
혹시 시간나시는 분 있으시면 한 번 다운받아 사용해보고, 피드백 주시면 감사하겠습니다.<br> 
회사를 그만두고 개발을 공부하며 스스로 불안할 때마다 OKKY 글들을 읽곤 했었는데,<br> 
드디어 첫 작품이 나왔으니 선배님들께 처음으로 고견을 여쭙고 싶습니다.<br> 
남는건 시간뿐이라 고칠 부분 있다면 바로바로 적용하도록 하겠습니다.  ( _ _ )',
sysdate, 0, 2, 4, 4)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '군대에서도 경력 1년이면 선임이고, 직장에서도 경력 10년이면 베테랑 아닌가요?',
'인간 경력 24년인데 왜이렇게 새로운게 많고 당황스러운 일들이 많이 생길까요.<br>
익숙해질만도 한데 ''어떻게 살아야 하는가''라는 질문을 스스로 하면 매번 새롭네요.<br>
나이 30줄 40줄이 되면 헤메지 않고 인생에 대한 뿌리가 잡히게 되나요?<br>
개발자로서도, 인생으로서도 선배님들의 고견을 듣고싶습니다.',
sysdate, 0, 2, 5, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '일명 SI보도방 들은 프로젝트를 어디서 구해서 알선 해 주는지 아시나요??',
'제목 그대로 입니다.<br>
일명 SI보도방 들은 프로젝트를 어디서 구해서 알선 해 주는지 아시나요??<br>
여기도 보면 구인란에 각종 프로젝트가 올라 와 있는데..<br>
실제 잡사이트에 가보면 해당 프로젝트는 없는 경우가 거의100% 라..<br>
보도방들은 어디서 프로젝트를 구하는지 참 궁금 합니다.<br>
보도방 안 거치면  단가도 더 올라 갈 것 같은데..<br>
중간에서 보도방 횡포가 넘 심하네요..',
sysdate, 0, 2, 6, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '안녕하세요~ 서울 세미나 관련 행사는 어디서 확인들 하시나요?',
'서울에서 열리는 컨퍼런스, 세미나 등의 일정은 혹시 어디서 확인들 하시나요...?<br>
지금은 코로나때문에 오프라인이 온라인 위주로 진행되는거 같은데...<br>
혹시 이러한 IT, 개발 관련 행사 일정들 어디서 확인들 하시나요!?<br>
좋은 사이트 알고계시면 추천좀 부탁드리겠습니다 !',
sysdate, 0, 2, 7, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '노트북 용 백팩 추천 해주시면 감사하겠습니다 ㅎㅎ',
'보통 노트북, 태블릿, 스위치 정도? 등등 들어갈 거 같은데 가방 사이즈는 클 수록 좋습니다.<br>
2~5만원 대 제품으로 추천 해주실 수 있나요~?',
sysdate, 0, 2, 8, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '빅데이터 나이 40에 시작을 하는데',
'늦은건가요?<br>
석사 도중에 젊은 친구들이랑 같이 공부하니 현타 오네요.<br>
나이먹고 평생 직장 꿈꾸며 공부하기 좋은 분야인지 의문이 듭니다.<br> 
에휴휴 힘들다 힘들어',
sysdate, 0, 2, 9, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '웹퍼블리셔와 프론트엔드 차이는 무엇인가요?',
'웹퍼블리셔는 html css js 까지만다루고<br>
여기에 react를 추가로 다룰수있게되면 프론트엔드가 되는건가요?',
sysdate, 0, 4, 8, 1)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '저는 스타트업에서 혼자 어플 개발을 하고 있는 신입 개발자입니다.',
'안녕하세요. 읽어주셔서 감사드립니다.<br>
안드로이드를 전혀 접해본적 없는 저에게 선임조차 없는 곳에서 혼자 어플을 만들고 있습니다.<br>
많은 영상을 보고 구글링 하며 시도하고 있지만 잘 되지 않아서 이렇게 글을 올려봅니다.<br>
저는 국비지원 6개월을 받고 처음 회사에 입사하게 되어 지금 현재 복무중인 회사에서 어플을 만들라는 업무가 있어서 혼자 열심히 싸우고 있습니다.<br>
android 에서 mysql 로 data 를 보내는 것과 가져오는 방법을 kotlin 방식으로 자세히 알고 싶습니다.<br>
잘 찾아보고 하고 있지만 한계가 있고 물어보고 할 사람도 없다보니 오래 걸리고 있습니다.<br>
좋은 정보와 팁 알려주신다면 정말 감사히 사용하겠습니다.<br>
미세먼지 어플을 만들생각입니다.<br>
아두이노를 이용하여 데이터를 수집하면 젝을 데스크탑에 연결하여 데이터를 보관하는 방식으로 하고 있습니다.<br>
이건 외주업체에서 맡겨서 한것 같습니다. 제가 이제 이걸 관리해야하는데 어떻게 해야할지 모르겠습니다.',
sysdate, 0, 4, 7, 4)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '자바 예외처리에 관한 질문',
'예외처리에는 두 가지 종류가 있습니다. Exception 클래스를 상속 받거나 RuntimeException 클래스를 상속받거나.<br>
Exception 클래스들은 반드시 예외처리를 해줘야 하고 Runtime은 그렇지 않습니다.<br> 
RuntimeException은 개발자의 실수에 의해서 발생하므로 예외처리를 따로 하지 않아도 된다고 배웠습니다.<br>
그런데 개발자의 실수조차 컴파일 단계에 막아서 예외처리를 해야 함이 바람직한것이 아닌가요?<br>
굳이 왜 RuntimeException은 uncheckedException인지 모르겠습니다. 부디 가르쳐주세요 ㅠㅠ',
sysdate, 0, 4, 6, 3)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '자바 배열관련 문의입니다.',
'자바에서<br>
{"CoverCD":3,"PageCD":"1"} , {"CoverCD":6,"PageCD":"2"} 이라는 문자열을<br>
배열로 바꿀수있나요?<br>
[{"CoverCD":3,"PageCD":"1"} , {"CoverCD":6,"PageCD":"2"}]<br>
이렇게 배열로 바꾸길 원합니다.',
sysdate, 0, 4, 5, 3)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '자바 문자열에서 문자 추출 질문!',
'A = { *B, *B =! A, *Baby}<br>
라는 A배열에서 "*B" 와 일치 할때만 그 값을 출력하고싶습니다.<br>
위와같은 경우에는<br>
A[0] 에서는 *B 를 출력<br>
A[1] 에서는 *B 를 출력<br>
A[2] 에서는 출력X<br> 
contains를 이용하면 A[2] 에 *B 가 포함되어있어서 이것도 같이 출력되더라구요<br>
"*B" 문자와 완전히 동일한 문자만 뽑고 싶을땐 어떤 메소드를 이용해야하나요? ',
sysdate, 0, 4, 4, 3)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '자바스크립트에서 템플릿 문자열 사용에 관한 질문드립니다.',
'템플릿 문자열을 사용할때 backtick(`) 문자를 사용하잖아요?<br>
backtick 문자 사이로 alert 함수를 통해 최종적으로<br>
"안녕하세요" << 왼쪽처럼 쌍 따옴표를 포함해서 문구를 출력하려고 하는데요<br>
` alert(""안녕하세요"") `;<br>
라고 쓰니까 Uncaught SyntaxError: missing ) after argument list 오류가 뜨더라구요.<br> 
이스케이프 시퀀스도 써봤는데 안되네요..<br>
저걸 어떻게 수정해야 돌아갈까요?',
sysdate, 0, 4, 3, 5)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '소프트웨어 개발회사로는 처음 취직해서 잘 모르는것이 많습니다',
'보통 프로그램을 개발할때, 세부 기획이 다 된다음 프로그램 구조를 설계하나요?<br>
아니면 큰 구조를 미리 잡고 세부 기획을 하나요?<br>
소프트웨어는 혼자서 토이프로젝트로만 개발한게 전부라서 협업을 하려니 잘 몰라서 질문합니다',
sysdate, 0, 4, 2, 9)
;

INSERT INTO TB_POST (POST_UID, POST_SUBJECT , POST_CONTENT , POST_REGDATE , POST_VIEWCNT , BOARD_UID ,  USER_UID , CATEGORY_UID )
VALUES (post_seq.nextval, '백엔드 개발자가 웹개발자가 맞나요??',
'이제 입사한지 막 1년지난 신입개발자인데요<br>
웹개발자로 성장하기 위해, 자바스크립트, node, react 등을 공부하면서 느낀점이<br>
웹개발 하면 떠오르는 기술들이나, 제가 공부하고있는 기술들도 대부분 프론트쪽 기술들이거든요<br>
입사하기전에<br>
기존에 가지고있던 생각은 웹개발자는 백엔드 위주, 프론트 위주 개발자가 있다.<br> 
이렇게 생각하고있었는데,<br>
요즘 웹개발쪽 스펙쌓겠다고 공부하고있는 과목들이 대다수 프론트위주이고 하다보니<br>
백엔드쪽에서 막상 웹이랑 관련된게 없는거같이 느껴저서요.<br> 
자바기반에, oracle로 db 데이터 crud하고 앞단에 데이터 넘겨주는게 백단의 주업무이다보니<br>
막상 백단에서 웹관련 개발 지식이나 기술이 크게 느껴지지도않고<br>
백엔드 개발자랑 웹개발자랑은 먼가 이질감이 드는데....<br>
제가 아직 견문이 좁아서 이렇게 느껴지는 걸까요??',
sysdate, 0, 4, 1, 2)
;