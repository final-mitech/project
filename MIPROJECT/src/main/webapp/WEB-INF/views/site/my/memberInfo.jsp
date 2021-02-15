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
	<div class="container" style="max-width: 1400px;">
		<div class="row">
		<button type="button" class="btn btn-secondary" onclick="location.href='/etoile/site/memberInfo.do'">My Detail Info</button>
		<button type="button" class="btn btn-light" onclick="location.href='/etoile/site/couponInfo.do'">My Coupon</button>
		</div>
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
	</div>
</body>
</html>