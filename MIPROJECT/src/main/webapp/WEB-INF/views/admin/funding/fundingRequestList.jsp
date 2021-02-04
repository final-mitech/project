<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>funding/fundingRequestList.jsp</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
</style>

</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active" data-toggle="tab"
					onclick="location.href='/etoile/admin/fundingRequestList.a'">펀딩
						요청 리스트</a></li>
				<li class="nav-item"><a class="nav-link "
					data-toggle="tab"
					onclick="location.href='/etoile/admin/fundingRegisterList.a'">펀딩
						등록 리스트</a></li>
			</ul>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">NO.</th>
						<th scope="col">회원ID</th>
<!-- 						<th scope="col">펀딩명</th> -->
						<th scope="col">상품명</th>
						<th scope="col">브랜드</th>
						<th scope="col">모델번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">요청사항</th>
						<th scope="col">펀딩상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="f" items="${fundings }">
						<tr class="clickSelect" data-id="${f.fundingId }">
							<th scope="row">${f.fundingId }</th>
							<td>${f.memberId }</td>
<%-- 							<td>${f.fundingTitle }</td> --%>
							<td>${f.fundingName }</td>
							<td>${f.fundingBrand }</td>
							<td>${f.fundingSerial }</td>
							<td>${f.fundingCategory }</td>
							<td>${f.fundingContent }</td>
							<td class="eventDel">
								 <select id="conditionChange${f.fundingId }"
								class="form-control" onchange="conditionChange(${f.fundingId })">
									<option
										<c:if test="${f.fundingCondition eq '접수완료'}"> selected </c:if>>
										접수완료</option>
									<option
										<c:if test="${f.fundingCondition eq '검수중'}"> selected </c:if>>
										검수중</option>
									<option
										<c:if test="${f.fundingCondition eq '검수완료'}"> selected </c:if>>
										검수완료</option>
							</select>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row">
			<div class="div delete" align="right">
				<button type="button" class="btn btn-dark"
					onclick="location.href='fundingDelete.a' ">펀딩 요청 삭제</button>
			</div>
		</div>

	</div>

	<!-- clickSelect : 펀딩 상세보기 -->
	<script>
		$('.clickSelect').on('click', clickSelectFunc);

		function clickSelectFunc() {
			console.log($(this).data('id'));
			let id = $(this).data('id');

			location.href = 'fundingRequestUpdateForm.a?fundingId=' + id;
		}

		$('.eventDel').on('click', function(e) {
			e.stopPropagation();
		})
		
		function conditionChange(id) {
			let fundingId = id;
			let fundingCondition = $('#conditionChange'+id).val();
			
			$.ajax({
				url: 'conditionUpdate.a',
				type: 'post',
				data: {
					fundingId: fundingId,
					fundingCondition: fundingCondition
				},
				success: function(data) {
					if(data=="SUCCESS") {
						alert(fundingCondition+"으로 상태가 변경되었습니다.");
					}
					else {
					location.href="/etoile/admin/funding/fundingUpdateFail"; 
					}
				},
				error: function(data) {
					location.href="/etoile/admin/funding/fundingUpdateFail"; 
				}
				
			}); 
		}
	
	</script>
</body>

</html>