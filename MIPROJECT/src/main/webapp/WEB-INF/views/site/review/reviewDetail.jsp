<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 리뷰 상세페이지 & 댓글</title>
<script>

	// 리뷰 좋아요
	$(function() {
		$("#like").click(function Recommend() {
			var sId = document.getElementById("styleId").value;
			$.ajax({
				url: "stylingRecommend",
				type: "POST",
				data: {
					styleId: sId
				},
				success: function() {
					selectRecommend();
				}
			})
		})
		selectRecommend();
	})
	
	// 리뷰 좋아요 조회
	function selectRecommend() {
		var sId = document.getElementById("styleId").value;
		$.ajax({
			url: "selectRecommend",
			type: "POST",
			data: {
				styleId: sId
			},
			success: function (count) {
				document.getElementById("searchRecommend").value = count;
				if (count == 1) {
					$("#like").attr("src", "../images/like1.png");
				} else {
					$("#like").attr("src", "../images/like2.png");
				}
			}
		})
	}
	
</script>
</head>
<body>
	<br/>
	<div id="main-wrapper">
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-4 col-xl-3">
						<div class="card">
						<form id="frm">
							<div class="card-body">
								<div class="media align-items-center mb-4">
									<img class="mr-3" src="${list.styleImage }">
								</div>
									<div class="row mb-5">
										<div class="col-12 text-center">
											<h3>#${list.styleTag }</h3>
											<p class="text-muted mb-0">${list.memberId }</p>
											<div class="likebtn">
												<img id="like" value="like" src="/etoile/images/like1.png" style="height: 20%; width: 20%;">
												<input type="hidden" id="searchRecommend">
												<p class="text-muted mb-0">${list.styleRecommend }</p>
											</div>
										</div>
									</div> 
								<p class="text-muted">${list.styleContent }</p>
							</div>
						</form>
						</div>
					</div>

					<!--  댓글창 -->
					<!--<form action="site/review/reviewDetail" class="form-profile">-->
						<div class="col-lg-8 col-xl-9">
							<div class="card">						
								<div class="card-body">
									<form action="commentsInsert">
										<div class="form-group">
											<textarea class="form-control" name="commentContent" id="textarea" cols="30" rows="2"
												 	 placeholder="댓글을 입력하세요"></textarea>
										</div>
										<div class="d-flex align-items-center">
											<input type="hidden" name="styleId" value="${list.styleId }">
											<button type="submit" class="btn btn-primary px-3 ml-4">등록</button>
										</div>
									</form>
								</div>
							</div>
							<br />
							
							<div class="card">
								<c:forEach var="vo" items="${comments }">
									<div class="card-body">
										<div class="media media-reply">
											<div class="media-body">
												<div class="d-sm-flex justify-content-between mb-2">
													<h5 class="mb-sm-0">${vo.memberId }<small class="text-muted ml-3">
															<fmt:formatDate value="${vo.commentDate }" pattern="yyyy-MM-dd" /></small>
													</h5>
													<div class="media-reply__link">
														<button class="btn btn-transparent p-0 mr-3">
															<i class="fa fa-thumbs-up"></i>
														</button>
														<button class="btn btn-transparent p-0 mr-3">
															<i class="fa fa-thumbs-down"></i>
														</button>
														<button onclick='location.href="commentsDelete?commentId=${vo.commentId}&styleId=${vo.styleId }"'
																class="btn btn-transparent text-dark font-weight-bold p-0 ml-2">삭제</button>
														<button
															class="btn btn-transparent text-dark font-weight-bold p-0 ml-2">수정</button>
													</div>
												</div>
												<p>${vo.commentContent }</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							
						</div>
					<!--</form>-->
					<!-- 댓글창 끝 -->
					
				</div>
			</div>
		</div>
	</div>

<!-- <script src="plugins/common/common.min.js"></script>
     <script src="js/custom.min.js"></script>
     <script src="js/settings.js"></script>
     <script src="js/gleek.js"></script>
     <script src="js/styleSwitcher.js"></script> -->
</body>
</html>