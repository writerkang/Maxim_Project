<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>PointRanking</title>
    
    <link rel="stylesheet" href="../CSS/bootstrap.css"/>
    <link rel="stylesheet" href="../CSS/ranker-card.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>  
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../JS/ranker-card.js"></script>

<body>

<!-- 헤더 부분 입니다. -->
<jsp:include page="../header.jsp" />
<script src="../JS/header.js"></script>
<!---------------------------------->

<div class="container">
    <h4 style="margin-top: 24px">포인트랭킹</h4>
    <div class="panel-ranker-info">
        <div class="ranker1 ranker-info">
            <div class="card">
                <div class="card-image">
                    <img src="../user.png">
                </div>
                <div class="card-text">
                    <span class="date">어쩌구 저쩌구</span>
                    <h2 class="ranker-name">User1</h2>
                    <p>Lorem ipsum dolor sit amet consectetur, Ducimus, repudiandae temporibus omnis illum maxime quod deserunt eligendi dolor</p>
                </div>
                <div class="card-stats">
                    3000 point
                </div>
            </div>
        </div>
        <div class="ranker2 ranker-info">
            <div class="card">
                <div class="card-image">
                    <img src="../user.png">
                </div>
                <div class="card-text">
                    <span class="date">어쩌구 저쩌구</span>
                    <h2 class="ranker-name">User2</h2>
                    <p>Lorem ipsum dolor sit amet consectetur, Ducimus, repudiandae temporibus omnis illum maxime quod deserunt eligendi dolor</p>
                </div>
                <div class="card-stats">
                    2000 point
                </div>
            </div>
        </div>
        <div class="ranker3 ranker-info">
            <div class="card">
                <div class="card-image">
                    <img src="../user.png">
                </div>
                <div class="card-text">
                    <span class="date">어쩌구 저쩌구</span>
                    <h2 class="ranker-name">User3</h2>
                    <p>Lorem ipsum dolor sit amet consectetur, Ducimus, repudiandae temporibus omnis illum maxime quod deserunt eligendi dolor</p>
                </div>
                <div class="card-stats">
                    1000 point
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th>순위</th><th>닉네임</th><th>포인트</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td><td>user1</td><td>3000</td>
                        </tr>
                        <tr>
                            <td>2</td><td>user2</td><td>2000</td>
                        </tr>
                        <tr>
                            <td>3</td><td>user3</td><td>1000</td>
                        </tr>
                        <tr>
                            <td>4</td><td>user4</td><td>500</td>
                        </tr>
                        <tr>
                            <td>5</td><td>user5</td><td>100</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>   
</body>
</html>