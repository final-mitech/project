<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<!-- 부트스트랩 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

</head>
<body>
	<div class="container" style="max-width: 1400px;">
		<!-- 대여 목록 -->
		<div class="row">
			<div><h3>Rental</h3></div>
			<c:forEach var="list" items="${rentalList }">
				<div class="col-3 mb-3">
					<div class="card-deck">
						<div class="card">
							<div class="card-body" style="overflow: hidden; height:270px">
								<a href="/etoile/site/productDetail?productId=${list.productId }">
								<img class="card-img-top" src="${list.productImage }"
									alt="Card image" style="overflow:hidden; width:100%; height:140%"></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 마이 스타일링 -->
		<div class="row">
			<div><h3>My Styling</h3></div>
			<c:forEach var="list" items="${stylingList }">
				<div class="col-3 mb-3">
					<div class="card-deck">
						<div class="card">
							<div class="card-body">
								<a href="/etoile/site/reviewDetail?styleId=${list.styleId }"><img
									class="card-img-top" src="/etoile/images/${list.styleImage }"
									alt="Card image" width="100%" height="230px"></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 펀딩 목록 -->
		<div class="row">
			<div><h3>Funding</h3></div>
			<c:forEach items="${fundingList }" var="f">
				<div class="col-3 mb-3">
					<div class="card-deck">
						<div class="card">
							<div class="card-body">
								<a href="/etoile/site/fundingSelect?fundingId=${f.fundingId }"><img
									class="card-img-top" src="/etoile/images/${f.fundingImage }"
									alt="Card image" width="100%" height="230px"></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 경매 목록 -->
		<div class="row">
			<div><h3>Auction</h3></div>
			<c:forEach var="vo" items="${auctionList }">
				<div class="col-3 mb-3">
					<div class="card-deck">
						<div class="card">
							<div class="card-body">
								<a href="/etoile/site/auctionOne?id=${vo.auctionId}"><img
									class="card-img-top" src="/etoile/images/${vo.auctionImage}"
									alt="Card image" width="100%" height="230px"></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		
	</div>
</body>
</html>