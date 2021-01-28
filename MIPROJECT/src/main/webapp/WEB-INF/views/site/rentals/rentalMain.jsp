<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/font-awesome.min.css">
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
button {
	border: none;
	background-color: white;
	text-decoration: none;
}
</style>
<script>
	function sSubmit() {
		document.getElementById("frm").submit();
	}
	function goList(page) {
		location.href = 'productList.do?page=' + page;
	}
</script>
</head>
<body>
	<div class="container">
		<div id="sort">
			<a href="#">최신순</a> <a href="#">인기순</a>
		</div>
		<div style="float: right;">
			<form id="frm" action="productSearch.do">
				<label> <input type="text" name="productName"
					placeholder="검색할 상품명 입력" size="25px">
				</label> <a class="link-secondary" onclick="sSubmit();" aria-label="Serch">
					<i class="fa fa-search" id="S" aria-hidden="true"></i>
				</a>
			</form>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<c:forEach var="list" items="${list }">
				<div class="col-lg-3 mb-1" style="height: 450px">
					<div class="card" id="product-card" style="position: relative;"
						onclick="location.href='productDetail.do?productId=${list.productId }'">
						<div class="card-header"
							style="height: 280px; border: 0px; background-color: white; overflow: hidden;">
							<img src="${list.productImage }" class="card-img-top"
								style="height: 120%; width: 100%; overflow: hidden;">
						</div>
						<div class="card-body">
							<h5 class="card-title" style="font-size: 16px; height: 20px;">
								<strong>${list.productName }</strong>
							</h5>
						</div>
						<div class="card-footer"
							style="border: 0px; background-color: white;">
							<p class="card-text" style="float: left;">${list.productRental }</p>
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