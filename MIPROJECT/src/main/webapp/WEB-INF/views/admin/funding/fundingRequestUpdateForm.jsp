<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>funding/fundingRequestUpdateForm.jsp</title>

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
				action="fundingRequestUpdate.a" method="post">
				<h2>Funding Request</h2>

				<div class="form-group">
					<label for="fundingId" class="col-sm-3 control-label">NO.</label>
					<div class="col-sm-9">
						<input type="text" name="fundingId" id="fundingId"
							value="${selectVo.fundingId}" placeholder="NO."
							class="form-control" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="fundingName" class="col-sm-3 control-label">*제품명</label>
					<div class="col-sm-9">
						<input type="text" name="fundingName" id="fundingName"
							value="${selectVo.fundingName}" placeholder="제품명"
							class="form-control" autofocus>
					</div>
				</div>
				<div class="form-group">
					<label for="fundingTitle" class="col-sm-3 control-label">펀딩명</label>
					<div class="col-sm-9">
						<input type="text" name="fundingTitle" id="fundingTitle"
							value="${selectVo.fundingTitle}" placeholder="펀딩명 생성"
							class="form-control" autofocus>
					</div>
				</div>
				<div class="form-group">
					<label for="fundingBrand" class="col-sm-3 control-label">*브랜드명</label>
					<div class="col-sm-9">
						<input type="text" name="fundingBrand" id="fundingBrand"
							placeholder="브랜드명" class="form-control"
							value="${selectVo.fundingBrand}">
					</div>
				</div>
				<div class="form-group">
					<label for="fundingSerial" class="col-sm-3 control-label">*모델번호
					</label>
					<div class="col-sm-9">
						<input type="text" name="fundingSerial" id="fundingSerial"
							placeholder="모델번호" class="form-control"
							value="${selectVo.fundingSerial}">
					</div>
				</div>
				<div class="form-group">
					<label for="fundingCategory" class="col-sm-3 control-label">*제품유형</label>
					<div class="col-sm-9">
						<input type="text" name="fundingCategory" id="fundingCategory"
							placeholder="제품유형" class="form-control"
							value="${selectVo.fundingCategory}">
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
					<label for="fundingContent" class="col-sm-9 control-label">*고객
						요청사항</label>
					<div class="col-sm-9">
						<textarea class="form-control" rows="3" name="fundingContent"
							id="fundingContent">${selectVo.fundingContent}</textarea>

						<span class="help-block">고객 요청사항 검토 후 상품설명 수정</span>
					</div>
				</div>
				<!--                 <div class="form-group">
                    <label for="imageLoad" id="imageLoadLabel" class="col-sm-3 control-label"></label>
                    <div class="col-sm-9" id="imageLoad" name="imageLoad">
                    </div>
                </div> -->
				<!-- 고객 요청 폼에 없는 항목 관리자가 추가 -->
				<div class="form-group">
					<label for="fundingGoal" class="col-sm-3 control-label">목표금액</label>
					<div class="col-sm-9">
						<input type="text" name="fundingGoal" id="fundingGoal"
							placeholder="목표금액" class="form-control"
							value="${selectVo.fundingGoal}">
					</div>
				</div>

				<div class="form-group">
					<label for="fundingStart" class="col-sm-9 control-label">펀딩시작날짜</label>
					<div class="col-sm-9">
						<input type="text" name="fundingStart" id="fundingStart"
							placeholder="펀딩시작날짜" class="form-control"
							value="${selectVo.fundingStart}">
					</div>
				</div>

				<div class="form-group">
					<label for="fundingEnd" class="col-sm-9 control-label">펀딩마감날짜</label>
					<div class="col-sm-9">
						<input type="text" name="fundingEnd" id="fundingEnd"
							placeholder="펀딩마감날짜" class="form-control"
							value="${selectVo.fundingEnd}">
					</div>
				</div>

				<div class="form-group">
					<label for="fundingCondition" class="col-sm-3 control-label">펀딩상태</label>
					<div class="col-sm-9">
						<input type="text" name="fundingCondition" id="fundingCondition"
							placeholder="펀딩상태" class="form-control"
							value="${selectVo.fundingCondition}">
					</div>
				</div>

				<div class="form-group">
					<label for="fundingGift" class="col-sm-9 control-label">펀딩
						기프트</label>
					<div class="col-sm-9">
						<input type="text" name="fundingGift" id="fundingGift"
							placeholder="펀딩 기프트" class="form-control"
							value="${selectVo.fundingGift}">
					</div>
				</div>

				<div class="form-group">
					<label for="fundingTotalprice" class="col-sm-3 control-label">현재모금액</label>
					<div class="col-sm-9">
						<input type="text" name="fundingTotalprice" id="fundingTotalprice"
							placeholder="현재모금액" class="form-control"
							value="${selectVo.fundingTotalprice}" readonly="readonly">
					</div>
				</div>
				<!-- /.form-group -->

				<div align="center">
					<button type="submit" value="등록" class="btn btn-primary ">펀딩
						요청받기</button>
					<button type="reset" value="취소" class="btn btn-primary ">취소</button>
				</div>

			</form>
			<!-- /form -->
		</div>
	</div>
	<!-- ./container -->
</body>

</html>