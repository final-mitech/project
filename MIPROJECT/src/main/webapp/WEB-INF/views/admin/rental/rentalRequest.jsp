<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>

<script src="<c:url value="/resources/js/productHistory.js" />"></script>
<script>
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')
	myModal.addEventListener('shown.bs.modal', function() {
		myInput.focus()
	})
</script>
<script>
	   function updateWaybill(tag) {
	      var today = new Date();
	      var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
	            + today.getDate();

	      let status = "rental";
	      let productId = document.forms[$(tag).attr('name')].elements['productId'].value;
	      App.setStatus(productId, status, date, $(tag).attr('name'));
	      
	   }
	   
		function sSubmit() {
			document.getElementById("frm").submit();
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

#insertWay {
	border: 1 #dddddd;
	background-color: #cccccc;
	padding: 6px 8px;
	border-radius:10px;
}

#inserWay :hover {
	background-color: #dddddd;
}
#download {
	height: 40px;
	float : right;
	background-color: #cccccc;
	font-color: #000000;
}
#download :hover {
	background-color: #dddddd;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalList.a">대여 요청</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalcancelList.a"
				style="background: #e5e5e5;">취소 요청</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalReList.a"
				style="background: #e5e5e5;">회수 관리</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/etoile/admin/rentalStatistics.a"
				style="background: #e5e5e5;">대여 통계</a></li>
		</ul>
	</div>
	<br>
	<form id="frm" action="searchMember.a">
		<div class="row">
				<input type="text" name="memberId" style="BORDER-BOTTOM: 1px solid;" placeholder="검색할 유저ID 입력" >&nbsp;&nbsp;
				<input type="button" style="float:right;" value="검색" onclick="sSubmit();">
		</div>
	</form>
		<br />
	<div class="row">
		<table class="table" align="center">
			<thead class="thead-dark">
			<tr>
				<th width="300">주문번호</th>
				<th width="400">상품명</th>
				<th width="80">협찬</th>
				<th width="300">대여기간</th>
				<th width="80">배송</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list }">
				<tr style="text-align:center">
					<td width="300">${list.rentalOrder }</td>
					<td width="400">${list.productName }</td>
					<td width="80" style="text-align: center">${list.ppl }</td>
					<td width="300" style="text-align: center">
						<input type="text" value="${list.rentalStart }" size="7" readonly>
						~
						<input type="text" value="${list.rentalEnd }" size="7" readonly>
					</td>
					<td style="text-align: center">
						<button id="insertWay" type="button" data-toggle="modal"
							data-target="#myModal${list.rentalId }">등록</button>
					</td>
				</tr>
				<form id="frm${list.rentalId }" name="frm${list.rentalId }" action="updateWaybill.a" >
					<div class="modal fade" id="myModal${list.rentalId }" tabindex="-1"
						aria-labelledby="dropLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="dropLabel">송장번호 등록</h5>
									<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<input type="text" id="name" name="name" value="${list.name }"
										readonly><br> <input type="text"
										id="rentalAddress" name="rentalAddress"
										value="${list.rentalAddress }" readonly
										style="text-align: center" size="50"><br> <input
										type="text" id="rentalWaybill" name="rentalWaybill"
										placeholder="송장번호입력">
								</div>
								<div class="modal-footer">
									<input type="hidden" id="rentalId" name="rentalId" value="${list.rentalId }">
									<input type="hidden" id="${list.productId }" name="productId" value="${list.productId }">
									<button type="button" class="btn btn-close btn-dark" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" onclick="updateWaybill(this.form);">등록</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<button type="button" id="download" onclick="location.href='/etoile/admin/rentalExcel.a'">다운로드</button>
	</div>
</body>
</html>