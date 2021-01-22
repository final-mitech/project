<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/font-awesome.min.css">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
a {
	text-decoration: none;
	color: #999999;
}

a:hover {
	text-decoration: none;
	color: #999999;
}
a:active {
	text-decoration: none;
	color: #666666;
}
input {
	float: left;
	BORDER-BOTTOM: 1px solid;
	BORDER-LEFT: medium none;
	BORDER-RIGHT: medium none;
	BORDER-TOP: medium none;
}
button {
	 border: none;
	 background-color: white;
	 text-decoration: none;
}
</style>
<script>
	function sSubmit() {
		document.getElementById("frm").submit();
	}
	function goList(page){
		location.href='productList.do?page='+page;
	}
	
	function changePick(){
		$.ajax({
			url : "pickUp.do",
			data : "memberId=" + memberId,
			type: "post",
			success : function(data) {
				var result = JSON.parse(data);
				if (result.status == 404) {
					$('#btn-pick>i').attr('class','far fa-heart fa-2x');
				} else {
					$('#btn-pick>i').attr('class','fas fa-heart fa-2x');
				}
				
			}
			error : function() {
				alert("에러");
			}
			
		})
		
	}
</script>
</head>
<body>
	<div class="container">
		<div>
			<a href="#">최신순</a> <a href="#">인기순</a>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<c:forEach var="list" items="${list }">
				<div class="col-lg-3 mb-1" style="height:500px">
					<div class="card" id="product-card" style="position: relative;"
						onclick="location.href='productDetail.do?productId=${list.productId }'">
						<div class="card-header" style="height:300px; border:0px; background-color:white;">
							<img src="${list.productImage }" class="card-img-top" style="height:300px; width:100%; overflow: hidden;">
						</div>
						<div class="card-body">
							<h5 class="card-title" style="font-size:16px; height:20px;"><strong>${list.productName }</strong></h5>
						</div>
						<div class="card-footer" style="border:0px; background-color:white;">
							<p class="card-text" style="float:left;">${list.productRental }</p>
							<div style="float:right;" onclick="event.cancelBubble=true;">
								<button type="button" id="btn-pick">
									<i class="far fa-heart fa-2x" style="color:red;" ></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div>
			<div style="float:left;">
				<form id="frm" action="productSearch.do">
					<label>
						<input type="text" name="productName" placeholder="검색할 상품명 입력">
					</label>
					<a class="link-secondary" onclick="sSubmit();" aria-label="Serch">
						<i class="fa fa-search" id="S" aria-hidden="true"></i>
					</a>
				</form>
			</div>
			<div style="float:center;">
				<tag:historyPaging jsFunc="goList" />
			</div>
			<br>
		</div>
	</div>
</body>
</html>