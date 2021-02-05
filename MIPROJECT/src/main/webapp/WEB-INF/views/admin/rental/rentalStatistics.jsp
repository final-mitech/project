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
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
	
	var data = google.visualization.arrayToDataTable(
		//for (var i=0; i<=6; i++) {
		[
			['Month', '월별 대여횟수', '월별 대여 총금액'],
			['2004/05',  10,      938],
	    	['2005/06',  15,      1120],
	    	['2006/07',  5,      1167],
	    	['2007/08',  7,      1110],
	    	['2008/09',  20,      691],
	    	['2008/10',  20,      1500]
		]
		//}
	);

	var options = {
		vAxes: {
			0: { 
				minValue : 0,
				maxValue : 50	
			},
			1: {
				minValue : 0,
				maxValue : 2000	
			}
		},
		
    	series: {
    		0: {targetAxisIndex: 0, type:"bars", lineWidth: 1, color: '#002699'},
    		1: {targetAxisIndex: 1, type:'line', lineWidth: 2, color: '#b30000'}
    	}
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
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="/etoile/admin/rentalReList.a" style="background: #e5e5e5;">회수 관리</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="/etoile/admin/rentalStatistics.a">대여 통계</a></li>
		</ul>
	</div>
	<div class="row">
		<div id="chart_div" style="width: 1500px; height: 600px;"></div>
	</div>
</body>
</html>