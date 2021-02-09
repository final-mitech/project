<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
/* 최신.인기순정렬버튼 */
#sort a {
	text-decoration: none;
	color: #999999;
}

#sort a:hover {
	text-decoration: none;
	color: #999999;
}

#sort a:active {
	text-decoration: none;
	color: #666666;
}
/* 검색어입력칸 */
#frm input {
	float: left;
	BORDER-BOTTOM: 1px solid;
	BORDER-LEFT: medium none;
	BORDER-RIGHT: medium none;
	BORDER-TOP: medium none;
}
/* 돋보기버튼 */
#S {
	border: none;
	color: gray;
	background-color: white;
	text-decoration: none;
}
.card-body> h5 {
	font-size: 16px; 
	height: 20px;
}
.card-footer {
	border: 0px;
	background-color: white;
}
</style>
<script>
	function sSubmit() {
		document.getElementById("frm").submit();
	}
	function goList(page) {
		location.href = 'productList?page=' + page;
	}
</script>
</head>
<body>
	<div class="container" style="max-width: 1400px;">
		<div id="sort">
			<a href="productList">최신순</a> <a href="productList2">인기순</a>
		</div>
		<div style="float: right;">
			<form id="frm" action="productSearch">
				<label>
					<input type="text" name="productName" placeholder="검색할 상품명 입력" size="25px">
				</label>
				<a class="link-secondary" onclick="sSubmit();" aria-label="Serch">
					<i class="fa fa-search" id="S" aria-hidden="true"></i>
				</a>
			</form>
		</div>
	</div>
	<br>
	<br>
	<div class="container" style="max-width: 1400px;">
		<div class="row">
			<c:forEach var="list" items="${list }">
				<div class="col-3" style="height: 450px;">
					<div class="card" id="product-card" style="position: relative;" onclick="location.href='productDetail?productId=${list.productId }'">
						<div class="card-header" style="height: 280px; border: 0px; background-color: white; overflow: hidden;">
							<img src="${list.productImage }" class="card-img-top" style="height: 150%; width: 100%; overflow: hidden; padding-bottom:100px;">
						</div>
						<div class="card-body">
							<h5 class="card-title">
								<strong>${list.productName }</strong>
							</h5>
						</div>
						<div class="card-footer">
							<p class="card-text" style="float: left;">
							<fmt:formatNumber type="currency" maxFractionDigits="3" value="${list.productRental }" />
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div>
			<div style="float: center;">
				<tag:historyPaging jsFunc="goList" />
			</div>
			<br>
		</div>
	</div>
</body>
</html>