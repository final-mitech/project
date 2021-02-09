<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap4.min.css"/>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="<c:url value="/resources/js/productHistory.js" />"></script>

</head>
<body>
	<div class="containter-fluid">
		<div class="row">
			<div class="col-7">
				<img src="${product.productImage }">
			</div>
			<div class="col-5">
				<div>
					<input type="hidden" id="id" value="${product.productId }">
					<h5>상품번호 - ${product.productId }</h5>
					<br />
					<h5>분류 - ${product.productType }</h5>
					<br />
					<h3>${product.productName }</h3>
					<br />
					<h3>구입가격 - <fmt:formatNumber value="${product.productPrice }" type="currency"/></h3>
					<br />
					<h3>대여료 - <fmt:formatNumber value="${product.productRental }" type="currency"/></h3>
					<br />
					<c:if test="${product.productStatus eq 'waiting'}">
						<h3>대기</h3>
					</c:if>
					<c:if test="${product.productStatus eq 'rental'}">
						<h3>대여중</h3>
					</c:if>
					<c:if test="${product.productStatus eq 'wash'}">
						<h3>세탁중</h3>
					</c:if>
					<c:if test="${product.productStatus eq 'repair'}">
						<h3>수선중</h3>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-light btn-lg btn-block"
					onclick="location.href='/etoile/admin/productUpdateForm.a?productId=${product.productId}'">수정하기</button>
			</div>
			<div class="col">
				<button type="button" class="btn btn-light btn-lg btn-block"
					onclick="location.href='/etoile/admin/productDelete.a?productId=${product.productId}'">삭제하기</button>
			</div>
			<div class="col">
				<c:if test="${product.ppl eq 'own' }">
					<button type="button" class="btn btn-light btn-lg btn-block"
						onclick="location.href='/etoile/admin/historyList.a'">목록보기</button>
				</c:if>
				<c:if test="${product.ppl eq 'ppl' }">
					<button type="button" class="btn btn-light btn-lg btn-block"
						onclick="location.href='/etoile/admin/pplList.a'">목록보기</button>
				</c:if>
			</div>
		</div>
		<div class="row">
			<br />
		</div>

			<table id="data" class="table table-striped table-bordered" style="width:100%">
				<thead class="thead-light">
					<tr>
						<th scope="col">이력내역</th>
						<th scope="col">일자</th>
					</tr>
				</thead>
				<tbody>
					<!-- 이력내역  -->
				</tbody>
			</table>

	</div>


</body>
</html>