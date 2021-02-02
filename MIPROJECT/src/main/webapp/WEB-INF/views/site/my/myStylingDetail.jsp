<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myStylingDetail.jsp</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/etoile/site/myPageStyling"
				   style="background: #e5e5e5;">STYLING LIST</a></li>
				<li class="nav-item">
				<a class="nav-link active" href="/etoile/site/myPageRecommend.do">RECOMMEND</a></li>
			</ul>
		</div>
		<div class="row"><br>
		</div>
		<div class="row" align="center"><br>
			<div id="main-wrapper">
				<div class="content-body" align="center">
					<div class="container-fluid">
						<div class="row" align="center">
							<div class="col-lg-20 col-xl-15">
								<div class="card" align="center">
									<div class="card-body">
										<div class="media align-items-center mb-4">
											<img class="mr-3" src="${list.styleImage }">
										</div>
										<div class="row mb-5">
											<div class="col-12 text-center">
												<h3>#${list.styleTag }</h3>
												<p class="text-muted mb-0">${list.memberId }</p>
												<p class="text-muted mb-0">${list.styleRecommend }</p>
											</div>
										</div>
										<p class="text-muted">${list.styleContent }</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>