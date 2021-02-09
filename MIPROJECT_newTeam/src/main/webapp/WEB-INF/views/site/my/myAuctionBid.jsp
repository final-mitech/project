<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>경매 낙찰 내역</title>
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

        .btnTitle {
            border-bottom-color: rgb(156, 151, 147);
            font-size: small;
            height: 35px;
        }

        .badge {
            font-size: small;
            width: 20%;
            height: 120%;
            float: right;
            padding-top: 3px;
            margin-top: 5px;
            margin-right: 10px;
        }

        .card {
            border-width: 1px;
            border-color: rgb(156, 151, 147);
            height: 250px;
        }

        .card-body {
            padding: 0px;
        }

        .imgCard {
            border-radius: 5px;
        }

        #auctionAddress {
            font-size: small;
            height: 30px;
            background-color: #f5f5f5;
            border-color: #f5f5f5;
        }

        .addrBtn {
            height: 30px;
            background-color: rgb(156, 151, 147);
            border-color: rgb(156, 151, 147);
            color: white;
        }

        .form-inline {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div class="container" style="max-width: 1400px;">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <br />
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" onclick="location.href='/etoile/site/myAuctionJoin.do'">경매참여내역</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" onclick="location.href='/etoile/site/myAuctionBid.do'">낙찰받은상품</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" onclick="location.href='/etoile/site/myAuctionReq.do'">대리경매현황</a>
                    </li>
                </ul>
                <br />
            </div>
            <div class="col-1"></div>
        </div>

        <div class="row">
            <c:forEach var="vo" items="${list }">
                <div class="col-1"></div>
                <div class="col-10 mb-3">
                    <div class="card">
                        <button type="button" class="btn btnTitle" readonly>
                            <span style="float: left;">참여일자:&nbsp; ${vo.auctionDate}</span>
                            경매 참여 번호 ${vo.auctionJoinId}
                        </button>

                        <div class="row">
                            <div class="col-4">
                                <div class="card-body">
                                    <a href="auctionOne?id=${vo.auctionId}">
                                        <img class="imgCard" src="/etoile/images/${vo.auctionImage}" alt="Card image"
                                            width="100%" height="213px"></a>
                                </div>
                            </div>
                            <div class="col-1"></div>
                            <div class="col-5">
                                <div class="card-text" style="font-size: small;">
                                    <p
                                        style="font-size: medium; font-weight: bold; padding-top: 20px; margin-bottom: 8px;">
                                        ${vo.auctionName}
                                        <c:if test="${vo.auctionDelivery eq '1' }">
                                            <span class="badge badge-pill badge-light"
                                                style="background-color: #fff5b9; color: rgb(78, 68, 68);">배송전</span>
                                            <br />
                                            <c:if test="${empty vo.auctionAddress}">
                                                <form class="form-inline" action="" id="frm1" name="frm1">
                                                    <input type="hidden" name=auctionJoinId value="${vo.auctionJoinId}">
                                                    <input type="text" placeholder="배송지를 입력하세요." class="form-control"
                                                        id="auctionAddress" name="auctionAddress"
                                                        style="width: 280px;">&nbsp;&nbsp;&nbsp;
                                                    <button type="button"
                                                        class="btn addrBtn btn-sm form-control">입력</button>
                                                </form>
                                            </c:if>
                                            <c:if test="${not empty vo.auctionAddress}">
                                                <form class="form-inline" action="" id="frm2" name="frm2">
                                                    배송지:&nbsp;&nbsp;<input type="text" value="${vo.auctionAddress}"
                                                        class="form-control" id="auctionAddress" name="auctionAddress"
                                                        style="width: 280px;" readonly>
                                                </form>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${vo.auctionDelivery eq '2' }">
                                            <span class="badge badge-pill badge-light"
                                                style="background-color: #b7caff; color:  rgb(78, 68, 68);">배송중</span>
                                            <form class="form-inline" action="">
                                                배송지:&nbsp;&nbsp;<input type="text" value="${vo.auctionAddress}"
                                                    class="form-control" id="auctionAddress" name="auctionAddress"
                                                    style="width: 280px;" readonly>
                                            </form>
                                        </c:if>
                                        <c:if test="${vo.auctionDelivery eq '3' }">
                                            <span class="badge badge-pill badge-light"
                                                style="background-color: #C8CAC4; color:rgb(78, 68, 68);">배송완료</span>
                                            <form class="form-inline" action="">
                                                배송지:&nbsp;&nbsp;<input type="text" value="${vo.auctionAddress}"
                                                    class="form-control" id="auctionAddress" name="auctionAddress"
                                                    style="width: 280px;" readonly>
                                            </form>
                                        </c:if>
                                    </p>
                                    <p>경매번호: ${vo.auctionId}</p>
                                    <p>내 입찰가: ${vo.auctionSuccessBid}</p>
                                    <p>입찰 일: ${vo.auctionDate}</p>
                                </div>
                            </div>
                            <div class="col-1"></div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </c:forEach>
            <br />
        </div>
        <div style="margin: auto;">
            <tag:historyPaging jsFunc="goList" />
        </div>
        <br />
        <br />
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

    var rePage = location.href;
    $(".addrBtn").click(function () {
        $.ajax({
            url: "/etoile/site/myAuctionAddr",
            type: 'POST',
            //dataType: 'json', //받아오는 타입
            data: $("#frm1").serialize(),
            success: function (data) {
                if (data == "1") {
                    alert("배송지 입력 성공:)");
                    location.href = rePage;
                } else {
                    alert("배송지가 입력되지 않았습니다 :(")
                }
            },
            error: function (e) {
                alert("배송지가 입력되지 않았습니다!");
            }
        });
    });
</script>

</html>