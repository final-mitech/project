<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>경매메인</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style>
    .nav-link {
      color: rgb(78, 68, 68);
    }

    .nav-link:hover {
      color: rgb(78, 68, 68)
    }

    .card-image-top {
      width: auto;
      height: 100%;
    }

    .btnReq {
      background-color: rgb(218, 212, 196);
      height: 90%;
      font-size: large;
      float: right;
      text-align: center;
    }

    .btnReq:hover {
      color: #FBFBF4;
    }

    .btnTitle {
      font-size: small;
      height: 8%;
      padding-left: 20%;
    }

    .badge {
      float: right;
      font-size: smaller;
      width: 60px;
      height: 20px;
      padding-top: 5px;
      margin-top: 2px;
    }

    .card {
      border-width: 1px;
      border-color: rgb(192, 184, 177);
    }

    .card-body {
      padding: 0px;
    }

    .card-text {
      padding-top: 20px;
      height: 200px;
      border-color: rgb(0, 0, 0);
      font-size: small;
    }

    .btnJoin {
      background-color: rgb(66, 64, 64);
      color: #FBFBF4;
      border-color:  rgb(66, 64, 64);
      font-size: medium;
      height: 40px;
      padding-top: 6px;
    }

    .btnJoin:hover {
      color: #FBFBF4;
    }

    .card-footer {
      padding: 0px;
      border-color: #A4ACC8;
    }
  </style>
</head>

<body>
  <div class="container" style="max-width: 1400px;">
    <br />
    <div class="row">
      <div class="col-3">
        <br />
        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link" onclick="location.href='auctionRecent'">최신등록순</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" onclick="location.href='auctionHottest'">인기경매순</a>
          </li>
        </ul>
      </div>
      <div class="col-3">
        <br />
        <form class="form-inline" action="auctionSearch">
          <input type="text" class="form-control" placeholder="상품명을 입력하세요." id="word" name="word">&nbsp;<button
            type="submit" class="form-control"><i class="fa fa-search"></i></button>
        </form>
      </div>
      <div class="col-4"></div>
      <div class="col-2">
        <button type="button" class="btn btnReq btn-lg" onclick="location.href='auctionJoinForm.do'">경매등록하기</button>
      </div>
    </div>
    <br />

    <div class="row">
      <c:forEach var="vo" items="${list }">
        <div class="col-3 mb-3">
          <div class="card-deck">
            <div class="card">
              <button type="button" class="btn btnTitle" readonly>
                경매번호 ${vo.auctionId}
                <c:if test="${vo.auctionCondition eq '2' }">
                  <span class="badge badge-pill badge-light" style="background-color:  #c6e1ff;">오픈예정</span>
                </c:if>
                <c:if test="${vo.auctionCondition eq '1' }">
                  <span class="badge badge-pill badge-light" style="background-color: #ffc1bd;">경매중</span>
                </c:if>
                <c:if test="${vo.auctionCondition eq '3' || vo.auctionCondition eq '8'}">
                  <span class="badge badge-pill badge-light" style="background-color: #C8CAC4;">경매마감</span>
                </c:if>
              </button>
              <div class="card-body">
                <a href="auctionOne?id=${vo.auctionId}"><img class="card-img-top"
                    src="/etoile/images/${vo.auctionImage}" alt="Card image" width="100%" height="230px"></a>
              </div>
              <div class="card-text">
                <p style="font-size: medium; font-weight: bold; text-align: center;">${vo.auctionName} </p>
                <p style="font-size: small; text-align: center;">입찰 수 &nbsp;${vo.auctionJoinCount} </p>
                <p style="padding-left: 20px;">경매시작가: ${vo.auctionBestPrice} </p>
                <p style="padding-left: 20px;">즉시입찰가: ${vo.auctionImmediateBid}</p>
                <p style="padding-left: 20px;">경매기간: ${vo.auctionStart} ~ ${vo.auctionEnd}</p>
              </div>
              <c:if test="${vo.auctionCondition eq '1' }">
                <div class="card-footer">
                  <a href="auctionOne?id=${vo.auctionId}" class="btn btnJoin btn-block btn-sm">입찰하러가기</a>
                </div>
              </c:if>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
    <div style="margin: auto;">
      <tag:historyPaging jsFunc="goList" />
    </div>
  </div>
</body>
<script>
  var string = location.pathname;
  console.log(string);
  var str = string.split('/');
  console.log(str[3]);

  function goList(p) {
    location.href = str[3] + "?page=" + p;

  }

  //nav에 active 걸기
  $('.nav-link').click(function () {
    $('.active').removeClass('active');
    $(this).addClass('active');
  })
</script>

</html>