<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>funding/fundingList.jsp</title>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
</head>


<style>
.pd-wrap {
	padding: 40px 0;
	font-family: 'Poppins', sans-serif;
}

.heading-section {
	text-align: center;
	margin-bottom: 20px;
}

.sub-heading {
	font-family: 'Poppins', sans-serif;
	font-size: 12px;
	display: block;
	font-weight: 600;
	color: #2e9ca1;
	text-transform: uppercase;
	letter-spacing: 2px;
}

.heading-section h2 {
	font-size: 32px;
	font-weight: 500;
	padding-top: 10px;
	padding-bottom: 15px;
	font-family: 'Poppins', sans-serif;
}

.user-img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	position: relative;
	min-width: 80px;
	background-size: 100%;
}

.carousel-testimonial .item {
	padding: 30px 10px;
}

.quote {
	position: absolute;
	top: -23px;
	color: #2e9da1;
	font-size: 27px;
}

.name {
	margin-bottom: 0;
	line-height: 14px;
	font-size: 17px;
	font-weight: 500;
}

.position {
	color: #adadad;
	font-size: 14px;
}

.owl-nav button {
	position: absolute;
	top: 50%;
	transform: translate(0, -50%);
	outline: none;
	height: 25px;
}

.owl-nav button svg {
	width: 25px;
	height: 25px;
}

.owl-nav button.owl-prev {
	left: 25px;
}

.owl-nav button.owl-next {
	right: 25px;
}

.owl-nav button span {
	font-size: 45px;
}

.product-thumb .item img {
	height: 100px;
}

.product-name {
	font-size: 22px;
	font-weight: 500;
	line-height: 22px;
	margin-bottom: 4px;
}

.product-price-discount {
	font-size: 22px;
	font-weight: 400;
	padding: 10px 0;
	clear: both;
}

.product-price-discount span.line-through {
	text-decoration: line-through;
	margin-left: 10px;
	font-size: 14px;
	vertical-align: middle;
	color: #a5a5a5;
}

.display-flex {
	display: flex;
}

.align-center {
	align-items: center;
}

.product-info {
	width: 100%;
}

.reviews-counter {
	font-size: 13px;
}

.reviews-counter span {
	vertical-align: -2px;
}

.rate {
	float: left;
	padding: 0 10px 0 0;
}

.rate:not(:checked)>input {
	position: absolute;
	top: -9999px;
}

.rate:not(:checked)>label {
	float: right;
	width: 15px;
	overflow: hidden;
	white-space: nowrap;
	cursor: pointer;
	font-size: 21px;
	color: #ccc;
	margin-bottom: 0;
	line-height: 21px;
}

.rate:not(:checked)>label:before {
	content: '\2605';
}

.rate>input:checked ~ label {
	color: #ffc700;
}

.rate:not(:checked)>label:hover, .rate:not(:checked)>label:hover ~ label
	{
	color: #deb217;
}

.rate>input:checked+label:hover, .rate>input:checked+label:hover ~ label,
	.rate>input:checked ~ label:hover, .rate>input:checked ~ label:hover ~
	label, .rate>label:hover ~ input:checked ~ label {
	color: #c59b08;
}

.product-dtl p {
	font-size: 14px;
	line-height: 24px;
	color: #7a7a7a;
}

.product-dtl .form-control {
	font-size: 15px;
}

.product-dtl label {
	line-height: 16px;
	font-size: 15px;
}

.form-control:focus {
	outline: none;
	box-shadow: none;
}

.product-count {
	margin-top: 15px;
}

.product-count .qtyminus, .product-count .qtyplus {
	width: 34px;
	height: 34px;
	background: #212529;
	text-align: center;
	font-size: 19px;
	line-height: 36px;
	color: #fff;
	cursor: pointer;
}

.product-count .qtyminus {
	border-radius: 3px 0 0 3px;
}

.product-count .qtyplus {
	border-radius: 0 3px 3px 0;
}

.product-count .qty {
	width: 60px;
	text-align: center;
}

.round-black-btn {
	border-radius: 4px;
	background: #212529;
	color: #fff;
	padding: 7px 45px;
	display: inline-block;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}

.round-black-btn:hover, .round-black-btn:focus {
	background: transparent;
	color: #212529;
	text-decoration: none;
}

.product-info-tabs {
	margin-top: 25px;
}

.product-info-tabs .nav-tabs {
	border-bottom: 2px solid #d8d8d8;
}

.product-info-tabs .nav-tabs .nav-item {
	margin-bottom: 0;
}

.product-info-tabs .nav-tabs .nav-link {
	border: none;
	border-bottom: 2px solid transparent;
	color: #323232;
}

.product-info-tabs .nav-tabs .nav-item .nav-link:hover {
	border: none;
}

.product-info-tabs .nav-tabs .nav-item.show .nav-link,
	.product-info-tabs .nav-tabs .nav-link.active, .product-info-tabs .nav-tabs .nav-link.active:hover
	{
	border: none;
	border-bottom: 2px solid #d8d8d8;
	font-weight: bold;
}

.product-info-tabs .tab-content .tab-pane {
	padding: 30px 20px;
	font-size: 15px;
	line-height: 24px;
	color: #7a7a7a;
}

.review-form .form-group {
	clear: both;
}

.mb-20 {
	margin-bottom: 20px;
}

.review-form .rate {
	float: none;
	display: inline-block;
}

.review-heading {
	font-size: 24px;
	font-weight: 600;
	line-height: 24px;
	margin-bottom: 6px;
	text-transform: uppercase;
	color: #000;
}

.review-form .form-control {
	font-size: 14px;
}

.review-form input.form-control {
	height: 40px;
}

.review-form textarea.form-control {
	resize: none;
}

.review-form .round-black-btn {
	text-transform: uppercase;
	cursor: pointer;
}
</style>


<body>
	<form class="form-horizontal" role="form" id="frm" name="frm"
		action="#" onsubmit="return false">
		<input type="hidden" id="fundingId" name="fundingId" value="${selectVo.fundingId}">
		<input type="hidden" id="blockPrice" name="fundingPrice" value="">
		<div class="pd-wrap">
			<div class="container">
				<div class="heading-section">
					<h2>
						<c:out value="${selectVo.fundingTitle}" />
					</h2>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div id="slider" class="owl-carousel product-slider">
							<div class="item">
								<img src="/etoile/images/${selectVo.fundingImage}" />
							</div>
						</div>
						<div id="thumb" class="owl-carousel product-thumb">
							<div class="item">
								<img src="/etoile/images/${selectVo.fundingImage}" />
							</div>
							<div class="item">
								<img src="/etoile/images/${selectVo.fundingImage}" />
							</div>
							<div class="item">
								<img src="/etoile/images/${selectVo.fundingImage}" />
							</div>
							<div class="item">
								<img src="/etoile/images/${selectVo.fundingImage}" />
							</div>
<%-- 							<div class="item">
								<img src="../images/${selectVo.fundingImage}" />
							</div>
							<div class="item">
								<img src="../images/${selectVo.fundingImage}" />
							</div>
							<div class="item">
								<img src="../images/${selectVo.fundingImage}" />
							</div>
							<div class="item">
								<img src="../images/${selectVo.fundingImage}" />
							</div> --%>
						</div>
					</div>
					<div class="col-md-6">
						<div class="product-dtl">
							<div class="product-info">
								<div class="product-name">
									<c:out value="${selectVo.fundingName}" />
								</div>

								<div class="product-brand">
									<span>브랜드 : </span>
									<c:out value="${selectVo.fundingBrand}" />
								</div>
								<div class="product-serial">
									<span>모델번호 : </span>
									<c:out value="${selectVo.fundingSerial}" />
								</div>
								<!-- <div class="product-price-discount">
								<span>$39.00</span><span class="line-through">$29.00</span>
							</div> -->
								<div class="product-goal">
									<span>목표금액 : </span> ${selectVo.fundingGoal}
								</div>
								<div class="product-totalprice">
									<span>현재모금액 : </span> <span id="fundingTotalprice"> ${selectVo.fundingTotalprice}</span>
								</div>
								<!-- 상태바 -->
								<div class="product-percent">
									<fmt:formatNumber var="percent"
										value="${selectVo.fundingTotalprice / selectVo.fundingGoal * 100}"
										pattern="##" />${percent }%
									<fmt:parseNumber value="${percent}" var="parsePer" />
									<c:choose>
										<c:when test="${parsePer ge 100}">
											<div class="progress">
												<div class="progress-bar progress-bar-striped bg-danger"
													role="progressbar" style="width: 100%" aria-valuenow="100"
													aria-valuemin="0" aria-valuemax="100"></div>
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
									</c:choose>
								</div>
								<!-- 상태바 종료 -->
								<div class="product-end">
									<span>펀딩기간 : </span> <span>${selectVo.fundingStart} ~
										${selectVo.fundingEnd}</span>
									<c:choose>
										<c:when test="${selectVo.fundingCondition eq '펀딩오픈예정'}">
											<span class="badge badge-pill badge-secondary">${selectVo.fundingCondition }</span>
										</c:when>
										<c:when test="${selectVo.fundingCondition eq '펀딩중'}">
											<span class="badge badge-pill badge-danger">${selectVo.fundingCondition }</span>
										</c:when>
										<c:when test="${selectVo.fundingCondition eq '펀딩마감'}">
											<span class="badge badge-pill badge-success">${selectVo.fundingCondition }</span>
										</c:when>
									</c:choose>
									<span class="badge badge-pill badge-dark">${selectVo.fundingDday}</span>
								</div>
								<div class="product-gift">
									<span>펀딩 기프트 선택</span> <select onchange="selectGift()"
										id="fundingGift" name="fundingGift" class="form-control">
										<c:forTokens items="${selectVo.fundingGift}" delims=","
											var="token1">
											<option value="${selectVo.fundingName}]${token1}">${token1}</option>
										</c:forTokens>
									</select>
								</div>
								<div class="product-price">
									<span>총 가격 : </span> <span id="fundingPrice"
										name="fundingPrice"></span>
								</div>
							</div>


							<!-- 						<div class="product-count">
							<label for="size">수량</label>
							<form action="#" class="display-flex">
								<div class="qtyminus">-</div>
								<input type="text" name="quantity" value="1" class="qty">
								<div class="qtyplus">+</div>
							</form>
						</div> -->
							<c:if test="${selectVo.fundingCondition eq '펀딩오픈예정'}">
							<button value="등록" class="round-black-btn" disabled=”disabled”
								id="joinbutton">펀딩 참여는 조금만 기다려 주세요 ^^</button>
								</c:if>
								<c:if test="${selectVo.fundingCondition eq '펀딩마감'}">
							<button value="등록" class="round-black-btn" disabled=”disabled”
								id="joinbutton">펀딩이 종료되었습니다 감사합니다 ^^</button>
								</c:if>
								
								<c:if test="${selectVo.fundingCondition ne '펀딩오픈예정' && selectVo.fundingCondition ne '펀딩마감'}">
								<button value="등록" class="round-black-btn"
								id="joinbutton">펀딩참여하기</button>
									</c:if>
								<!-- submit 지움 -->
						</div>
					</div>
				</div>

				<div class="product-info-tabs">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="description-tab" data-toggle="tab" href="#description"
							role="tab" aria-controls="description" aria-selected="true">상품설명</a>
						</li>
						<li class="nav-item"><a class="nav-link" id="review-tab"
							data-toggle="tab" href="#review" role="tab"
							aria-controls="review" aria-selected="false">문의하기</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="description"
							role="tabpanel" aria-labelledby="description-tab">${selectVo.fundingContent}</div>
						<div class="tab-pane fade" id="review" role="tabpanel"
							aria-labelledby="review-tab">

							<p class="mb-20">문의사항을 남겨주세요.</p>
							<form class="review-form">
								<div class="form-group">
									<div class="review-heading">문의내용</div>
									<textarea class="form-control" rows="3"></textarea>
								</div>
								<!-- <div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" name="" class="form-control"
											placeholder="Name*">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" name="" class="form-control"
											placeholder="Email Id*">
									</div>
								</div>
							</div> -->
								<button class="round-black-btn">문의하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!-- 블록체인 -->
	<script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
	<script src="/etoile/resources/js/abi.js"></script>
	<script src="/etoile/resources/js/index.js"></script>
	
	<script>
		var memberid = '${sessionScope.id}';

	
		function selectGift() {
			var a = frm.fundingGift.value; //상품명]1일권:1원 , db에 들어갈 애
			//console.log(a);
			var b = a.split(':')[1]; //1원
			//console.log(b);
			$('#fundingPrice').html(b);

			frm.fundingPrice.value = parseInt(b.replace(',', '')); //1
			
			/* var a = frm.fundingGift.value; 
			var b = a.split(':')[1];
			var c = b.replace('원','');

			$('#fundingPrice').append($('<tr />').append($('<td />').html(a)));
			frm.fundingPrice.value = parseInt(b.replace(',', '')); */
		}
		selectGift();

		$(document)
				.ready(
						function() {
							var slider = $("#slider");
							var thumb = $("#thumb");
							var slidesPerPage = 4; //globaly define number of elements per page
							var syncedSecondary = true;
							slider.owlCarousel({
								items : 1,
								slideSpeed : 2000,
								nav : false,
								autoplay : false,
								dots : false,
								loop : true,
								responsiveRefreshRate : 200
							}).on('changed.owl.carousel', syncPosition);
							thumb
									.on(
											'initialized.owl.carousel',
											function() {
												thumb.find(".owl-item").eq(0)
														.addClass("current");
											})
									.owlCarousel(
											{
												items : slidesPerPage,
												dots : false,
												nav : true,
												item : 4,
												smartSpeed : 200,
												slideSpeed : 500,
												slideBy : slidesPerPage,
												navText : [
														'<svg width="18px" height="18px" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>',
														'<svg width="25px" height="25px" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>' ],
												responsiveRefreshRate : 100
											}).on('changed.owl.carousel',
											syncPosition2);
							function syncPosition(el) {
								var count = el.item.count - 1;
								var current = Math.round(el.item.index
										- (el.item.count / 2) - .5);
								if (current < 0) {
									current = count;
								}
								if (current > count) {
									current = 0;
								}
								thumb.find(".owl-item").removeClass("current")
										.eq(current).addClass("current");
								var onscreen = thumb.find('.owl-item.active').length - 1;
								var start = thumb.find('.owl-item.active')
										.first().index();
								var end = thumb.find('.owl-item.active').last()
										.index();
								if (current > end) {
									thumb.data('owl.carousel').to(current, 100,
											true);
								}
								if (current < start) {
									thumb.data('owl.carousel').to(
											current - onscreen, 100, true);
								}
							}
							function syncPosition2(el) {
								if (syncedSecondary) {
									var number = el.item.index;
									slider.data('owl.carousel').to(number, 100,
											true);
								}
							}
							thumb.on("click", ".owl-item", function(e) {
								e.preventDefault();
								var number = $(this).index();
								slider.data('owl.carousel').to(number, 300,
										true);
							});

							$(".qtyminus").on("click", function() {
								var now = $(".qty").val();
								if ($.isNumeric(now)) {
									if (parseInt(now) - 1 > 0) {
										now--;
									}
									$(".qty").val(now);
								}
							})
							$(".qtyplus").on("click", function() {
								var now = $(".qty").val();
								if ($.isNumeric(now)) {
									$(".qty").val(parseInt(now) + 1);
								}
							});
						});
	</script>
</body>

</html>