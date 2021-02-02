<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-5">
				<div class="row">
					<label>펀딩 등록 요청</label>
				</div>
				<div class="row">
					<table class="table text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">펀딩번호</th>
								<th scope="col">제품명</th>
								<th scope="col">제품유형</th>
								<th scope="col">펀딩상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="funding" begin="0" end="4" items="${fundingList }">
								<tr onclick="location.href='/etoile/admin/fundingRegisterList.a'">
									<th scope="row">${funding.fundingId }</th>
									<td>${funding.fundingName }</td>
									<td>${funding.fundingCategory  }</td>
									<td>${funding.fundingCondition }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-1"></div>
			<div class="col-5">
				<div class="row">
					<label>경매 등록 요청</label>
				</div>
				<div class="row">
					<table class="table text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">경매번호</th>
								<th scope="col">제품명</th>
								<th scope="col">제품유형</th>
								<th scope="col">경매상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="auction" begin="0" end="4" items="${auctionList }">
								<tr onclick="location.href='/etoile/admin/auctionReqList.a'">
									<th scope="row">${auction.auctionId }</th>
									<td>${auction.auctionName }</td>
									<td>${auction.auctionCategory  }</td>
									<td>${auction.auctionCondition }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-11">
				<div class="row">
					<label>대여 등록 요청</label>
				</div>
				<div class="row">
					<table class="table text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">대여번호</th>
								<th scope="col">아이디</th>
								<th scope="col">제품명</th>
								<th scope="col">제품유형</th>
								<th scope="col">협찬여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rental" begin="0" end="4" items="${rentalList }">
								<tr onclick="location.href='/etoile/admin/rentalList.a'">
									<th scope="row">${rental.rentalId }</th>
									<td>${rental.memberId }</td>
									<td>${rental.productName }</td>
									<td>${rental.productType  }</td>
									<td>${rental.ppl }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
</body>
</html>