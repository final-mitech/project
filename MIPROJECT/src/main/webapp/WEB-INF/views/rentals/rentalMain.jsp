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
	href="netdna.bootstrapcdn.com/font-awesome.min.css">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div>
			<a href="#">최신순</a> <a href="#">인기순</a>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<c:forEach var="#" items="#">
				<div class="col-lg-4">
					<div class="card">
						<a href="#"> <img src="${#.productImage }" class="card-img-top">
						</a>
						<div class="card-body">
							<h5 class="card-title" onclick="location.href='#'">${#.productName }</h5>
							<p class="card-text" onclick="location.href='#'">${#.rentalPay }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div>
			<input type="text" id="search" name="search"><i class="fa-search fa-lg"></i>
			<nav aria-label="...">
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
					<li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>