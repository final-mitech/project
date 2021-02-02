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
            background-color: #cacaca;
            color: rgb(78, 68, 68);
            font-size: large;
            font-weight: bold;
            float: right;
            text-align: center;
        }

        .btnAdmin:hover {
            color: #FBFBF4;
        }
    </style>
</head>

<body>
    <div class="container">
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
            <div class="col-2" style="padding-left: 0px; padding-right: 2px;">
                <button class="btn btnAdmin btn-lg" onclick="location.href='/etoile/admin/auctionAdminForm.a'">경매등록</button>
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
                    <tr onclick="모달해서수정폼할거얌" align="center">
                        <td>${vo.auctionId}</td>
                        <td>${vo.auctionUpdateDate}</td>
                        <c:if test="${vo.auctionCondition eq '0'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #f7e6e6; border-color: #f7e6e6; text-align: center;"
                                    value="접수대기" readonly>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '4'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #fad3d3; border-color: #fad3d3; text-align: center;"
                                    value="접수완료" readonly>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '5'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #ebe3fa; border-color: #ebe3fa; text-align: center;"
                                    value="검수중" readonly>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '6'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #d4c2f7; border-color: #dccdf8; text-align: center;"
                                    value="검수완료" readonly>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '7'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #b1d7ff; border-color: #b1d7ff; text-align: center;"
                                    value="회수요청" readonly>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '8'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #b6d5f5; border-color: #dccdf8; text-align: center;"
                                    value="정산요청" readonly>
                            </td>
                        </c:if>
                        <td>${vo.memberId}</td>
                        <td>${vo.auctionName}</td>
                        <td style="width: 200px;">
                            <form class="form-inline" id="frm" name="frm">
                                <c:if test="${vo.auctionCondition eq '0'}">
                                    <input type="hidden" class="conditionAuctionId" value="${vo.auctionId}">
                                    <input type="text" class="form-control conditionChange" name="" value="접수완료"
                                        readonly>&nbsp;&nbsp;&nbsp;
                                    <button class="form-control btn btn-secondary btnConfirm">확인</button>
                                </c:if>
                                <c:if test="${vo.auctionCondition eq '4'}">
                                    <input type="hidden" class="conditionAuctionId" value="${vo.auctionId}">
                                    <input type="text" class="form-control conditionChange" name="" value="검수중"
                                        readonly>&nbsp;&nbsp;&nbsp;
                                    <button class="form-control btn btn-secondary btnConfirm">확인</button>
                                </c:if>
                                <c:if test="${vo.auctionCondition eq '5'}">
                                    <input type="hidden" class="conditionAuctionId" value="${vo.auctionId}">
                                    <input type="text" class="form-control conditionChange" name="" value="검수완료"
                                        readonly>&nbsp;&nbsp;&nbsp;
                                    <button class="form-control btn btn-secondary btnConfirm">확인</button>
                                </c:if>

                            </form>
                        </td>
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

    var conditionChange = $('.conditionChange').val();
    var conditionAuctionId = $('.conditionAuctionId').val();

    $(function () {
        $('.btnConfirm').click(function () {
            $.ajax({
                url: "auctionReqConfirm.a",
                type: 'POST',
                //dataType: 'json', //받아오는 타입
                data: {
                    conditionChange: conditionChange,
                    conditionAuctionId: conditionAuctionId
                },
                success: function (data) {
                    if (data == "1") {
                        alert("정상적으로 등록되었습니다 :)");
                        location.href = "auctionReqList.a";
                    } else {
                        alert("등록되지 않았습니다 :(")
                    }
                },
                error: function (e) {
                    alert("등록되지 않았습니다!");
                }
            });
        });
    });
</script>

</html>