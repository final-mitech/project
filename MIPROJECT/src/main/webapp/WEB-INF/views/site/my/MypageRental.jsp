<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card-img {
	display: block;
	margin: 0px auto;
	float: center;
}
.card-body a {
	text-decoration: none;
	color: #000000;
	font-weight: bold;
}
.card-body-footer a {
	text-decoration: none;
	color: #00b3b3;
	font-weight: bold;
}

.card-body-footer a:hover {
	text-decoration: none;
	color: #008080;
	font-weight: bold;
}

.card-body #rentalOrder {
	border: 0px;
	font-weight: bold;
	font-size: 18px;
}

.card-body #rentalOrder:focus {
	outline: none;
}

.btn {
	border: 0px;
	outline: 0;
}
p {
	font-weight: bold;
}
</style>
<script>
	function goList(page) {
		location.href = 'MypageRental.do?page=' + page;
	}
	
	function cancelRental(tag) {
		console.log(tag);
		 if (confirm("정말 취소하시겠습니까?") == true){
		     document.forms[tag.name].submit();
		 }else{   //취소
		     return false;
		 }
	}
</script>
</head>
<body>
	<br>
	<div class="container" style="max-width: 1400px;">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/etoile/site/MypageRental.do" style="background: #e5e5e5;">MyRental</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="/etoile/site/pickList.do">MyPick</a>
				</li>
			</ul>
		</div>
		<div class="row" style="background: #e5e5e5;"><br></div>
		<div class="row" style="background: #e5e5e5;">
			<br>
			<c:forEach var="list" items="${list }">
				<div class="container">
				<form id="frm" name="frm${list.rentalId }" action="updateStatus">
					<div class="row no-gutters">
						<div class="col-4 mb-3" style="background: #ffffff; overflow: hidden; height: 230px">
							<a href="/etoile/site/productDetail?productId=${list.productId }">
								<img src="${list.productImage }" class="card-img" style="height: 140%; width: 85%; overflow: hidden; padding-bottom: 80px">
							</a>
						</div>
						<div class="col-8 mb-3" style="background: #ffffff; height: 230px">
							<div class="card-body">
								<p>주문번호 : <input type="text" id="rentalOrder" value="${list.rentalOrder }" readonly></p>
								<a href="/etoile/site/productDetail?productId=${list.productId }" style="font-size:20px;">${list.productName }</a>
								<p>${list.rentalStart }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.rentalEnd }</p>
								<p><fmt:formatNumber type="currency" maxFractionDigits="3" value="${list.rentalPay }" /></p>
								<input type="hidden" name="productId" value="${list.productId }">
							</div>
							<div class="card-body-footer" style="float: right; margin-right: 20px; height:100px">
								<c:if test="${list.rentalWaybill ne null}">
									<a href="/etoile/site/productReviewList.do?styleTag=${list.productName }">마이스타일링</a>	
								</c:if>
								<c:if test="${list.rentalWaybill eq null}">
									<c:if test="${list.productStatus == 'waiting'}">
										<button type="button" id="cancel" onclick="cancelRental(this.form)">대여취소</button>
										<a href="#" style="pointer-events: none;">배송준비중</a>
									</c:if>
									<c:if test="${list.productStatus == 'cancel'}">
										<a href="#" style="pointer-events: none;">대여취소</a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
			</form>
				</div>
			</c:forEach>
		</div>
		<div style="float: center;">
			<tag:historyPaging jsFunc="goList" />
		</div>
	</div>
</body>
</html>