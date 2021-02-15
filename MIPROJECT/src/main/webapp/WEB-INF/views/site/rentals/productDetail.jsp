<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<%
//날짜지정
Date date = new Date();
date.setDate(date.getDate() + 1);
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
			var pRental = ("${product.productRental }").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#totalPay").html("￦"+pRental);
		} else if(getsDay.trim() != "" && getsDay.trim() != ""){
			var sDay = new Date($("#rentalStart").val());
			var eDay = new Date($("#rentalEnd").val());
			var renDay = eDay - sDay;
			
			var totalDay = (renDay / 100 / 60 / 60 / 24 / 10) + 1;
			
			var distance = totalDay * (${product.productRental });
			var pRental = (distance).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#totalPay").html("￦"+pRental);
		} else {
			var pRental = ("${product.productRental }").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#totalPay").html("￦"+pRental);
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
<script>
	$(function() { //모든 datepicker에 대한 공통 옵션 설정
		$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd' //Input Display Format 변경
			,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true //콤보박스에서 년 선택 가능
			,changeMonth: true //콤보박스에서 월 선택 가능                
			,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
			,beforeShowDay: disableAllTheseDays
            });
	
			var rEnd = document.getElementById("pRentalEnd").value;
			var disabledDays = [rEnd];
			
			function disableAllTheseDays(date) { 
				   var m = date.getMonth();
				   var d = date.getDate();
				   var y = date.getFullYear(); 
				   
				   if (m+1 < 10) {
						m = "0"+(m+1);
				   }
				   if (d < 10) {
						d = "0"+d;
				   }
				   
				   for (i = 0; i < disabledDays.length; i++) { 
				       if($.inArray(y + '-' + m + '-' + d,disabledDays) != -1) { 
				           return [false]; 
				       }
				   } 
				   return [true]; 
				}
 
            //input을 datepicker로 선언
            $("#rentalStart").datepicker();                    
            $("#rentalEnd").datepicker();
            
            //rentalStart 의 초기값을 오늘 날짜로 설정
            $('#rentalStart').datepicker('setDate', '+1D');
            //rentalEnd의 초기값을 내일로 설정
            $('#rentalEnd').datepicker('setDate', '+1D');
        });
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
	<div class="container" style="max-width: 1400px;">
		<div class="row">
			<div class="col-5">
				<div style="height: 500px; overflow: hidden;">
					<img src="${product.productImage }" style="height: 120%; width: 100%; overflow: hidden;">
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
					<p>${product.productContent }</p>
				</div>
				<form id="frm" name="frm" action="payPage.do" method="get">
					<input type="hidden" id="productId" name="productId" value="${product.productId}">
					<input type="hidden" id="pRentalEnd" value="${rental.rentalEnd }">
					<div>
						<p style="font-size: 23px; padding-right:50px; font-weight: bold;" align="right" id="totalPay" name="totalPay"></p>
						<p align="center">
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />  
								<input type="text" id="rentalStart" name="rentalStart">
								~
								<input type="text" id="rentalEnd" name="rentalEnd">
						</p>
						<button type="submit" style="float: right;">대여하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>