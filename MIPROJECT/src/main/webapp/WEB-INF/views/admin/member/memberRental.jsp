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
	<div class="container-fluid">
		<div class="row mt-3">
			<table class="table">
				<thead>
					<tr>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">아이디</th>
						<td scope="col">${info.memberId }</td>
					</tr>
					<tr>
						<th scope="row">이름</th>
						<td scope="col">${info.name }</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td scope="col">${info.phone }</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td scope="col">${info.email }</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td scope="col">${info.address }</td>
					</tr>
					<tr>
						<th scope="row">등급</th>
						<td scope="col">${info.grade }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row">
			<c:if test="${info.grade ne 'BUSINESS' }">
				<button type="button" class="btn btn-light btn-lg btn-block"
					onclick="location.href='/etoile/admin/memberList.a'">목록보기</button>
			</c:if>
			<c:if test="${info.grade eq 'BUSINESS' }">
				<button type="button" class="btn btn-light btn-lg btn-block"
					onclick="location.href='/etoile/admin/businessList.a'">목록보기</button>
			</c:if>
		</div>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>대여제품</th>
						<th>대여기간</th>
						<th>대여금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="record" items="${list }">
						<tr>
							<td>${record.productName}</td>
							<td>${record.rentalStart} ~ ${record.rentalEnd}</td>
							<td>${record.rentalPay}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>