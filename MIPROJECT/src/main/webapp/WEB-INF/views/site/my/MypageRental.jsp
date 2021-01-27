<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.card-body-footer a {
	text-decoration: none;
	color: #00b3b3;
	font-weight: bold;
}

.card-body-footer a:hover {
	text-decoration: none;
	color: #00b3b3;
	font-weight: bold;
}

.btn {
	border: 0px;
	outline: 0;
}
</style>
</head>
<body>
	<br>
	<div class="container">
		<div class="row" style="background: #e5e5e5;">
			<div>
				<button class="btn" onclick="location.href='MypageRental.do'">
					RentalList</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn" onclick="location.href='pickList.do'">My Pick</button>
			</div>
			<br>
			<c:forEach var="list" items="${list }">
				<div class="container">
					<div class="row no-gutters">
						<div class="col-4 mb-3" style="background: #ffffff; overflow: hidden; height: 200px"">
							<img src="${list.productImage }" class="card-img"
								style="height: 120%; width: 85%; overflow: hidden;">
						</div>
						<div class="col-8 mb-3" style="background: #ffffff; height: 200px">
							<div class="card-body">
								<p>${list.productName }</p>
								<p>${list.rentalStart }~${list.rentalEnd }</p>
								<p>${list.rentalPay }</p>
							</div>
							<div class="card-body-footer"
								style="float: right; margin-right: 20px">
								<a href="#">마이스타일링</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>