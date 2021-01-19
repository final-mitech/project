<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
function changeSort(){
	let selected = $('#sort').val();
	$.ajax({
		type: "post", //요청 메소드 방식
		url:"",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){

		},
		error : function(reject){
			console.log()
		}
	});
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-9"></div>
			<div class="col-3">
				<select id="sort" class="form-control" onchange="changeSort()">
					<option value="all">ALL</option>
					<option value="standby">대기중</option>
					<option value="rental">대여중</option>
					<option value="washing">세탁중</option>
					<option value="repair">수선중</option>
				</select>
			</div>
		</div>
		<div class="row">
			<table class="table table-striped table-hover text-center" >
				<thead class="thead-dark">
					<tr>
						<th scope="col-3">NO</th>
						<th scope="col-3">BRAND</th>
						<th scope="col-3">PRODUCT</th>
						<th scope="col-3">STATUS</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${list }">
						<tr
							onclick="location.href='/admin/productSelect.do?productId=${product.productId }'">
							<th scope="row">${product.productId }</th>
							<td>${product.productBrand}</td>
							<td>${product.productName }</td>
							<td><select class="form-control">
									<option value="standby"
										<c:if test="${product.productStatus eq standby}"> selected </c:if>>대기중</option>
									<option value="rental"
										<c:if test="${product.productStatus eq rental}"> selected </c:if>>대여중</option>
									<option value="washing"
										<c:if test="${product.productStatus eq washing}"> selected </c:if>>세탁중</option>
									<option value="repair"
										<c:if test="${product.productStatus eq repair}"> selected </c:if>>수선중</option>
							</select></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>