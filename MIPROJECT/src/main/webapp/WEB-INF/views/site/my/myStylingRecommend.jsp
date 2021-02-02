<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageRecommend.jsp</title>
</head>
<body>
<div class="container">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/etoile/site/myPageStyling.do">STYLING LIST</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="/etoile/site/myPageRecommend.do" style="background: #e5e5e5;">RECOMMEND</a>
				</li>
			</ul>
		</div>
		<div class="row" style="background: #e5e5e5;"><br></div>
		<div class="row" style="background: #e5e5e5;">
			<br>
			<c:forEach var="list" items="${list }">
				<div class="container">
					<div class="row no-gutters">
						<div class="col-4 mb-3" style="background: #ffffff; overflow: hidden; height: 200px">
							<img src="${list.styleImage }" class="card-img" style="height: 120%; width: 85%; overflow: hidden;">
						</div>
						<div class="col-8 mb-3" style="background: #ffffff; height: 200px">
							<div class="card-body">
								<p style="font-size:20px;">${list.styleTag }</p>
								<p>${list.styleDate }</p>
								<p>${list.styleContent }</p>
							</div>
							<div class="card-body-footer" style="float: right; margin-right: 20px">
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>