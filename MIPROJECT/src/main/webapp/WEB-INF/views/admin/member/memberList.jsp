<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script>
	function changeSort() {
		let selected = $('#sort').val();

		if (selected == 'all') {
			location.href = '/etoile/admin/memberList.a';
		} else {
			location.href = '/etoile/admin/memberList.a?grade='
					+ selected;
		}

	}

	function goList(page) {
		location.href = '/etoile/admin/memberList.a?page=' + page;
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-9">
				<a href="/etoile/admin/memberList.a">개인회원</a>
				<a>&nbsp;|&nbsp;</a>
				<a href="/etoile/admin/businessList.a">기업회원</a>
			</div>
			<div class="col-3">
				<select id="sort" class="form-control" onchange="changeSort()">
					<option value="all" <c:if test="${sort eq 'all'}"> selected </c:if>>ALL</option>
					<option value="VISIT"
						<c:if test="${sort eq 'VISIT'}"> selected </c:if>>VISIT</option>
					<option value="VIP"
						<c:if test="${sort eq 'VIP'}"> selected </c:if>>VIP</option>
					<option value="VVIP"
						<c:if test="${sort eq 'VVIP'}"> selected </c:if>>VVIP</option>
				</select>
			</div>
		</div>
		<div class="row">
			<table class="table table-striped table-hover text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="col-4">NAME</th>
						<th scope="col-4">ID</th>
						<th scope="col-4">GRADE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${list }">
						<tr
							onclick="location.href='memberSelect.a?memberId=${member.memberId }'">
							<th scope="row">${member.name }</th>
							<td>${member.memberId }</td>
							<td>${member.grade }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>		
		</div>
		<tag:historyPaging jsFunc="goList" />
		<div class="row">
			<div class="text-right">
				<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/etoile/admin/memberDownload.a'">다운로드</button>
			</div>
		</div>
	</div>
</body>
</html>