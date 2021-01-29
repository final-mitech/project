<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>funding/fundingInsertForm.jsp</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body {
	background:
		url('https://static-communitytable.parade.com/wp-content/uploads/2014/03/rethink-target-heart-rate-number-ftr.jpg')
		fixed;
	background-size: cover;
}

*[role="form"] {
	max-width: 530px;
	padding: 15px;
	margin: 0 auto;
	border-radius: 0.3em;
	background-color: #f2f2f2;
}

*[role="form"] h2 {
	font-family: 'Open Sans', sans-serif;
	font-size: 40px;
	font-weight: 600;
	color: #000000;
	margin-top: 5%;
	text-align: center;
	text-transform: uppercase;
	letter-spacing: 4px;
}
</style>

</head>


<!-- <script>
    function imageLoad(img) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imageLoad').empty();
            $('#imageLoadLabel').html('미리보기');
            $('#imageLoad').append($('<img />').attr('src', e.target.result).css('width', '290px').css('height',
                '200px'));
        }
        reader.readAsDataURL(img.files[0]);
    }

    function imageReset() {
        $('#imageLoad').empty();
        $('#imageLoadLabel').empty();
    }
</script> -->


<body>


	<div class="container">
		<div align="center">
			<form class="form-horizontal" role="form" id="frm" name="frm"
				action="fundingInsert.do" method="post">
				<h2>Funding Registration</h2>

				<div class="form-group">
					<label for="fundingName" class="col-sm-3 control-label">제품명</label>
					<div class="col-sm-9">
						<input type="text" name="fundingName" id="fundingName"
							placeholder="제품명" class="form-control" autofocus>
					</div>
				</div>
				<div class="form-group">
					<label for="fundingBrand" class="col-sm-3 control-label">브랜드명</label>
					<div class="col-sm-9">
						<select name="fundingBrand" id="fundingBrand" class="form-control">
							<option value="none" selected="selected">브랜드 선택안함</option>
							<c:forEach items="${fundings }" var="f">
								<option>${f.fundingBrand}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="fundingSerial" class="col-sm-3 control-label">모델번호
					</label>
					<div class="col-sm-9">
						<input type="text" name="fundingSerial" id="fundingSerial"
							placeholder="모델번호" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="fundingCategory" class="col-sm-3 control-label">제품유형</label>
					<div class="col-sm-9">
						<select name="fundingCategory" id="fundingCategory"
							class="form-control">
							<!-- <option value="none" selected="selected"> 카테고리 선택안함 </option> -->
							<c:forEach items="${fundings }" var="f">
								<option>${f.fundingCategory}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<!--                  <div class="form-group">
                    <label for="fundingImage" class="col-sm-3 control-label">이미지</label>
                    <div class="col-sm-9">
                        <input type="file" name="fundingImage" id="fundingImage" placeholder="이미지" class="form-control"
                            onchange="imageLoad(this)">
                            <input type="file" name="fundingImage" id="fundingImage" placeholder="이미지" class="form-control"
                            >
                    </div>
                </div> -->

				<div class="form-group">
					<label for="fundingContent" class="col-sm-3 control-label">요청사항</label>
					<div class="col-sm-9">
						<input type="fundingContent" name="fundingContent"
							id="fundingContent" placeholder="요청사항" class="form-control">
						<span class="help-block">기타 요청사항을 입력해주세요.</span>
					</div>
				</div>
				<!--                 <div class="form-group">
                    <label for="imageLoad" id="imageLoadLabel" class="col-sm-3 control-label"></label>
                    <div class="col-sm-9" id="imageLoad" name="imageLoad">
                    </div>
                </div> -->
				<!-- /.form-group -->
				<div class="form-group">
					<div class="col-sm-9 col-sm-offset-3">
						<span class="help-block">*필수항목</span>
					</div>
				</div>
				<div align="center">
					<button type="submit" value="등록" class="btn btn-primary ">펀딩요청하기</button>
					<button type="reset" value="취소" class="btn btn-primary ">취소</button>
				</div>

			</form>
			<!-- /form -->
		</div>
	</div>
	<!-- ./container -->
</body>

</html>