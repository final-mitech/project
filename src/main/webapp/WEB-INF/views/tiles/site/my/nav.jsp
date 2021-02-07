<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
$(document).ready(function(){
	let url = $(location).attr('href');

	let myInfo = 'Info'
	let rental = 'Rental';
	let pick = 'pick';
	let myStyling = 'myPage';
	let funding = 'Funding';
	let auction = 'Auction';
	
	if(url.indexOf(myInfo) != -1){
		$('#myInfo').attr('class', 'list-group-item-action active');
	}else if(url.indexOf(rental) != -1 || url.indexOf(pick) != -1){
		$('#myRental').attr('class', 'list-group-item-action active');
	}else if(url.indexOf(myStyling) != -1){
		$('#myStyling').attr('class', 'list-group-item-action active');
	}else if(url.indexOf(funding) != -1){
		$('#myFunding').attr('class', 'list-group-item-action active');
	}else if(url.indexOf(auction) != -1){
		$('#myAuction').attr('class', 'list-group-item-action active');
	}
	
})
</script>
</head>
<body>
	
	<ul class="list-group list-group-flush">
		<li class="list-group-item"><a id="myInfo" href="/etoile/site/memberInfo.do">My Info</a></li>
		<li class="list-group-item"><a id="myRental" href="/etoile/site/MypageRental.do">RENTAL</a></li>
		<li class="list-group-item"><a id="myStyling" href="/etoile/site/myPageStyling.do">MY STYLING</a></li>
		<li class="list-group-item"><a id="myFunding" href="/etoile/site/myFundingList.do"">FUNDING</a></li>
		<li class="list-group-item"><a id="myAuction" href="/etoile/site/myAuctionJoin.do">AUCTION</a></li>	
	</ul>
</body>
</html>