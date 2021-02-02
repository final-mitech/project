<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

</head>
<body>
	<div class="container">
		<div style="background-color: gray">
			<c:forEach items="${fundings }" var="f">
				<div class="profileWrap">
					<div class="profImg">
						<img src="../images/${f.fundingImage }" style="width: 100px" height="100px">
					</div>
					<div class="profileInfo">
						<span class="badge badge-pill badge-danger dist"
							style="float: right; font-size: 1rem;">펀딩중</span>
						<!-- 라벨 색 -->
						<c:choose>
							<c:when test="${f.fundingCondition eq '접수완료'}">
								<span class="badge badge-pill badge-secondary dist"
									style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
							</c:when>
							<c:when test="${f.fundingCondition eq '검수중'}">
								<span class="badge badge-pill badge-danger dist"
									style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
							</c:when>
							<c:when test="${f.fundingCondition eq '검수완료'}">
								<span class="badge badge-pill badge-success dist"
									style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
							</c:when>
							<c:when test="${f.fundingCondition eq '펀딩오픈예정'}">
								<span class="badge badge-pill badge-secondary dist"
									style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
							</c:when>
							<c:when test="${f.fundingCondition eq '펀딩중'}">
								<span class="badge badge-pill badge-danger dist"
									style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
							</c:when>
							<c:when test="${f.fundingCondition eq '펀딩마감'}">
								<span class="badge badge-pill badge-success dist"
									style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
							</c:when>
						</c:choose>
						<!-- 라벨 색 종료 -->
						<span>${f.fundingName }</span><span>상품명</span> <span>${f.fundingBrand }</span>
						<span>브랜드</span> <span>${f.fundingCategory }</span> <span>카테고리</span>

						<!-- 상태바 -->
						<div class="col">
							<div class="progress">
								<div class="progress-bar bg-warning " role="progressbar"
									style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
									aria-valuemax="100">접수완료</div>
							</div>
						</div>
						<div class="col">
							<c:choose>
								<c:when test="${f.fundingCondition eq '펀딩마감'}">
									<div class="progress">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 100%;" aria-valuenow="100" aria-valuemin="0"
											aria-valuemax="100">펀딩마감</div>
									</div>

								</c:when>
								<c:when test="${f.fundingCondition eq '펀딩중'}">
									<div class="progress">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 75%;" aria-valuenow="75" aria-valuemin="0"
											aria-valuemax="100">펀딩중</div>
									</div>
								</c:when>
								<c:when test="${f.fundingCondition eq '펀딩오픈예정'}">
									<div class="progress">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 50%;" aria-valuenow="50" aria-valuemin="0"
											aria-valuemax="100">펀딩오픈예정</div>
									</div>
								</c:when>
								<c:when test="${f.fundingCondition eq '검수완료'}">
									<div class="progress">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
											aria-valuemax="100">검수완료</div>
									</div>
								</c:when>
								<c:when test="${f.fundingCondition eq '검수중'}">
									<div class="progress">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 10%;" aria-valuenow="10" aria-valuemin="0"
											aria-valuemax="100">검수중</div>
									</div>
								</c:when>
								<c:when test="${f.fundingCondition eq '접수완료'}">
									<div class="progress">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 0%;" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100">접수완료</div>
									</div>
								</c:when>
							</c:choose>
						</div>
						<!-- 상태바 종료 -->
						<a href="#">상세보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>