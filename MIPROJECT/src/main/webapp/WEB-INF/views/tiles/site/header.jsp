<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	let url = $(location).attr('href');

	let rental = 'product';
	let myStyling = 'review';
	let funding = 'funding';
	let auction = 'auction';
	
	if(url.indexOf(rental) != -1){
		$('#rental').attr('class', 'active');
	}else if(url.indexOf(myStyling) != -1){
		$('#styling').attr('class', 'active');
	}else if(url.indexOf(funding) != -1){
		$('#funding').attr('class', 'active');
	}else if(url.indexOf(auction) != -1){
		$('#auction').attr('class', 'active');
	}
	
})
</script>
</head>
<body>
	<div class="container" style="max-width: 1400px;">
		<div>
			<a href="#"> <img src="/etoile/images/main.png"
				onclick="location.href='/etoile'"></a>
			<c:if test="${id eq null or id eq ''}">
				<button style="float: right;" class="btn btn-outline-dark" onclick="location.href='/etoile/site/joinForm'">sign up</button>
				<button style="float: right;" class="btn btn-outline-dark" onclick="location.href='/etoile/site/loginForm'">login</button>
			</c:if>
			<c:if test="${id ne null and id ne ''}">
				<button style="float: right;" class="btn btn-outline-dark" onclick="location.href='/etoile/site/memberInfo.do'">MY</button>
				<button style="float: right;" class="btn btn-outline-dark" onclick="location.href='/etoile/site/logout.do'">logout</button>
			</c:if>
		</div>
		<div>
			<nav class="navbar navbar-expand-md bg-dark navbar-dark" >
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav ml-auto">
						<li id="rental" class="nav-item"><a class="nav-link" href="/etoile/site/productList">RENTAL</a></li>
						<li id="styling" class="nav-item"><a class="nav-link" href="/etoile/site/reviewList">MY STYLING</a></li>
						<li id="funding" class="nav-item"><a class="nav-link" href="/etoile/site/fundingList">FUNDING</a></li>
						<li id="auction" class="nav-item"><a class="nav-link" href="/etoile/site/auctionMain">AUCTION</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>