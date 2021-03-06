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
<script>
	function changeSort() {
		let selected = $('#sort').val();

		if (selected == 'all') {
			location.href = '/etoile/admin/businessList.a';
		} else {
			location.href = '/etoile/admin/businessList.a?grade=' + selected;
		}

	}

	function goList(page) {
		location.href = '/etoile/admin/businessList.a?page=' + page;
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row mb-2">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/memberList.a"
				style="background: #e5e5e5;">개인회원</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/businessList.a">기업회원</a></li>
		</ul>
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
		<c:if test="${!empty list }">
		<div class="text-right">
			<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/etoile/admin/businessDownload.a'">다운로드</button>
		</div>
		</c:if>
	</div>
</body>
</html>