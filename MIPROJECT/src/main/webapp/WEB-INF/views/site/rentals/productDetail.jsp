<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.*, java.text.*" %>
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
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
%>
<script>
$(document).ready( function() {
	setViewTime = function (){
		var getsDay = $("#startRental").val();
		var geteDay = $("#endRental").val();
		if (getsDay.trim() != "" && geteDay.trim() == "") {
			$("#totalPay").html(${product.productRental });
		} else if(getsDay.trim() != "" && getsDay.trim() != ""){
			var sDay = new Date($("#startRental").val());
			var eDay = new Date($("#endRental").val());
			var renDay = eDay - sDay;
			
			var totalDay = (renDay / 100 / 60 / 60 / 24 / 10) + 1;
				
			console.log(totalDay);
			
			var distance = totalDay * (${product.productRental });
			$("#totalPay").html(distance);
		} else {
			$("#totalPay").html(${product.productRental });
		}
	}
	setInterval('setViewTime()',1000);
});
</script>
</head>
<body>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-7">
				<img src="${product.productImage }">
			</div>
			<div class="col-5">
				<div>
					<h1>${product.productName }</h1>
					<br />
					<h3>${product.productContent }</h3>
				</div>
				<form id="frm" name="frm" action="payPage.do" method="get">
				<input type="hidden" name="productId" value="${product.productId}">
					<div>
						<p style="font-size:15px;" align="right" id="totalPay" name="totalPay"></p>
						<p align="center">
							<input type="date" id="startRental" name="startRental" min="<%= strdate%>">
							~ <input type="date" id="endRental" name="endRental" min="<%= strdate%>">
						</p>
						<button type="submit" style="float: right;">대여하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>