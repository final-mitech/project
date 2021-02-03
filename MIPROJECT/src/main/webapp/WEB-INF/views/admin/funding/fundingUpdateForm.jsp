<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>funding/fundingUpdateForm.jsp</title>

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

/* .product-name {
	font-size: 22px;
	font-weight: 500;
	line-height: 22px;
	margin-bottom: 4px;
} */
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

	<div class="pd-wrap">
		<div class="container">
			<div class="heading-section">
				<h2>펀딩 상품 수정 페이지</h2>
			</div>
			<form class="form-horizontal" role="form" id="frm" name="frm"
				action="fundingUpdate.a" method="post" onsubmit="submitCheck();">
				<input type="hidden" name="fundingId" value="${selectVo.fundingId}">
				<div class="row">
					<div class="col-md-6">
						<div id="slider" class="owl-carousel product-slider">
							<div class="item">
								<img src="../images/${selectVo.fundingImage}" />
							</div>
						</div>
						<div id="thumb" class="owl-carousel product-thumb">
							<div class="item">
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
							</div>
							<div class="item">
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
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="product-dtl">
							<div class="product-info">
								<div class="product-id" align="center">
									<span>NO. </span> <span> ${selectVo.fundingId} </span>
								</div>
								<div class="product-title">
									<span>펀딩명 : </span> <input class="form-control"
										name="fundingTitle"
										value='<c:out value="${selectVo.fundingTitle}" />'>
								</div>
								<div class="product-name">
									<span>상품명 : </span> <input class="form-control"
										name="fundingName"
										value='<c:out value="${selectVo.fundingName}" />'>
								</div>
								<div class="row">
									<div class="product-brand col-md-6">
										<span>브랜드 : </span>
										 	<select name="fundingBrand"
											id="fundingBrand" class="form-control">
											<c:forEach items="${branList }" var="b">
												<option>${b.codeDetail}</option>
											</c:forEach>
										</select>										
									</div>
									<div class="product-serial col-md-6">
										<span>모델번호 : </span> <input class="form-control"
											name="fundingSerial"
											value='<c:out value="${selectVo.fundingSerial}" />'>
									</div>
								</div>
								<!-- <div class="product-price-discount">
								<span>$39.00</span><span class="line-through">$29.00</span>
							</div> -->
								<div class="product-category">
									<span>카테고리 : </span>
									<select name="fundingCategory"
										id="fundingCategory" class="form-control">
										<c:forEach items="${cateList }" var="c">
											<option>${c.codeDetail}</option>
										</c:forEach>
									</select>
									
								</div>
								<div class="product-goal">
									<span>목표금액 : </span> <input class="form-control"
										name="fundingGoal"
										value='<c:out value="${selectVo.fundingGoal}" />'>
								</div>
								<div class="row">
									<div class="product-start col-md-6">
										<span>펀딩시작날짜 : </span> <input type="date" class="form-control"
											name="fundingStart"
											value='<c:out value="${selectVo.fundingStart}" />'>
									</div>
									<div class="product-end col-md-6">
										<span>펀딩마감날짜 : </span> <input type="date" class="form-control"
											name="fundingEnd"
											value='<c:out value="${selectVo.fundingEnd}" />'>
									</div>
								</div>
								<div class="row">
									<div class="product-condition col-md-6">
										<span>펀딩상태 : </span> <input class="form-control"
											name="fundingCondition"
											value='<c:out value="${selectVo.fundingCondition}" />'
											readonly="readonly">
									</div>
									<div class="product-totalprice col-md-6">
										<span>현재모금액 : </span> <input class="form-control"
											name="fundingTotalprice"
											value='<c:out value="${selectVo.fundingTotalprice}" />'
											readonly="readonly">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="product-gift col-md-12">
									<span> 펀딩 기프트 선택 </span>
									<c:forTokens items="${selectVo.fundingGift}" delims=","
										var="token1">
										<input id="fundingGift" name="fundingGift"
											class="form-control" value="${token1}">
									</c:forTokens>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-12">
									<button type="submit" value="등록" class="btn btn-primary ">펀딩
										수정하기</button>
									<button type="reset" value="취소" class="btn btn-primary ">취소</button>
									<button type="button" value="목록" class="btn btn-primary "
										onclick="location.href='fundingRegisterList.a' ">목록보기</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!--  -->
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
							role="tabpanel" aria-labelledby="description-tab">
							<textarea class="form-control" rows="5" name="fundingContent"
								id="fundingContent">${selectVo.fundingContent}</textarea>
						</div>

						<div class="tab-pane fade" id="review" role="tabpanel"
							aria-labelledby="review-tab">
			</form>
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
	<script>
		function selectGift() {
			var a = frm.fundingGift.value;
			//console.log(a.split(':')[1]);
			var b = a.split(':')[1];

		}
		selectGift();
		
		function submitCheck() {
			    alert("수정 완료");
		}
		
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