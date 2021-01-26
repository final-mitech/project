<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<%
//날짜지정
Date date = new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String strdate = simpleDate.format(date);
%>
<script>
	// 금액 실시간 반영
$(document).ready( function() {
	setViewTime = function (){
		var getsDay = $("#rentalStart").val();
		var geteDay = $("#rentalEnd").val();
		if (getsDay.trim() != "" && geteDay.trim() == "") {
			$("#totalPay").html(${product.productRental });
		} else if(getsDay.trim() != "" && getsDay.trim() != ""){
			var sDay = new Date($("#rentalStart").val());
			var eDay = new Date($("#rentalEnd").val());
			var renDay = eDay - sDay;
			
			var totalDay = (renDay / 100 / 60 / 60 / 24 / 10) + 1;
			
			var distance = totalDay * (${product.productRental });
			$("#totalPay").html(distance);
		} else {
			$("#totalPay").html(${product.productRental });
		}
	}
	setInterval('setViewTime()',100);
});
</script>
<script>
	//찜 기능
	$(function() {
		$("#heart").click(function Pick(){
			var pId = document.getElementById("productId").value;
			$.ajax({
				url: "productPickInsert.do",
				type: "POST",
				data: {
					productId: pId
				},
				success: function () {
					selectPick();
				}
			})
		})
		//처음 페이지 시작했을때도 실행되도록 호출
		selectPick();
	})
		
		//pick테이블에서 productId 조건으로 찜목록조회
		function selectPick(){
			var pId = document.getElementById("productId").value;
			$.ajax({
				url: "selectPick.do",
				type: "POST",
				data: {
					productId: pId
				},
				success: function (count) {
					console.log(count);
					document.getElementById('searchPick').value = count;
					if(count == 1){
						$("#heart").attr("src","../images/heart2.png");
					} else {
						$("#heart").attr("src","../images/heart1.png");
					}
				}
			})
		}
</script>
<style>
/* 하트버튼 */
.hbtn {
	background-color: white;
	border:0;
	outline:0;
	width: 80px;
}
</style>
</head>
<body>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-5">
				<div style="height: 300px">
					<img src="${product.productImage }"
						style="height: 500px; width: 100%; overflow: hidden;">
				</div>
			</div>
			<div class="col-1">
				<form id="pickForm">
					<div class="pickbtn" style="float: left;">
						<img id="heart" src="../images/heart1.png" style="height: 50%; width: 50%;">
						<input type="hidden" id="searchPick">
					</div>
				</form>
			</div>
			<div class="col-6">
				<div>
					<h1>${product.productName }</h1>
					<br />
					<h3>${product.productContent }</h3>
				</div>
				<form id="frm" name="frm" action="payPage.do" method="get">
					<input type="hidden" id="productId" name="productId" value="${product.productId}">
					<div>
						<p style="font-size: 15px;" align="right" id="totalPay"
							name="totalPay"></p>
						<p align="center">
							<input type="date" id="rentalStart" name="rentalStart"
								min="<%=strdate%>" required> ~ <input type="date"
								id="rentalEnd" name="rentalEnd" min="<%=strdate%>" required>
						</p>
						<button type="submit" style="float: right;">대여하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>