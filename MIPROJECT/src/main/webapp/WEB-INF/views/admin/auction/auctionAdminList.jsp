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
            border-color:  #f5f5f5;
            width: 120px;
            height: 40px;
        }

        .btnSelect {
            background-color: #f5f5f5;
            border-color: #c7c7c7;
            height: 40px;
        }

        .modal-body {
            text-align: left;
            padding-left: 20%;
            padding-right: 20%;
        }

        .modal-body>.form-group[input] {
            background-color: #f5f5f5;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
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
                    <li class="nav-item">
                        <a class="nav-link"
                            onclick="location.href='/etoile/admin/auctionAdminForm.a'">경매 상품 등록</a>
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
                    <tr onclick="" align="center">
                        <td>${vo.auctionId}</td>
                        <td>${vo.auctionName}</td>
                        <td>${vo.auctionBrand}</td>
                        <td>${vo.auctionCategory}</td>
                        <td>${vo.memberId}</td>
                        <c:if test="${vo.auctionCondition eq '1'}">
                            <td><input type="text" class="form-control condition" data-toggle="modal"
                                    data-target="#biddingModal${vo.auctionId}"
                                    style="width: 90px; background-color: #fdbab5; border-color: #fdbab5; text-align: center;"
                                    value="경매중" readonly>
                                <div class="modal fade" id="biddingModal${vo.auctionId}">
                                    <div class="modal-dialog modal-dialog-centered modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Bidding Info</h4>
                                                <button type="button" class="close"
                                                    data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="">이미지</label>
                                                    <img onerror="this.src='/etoile/images/노이미지1.png';" src="/etoile/images/${vo.auctionImage}" class="img-fluid"
                                                        style="width: 30%">
                                                </div>
                                                <div class="form-group">
                                                    <label for="">경매자 아이디</label>
                                                    <input type="text" class="form-control" id="memberId"
                                                        value="${vo.memberId }" name="" style="width: 40%" readonly>
                                                </div>
                                                <div class="form-group">
                                                    상품명&nbsp;<input type="text" class="form-control" id="auctionName"
                                                        name="auctionName" style="width: 60%;" value="${vo.auctionName}"
                                                        readonly>
                                                </div>
                                                <div class="form-group">
                                                    브랜드명&nbsp;<input type="text" class="form-control" id="auctionBrand"
                                                        name="auctionBrand" style="width: 40%;"
                                                        value="${vo.auctionBrand}" readonly>
                                                </div>
                                                <div class="form-group form-inline">
                                                    현재 최고액 입찰가&nbsp;<input type="text" class="form-control"
                                                        id="auctionBestPrice" name="auctionBestPrice"
                                                        style="width: 60px; text-align: center;"
                                                        value="${vo.auctionBestPrice}" readonly>&nbsp;Milli
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    즉시낙찰가&nbsp;<input type="text" class="form-control"
                                                        id="auctionImmediateBid" name="auctionImmediateBid"
                                                        style="width: 60px; text-align: center;"
                                                        value="${vo.auctionImmediateBid}" readonly>&nbsp;Milli<br />
                                                </div>
                                                <div class="form-group">
                                                	<c:if test="${not empty vo.auctionRecentName}">
                                                    	<label for="">현재 최고 입찰액 아이디</label>
                                                    	<input type="text" class="form-control" id="auctionRecentName"
                                                        	value="${vo.auctionRecentName }" name=""
                                                        	style="width: 30%; background-color: #fde8e8; border-color:  #fde8e8;" readonly>
                                                     </c:if>
                                                     <c:if test="${empty vo.auctionRecentName}">
                                                     	<label for="">현재 최고 입찰액 아이디</label>
                                                    	<input type="text" class="form-control" id="auctionRecentName"
                                                        	value="" name=""
                                                        	style="width: 30%; background-color: #fde8e8; border-color:  #fde8e8;" readonly>
                                                     </c:if>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Title</label>
                                                    <input type="text" class="form-control" id="auctionTitle"
                                                        value="${vo.auctionTitle}" name="auctionTitle"
                                                        style="width: 60%" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">상세내용</label>
                                                    <textarea type="text" class="form-control info" id="auctionContent"
                                                        value="" name="auctionContent"
                                                        readonly>${vo.auctionContent}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '2'}">
                            <td><input type="text" class="form-control condition" data-toggle="modal" data-target="#biddingSoonModal${vo.auctionId}"
                                    style="width: 90px; background-color: #b5d7fd; border-color: #b5d7fd; text-align: center;"
                                    value="오픈예정" readonly>
                                <div class="modal fade" id="biddingSoonModal${vo.auctionId}">
                                    <div class="modal-dialog modal-dialog-centered modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Bidding Info</h4>
                                                <button type="button" class="close"
                                                    data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="">이미지</label>
                                                    <img onerror="this.src='/etoile/images/노이미지1.png';" src="/etoile/images/${vo.auctionImage}" class="img-fluid"
                                                        style="width: 30%">
                                                </div>
                                                <div class="form-group">
                                                    <label for="">경매자 아이디</label>
                                                    <input type="text" class="form-control" id="memberId"
                                                        value="${vo.memberId }" name="" style="width: 40%" readonly>
                                                </div>
                                                <div class="form-group">
                                                    상품명&nbsp;<input type="text" class="form-control" id="auctionName"
                                                        name="auctionName" style="width: 60%;" value="${vo.auctionName}"
                                                        readonly>
                                                </div>
                                                <div class="form-group">
                                                    브랜드명&nbsp;<input type="text" class="form-control" id="auctionBrand"
                                                        name="auctionBrand" style="width: 40%;"
                                                        value="${vo.auctionBrand}" readonly>
                                                </div>
                                                <div class="form-group form-inline">
                                                    최저입찰가&nbsp;<input type="text" class="form-control"
                                                        id="auctionBestPrice" name="auctionBestPrice"
                                                        style="width: 60px; text-align: center;"
                                                        value="${vo.auctionBestPrice}" readonly>&nbsp;Milli
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    즉시낙찰가&nbsp;<input type="text" class="form-control"
                                                        id="auctionImmediateBid" name="auctionImmediateBid"
                                                        style="width: 60px; text-align: center;"
                                                        value="${vo.auctionImmediateBid}" readonly>&nbsp;Milli<br />
                                                </div>
                                                <div class="form-group">
                                                    <label for="">경매오픈 일자</label>
                                                    <input type="text" class="form-control" id="auctionStart"
                                                        value="${vo.auctionStart }" name=""
                                                        style="width: 25%; background-color: #e2effa; border-color: #e2effa;" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">Title</label>
                                                    <input type="text" class="form-control" id="auctionTitle"
                                                        value="${vo.auctionTitle}" name="auctionTitle"
                                                        style="width: 60%" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">상세내용</label>
                                                    <textarea type="text" class="form-control info" id="auctionContent"
                                                        value="" name="auctionContent"
                                                        readonly>${vo.auctionContent}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${vo.auctionCondition eq '3'}">
                            <td>
                                <input type="text" class="form-control condition" data-toggle="modal" data-target="#biddingEndedModal${vo.auctionId}"
                                    style="width: 90px; background-color: #c5c4cf; border-color: #c5c4cf; text-align: center;"
                                    value="경매마감" readonly>
                                    <div class="modal fade" id="biddingEndedModal${vo.auctionId}">
                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Bidding Ended Info</h4>
                                                    <button type="button" class="close"
                                                        data-dismiss="modal">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="">이미지</label>
                                                        <img onerror="this.src='/etoile/images/노이미지1.png';" src="/etoile/images/${vo.auctionImage}" class="img-fluid"
                                                            style="width: 30%">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="">경매자 아이디</label>
                                                        <input type="text" class="form-control" id="memberId"
                                                            value="${vo.memberId }" name="" style="width: 40%" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        상품명&nbsp;<input type="text" class="form-control" id="auctionName"
                                                            name="auctionName" style="width: 60%;" value="${vo.auctionName}"
                                                            readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        브랜드명&nbsp;<input type="text" class="form-control" id="auctionBrand"
                                                            name="auctionBrand" style="width: 40%;"
                                                            value="${vo.auctionBrand}" readonly>
                                                    </div>
                                                    <div class="form-group form-inline">
                                                        낙찰자 아이디&nbsp;<input type="text" class="form-control"
                                                            id="auctionMemberId" name="auctionMemberId"
                                                            style="width: 60px; text-align: center;"
                                                            value="${vo.auctionMemberId}" readonly>&nbsp;Milli
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        낙찰가&nbsp;<input type="text" class="form-control"
                                                            id="auctionBestPrice" name="auctionBestPrice"
                                                            style="width: 60px; text-align: center;"
                                                            value="${vo.auctionBestPrice}" readonly>&nbsp;Milli<br />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="">경매마감일자</label>
                                                        <input type="text" class="form-control" id="auctionEnd"
                                                            value="${vo.auctionEnd }" name=""
                                                            style="width: 25%; background-color: #d4cedb; border-color: #d4cedb;" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="">Title</label>
                                                        <input type="text" class="form-control" id="auctionTitle"
                                                            value="${vo.auctionTitle}" name="auctionTitle"
                                                            style="width: 60%" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="">상세내용</label>
                                                        <textarea type="text" class="form-control info" id="auctionContent"
                                                            value="" name="auctionContent"
                                                            readonly>${vo.auctionContent}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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