<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자 경매 현황리스트</title>
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
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-10">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link " onclick="location.href='/etoile/admin/auctionReqList.a'">실시간 경매요청</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" onclick="location.href='/etoile/admin/auctionAdminList.a'">경매현황리스트</a>
                    </li>
                </ul>
            </div>
            <div class="col-2">
                <p>경매상태별정렬</p>
            </div>
        </div>
        <br />
        <div class="row">
            <table class="table" align="center">
                <thead class="thead-dark">
                    <tr>
                        <th>경매번호</th>
                        <th>아이디</th>
                        <th>상품명</th>
                        <th>브랜드</th>
                        <th>유형</th>
                        <th>경매상태</th>
                        <th>경매상태관리</th>
                    </tr>
                </thead>

                <c:forEach var="vo" items="${list }">
                    <tr onclick="모달해서수정폼할거얌">
                        <td>${vo.auctionId}</td>
                        <td>${vo.memberId}</td>
                        <td>${vo.auctionName}</td>
                        <td>${vo.auctionBrand}</td>
                        <td>${vo.auctionCategory}</td>
                        <c:if test="${vo.auctionCondition eq '1'}">
                            <td>경매중</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '2'}">
                            <td>오픈예정</td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '3'}">
                            <td>경매마감</td>
                        </c:if>
                        <td>드롭다운</td>
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
</script>

</html>