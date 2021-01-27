<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<button type="button" class="btn btn-light"
				onclick="location.href='/etoile/site/memberInfo'">My Detail
				Info</button>
			<button type="button" class="btn btn-light"
				onclick="location.href='/etoile/site/couponInfo'">My Coupon</button>
		</div>
		<!-- 등급별 혜택 -->
		<div class="row mt-3">
			<div class="card" style="width: 50rem;">
				<div class="card-body">
					<h5 class="card-title">등급별 혜택</h5>
					<p class="card-text">고객님의 등급은 ${info.grade }입니다.</p>
				</div>
				<ul class="list-group list-group-flush">
					<c:forEach var="benefit" items="${coupon }">
						<c:if test="${benefit.gradeCoupon ne null and benefit.gradeCoupon ne '' }">
							<li class="list-group-item">대여료 할인 : ${benefit.gradeCoupon }%
								<c:if test="${benefit.couponUsed eq 0 }">미사용</c:if> <c:if
									test="${benefit.couponUsed eq 1 }">사용완료</c:if>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 등급별 혜택 -->
		<div class="row mt-3">
			<div class="card" style="width: 50rem;">
				<div class="card-body">
					<h5 class="card-title">펀딩 쿠폰</h5>
					<p class="card-text">펀딩 참여 시 구입한 내역입니다.</p>
				</div>
				<ul class="list-group list-group-flush">
					<c:if test="${benefit.fundingCoupon ne null and benefit.fundingCoupon ne '' }">
						<c:forEach var="benefit" items="${coupon }">
							<li class="list-group-item">대여료 할인 : ${benefit.fundingCoupon }%
								<c:if test="${benefit.couponUsed eq 0 }">미사용</c:if> <c:if
									test="${benefit.couponUsed eq 1 }">사용완료</c:if>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>