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
function changeSort(){
	let selected = $('#sort').val();
	console.log(selected);
	if(selected == 'all'){
		location.href='/etoile/admin/historyList.do';
	}else{
		location.href='/etoile/admin/historyList.do?productStatus='+selected;
	}
	
}

function goList(page){
	location.href='/etoile/admin/historyList.do?page='+page;
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-9"></div>
			<div class="col-3">
				<select id="sort" class="form-control" onchange="changeSort()">
					<option value="all" <c:if test="${sort eq 'all'}"> selected </c:if>>ALL</option>
					<option value="waiting" <c:if test="${sort eq 'waiting'}"> selected </c:if>>대기중</option>
					<option value="rental" <c:if test="${sort eq 'rental'}"> selected </c:if>>대여중</option>
					<option value="wash" <c:if test="${sort eq 'wash'}"> selected </c:if>>세탁중</option>
					<option value="repair" <c:if test="${sort eq 'repair'}"> selected </c:if>>수선중</option>
				</select>
			</div>
		</div>
		<div class="row">
			<table class="table table-striped table-hover text-center" >
				<thead class="thead-dark">
					<tr>
						<th scope="col-4">NO</th>
						<th scope="col-4">PRODUCT</th>
						<th scope="col-4">STATUS</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${list }">
						<tr
							onclick="location.href='/admin/productSelect.do?productId=${product.productId }'">
							<th scope="row">${product.productId }</th>
							<td>${product.productName }</td>
							<td onclick="event.cancelBubble=true" >
							<c:if test="${product.productStatus eq 'rental' and product.productStatus ne null}">
								<select class="form-control">
									<option value="rental" selected>대여중</option>
								</select>
							</c:if>
							<c:if test="${product.productStatus ne 'rental' and product.productStatus ne null}">
								<select class="form-control">		
										<option value="waiting"
											<c:if test="${product.productStatus eq 'waiting'}"> selected </c:if>>대기중</option>
										<option value="wash"
											<c:if test="${product.productStatus eq 'wash'}"> selected </c:if>>세탁중</option>
										<option value="repair"
											<c:if test="${product.productStatus eq 'repair'}"> selected </c:if>>수선중</option>
								</select>
							</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<tag:historyPaging jsFunc="goList" />
		</div>
	</div>
</body>
</html>