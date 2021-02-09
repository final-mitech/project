<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일링 리뷰 리스트</title>
</head>
<script>
 	// 검색 버튼의 이벤트 처리
/* var searchForm = $("#searchForm");
	$("#searchForm button").on("click", function() {
		searchForm.submit();
	});  */

	// 페이징 실행
function goList(page) {
	location.href = '/etoile/site/reviewList?page=' + page;
}
	
</script>
<body>
	<div id="main-wrapper">
		<div class="content-body">
			<div class="container" style="max-width: 1400px;">
				<div class="row" align="center">
					<div class="col-12 m-b-30" align="center">
						<p class="text-muted"></p><h4 class="d-inline">MY STYLING LIST</h4><p class="text-muted"></p>
						<!-- 검색 기능 -->
						<div class="row">
							<div class="col-lg-12" align="right">
								<div align="left">
									<br/><a href="reviewList">최신순</a> / <a href="reviewList2">추천순</a>
								</div>
								<form id="searchForm" action="reviewSearch">
									<input type="text" name="styleTag" placeholder="상품명을 입력하세요" size="25px">
							   		<button class="btn btn-outline-dar type="submit">검색</button>
								</form><br/>
							</div>
						</div>
						<div class="row" align="center">
							<c:forEach var="vo" items="${list }">
							<div class="col-4" align="center">
								<div class="card" onclick='location.href="reviewDetail?styleId=${vo.styleId}"'>
								<img class="img-fluid" style="width:100%" src="/etoile/images/${vo.styleImage }">
									<div class="card-body">
										<h5 class="card-title">${vo.memberId }</h5>
										<p class="card-text">${vo.styleContent }</p>				
										<p class="card-text">
											<a href="stylingSearchProduct?styleTag=${vo.styleTag }" class="card-link float-right"><small>#${vo.styleTag }</small></a>								
											<small class="text-muted">${vo.styleDate }</small>
										</p>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						<tag:historyPaging jsFunc="goList" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>