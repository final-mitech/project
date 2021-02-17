<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>

<script src="<c:url value="/resources/js/productHistory.js" />"></script>
<script>
	function selStatus(tag) {
		var status = $("#" + tag.id).val();
		var rentalId = $("#rentalId").val();
		var productId = $("#" + tag.id).parent().find("#productId").val();
		var form = $("#frm" + rentalId);

		let today = new Date();
		let date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
				+ today.getDate();

		App.setStatus(productId, status, date, form);
		
	}
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

#PName:link {
	color: #000000;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalList.a"
				style="background: #e5e5e5;">대여 요청</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalcancelList.a"
				style="background: #e5e5e5;">취소 요청</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalReList.a">회수 관리</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalStatistics.a"
				style="background: #e5e5e5;">대여 통계</a></li>
		</ul>
	</div>
	<br>
	<div class="row">

		<table class="table" align="center">
			<thead class="thead-dark">
				<tr>
					<th width="400">상품명</th>
					<th width="100">협찬유무</th>
					<th width="300">대여기간</th>
					<th width="100">상품상태</th>
				</tr>
			</thead>
			<tbody>		
				<c:forEach var="list" items="${list }">
					<form id="frm${list.rentalId }" name="frm${list.rentalId }" action="updateWaybill.a">
						<tr>
							<td width="400">
								<a id="PName" data-toggle="modal" href="#myModal${list.rentalId }">${list.productName }</a>
							</td>
							<td width="80" style="text-align: center">${list.ppl }</td>
							<td width="300" style="text-align: center">
								<input type="text" value="${list.rentalStart }" size="7" readonly>
								~
								<input type="text" value="${list.rentalEnd }" size="7" readonly>
							</td>
							<td style="text-align: center">
								<c:if test="${list.productStatus eq 'rental'}">
									<select name="Status" id="Status${list.rentalId }"
										onchange="selStatus(this)">
										<option value="rental" selected>대여중</option>
										<option value="waiting">회수완료</option>
									</select>
								</c:if>
								<c:if test="${list.productStatus eq 'waiting'}">
									<select name="Status" id="Status${list.rentalId }"
										onchange="selStatus(this)">
										<option value="rental">대여중</option>
										<option value="waiting" selected>회수완료</option>
									</select>
								</c:if>
								<input type="hidden" id="rentalId" value="${list.rentalId }">
								<input type="hidden" id="productId" value="${list.productId }">
								<input type="hidden" id="rentalWaybill" value="${list.rentalWaybill }">
								<div class="modal fade" id="myModal${list.rentalId }" tabindex="-1"
						aria-labelledby="dropLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="dropLabel">대여 고객 정보</h5>
									<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<input type="text" id="rentalOrder" name="rentalOrder" value="${list.rentalOrder }" readonly><br>
									<input type="text" id="name" name="name" value="${list.name }" readonly><br>
									<input type="text" id="rentalAddress" name="rentalAddress" value="${list.rentalAddress }" readonly style="text-align: center" size="50"><br>
								</div>
								<div class="modal-footer">
									<input type="hidden" id="rentalId" name="rentalId" value="${list.rentalId }">
									<input type="hidden" id="${list.productId }" name="productId" value="${list.productId }">
									<button type="button" class="btn btn-close btn-dark" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
							</td>
						</tr>
					</form>
				</c:forEach>				
			</tbody>
		</table>
	</div>
	<div>
		<button type="button" id="download" onclick="location.href='/etoile/admin/rentalReExcel.a'">다운로드</button>
	</div>
</body>
</html>