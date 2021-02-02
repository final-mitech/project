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

        #selectWord {
            padding-top: 4px;
            background-color: #f5f5f5;
            border-color: #c7c7c7;
            width: 120px;
            height: 40px;
        }

        .btnSelect{
            background-color: #f5f5f5;
            border-color: #c7c7c7;
            height: 40px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-9">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link " onclick="location.href='/etoile/admin/auctionReqList.a'">실시간 경매요청</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active"
                            onclick="location.href='/etoile/admin/auctionAdminList.a'">경매현황리스트</a>
                    </li>
                </ul>
            </div>
            <div class="col-3" style="padding-top: 10px; padding-right: 0px;">
                <form class="form-inline" action="auctionAdminSelect.a" method="POST">
                    <select class="form-control" name="selectWord" id="selectWord">
                        <c:choose>
                            <c:when test="${selectWord eq '0' }">
                                <option value="0" selected>전체보기</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">전체보기</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${selectWord eq '1' }">
                                <option value="1" selected>경매중</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">경매중</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${selectWord eq '2' }">
                                <option value="2" selected>오픈예정</option>
                            </c:when>
                            <c:otherwise>
                                <option value="2">오픈예정</option>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${selectWord eq '3' }">
                                <option value="3" selected>경매마감</option>
                            </c:when>
                            <c:otherwise>
                                <option value="3">경매마감</option>
                            </c:otherwise>
                        </c:choose>
                    </select>&nbsp;&nbsp;&nbsp;
                    <input type="submit" class="form-control btn btn-sm btnSelect" value="보기">
                </form>
            </div>
        </div>
        <br />
        <div class="row">
            <table class="table">
                <thead class="thead-dark" align="center">
                    <tr>
                        <th>경매번호</th>
                        <th>상품명</th>
                        <th>브랜드</th>
                        <th>유형</th>
                        <th>아이디</th>
                        <th>경매상태</th>
                    </tr>
                </thead>

                <c:forEach var="vo" items="${list }">
                    <tr onclick="모달해서수정폼할거얌" align="center">
                        <td>${vo.auctionId}</td>
                        <td>${vo.auctionName}</td>
                        <td>${vo.auctionBrand}</td>
                        <td>${vo.auctionCategory}</td>
                        <td>${vo.memberId}</td>
                        <c:if test="${vo.auctionCondition eq '1'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #fdbab5; border-color: #fdbab5; text-align: center;"
                                    value="경매중" readonly>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '2'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #b5d7fd; border-color: #b5d7fd; text-align: center;"
                                    value="오픈예정" readonly>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '3'}">
                            <td><input type="text" class="form-control condition"
                                    style="width: 90px; background-color: #c5c4cf; border-color: #c5c4cf; text-align: center;"
                                    value="경매마감" readonly>
                            </td>
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
        $('#auctionConSelect').on("change", function () { //정렬 클릭하면
            var condition = $(this).val();
            console.log(condition);
            $.ajax({
                url: "auctionAdminSelect.a",
                type: 'POST',
                data: {
                    condition: condition
                },
                success: function (data) {
                    console.log(data);
                    //   location.href = "auctionAdminList.a"
                },
                error: function (e) {
                    alert("불러오지 못했습니다!");
                }
            });
        });
    });
</script>

</html>