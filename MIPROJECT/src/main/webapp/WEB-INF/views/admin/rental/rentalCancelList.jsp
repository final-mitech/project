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
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>

<script src="<c:url value="/resources/js/productHistory.js" />"></script>
<script>
	function cancelPay(tag) {
		
		console.log(tag);
		document.forms[tag.name].submit();
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

button {
	outline: none;
	background-color: #e5e5e5;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/etoile/admin/rentalList.a" style="background: #e5e5e5;">대여 요청</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/etoile/admin/rentalcancelList.a">취소 요청</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/etoile/admin/rentalReList.a" style="background: #e5e5e5;">회수 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/etoile/admin/rentalStatistics.a" style="background: #e5e5e5;">대여 통계</a>
			</li>
		</ul>
	</div>
	<br>
	<div class="row">

		<table class="table" align="center" style="text-align:center">
			<thead class="thead-dark">
				<tr>
				<th width="300">주문번호</th>
				<th width="400">상품명</th>
				<th width="80">협찬</th>
				<th width="300">대여기간</th>
				<th width="80">취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list }">
					<form name="form${list.rentalId }" action="updateStatus2">
					<tr>
						<td width="300">
							<input type="text" id="rentalOrder" value="${list.rentalOrder }" readonly>
						</td>
						<td width="400">${list.productName }</td>
						<td width="80">${list.ppl }</td>
						<td width="300">
							<input type="text" value="${list.rentalStart }" size="7" readonly>
						~
							<input type="text" value="${list.rentalEnd }" size="7" readonly>
						</td>
						<td width="80">
							<input type="hidden" name="productId" value="${list.productId }">
							<input type="hidden" name="productStatus" value="${list.productStatus }">
							<button type="button" onclick="cancelPay(this.form)">승인</button>
						</td>
					</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>