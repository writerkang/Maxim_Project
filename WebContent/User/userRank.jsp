<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ranking</title>
    
    <link rel="stylesheet" href="../CSS/userRank.css"/>
    <link rel="stylesheet" href="../CSS/stack-card.css"/>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="../JS/stack-card.js" type="text/javascript"></script>

<body>
    <div class="header"><span>랭킹 - Ranking</span></div>

    <div id="topRankers">
        <div class="topRanker" style="--i:0;">
            <div class="ranker-img"><img src="../user.png"/></div>
            <div class="ranker-info">
                <div>
                    <div>Rank1</div>
                    <div>john</div>
                    <div>100</div>
                </div>
            </div>
        </div>
        <div class="topRanker" style="--i:1;">
            <div class="ranker-img"><img src="../user.png"/></div>
            <div class="ranker-info">
                <div>
                    <div>Rank2</div>
                    <div>scott</div>
                    <div>90</div>
                </div>
            </div>
        </div>
        <div class="topRanker" style="--i:2;">
            <div class="ranker-img"><img src="../user.png"/></div>
            <div class="ranker-info">
                <div>
                    <div>Rank3</div>
                    <div>tiger</div>
                    <div>80</div>
                </div>
            </div>
        </div>
    </div>

    <table>
        <tr>
            <th>순위</th>
            <th>닉네임</th>
            <th>포인트</th>
        </tr>
        <tr>
            <td>1</td>
            <td>john</td>
            <td>100</td>
        </tr>
        <tr>
            <td>2</td>
            <td>scott</td>
            <td>90</td>
        </tr>
        <tr>
            <td>3</td>
            <td>tiger</td>
            <td>80</td>
        </tr>
    </table>
</body>
</html>