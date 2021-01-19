<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-7">
				<img src="#">
			</div>
			<div class="col-5">
				<div>
					<h1>${#.productName }</h1>
					<h3>${#.productBrand }</h3>
					<br />
					<h3>${#.productContent }</h3>
				</div>
				<div>
					<p style="font-size:15px;">${#.productPay }</p>
					<a><input type="date" ></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>