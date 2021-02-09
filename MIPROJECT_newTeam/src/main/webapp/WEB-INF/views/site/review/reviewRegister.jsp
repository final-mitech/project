<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewRegister.jsp</title>
<script>
	// 제품명 불러오기
$(function() {
	$('#myDropdown .dropdown-item').on('click', function(event) {
			//console.log(event.target.innerHTML)
		$('#pname').html(event.target.innerHTML)
		$('[name="productName"]').val(event.target.innerHTML)
	})
})
	
	function insertTag(tag) {
		let selected = $(tag).text();
		$('#styleTag').val(selected);
		
	}
</script>
</head>
<body>
	<div class="content-body">
		<div class="container" style="max-width: 1400px;">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<form action="reviewRegister.do">
								<input type="hidden" name="productName">
								<div class="email-right-box">
									<div class="toolbar" role="toolbar">	
										<!--  제품명 불러오기 -->
										<div class="btn-group m-b-20" id="myDropdown">
											<button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
													<span id="pname">${list.styleTag }</span>
											</button>
											<div class="dropdown-menu">
												<c:forEach var="p" items="${p }">
													<a class="dropdown-item" onclick="insertTag(this)">${p.productName }</a>
												</c:forEach>
												<input type="hidden" id="styleTag" name="styleTag" value="${list.styleTag }">
											</div>
										</div>
									</div>
									<div class="compose-content mt-5">
										<div class="form-group">
											<textarea class="textarea_editor form-control bg-light" name="styleContent" rows="15" placeholder="리뷰를 입력하세요"></textarea>
										</div>
										<h5 class="m-b-20">
											<i class="fa fa-paperclip m-r-5 f-s-18"></i>리뷰사진 첨부
										</h5>
										<!-- 파일 첨부 부분 -->
										<div class="form-group">
											<div class="fallback">
												<input class="l-border-1" name="styleImage" type="file" multiple="multiple">
											</div>
										</div>
									</div>
									<div class="text-left m-t-15">
										<button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit">
											 <i class="fa fa-paper-plane m-r-5"></i> 등록
										</button>
										<button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="reset">
											 <i class="ti-close m-r-5 f-s-12"></i> 취소
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>