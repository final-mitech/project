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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/font-awesome.min.css">
<style type="text/css">
a {
	text-decoration: none;
	color: #999999;
}

a:hover {
	text-decoration: none;
	color: #999999;
}
a:active {
	text-decoration: none;
	color: #666666;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<a href="#">최신순</a> <a href="#">인기순</a>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<c:forEach var="list" items="${list }">
				<div class="col-lg-3">
					<div class="card"
						onclick="location.href='productDetail.do?productId=${list.productId }'">
						<img src="${list.productImage }" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">${list.productName }</h5>
							<p class="card-text">${list.productRental }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div>
			<input type="text" id="search" name="search">
			<i class="fa fa-search" aria-hidden="true"></i>
		</div>
		
	</div>
</body>
</html>