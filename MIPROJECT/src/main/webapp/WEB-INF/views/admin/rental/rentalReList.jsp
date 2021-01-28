<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function() {
		$("#productStatus").on("change",function(){
			var status = document.getElementById("productStatus").value;
			var rentalId = document.getElementById("rentalId").value;
			$.ajax ({
				url: "rentalProductStatus.a",
				type: "post",
				data: {
					ProductStatus: status,
					rentalId: rentalId
				},
				success: function() {
					location.href="/etoile/admin/rentalReList.a";
				}
			})
		})
	})
</script>
<style>
tr {
	height: 50px;
	BORDER-BOTTOM: 1px solid;
	BORDER-LEFT: medium none;
	BORDER-RIGHT: medium none;
	BORDER-TOP: medium none;
}

th {
	text-align: center;
	font-size: 20px;
}

input {
	border: 0;
	text-align: center;
}

input:focus {
	outline: none;
}

.button {
	outline: none;
	border: 1;
	background-color: #e5e5e5;
}
select {
	border: 0;
}

</style>
</head>
<body>
	<div class="container">
		<hr>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalList.a" style="background: #e5e5e5;">대여 요청</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalReList.a">회수 관리</a></li>
		</ul>
	</div>
	<br>
	<div>
		<form id="frm" action="updateWaybill.a">
			<table align="center">
				<tr>
					<th width="400">상품명</th>
					<th width="100">협찬유무</th>
					<th width="300">대여기간</th>
					<th width="100">상품상태</th>
				</tr>
				<c:forEach var="list" items="${list }">
					<tr>
						<td width="400">${list.productName }</td>
						<td width="80" style="text-align: center">${list.ppl }</td>
						<td width="300" style="text-align: center">
							<input type="text" value="${list.rentalStart }" size="7" readonly>
							~
							<input type="text" value="${list.rentalEnd }" size="7" readonly>
						</td>
						<td style="text-align: center">
						<c:if test="${list.productStatus eq 'rental'}">
							<select name="productStatus" id="productStatus">
								<option value="rental" selected>배송중</option>
								<option value="waiting">회수완료</option>
							</select>
						</c:if>
						<c:if test="${list.productStatus eq 'waiting'}">
							<select name="productStatus" id="productStatus">
								<option value="rental">배송중</option>
								<option value="waiting" selected>회수완료</option>
							</select>
						</c:if>
							<input type="hidden" id="status" value="${list.productStatus }">
							<input type="hidden" id="rentalId" value="${list.rentalId }">
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>