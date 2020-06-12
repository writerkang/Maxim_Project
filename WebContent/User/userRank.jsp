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
<script src="../JS/userRankList.js"></script>

<body>

<!-- 헤더 부분 입니다. -->
<jsp:include page="../header.jsp" />
<script src="../JS/header.js"></script>
<!---------------------------------->

<div class="container">
    <h4 style="margin-top: 24px">포인트랭킹</h4>
    <div class="panel-ranker-info">
        <div class="ranker2 ranker-info">
            <div class="card">
                <div class="card-image">
                    <img src="../image/user.png">
                </div>
                <div class="card-text">
                    <span class="date">Rank2</span>
                    <h2 class="ranker-name"></h2>
                    <p>Lorem ipsum dolor sit amet consectetur, Ducimus, repudiandae temporibus omnis illum maxime quod deserunt eligendi dolor</p>
                </div>
                <div class="card-stats"></div>
            </div>
        </div>
        <div class="ranker1 ranker-info">
            <div class="card">
                <div class="card-image">
                    <img src="../image/user.png">
                </div>
                <div class="card-text">
                    <span class="date">Rank1</span>
                    <h2 class="ranker-name"></h2>
                    <p>Lorem ipsum dolor sit amet consectetur, Ducimus, repudiandae temporibus omnis illum maxime quod deserunt eligendi dolor</p>
                </div>
                <div class="card-stats"></div>
            </div>
        </div>
        <div class="ranker3 ranker-info">
            <div class="card">
                <div class="card-image">
                    <img src="../image/user.png">
                </div>
                <div class="card-text">
                    <span class="date">Rank3</span>
                    <h2 class="ranker-name"></h2>
                    <p>Lorem ipsum dolor sit amet consectetur, Ducimus, repudiandae temporibus omnis illum maxime quod deserunt eligendi dolor</p>
                </div>
                <div class="card-stats"></div>
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
                    <tbody class="userRank-list"></tbody>
                </table>
            </div>
        </div>
    </div>
</div>   
</body>
</html>