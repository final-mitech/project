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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script>
	function changeSort() {
		let selected = $('#sort').val();

		if (selected == 'all') {
			location.href = '/etoile/admin/historyList.a';
		} else {
			location.href = '/etoile/admin/historyList.a?productStatus='
					+ selected;
		}

	}

	function goList(page) {
		location.href = '/etoile/admin/historyList.a?page=' + page;
	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>

<script src="<c:url value="/resources/js/productHistory.js" />"></script>

<script type="text/javascript">
	function changeStatus(tag) {
		//저장해야할 정보를 각 가져옴
		let selected = $('#'+tag.id+' option:selected').val();
		let productId = $('#'+tag.id).parent().prev().prev().text();
		let today = new Date();
		let date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
				+ today.getDate();
		
		//블록체인에 내역 저장
		App.setStatus(productId, selected, date);
		//물품DB에 상태 업데이트
		$.ajax({
			url : "historyUpdate.a", 
			data : {
				productId : productId,
				productStatus : selected
			}, 
			type : "POST", 
			success : function(result){
			},
			error : function(reject){
				console.log(reject);
			}

		})
		
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-9">
				<a href="#">개인회원</a>
				<a>&nbsp;|&nbsp;</a>
				<a href="#">기업회원</a>
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
							onclick="location.href='productSelect.a?productId=${member.productId }'">
							<th scope="row">${product.productId }</th>
							<td>${product.productName }</td>
							<td>${product.productName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<tag:historyPaging jsFunc="goList" />
		</div>
	</div>
</body>
</html>