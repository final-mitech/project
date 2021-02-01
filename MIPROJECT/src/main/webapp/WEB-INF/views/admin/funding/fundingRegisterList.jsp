<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>funding/fundingRegisterList.jsp</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
</style>

</head>

<body>
	<div class="container">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="/etoile/admin/fundingRegisterList.a">등록된 펀딩 리스트</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab" href="/etoile/admin/fundingRequestList.a">요청받은 펀딩 리스트</a></li>
			</ul>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">NO.</th>
						<th scope="col">펀딩명</th>
						<th scope="col">상품명</th>
						<th scope="col">브랜드</th>
						<th scope="col">모델번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">목표금액</th>
						<th scope="col">현재모금액</th>
						<th scope="col">이미지</th>
						<th scope="col">펀딩상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="f" items="${fundings }">
						<tr class="clickSelect" data-id="${f.fundingId }">
							<th scope="row">${f.fundingId }</th>
							<td>${f.fundingTitle }</td>
							<td>${f.fundingName }</td>
							<td>${f.fundingBrand }</td>
							<td>${f.fundingSerial }</td>
							<td>${f.fundingCategory }</td>
							<td>${f.fundingGoal }</td>
							<td>${f.fundingTotalprice }</td>
							<td>${f.fundingImage }</td>
							<td>
								<!-- Default dropright button -->
								<div class="btn-group dropright">
									<button type="button" class="btn btn-secondary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">${f.fundingCondition }</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">펀딩 중</a> <a
											class="dropdown-item" href="#">펀딩 마감</a> <a
											class="dropdown-item" href="#">펀딩 대기</a>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row">
			<div class="div delete" align="right">
				<button type="button" class="btn btn-dark"
					onclick="location.href='fundingDelete.a' ">펀딩 삭제</button>
			</div>
		</div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!-- clickSelect : 펀딩 상세보기 -->
	<script>
		$('.clickSelect').on('click', clickSelectFunc);

		function clickSelectFunc() {
			console.log($(this).data('id'));
			let id = $(this).data('id');

			location.href = 'fundingUpdateForm.a?fundingId=' + id;
		}
	</script>
</body>

</html>