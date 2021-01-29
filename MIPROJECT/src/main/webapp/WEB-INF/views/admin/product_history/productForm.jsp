<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<style type="text/css">
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #337ab7;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						var fileTarget = $('.filebox .upload-hidden');

						fileTarget.on('change', function() {
							if (window.FileReader) {
								// 파일명 추출
								var filename = $(this)[0].files[0].name;
							}

							else {
								// Old IE 파일명 추출
								var filename = $(this).val().split('/').pop()
										.split('\\').pop();
							}
							;

							$(this).siblings('.upload-name').val(filename);
						});

						//preview image 
						var imgTarget = $('.preview-image .upload-hidden');

						imgTarget
								.on(
										'change',
										function() {
											var parent = $(this).parent();
											parent.children('.upload-display')
													.remove();

											if (window.FileReader) {
												//image 파일만
												if (!$(this)[0].files[0].type
														.match(/image\//))
													return;

												var reader = new FileReader();
												reader.onload = function(e) {
													var src = e.target.result;
													parent
															.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
												}
												reader
														.readAsDataURL($(this)[0].files[0]);
											}

											else {
												$(this)[0].select();
												$(this)[0].blur();
												var imgSrc = document.selection
														.createRange().text;
												parent
														.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

												var img = $(this).siblings(
														'.upload-display')
														.find('img');
												img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
														+ imgSrc + "\")";
											}
										});
					});
	
function insert(){
	$('#frm').attr("action", "/etoile/admin/prodcutInsert.a").submit();
}

function update(){
	$('#frm').attr("action", "/etoile/admin/productUpdate.a").submit();
}
</script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h3>상품 등록</h3>
		</div>
		<form:form id="frm" action="#"
			modelAttribute="productVO" method="post"
			encType="multipart/form-data">
			<form:input path="productId" type="hidden" />
			<div class="form-group">
				<label for="productName">상품명</label>
				<form:input path="productName" class="form-control" />
			</div>
			<div class="form-group">
				<label for="productSerial">상품모델번호</label>
				<form:input path="productSerial" class="form-control" />
			</div>
			<div class="form-group">
				<label for="productBrand">브랜드</label>
				<form:input path="productBrand" class="form-control" />
			</div>
			<div class="form-group">
				<label for="productType">상품유형&nbsp;&nbsp;</label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="productType" value="bag" id="bag"
					<c:if test="${productVO.productType eq 'bag' }">checked</c:if>> 
						<label class="form-check-label" for="bag">가방</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="productType" value="dress" id="dress"
					<c:if test="${productVO.productType eq 'dress' }">checked</c:if>> 
					<label class="form-check-label" for="dress">옷</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="productType" value="goods" id="goods"
					<c:if test="${productVO.productType eq 'goods' }">checked</c:if>> 
					<label class="form-check-label" for="goods">잡화</label>
				</div>
			</div>
			<div class="form-group">
				<label for="productPrice">구입가격</label>
				<form:input path="productPrice" class="form-control" />
			</div>
			<div class="form-group">
				<label for="productContent">상세내용</label>
				<form:input path="productContent" class="form-control" />
			</div>
			<div class="filebox preview-image">
				<input class="upload-name" value="이미지 선택" disabled="disabled">
				<label for="uploadImage">상품이미지</label> <input type="file"
					id="uploadImage" name="uploadImage" class="upload-hidden" />
			</div>
			<div class="form-group">
				<label for="ppl">협찬여부</label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="ppl" value="ppl" id="ppl"
					<c:if test="${productVO.ppl eq 'ppl' }">checked</c:if>> 
						<label class="form-check-label" for="ppl">협찬</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="ppl" value="own" id="own" 
					<c:if test="${productVO.ppl eq 'own' }">checked</c:if>>
					<label class="form-check-label" for="own">구입</label>
				</div>
			</div>
			<div class="form-group">
				<label for="productRental">대여료</label>
				<form:input path="productRental" class="form-control" />
			</div>
			<div class="form-group text-center">
				<c:if test="${productVO.productId eq null or  productVO.productId eq ''}"><form:button class="btn btn-dark" onclick="insert()">등록</form:button></c:if>
				<c:if test="${productVO.productId ne null and  productVO.productId ne ''}"><form:button class="btn btn-dark" onclick="update()">수정</form:button></c:if>
			</div>
		</form:form>
	</div>
</body>
</html>