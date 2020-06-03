<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="CSS/ham.css" />
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
        <li><a onclick="location.href=''">SiteCommand</a></li>
        <li><a onclick="location.href=''">Question</a></li>
        <li><a onclick="location.href='FreeBoardList.po'">FreeBoard</a></li>
        <li><a onclick="location.href='tipBoardList.po'">TipBoard</a></li>
        <li><a href="#">Ranking</a></li>
        <li><a onclick="location.href='noticeBoardList.po'">Notice</a></li>
      </ul>
    </nav>

    <section class="landing">
      <img src="image/circle.svg" alt="dots" />
      <h2>SYSOUT</h2>
    </section>

    <script src="JS/ham.js"></script>
  </body>
</html>