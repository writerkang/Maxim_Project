<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <link rel="stylesheet" href="CSS/index.css" />
  <link rel="stylesheet" href="CSS/sub.css" />
  <title>Bubble Effect</title>
</head>

<body>
  <nav>

    <div class="hamburger">
      <div class="line"></div>
      <div class="line"></div>
      <div class="line"></div>
    </div>
    <ul class="nav-links">
      <li><a onclick="location.href='#.po'">SiteCommand</a></li>
      <li><a onclick="location.href='Board/freeBoardList.po'">FreeBoard</a></li>
      <li><a onclick="location.href='Board/tipBoardList.po'">tipBoard</a></li>
      <li><a onclick="location.href='User/userRank.uo'">Ranking</a></li>
      <li><a onclick="location.href='Board/noticeBoardList.po'">Notice</a></li>
    </ul>
  </nav>

  <section class="landing">
    <ul class="login-links">
      <li><a href="#" id="mypage">MyPage</a></li>
      <li><a href="#" id="login">LogIn</a></li>
    </ul>
    <img src="image/circle.svg" alt="dots" />
    <h2>SYSOUT</h2>
  </section>

  <script src="JS/index.js"></script>

  <hr><br>
 <div class="notice-rank">
            <div class="index-noticecontainer">
                <div class="noticebtn">
                    <a class="nbtn" href="#">N O T I C E</a>
                </div>
              	<c:choose>
			<c:when test="${empty list || fn:length(list) == 0}">
			</c:when>
			<c:otherwise>

				<c:forEach var="dto" items="${list }">
				  <div class="notice-1">
               		 <!-- 게시내용 -->
	                    <div class="notice-text"> 
	                    	<a href="noticeBoardList.po?uid=${dto.post_uid }">${dto.post_subject }</a>
	                    </div>
	                    <!-- 게시날짜 -->
	                    <div class="notice-regdate">
	                        <a class="nregdate">${dto.post_regdate}</a>
	                    </div>
                	</div>
				</c:forEach>

			</c:otherwise>
		</c:choose>
    </div>
    <div class="index_rankcontainer">
      <div class="card" id="btn">
        <a class="rank_btn" href="#">전체 랭킹 현황</a>
      </div>
      <div class="card">
        <i class="fas fa-crown"></i>
        <span class="title"> name</span>
        <span class="rank"> 90</span>
      </div>
      <div class="card">
        <i class="fas fa-crown"></i>
        <span class="title"> name</span>
        <span class="rank"> 90</span>
      </div>
      <div class="card">
        <i class="fas fa-crown"></i>
        <span class="title"> name</span>
        <span class="rank"> 90</span>
      </div>
      <div class="card">
        <i class="fas fa-user "></i>
        <span class="title"> name</span>
        <span class="rank"> 90</span>
      </div>
      <div class="card">
        <i class="fas fa-user "></i>
        <span class="title"> name</span>
        <span class="rank"> 90</span>
      </div>
    </div>
  </div>
  </article>

  <footer>
    푸터입니다.
  </footer>

</body>

</html>