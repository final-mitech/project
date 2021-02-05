<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>funding/fundingList.jsp</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<!-- 부트스트랩 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<style>
.form-control {
	font-size: 10px;
}

.search {
	width: 250px;
	height: 30px;
}

.sort {
	width: 140px;
	float: left;
}

.serach {
	display: inline-block;
	float: right;
}

/* .h6.mb-0.mr-3 {
	padding: 1em;
} */
.clickSelect {
	width: 310px;
	height: 510px;
}

.card-body {
	height: 300px;
}
</style>

</head>

<body>

	<div class="container" style="max-width: 1400px;">
		<!-- 		<div class="row"> -->

		<div class="div sort">
			<a href="fundingList?sort=registrationSort">등록순</a> <a
				href="fundingList?sort=popularitySort">인기순</a>
		</div>
		<form action="fundingList">
			<div class="input-group div search">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요"
					name="fundingBrand">​​​​​​​
				<button type="submit">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>

		<div class="row">
			<div class="div register" align="right">
				<button type="button" class="btn btn-dark"
					onclick="location.href='fundingInsertForm.do' ">펀딩 요청하기</button>
			</div>
		</div>

		<div class="row text-center">

			<c:forEach items="${fundings }" var="f">

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card clickSelect" data-id="${f.fundingId }">
						<img class="card-img-top" src="../images/${f.fundingImage }"
							alt="Card image" style="width: 305px" height="260px"
							align="center">
						<div class="card-body">
							<h5 class="card-title" align="left" style="display: inline">
								<b>${f.fundingTitle }</b>
							</h5>
							<br />

						</div>
						<div class="card-footer" style="background-color:white; border: 0;" >
							<!-- 라벨 색 -->
							<div>
								<c:choose>
									<c:when test="${f.fundingCondition eq '펀딩오픈예정'}">
										<span class="badge badge-pill badge-secondary"
											style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
									</c:when>
									<c:when test="${f.fundingCondition eq '펀딩중'}">
										<span class="badge badge-pill badge-danger"
											style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
									</c:when>
									<c:when test="${f.fundingCondition eq '펀딩마감'}">
										<span class="badge badge-pill badge-success"
											style="float: right; font-size: 1rem;">${f.fundingCondition }</span>
									</c:when>
								</c:choose>
							</div>
							<!-- 라벨 색 종료 -->
							<br />
							<div>

								<h6 align="right" style="margin-right: 10px;">
									<b>${f.fundingDday }</b>
								</h6>
								<br />

							</div>

							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="row no-gutters align-items-center">
										<div class="col-auto">
											<div class="h6 mb-0 mr-3">
												<b><fmt:formatNumber var="percent"
														value="${f.fundingTotalprice / f.fundingGoal * 100}"
														pattern="##" />${percent }%</b>
											</div>
										</div>
										<!-- 상태바 -->
										<fmt:parseNumber value="${percent}" var="parsePer" />

										<div class="col">
											<c:choose>
												<c:when test="${parsePer ge 100}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-danger"
															role="progressbar" style="width: 100%"
															aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 75}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-warning"
															role="progressbar" style="width: 75%" aria-valuenow="75"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 50}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-info"
															role="progressbar" style="width: 50%" aria-valuenow="50"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 25}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped bg-success"
															role="progressbar" style="width: 25%" aria-valuenow="25"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 10}">
													<div class="progress">
														<div class="progress-bar progress-bar-striped"
															role="progressbar" style="width: 10%" aria-valuenow="10"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</c:when>
												<c:when test="${parsePer ge 0}">
													<div class="progress">
														<div class="progress-bar progress-bar" role="progressbar"
															style="width: 0%" aria-valuenow="0" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</c:when>
											</c:choose>
										</div>
										<!-- 상태바 종료 -->
									</div>
								</div>
								<div class="col-auto">
									<!--  <i class="fas fa-clipboard-list fa-2x text-gray-300"></i> -->
								</div>
							</div>

							<div class="col-auto">
								<h6 align="center">
									<b>${f.fundingTotalprice } eth / ${f.fundingGoal } eth</b>
								</h6>
							</div>

						</div>
					</div>
				</div>

			</c:forEach>

		</div>
		<div style="float: center;">
			<tag:historyPaging jsFunc="goList" />
		</div>

	</div>
	<!-- 모달 창 보여주기 -->
	<div class="modal fade" id="modalInsert" tabindex="-1" role="dialog"
		aria-labelledby="modalInsertLabel" aria-hidden="ture">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aira-hidden="ture">&times;</button>
					<h4 class="modal-title" id="modalInsertLabel">펀딩 요청 등록</h4>
				</div>
				<div class="modal-body">펀딩 요청 등록이 성공적으로 완료되었습니다. 마이페이지의 펀딩 내역을
					확인해주세요.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">이버튼은뭐지</button>
				</div>
			</div>
			<!-- modal-content 끝 -->
		</div>
		<!-- modal-dialog 끝 -->
	</div>


	<!-- ****************************script**************************** -->
	<script type="text/javascript">
	<!-- 모달 창 제이쿼리 -->
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		function checkModal(result) {
			if (result === '') {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body")
						.html("상품 " + parseInt(result) + " 번이 등록되었습니다.");
			}

			$("#modalInsert").modal("show");
		}
	</script>

	<!-- clickSelect : 펀딩 상세보기 -->
	<script>
		$('.clickSelect').on('click', clickSelectFunc);

		function clickSelectFunc() {
			console.log($(this));
			let id = $(this).data('id');

			location.href = 'fundingSelect?fundingId=' + id;
		}

		//페이징
		function goList(page) {
			location.href = 'fundingList?page=' + page;
		}
	</script>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

</body>

</html>