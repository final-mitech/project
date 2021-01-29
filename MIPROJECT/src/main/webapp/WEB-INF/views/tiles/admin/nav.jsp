<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
</head>
<body>
	<c:if test="${admin ne null and admin ne '' }">
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="/etoile/admin/memberList.a">고객정보관리</a></li>
			<li class="list-group-item"><a href="/etoile/admin/historyList.a">물품관리</a></li>
			<li class="list-group-item"><a href="/etoile/admin/rentalList.a">대여관리</a></li>
			<li class="list-group-item"><a href="/etoile/admin/auctionReqList.a">경매관리</a></li>
			<li class="list-group-item"><a href="">펀딩관리</a></li>
			<li class="list-group-item"><a href="/etoile/admin/logout.a">로그아웃</a></li>	
	</ul>
	</c:if>
</body>
</html>