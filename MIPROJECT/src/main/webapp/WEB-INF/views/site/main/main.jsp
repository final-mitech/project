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

<style>
.form-control {
	font-size: 10px;
}

.search {
	width: 200px;
	height: 30px;
}

.sort {
	width: 200px;
	float: left;
}

.serach {
	display: inline-block;
	float: right;
}

.h6.mb-0.mr-3 {
	padding: 1em;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 대여 목록 -->
		<div class="row">
			<c:forEach var="list" items="${rentalList }">
				<div class="col-lg-3 mb-1" style="height: 450px">
					<div class="card" id="product-card" style="position: relative;"
						onclick="location.href='/etoile/site/productDetail?productId=${list.productId }'">
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
		<!-- 펀딩 목록 -->
		<div class="row">
			<c:forEach items="${fundingList }" var="f" begin="0" end="3">

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card clickSelect" style="width: 300px"
						data-id="${f.fundingId }">
						<img class="card-img-top" src="/etoile/images/${f.fundingImage }"
							alt="Card image" style="width: 290px" height="200px">
						<div class="card-body">
							<h4 class="card-title" align="left" style="display: inline">
								<b>${f.fundingTitle }</b>
							</h4>
							<!-- 라벨 색 -->
							<c:choose>
								<c:when test="${f.fundingCondition eq '펀딩오픈예정'}">
									<span class="badge badge-pill badge-secondary"
										style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
								</c:when>
								<c:when test="${f.fundingCondition eq '펀딩중'}">
									<span class="badge badge-pill badge-danger"
										style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
								</c:when>
								<c:when test="${f.fundingCondition eq '펀딩마감'}">
									<span class="badge badge-pill badge-success"
										style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
								</c:when>
							</c:choose>
							<!-- 라벨 색 종료 -->
							<p style="margin-bottom: 0;">
							<h6 align="right" style="margin-right: 10px;">
								<b>${f.fundingDday }</b>
							</h6>
							</p>
							<p class="card-text">${f.fundingContent }</p>

							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<!--  <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div> -->
									<div class="row no-gutters align-items-center">
										<div class="col-auto">
											<!--       <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div> -->
											<div class="h6 mb-0 mr-3">
												<b><fmt:formatNumber var="percent"
														value="${f.fundingTotalprice / f.fundingGoal * 100}"
														pattern="##" />${percent }%</b>
											</div>
										</div>

										<!-- 상태바 -->
										<fmt:parseNumber value="${percent}" var="parsePer" />

										<div class="col">
											<c:choose>
												<c:when test="${parsePer ge 100}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-danger"
															role="progressbar" style="width: 100%"
															aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 75}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-warning"
															role="progressbar" style="width: 75%" aria-valuenow="75"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 50}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-info"
															role="progressbar" style="width: 50%" aria-valuenow="50"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 25}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-success"
															role="progressbar" style="width: 25%" aria-valuenow="25"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 10}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped"
															role="progressbar" style="width: 10%" aria-valuenow="10"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 0}">
													<div class="progress">
														<div class="progress-bar progress-bar" role="progressbar"
															style="width: 0%" aria-valuenow="0" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</c:when>
											</c:choose>
										</div>
										<!-- 상태바 종료 -->
									</div>
								</div>
							</div>

							<div class="col-auto">
								<h6 align="center">
									<b>${f.fundingTotalprice }/${f.fundingGoal }</b>
								</h6>
							</div>

						</div>
					</div>
				</div>

			</c:forEach>
		</div>
		<!-- 경매 목록 -->
		<div class="row">
			<c:forEach var="vo" items="${auctionList }">
				<div class="col-3 mb-3">
					<div class="card-deck">
						<div class="card">
							<button type="button" class="btn btnTitle" readonly>
								경매번호 ${vo.auctionId}
								<c:if test="${vo.auctionCondition eq '2' }">
									<span class="badge badge-pill badge-light"
										style="background-color: #C4BCCC; color: rgb(78, 68, 68);">오픈예정</span>
								</c:if>
								<c:if test="${vo.auctionCondition eq '1' }">
									<span class="badge badge-pill badge-light"
										style="background-color: #f8f8d2; color: rgb(78, 68, 68);">경매중</span>
								</c:if>
								<c:if
									test="${vo.auctionCondition eq '3' || vo.auctionCondition eq '8'}">
									<span class="badge badge-pill badge-light"
										style="background-color: #C8CAC4; color: rgb(78, 68, 68);">경매마감</span>
								</c:if>
							</button>
							<div class="card-body">
								<a href="/etoile/site/auctionOne?id=${vo.auctionId}"><img
									class="card-img-top" src="/etoile/images/${vo.auctionImage}"
									alt="Card image" width="100%" height="230px"></a>
							</div>
							<div class="card-text">
								<p
									style="font-size: medium; font-weight: bold; text-align: center;">${vo.auctionName}
								</p>
								<p style="font-size: small; text-align: center;">참여 수
									&nbsp;${vo.auctionJoinCount}</p>
								<p style="padding-left: 20px;">경매시작가: ${vo.auctionBestPrice}
								</p>
								<p style="padding-left: 20px;">즉시입찰가:
									${vo.auctionImmediateBid}</p>
								<p style="padding-left: 20px;">경매기간: ${vo.auctionStart} ~
									${vo.auctionEnd}</p>
							</div>
							<c:if test="${vo.auctionCondition eq '1' }">
								<div class="card-footer">
									<a href="/etoile/site/auctionOne?id=${vo.auctionId}"
										class="btn btnJoin btn-block btn-sm">입찰하러가기</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
	<!-- clickSelect : 펀딩 상세보기 -->
	<script>
		$('.clickSelect').on('click', clickSelectFunc);

		function clickSelectFunc() {
			console.log($(this));
			let id = $(this).data('id');

			location.href = '/etoile/site/fundingSelect?fundingId=' + id;
		}
	</script>
</html>