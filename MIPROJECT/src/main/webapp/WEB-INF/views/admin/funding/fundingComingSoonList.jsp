<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
.tdColor b {
	background-color: yellow;
}
</style>

</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					onclick="location.href='/etoile/admin/fundingRequestList.a'">펀딩
						요청 리스트</a></li>
				<li class="nav-item"><a class="nav-link " data-toggle="tab"
					onclick="location.href='/etoile/admin/fundingRegisterList.a'">펀딩
						리스트</a></li>
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab"
					onclick="location.href='/etoile/admin/fundingComingSoonList.a'">펀딩
						오픈 예정</a></li>
				<li class="nav-item">
				<li class="nav-item"><a class="nav-link " data-toggle="tab"
					onclick="location.href='/etoile/admin/fundingOpenList.a'">펀딩 중</a></li>
				<li class="nav-item"><a class="nav-link " data-toggle="tab"
					onclick="location.href='/etoile/admin/fundingCloseList.a'">펀딩
						마감</a></li>
			</ul>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">NO.</th>
						<th scope="col" style="word-break: break-all; width: 300px">펀딩명</th>
						<th scope="col" style="word-break: break-all; width: 250px">상품명</th>
						<!-- 						<th scope="col">브랜드</th> -->
						<!-- 						<th scope="col">모델번호</th> -->
						<!-- 						<th scope="col">카테고리</th> -->
						<th scope="col" style="word-break: break-all; width: 30px">목표금액</th>
						<th scope="col" style="word-break: break-all; width: 30px">현재모금액</th>
						<!-- 						<th scope="col">이미지</th> -->
						<th scope="col">시작일</th>
						<th scope="col">마감일</th>
						<th scope="col">펀딩상태</th>
						<th scope="col">환불상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="f" items="${fundings }">
						<tr class="clickSelect" data-id="${f.fundingId }" id="fundingId">
							<th scope="row">${f.fundingId }</th>
							<td>${f.fundingTitle }</td>
							<td>${f.fundingName }</td>
							<%-- 							<td>${f.fundingBrand }</td> --%>
							<%-- 							<td>${f.fundingSerial }</td> --%>
							<%-- 							<td>${f.fundingCategory }</td> --%>
							<td>${f.fundingGoal }</td>
							<td>${f.fundingTotalprice }</td>
							<%-- <td>${f.fundingImage }</td> --%>

							<!-- 날짜 비교해서 시작일 이면 효과주기 -->
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />

							<c:if test="${f.fundingStart ne nowDate}">
								<td><b>${f.fundingStart }</b></td>
							</c:if>
							<c:if test="${f.fundingStart eq nowDate}">
								<td class="tdColor"><b>${f.fundingStart }</b></td>
							</c:if>

							<td>${f.fundingEnd }</td>
							<c:if test="${f.fundingCondition ne '펀딩마감'}">
								<td class="eventDel"><select
									id="conditionChange${f.fundingId }" class="form-control"
									onchange="conditionChange(${f.fundingId }, ${f.fundingGoal})">
										<option
											<c:if test="${f.fundingCondition eq '펀딩오픈예정'}"> selected </c:if>>
											펀딩오픈예정</option>
										<option
											<c:if test="${f.fundingCondition eq '펀딩중'}"> selected </c:if>>
											펀딩중</option>
										<option>펀딩마감</option>
								</select></td>
							</c:if>
							<c:if test="${f.fundingCondition eq '펀딩마감'}">
								<td class="eventDel"><select
									id="conditionChange${f.fundingId }" class="form-control"
									onchange="conditionChange(${f.fundingId })">
										<option>펀딩마감</option>
										<!-- <option>환불하기</option> -->
								</select></td>

							</c:if>
							
							<c:if test="${f.fundingStart eq nowDate }">
								<td class="eventDel">
									<button class="eventDel"
										onclick="App.setting(${f.fundingId },${f.fundingEnd}, ${f.fundingGoal})">펀딩시작</button>
								</td>
							</c:if>
							
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
	<!-- 블록체인 -->
	<script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
	<script src="/etoile/resources/js/fundingAbi.js"></script>
	<script src="/etoile/resources/js/fundingExample.js"></script>

	<!-- clickSelect : 펀딩 상세보기 -->
	<script>
		$('.clickSelect').on('click', clickSelectFunc);

		function clickSelectFunc() {
			console.log($(this).data('id'));
			let id = $(this).data('id');

			location.href = 'fundingUpdateForm.a?fundingId=' + id;
		}
		
		$('.eventDel').on('click',function(e){
			e.stopPropagation();
		})			
		
		function conditionChange(id, goal) {
			let fundingId = id;
			let fundingCondition = $('#conditionChange'+id).val();
			if(fundingCondition == "펀딩중"){
				let fundingGoal = parseInt(goal);
				let date = 7;
				console.log(""+fundingId,date,fundingGoal);
				App.setting(""+fundingId,date,fundingGoal);
			}else if(fundingCondition == "펀딩마감"){
				App.fundingResult(""+fundingId);
			}
			
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