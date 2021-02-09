<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>대리 경매 요청 내역</title>
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
            padding-left: 5%;
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

        .bar {
            text-align: center;
            border-style: solid;
            width: 500px;
            border-radius: 5px;
            border-width: 1px;
            border-color: rgb(156, 151, 147);
            margin-right: 5px;
            margin-left: 10%;
        }

        .progress {
            margin-left: 40px;
            margin-right: 40px;
            height: 12px;
        }

        .progress-bar {
            height: 12px;
        }

        .rounded-lg {
            display: inline-block;
            width: 230px;
            height: 110px;
            margin-top: 20px;
            margin-right: 10%;
            padding-top: 10px;
            padding-left: 5px;
            padding-right: 5px;
            background-color: rgb(206, 199, 194);
        }

        .settleBtn {
            background-color: rgb(230, 126, 95);
            border-color: rgb(230, 126, 95);
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
                        <a class="nav-link" onclick="location.href='/etoile/site/myAuctionBid.do'">낙찰받은상품</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" onclick="location.href='/etoile/site/myAuctionReq.do'">대리경매현황</a>
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
                        <button type="button" class="btn btnTitle" style="padding-left: 25%;" readonly>
                            대리 경매 번호 ${vo.auctionId}
                            <span style="float: right;">업데이트 일자:&nbsp; ${vo.auctionUpdateDate}</span>
                        </button>

                        <div class="row">
                            <div class="col-4">
                                <div class="card-body">
                                    <a href="auctionOne?id=${vo.auctionId}">
                                        <img class="imgCard" src="/etoile/images/${vo.auctionImage}" alt="Card image"
                                            width="100%" height="213px"></a>
                                </div>
                            </div>

                            <div class="col-8">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="card-text" style="font-size: small; padding-left: 20%;">
                                            <p
                                                style="font-size: medium; font-weight: bold; padding-top: 15px; margin-bottom: 10px;">
                                                ${vo.auctionName}</p>
                                            <p>브랜드 명: ${vo.auctionBrand}</p>
                                            <p>최저입찰가: ${vo.auctionBestPrice}</p>
                                        </div>
                                    </div>

                                    <div class="col-7">
                                        <c:if test="${vo.auctionCondition eq '7' }">
                                            <div style="text-align:center;">
                                                <span class="rounded-lg"
                                                    style="padding-top: 8px; height: 40px; background-color: rgb(255, 237, 188);">
                                                    <p style="font-weight: bold;">회수요청 된 상품입니다!</p>
                                                </span>
                                            </div>
                                        </c:if>
                                        <c:if test="${vo.auctionCondition eq '8' }">
                                            <div style="text-align:center;">
                                                <span class="rounded-lg"
                                                    style="padding-top: 8px; height: 40px; background-color: rgb(255, 237, 188);">
                                                    <p style="font-weight: bold;">정산요청 된 상품입니다!</p>
                                                </span>
                                            </div>
                                        </c:if>
                                        <c:if test="${vo.auctionCondition eq '2' }">
                                            <div style="text-align:center;">
                                                <span class="rounded-lg"
                                                    style="padding-top: 8px; height: 80px; background-color: rgb(255, 237, 188);">
                                                    <p>경매 오픈예정입니다 :)</p>
                                                    <p style="font-size: small;">경매 기간:&nbsp;${vo.auctionStart} ~
                                                        ${vo.auctionEnd}</p>
                                                </span>
                                            </div>
                                        </c:if>
                                        <c:if test="${vo.auctionCondition eq '6' }">
                                            <form action="" id="frm1" name="frm1">
                                                <div style="text-align:center;">
                                                    <input type="hidden" name="auctionId" value="${vo.auctionId}">
                                                    <span class="rounded-lg"
                                                        style="margin-top: 8px; margin-bottom: 5px;">
                                                        <p style="margin-bottom: 1px;">검수완료 되었습니다.
                                                        </p>
                                                        <p style="margin-bottom: 8px;">경매 진행을 하시겠습니까?
                                                        </p>
                                                        <button
                                                            class="btn btn-secondary btn-sm recoverBtn">회수하기</button>&nbsp;&nbsp;
                                                        <button class="btn btn-warning btn-sm confirmBtn">경매등록</button>
                                                    </span>
                                                </div>
                                            </form>
                                        </c:if>
                                        <c:if test="${vo.auctionCondition eq '3' }">
                                            <form action="" id="frm2" name="frm2">
                                                <div style="text-align:center;">
                                                    <input type="hidden" name="auctionId" value="${vo.auctionId}">
                                                    <span class="rounded-lg" style="padding-top: 8px; height: 80px;">
                                                        <p style="font-size:medium; margin-bottom: 7px;">
                                                            경매완료입니다 :)
                                                        </p>
                                                        <button class="btn btn-sm settleBtn">정산받기</button>
                                                    </span>
                                                </div>
                                            </form>
                                        </c:if>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">
                                            <div class="bar card-text">
                                                <p
                                                    style="font-size: small; font-weight: bold; margin-top: 5px; margin-bottom: 10px; color: rgb(78, 68, 68);">
                                                    대리경매 진행 상태</p>
                                                <div class="progress">
                                                    <c:if test="${vo.auctionCondition eq '4' }">
                                                        <div class="progress-bar bg-dark progress-bar-striped"
                                                            style="width: 20%;">
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${vo.auctionCondition eq '5' }">
                                                        <div class="progress-bar bg-dark progress-bar-striped"
                                                            style="width: 40%;">
                                                        </div>
                                                    </c:if>
                                                    <c:if
                                                        test="${vo.auctionCondition eq '6' || vo.auctionCondition eq '7'}">
                                                        <div class="progress-bar bg-dark progress-bar-striped"
                                                            style="width: 60%;">
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${vo.auctionCondition eq '2' }">
                                                        <div class="progress-bar bg-dark progress-bar-striped"
                                                            style="width: 70%;">
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${vo.auctionCondition eq '1' }">
                                                        <div class="progress-bar bg-dark progress-bar-striped"
                                                            style="width: 80%;">
                                                        </div>
                                                    </c:if>
                                                    <c:if
                                                        test="${vo.auctionCondition eq '3' || vo.auctionCondition eq '8'}">
                                                        <div class="progress-bar bg-dark progress-bar-striped"
                                                            style="width: 100%;">
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <p
                                                    style="font-size: small; text-align: left; padding-left: 15px; margin-top: 5px; margin-bottom: 10px; color: rgb(78, 68, 68);">
                                                    접수대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    접수완료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    검수중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    검수완료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    경매중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    경매완료
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

    $('.recoverBtn').click(function () {
        $.ajax({
            url: "/etoile/site/myAuctionRecover.do",
            type: 'POST',
            data: $("#frm1").serialize(),
            success: function (data) {
                if (data == "1") {
                    alert("회수 요청 성공:)");
                    location.href = rePage;
                } else {
                    alert("회수요청이 되지 않았습니다 :(")
                }
            },
            error: function (e) {
                alert("회수요청 오류입니다!");
            }
        });
    });

    $('.confirmBtn').click(function () {
        $.ajax({
            url: "/etoile/site/myAuctionConfirm.do",
            type: 'POST',
            data: $("#frm1").serialize(),
            success: function (data) {
                if (data == "1") {
                    alert("경매진행 확정 되었습니다 :)");
                    location.href = rePage;
                } else {
                    alert("경매진행 확정 되지 않았습니다 :(")
                }
            },
            error: function (e) {
                alert("경매진행 확정 오류입니다!");
            }
        });
    });

    $('.settleBtn').click(function () {
        $.ajax({
            url: "/etoile/site/myAuctionSettle.do",
            type: 'POST',
            data: $("#frm2").serialize(),
            success: function (data) {
                if (data == "1") {
                    alert("정산받기 요청 되었습니다 :)");
                    location.href = rePage;
                } else {
                    alert("정산받기 요청 되지 않았습니다 :(")
                }
            },
            error: function (e) {
                alert("정산받기 요청 오류입니다!");
            }
        });
    });
</script>

</html>