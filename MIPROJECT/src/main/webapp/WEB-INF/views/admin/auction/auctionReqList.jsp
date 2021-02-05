<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자 경매 요청리스트</title>
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

        .form-inline>.conditionChange {
            width: 100px;
            background-color: #f5f5f5;
            border-color: #f5f5f5;
            text-align: center;
        }

        .btnAdmin {
            background-color: rgb(218, 212, 196);
            font-size: large;
            float: right;
            text-align: center;
        }

        .btnAdmin:hover {
            color: #FBFBF4;
        }

        .btnConfirm1 {
            background-color: #f5f5f5;
            border-color: #f5f5f5;

        }

        .btnConfirm2 {
            background-color: #f5f5f5;
            border-color: #f5f5f5;

        }

        .btnReq {
            background-color: #fddbdb;
            border-color: #fddbdb;
        }

        .modal-body {
            padding-left: 20%;
            padding-right: 20%;
        }

        .reqUpdate{
            background-color: #fddbdb;
            border-color: #fddbdb;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-10">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" onclick="location.href='/etoile/admin/auctionReqList.a'">실시간 경매요청</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" onclick="location.href='/etoile/admin/auctionAdminList.a'">경매현황리스트</a>
                    </li>
                </ul>
            </div>
            <div class="col-2" style="padding-left: 0px; padding-right: 10px;">
                <button class="btn btnAdmin btn-lg" onclick="location.href='/etoile/admin/auctionAdminForm.a'">관리자
                    경매등록</button>
            </div>
        </div>
        <br />
        <div class="row">
            <table class="table">
                <thead class="thead-dark">
                    <tr align="center">
                        <th>대리경매번호</th>
                        <th>요청일자</th>
                        <th>경매상태</th>
                        <th>아이디</th>
                        <th>상품명</th>
                        <th>경매상태관리</th>
                    </tr>
                </thead>

                <c:forEach var="vo" items="${list }">
                    <tr align="center">

                        <td>${vo.auctionId}</td>
                        <td>${vo.auctionUpdateDate}</td>
                        <c:if test="${vo.auctionCondition eq '0'}">
                            <td> 접수대기</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '4'}">
                            <td>접수완료</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '5'}">
                            <td>검수중</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '6'}">
                            <td>검수완료</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '7'}">
                            <td>회수요청 </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '8'}">
                            <td>정산요청 </td>
                        </c:if>
                        <td>${vo.memberId}</td>
                        <td>${vo.auctionName}</td>
                        <c:if test="${vo.auctionCondition eq '0'}">
                            <td style="width: 200px;">
                                <form id="frm1">
                                    <input type="hidden" id="auctionCondition" name="auctionCondition"
                                        value="${vo.auctionCondition}">
                                    <input type="hidden" id="auctionId" name="auctionId" value="${vo.auctionId}">
                                    <button class="btn btnConfirm1" name="">접수하기</button>
                                </form>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '4'}">
                            <td style="width: 200px;">
                                <form id="frm2">
                                    <input type="hidden" id="auctionCondition" name="auctionCondition"
                                        value="${vo.auctionCondition}">
                                    <input type="hidden" id="auctionId" name="auctionId" value="${vo.auctionId}">
                                    <button class="btn btnConfirm2" name="">검수승인</button>
                                </form>
                            </td>
                        </c:if>
                        </form>
                        <c:if test="${vo.auctionCondition eq '6'}">
                            <td style="width: 200px;">고객확정 후 오픈예정</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '7'}">
                            <td style="width: 200px;">회수 확인바랍니다</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '8'}">
                            <td style="width: 200px;">정산 확인바랍니다</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '5'}">
                            <td style="width: 200px;"><button class="btn btnReq" data-toggle="modal" name=""
                                    data-target="#reqModal">검수하기</button>
                            </td>
                            <form action="" id="frm">
                                <div class="modal fade" id="reqModal">
                                    <div class="modal-dialog modal-dialog-centered modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Request Info</h4>
                                                <button type="button" class="close"
                                                    data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="">이미지</label>
                                                    <img src="/etoile/images/${vo.auctionImage}" class="img-fluid"
                                                        style="width: 30%">
                                                </div>
                                                <div class="form-group">
                                                    <label for="">아이디</label>
                                                    <input type="text" class="form-control" id="memberId"
                                                        value="${vo.memberId }" name="" style="width: 40%" readonly>
                                                </div>
                                                <div class="form-group">
                                                    상품명&nbsp;<input type="text" class="form-control" id="auctionName"
                                                        name="auctionName" style="width: 60%;"
                                                        value="${vo.auctionName}">
                                                </div>
                                                <div class="form-group">
                                                    브랜드명&nbsp;<input type="text" class="form-control" id="auctionBrand"
                                                        name="auctionBrand" style="width: 200px;"
                                                        value="${vo.auctionBrand}">
                                                </div>
                                                <div class="form-group form-inline">
                                                    최저입찰가&nbsp;<input type="text" class="form-control"
                                                        id="auctionBestPrice" name="auctionBestPrice"
                                                        style="width: 100px;" value="${vo.auctionBestPrice}"
                                                        readonly>&nbsp;eth
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
                                                    즉시낙찰가&nbsp;<input type="text" class="form-control"
                                                        id="auctionImmediateBid" name="auctionImmediateBid"
                                                        style="width: 100px;" value="${vo.auctionImmediateBid}"
                                                        readonly>&nbsp;eth<br />
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Title</label>
                                                    <input type="text" class="form-control" id="auctionTitle"
                                                        value="${vo.auctionTitle}" name="auctionTitle"
                                                        style="width: 60%">
                                                </div>
                                                <div class="form-group">
                                                    <label for="">상세내용</label>
                                                    <textarea type="text" class="form-control info" id="auctionContent"
                                                        value="" name="auctionContent">${vo.auctionContent}</textarea>
                                                </div>
                                                <input type="hidden" id="auctionCondition" name="auctionCondition"
                                                    value="6">
                                                <input type="hidden" id="auctionId" name="auctionId"
                                                    value="${vo.auctionId}">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-block reqUpdate"
                                                    style="height: 100%; font-size: large;">검수완료</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
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

    $(function () {
        $('.btnConfirm1').click(function () {
            $.ajax({
                url: "/etoile/admin/auctionReqConfirm.a",
                type: 'POST',
                //dataType: 'json', //받아오는 타입
                data: $("#frm1").serialize(),
                success: function (data) {
                    if (data == "1") {
                        alert("정상적으로 접수승인되었습니다 :)");
                        location.href = "/etoile/admin/auctionReqList.a";
                    } else {
                        alert("접수승인되지 않았습니다 :(")
                    }
                },
                error: function (e) {
                    alert("서버문제로 접수승인되지 않았습니다!");
                }
            });
        });
    });

    $(function () {
        $('.btnConfirm2').click(function () {
            $.ajax({
                url: "/etoile/admin/auctionReqConfirm.a",
                type: 'POST',
                //dataType: 'json', //받아오는 타입
                data: $("#frm2").serialize(),
                success: function (data) {
                    if (data == "1") {
                        alert("정상적으로 검수승인되었습니다 :)");
                        location.href = "/etoile/admin/auctionReqList.a";
                    } else {
                        alert("검수승인되지 않았습니다 :(")
                    }
                },
                error: function (e) {
                    alert("서버문제로 검수승인되지 않았습니다!");
                }
            });
        });
    });


    $(function () {
        $('.reqUpdate').click(function () {
            $.ajax({
                url: "/etoile/admin/auctionReqUpdate.a",
                type: 'POST',
                //dataType: 'json', //받아오는 타입
                data: $("#frm").serialize(),
                success: function (data) {
                    if (data == "1") {
                        alert("정상적으로 검수완료 되었습니다 :) 고객에게 경매확정 메시지를 보냅니다.");
                        location.href = "/etoile/admin/auctionReqList.a";
                    } else {
                        alert("검수완료되지 않았습니다 :(")
                    }
                },
                error: function (e) {
                    alert("서버문제로 검수완료되지 않았습니다!");
                }
            });
        });
    });
</script>

</html>