<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>경매메인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.2.0/dist/web3.min.js"></script>
	<script type="text/javascript" src="/etoile/resources/js/biddingAbi.js"></script>
	<script type="text/javascript" src="/etoile/resources/js/biddingIndex.js"></script>
	<style>
		span {
			display: inline-block;
			width: 100%;
			padding: 2% 5% 1% 18%;
			background-color: black;
			color: aliceblue;
			font-size: small;
		}

		.modal-body {
			padding: 5% 10% 5% 25%;
		}

		.modal-body input[readonly] {
			background-color: #f5f5f5;
			border-color: #f5f5f5;
			border: 1px solid #ebebeb;
			border-bottom-color: #e2e2e2;
			border-radius: .25em;
		}

		.info[readonly] {
			background-color: #f5f5f5;
			border-color: #f5f5f5;
			border: 1px solid #f5f5f5;

		}

		.thead {
			background-color: rgb(192, 184, 177);
		}
	</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-5" align="center">
				<br />
				<h3 align="left" style="padding-left:10px;">Auction Info</h3>
				<br />
				<img class="card-img-top" onerror="this.src='/etoile/images/노이미지1.png';" src="/etoile/images/${vo.auctionImage}" alt="Card image" style="width: 100%">
				<br />
				<br />
				<br />
				<h6 align="left">최고액 입찰자</h6>
				<table class="table table-sm" id="table1">
					<tr align="center">
						<thead class="thead" align="center">
							<th>상품명</th>
							<th>입찰자 ID</th>
						</thead>
					</tr>
					<tr align="center">
						<td>${vo.auctionName}</td>
						<td>${to.memberId}</td>
					</tr>
				</table>
				<br />
				<h6 align="left">최근 입찰자</h6>
				<table class="table table-sm">
					<tr align="center">
						<thead class="thead" align="center">
							<th>최근 ID</th>
							<th>입찰가</th>
						</thead>
					</tr>
					<c:forEach var="jo" items="${list }">
						<tr align="center">
							<td>${jo.memberId}</td>
							<td>${jo.auctionPay}&nbsp;Milli</td>
						</tr>
					</c:forEach>
				</table>
				<form style="display: none;" id="join" name="join" method="post">
					아이디: <input class="form-control" id="memberId" name="memberId" value="${loginId }"><br>
					경매 가: <input class="form-control" id="auctionPay" name="auctionPay" value=""><br>
					경매번호: <input class="form-control" id="auctionId" name="auctionId" value="${vo.auctionId}"><br>
				</form>
			</div>

			<div class="col-1"></div>

			<div class="col-6">
				<br />
				<br />
				<br />
				<div>
					<form id="frm" name="frm" action="" method="post">
						<div class="form-group">
							<label for="">Title</label> <input type="text" class="form-control info" id="" name=""
								value="${vo.auctionTitle}" style="width: 60%; text-align:center;" readonly>
						</div>
						<div class="form-group">
							<label for="">상품명</label> <input type="text" class="form-control info" id="" name=""
								value="${vo.auctionName}" style="width: 60%; text-align:center;" readonly>
						</div>
						<div class="form-group">
							<label for="">경매번호</label> <input type="text" class="form-control info" id=""
								value="${vo.auctionId}" name="" style="width: 30%; text-align:center;" readonly>
						</div>
						<div class="form-group">
							<label for="">브랜드명</label> <input type="text" class="form-control info" id=""
								value="${vo.auctionBrand}" name="" style="width: 30%; text-align:center;" readonly>
						</div>
						<div class="form-group">
							<label for="bcontent">상세내용</label>
							<textarea class="form-control info" id="" name=""
								readonly>${vo.auctionContent}</textarea>
						</div>
						<br />
						<input type="hidden" id="won" name="won" value="${won}">
						<div class="form-inline">
							<label for="">현재입찰가</label>&nbsp;<input type="text" class="form-control info" id="bestPrice"
								value="${vo.auctionBestPrice}" name="bestPrice" style="width: 15%; text-align:center;"
								readonly>&nbsp;Milli
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" class="form-control info"
								id="auctionBestPriceWon" value="" name="auctionBestPriceWon"
								style="width: 20%; text-align:center;" readonly>&nbsp;원
						</div>
						<br />
						<div class="form-inline">
							<label for="">즉시낙찰가</label>&nbsp;<input type="text" class="form-control info"
								id="auctionImmediateBid" value="${vo.auctionImmediateBid}" name="auctionImmediateBid"
								style="width: 15%; text-align:center;" readonly>&nbsp;Milli
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" class="form-control info"
								id="auctionImmediateBidWon" value="" name="auctionImmediateBidWon"
								style="width: 20%; text-align:center;" readonly>&nbsp;원
						</div>
						<br />
						<br />
						<c:if test="${vo.auctionCondition eq '1'}">
							<button type="button" class="btn btn-success btn-lg" align="center" data-toggle="modal"
								data-target="" id="joinBid" style="margin-left: 120px;">경매 참여</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<button type="button" class="btn btn-outline-secondary" align="center"
							onclick="location.href='auctionMain'">목록</button>
						<br />
						<br />
						<div class="modal fade" id="bidModal">
							<div class="modal-dialog modal-dialog-centered modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">Bid Info</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label for="">아이디</label>
											<input type="text" class="form-control" id="" value="${loginId }" name=""
												style="width: 40%" readonly><br />
										</div>
										<div class="form-group">
											<label for="">상품명</label>
											<input type="hidden" id="id" name="id" value="${vo.auctionId}">
											<input type="text" class="form-control" id="title" value="${vo.auctionName}"
												name="" style="width: 60%" readonly>
										</div>
										<br />
										<c:if test="${vo.auctionBestPrice +1 ne vo.auctionImmediateBid}">
											<div class="form-group form-inline">
												<input type="radio" class="form-control" id="bid" name="checkBid"
													value="" style="width: 3%;">&nbsp;
												입찰가&nbsp;<input type="text" class="form-control" id="bid1"
													style="width: 15%; height:30px; text-align: center; font-size: medium; font-weight: bold;">&nbsp;Milli
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" class="form-control" id="immediateBid"
													name="checkBid" value="" style="width: 3%;">&nbsp;
												즉시낙찰가&nbsp;<input type="text" class="form-control" id="immediateBid1"
													style="width: 15%; height:30px; text-align: center; font-size: medium; font-weight: bold;">&nbsp;Milli<br />
											</div>
										</c:if>
										<c:if test="${vo.auctionBestPrice +1 eq vo.auctionImmediateBid}">
											<div class="form-group form-inline">
												<input type="hidden" class="form-control" id="bid" name="checkBid"
													value="" style="width: 3%;">
												<input type="radio" class="form-control" id="immediateBid"
													name="checkBid" value="" style="width: 3%;">&nbsp;
												즉시낙찰가&nbsp;<input type="text" class="form-control" id="immediateBid1"
													style="width: 15%; height:30px; text-align: center; font-size: medium; font-weight: bold;">&nbsp;Milli<br />
											</div>
										</c:if>
									</div>
									<div class="modal-footer">
										<span class="rounded">
											<p>낙찰하기 버튼을 누르면 현재 최고가에서 1Milli 증가한 경매가로 참여합니다.</p>
											<p>다음참여자가 낙찰하면 계좌로 환불해 드리며, 마이페이지에서 확인 가능 합니다.</p>
										</span>
										<button type="button" class="btn btn-warning btn-block btn-lg" id="bidBtn"
											style="height: 100%; font-weight: bold;">입찰합니다!</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
</body>
<script>
	var memberId = $('#memberId').val();
	console.log(memberId);

	var bestPrice = $('#bestPrice').val();
	var auctionImmediateBid = $('#auctionImmediateBid').val();	

	//전자화폐 원화 환율 (1eth = 1000*milli)
	var won = $('#won').val();
	miliWon = parseInt(won) / parseInt(1000); 

	if( won != ""){
		var bestWon = miliWon * parseInt(bestPrice);
		bestWon = String(bestWon);
		bestWon = bestWon.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#auctionBestPriceWon').attr('value', bestWon);

		var immediateWon = miliWon * parseInt(auctionImmediateBid);
		immediateWon = String(immediateWon);
		immediateWon = immediateWon.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#auctionImmediateBidWon').attr('value', immediateWon);

	}else{
		$('#auctionBestPriceWon').attr('value', "");
		$('#auctionImmediateBidWon').attr('value', "");
	}


	$('#joinBid').click(function () {
		//로그인 체크
		if (memberId == '') {
			location.href = "/etoile/site/loginForm";
		} else {
			$('#joinBid').attr('data-target', '#bidModal');
		}

		//경매 가 세팅
		var sum = parseInt(bestPrice) + parseInt(1);

		$('#bid').attr('value', sum);
		$('#bid1').attr('value', sum);

		$('#immediateBid').attr('value', auctionImmediateBid);
		$('#immediateBid1').attr('value', auctionImmediateBid);

	});

	$('#bid').click(function () {
		$('#auctionPay').attr('value', $('#bid1').val());
	})

	$('#immediateBid').click(function () {
		$('#auctionPay').attr('value', $('#immediateBid1').val());
	})
</script>

</html>