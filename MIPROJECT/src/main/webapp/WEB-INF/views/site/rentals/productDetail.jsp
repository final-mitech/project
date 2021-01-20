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
	<br>
	<div class="container">
		<div class="row">
			<div class="col-7">
				<img src="${product.productImage }">
			</div>
			<div class="col-5">
				<div>
					<h1>${product.productName }</h1>
					<br />
					<h3>${product.productContent }</h3>
				</div>
				<form id="frm" name="frm">
					<div>
						<p style="font-size: 15px;" align="right">${product.productRental }</p>
						<p align="center">
							<input type="date" id="startRental" name="startRental"> ~
							<input type="date" id="endRental" name="endRental">
						</p>
						<button type="button" style="float: right;"
							onclick="location.href='payPage.do?productId=${product.productId}'">대여하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>