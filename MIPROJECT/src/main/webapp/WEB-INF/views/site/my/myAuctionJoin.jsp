<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>경매 참여 내역</title>
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

		.btnTitle {
			background-color: rgb(192, 184, 177);
			color: rgb(78, 68, 68);
			border-style: hidden;
			border-radius: unset;
			border-color: rgb(192, 184, 177);
			font-size: small;
			font-weight: bold;
			height: 30px;
			padding-left: 12%;
		}

		.badge {
			font-size: small;
			width: 10%;
			height: 110%;
			float: right;
			padding-top: 3px;
			margin-right: 10px;
		}

		.card {
			border-width: 1px;
			border-color: rgb(156, 151, 147);
			height: 250px;
		}

		.card-body {
			padding: 0px;
		}

		.imgCard {
			border-radius: 5px;
		}
	</style>
</head>

<body>
	<div class="container" style="max-width: 1400px;">
		<div class="row">
			<div class="col-11">
				<br />
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" onclick="location.href='/etoile/site/myAuctionJoin.do'">경매참여내역</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" onclick="location.href='/etoile/site/myAuctionBid.do'">낙찰받은상품</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" onclick="location.href='/etoile/site/myAuctionReq.do'">대리경매현황</a>
					</li>
				</ul>
				<br />
			</div>
			<div class="col-1"></div>
		</div>

		<div class="row">
			<c:forEach var="vo" items="${list }">
				<div class="col-11 mb-3">
					<div class="card">
						<button type="button" class="btn btnTitle" readonly>
							경매 참여 번호 ${vo.auctionJoinId}
							<c:if test="${vo.auctionCondition eq '2' }">
								<span class="badge badge-pill badge-light"
									style="background-color: #C4BCCC; color: rgb(78, 68, 68);">오픈예정</span>
							</c:if>
							<c:if test="${vo.auctionCondition eq '1' }">
								<span class="badge badge-pill badge-light"
									style="background-color: #f8f8d2; color:rgb(78, 68, 68);">경매중</span>

							</c:if>
							<c:if test="${vo.auctionCondition eq '3' }">
								<span class="badge badge-pill badge-light"
									style="background-color: #C8CAC4; color:rgb(78, 68, 68);">경매마감</span>
							</c:if>
						</button>

						<div class="row">
							<div class="col-4">
								<div class="card-body">
									<a href="auctionOne?id=${vo.auctionId}">
										<img class="imgCard" src="/etoile/images/${vo.auctionImage}" alt="Card image"
											width="100%" height="218px"></a>
								</div>
							</div>
							<div class="col-1"></div>
							<div class="col-6">
								<div class="card-text" style="font-size: small;">
									<p
										style="font-size: medium; font-weight: bold; padding-top: 20px; margin-bottom: 8px;">
										${vo.auctionName}
										<c:if test="${vo.auctionCondition eq '1' }">
											<a href="auctionOne?id=${vo.auctionId}">
												<button type="submit" class="btn" style="background-color: #A4ACC8; color: #FBFBF4;
														float: right;">입찰하러가기</button></a>
										</c:if>
									</p>
									<br />
									<p>내 입찰가: ${vo.auctionPay}</p>
									<p>입찰 일: ${vo.auctionDate}</p>
									<p>현재 경매가: ${vo.auctionBestPrice}&nbsp;&nbsp;&nbsp;즉시 입찰가:
										${vo.auctionImmediateBid}</p>
									<p>경매 기간: ${vo.auctionStart} ~ ${vo.auctionEnd}</p>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</c:forEach>
			<br />
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

	// //nav에 active 걸기
	// $('.nav-link').click(function(){
	// 	$('.active').removeClass('active');
	// 	$(this).addClass('active');
	// })
</script>

</html>