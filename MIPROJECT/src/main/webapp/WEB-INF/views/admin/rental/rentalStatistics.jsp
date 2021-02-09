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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="<c:url value="/resources/js/productHistory.js" />"></script>
<script>
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')
	myModal.addEventListener('shown.bs.modal', function() {
		myInput.focus()
	})
</script>
<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
	// Some raw data (not necessarily accurate)
	var data = google.visualization.arrayToDataTable([
		['Month', 'RentalCount', 'totalPay'],
		['2004/05',  165,      938],
    	['2005/06',  135,      1120],
    	['2006/07',  157,      1167],
    	['2007/08',  139,      1110],
    	['2008/09',  136,      691]
	]);

	var options = {
		title : '월별 대여 금액 & 횟수',
    	seriesType: 'bars',
    	series: {1: {type: 'line'}}
	};

	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
	}

</script>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="/etoile/admin/rentalList.a" style="background: #e5e5e5;">대여 요청</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="/etoile/admin/rentalcancelList.a" style="background: #e5e5e5;">취소 요청</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="/etoile/admin/rentalReList.a" style="background: #e5e5e5;">회수 관리</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="/etoile/admin/rentalStatistics.a">대여 통계</a></li>
		</ul>
	</div>
	<br />
	<div class="row">
		<table class="table" style="align:'center'">
			<tr>
				<th>DATE</th>
				<c:forEach var="rental" items="${rental }">
				<th><c:out value="${rental.date }" /> </th>
				</c:forEach>
			</tr>
			<tr>
				<th>월별 대여횟수</th>
				<c:forEach var="rental" items="${rental }">
				<th><c:out value="${rental.cnt }" /> </th>
				</c:forEach>
			</tr>
			<tr>
				<th>월별 대여총액</th>
				<c:forEach var="rental" items="${rental }">
				<th><c:out value="${rental.rentalPay }" /> </th>
				</c:forEach>
			</tr>
		</table>
	</div>
	<div class="row">
		<div id="chart_div" style="width: 1500px; height: 600px;"></div>
	</div>
</body>
</html>