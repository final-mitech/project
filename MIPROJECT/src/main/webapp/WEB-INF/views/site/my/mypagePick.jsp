<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card-img {
	display: block;
	margin: 0px auto;
	float: center;
}
.card-body p{
	text-decoration: none;
	color: #000000;
	font-weight: bold;
}

.card-body-footer a {
	text-decoration: none;
	color: #00b3b3;
	font-weight: bold;
}

.card-body-footer a:hover {
	text-decoration: none;
	color: #008080;
	font-weight: bold;
}

.btn {
	border: 0px;
	outline: 0;
}

.pickbtn {
	background-color: white;
	border:0;
	outline:0;
	width: 50px;
}
</style>
</head>
<body>
	<br>
	<div class="container" style="max-width: 1400px;">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/etoile/site/MypageRental.do">MyRental</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/etoile/site/pickList.do" style="background: #e5e5e5;">MyPick</a>
				</li>
			</ul>
		</div>
		<div class="row" style="background: #e5e5e5;"><br></div>
		<div class="row" style="background: #e5e5e5;">
			<br>
			<c:forEach var="list" items="${list }">
				<div class="container">
					<div class="row no-gutters">
						<div class="col-4 mb-3" style="background: #ffffff; overflow: hidden; height: 200px">
							<img src="${list.productImage }" class="card-img"
								style="height: 140%; width: 85%; overflow: hidden;">
						</div>
						<div class="col-8 mb-3" style="background: #ffffff; height: 200px">
							<div class="card-body">
								<p style="font-size:20px">${list.productName }</p>
								<p><fmt:formatNumber type="currency" maxFractionDigits="3" value="${list.productRental }" /></p>
							</div>
							<div class="card-body-footer" style="float: right; margin-right: 20px; heigh:100px">
							<br />
								<a href="/etoile/site/productDetail?productId=${list.productId }">대여하러가기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>