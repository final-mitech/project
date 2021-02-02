<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', function() {
		myInput.focus()
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

#insertWay {
	border: 0;
	padding: 6px 13px;
}

#inserWay:hover {
	background-color: #cccccc;
}
</style>
</head>
<body>
	<div class="container">
		<hr>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalList.a">대여 요청</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalReList.a"
				style="background: #e5e5e5;">회수 관리</a></li>
		</ul>
	</div>
	<br>
	<div>
		<table align="center">
			<tr>
				<th width="400">상품명</th>
				<th width="100">협찬유무</th>
				<th width="300">대여기간</th>
				<th width="100">배송정보</th>
			</tr>

			<c:forEach var="list" items="${list }">
				<tr>
					<td width="400">${list.productName }</td>
					<td width="80" style="text-align: center">${list.ppl }</td>
					<td width="300" style="text-align: center"><input type="text"
						value="${list.rentalStart }" size="7" readonly> ~ <input
						type="text" value="${list.rentalEnd }" size="7" readonly>
					</td>
					<td style="text-align: center">
						<button id="insertWay" type="button" data-toggle="modal"
							data-target="#myModal${list.rentalId }">등록</button>
					</td>
				</tr>
				<form id="frm" action="updateWaybill.a">
					<div class="modal fade" id="myModal${list.rentalId }" tabindex="-1"
						aria-labelledby="dropLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="dropLabel">송장번호 등록</h5>
									<button type="button" class="btn-close" data-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<input type="hidden" name="rentalId" value="${list.rentalId }">
									<input type="hidden" name="productId"
										value="${list.productId }"> <input type="text"
										id="name" name="name" value="${list.name }" readonly><br>
									<input type="text" id="rentalAddress" name="rentalAddress"
										value="${list.rentalAddress }" readonly
										style="text-align: center" size="50"><br> <input
										type="text" name="rentalWaybill" placeholder="송장번호입력">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</c:forEach>
		</table>
	</div>
</body>
</html>