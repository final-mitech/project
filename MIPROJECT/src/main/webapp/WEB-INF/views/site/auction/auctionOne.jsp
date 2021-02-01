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
	<script type="text/javascript" src="/auction/js/abi.js"></script>
	<script type="text/javascript" src="/auction/js/index.js"></script>
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
			padding: 5% 10% 5% 30%;
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
			border: 1px solid  #f5f5f5;

		}
		.thead{
			background-color:rgb(192, 184, 177);
		}
	</style>
</head>

<body>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-5" align="center">
				<br />
				<img class="card-img-top" src="/etoile/images/${vo.auctionImage}" alt="Card image" style="width: 100%"> 
				<br />
				<br />
				<br />
				<br />
				<table class="table table-sm" id="table1">
					<tr align="center">
						<thead class="thead" align="center">
							<th>상품명</th>
							<th>현재 최고액 참여자</th>
						</thead>
					</tr>
					<tr align="center">
						<td>${vo.auctionName}</td>
						<td>${to.memberId}</td>
					</tr>
				</table>
				<br />
				<br />
				<table class="table table-sm">
					<tr align="center">
						<thead class="thead" align="center">
							<th>최근아이디</th>
							<th>입찰가격</th>
						</thead>
					</tr>
					<c:forEach var="jo" items="${list }">
						<tr align="center">
							<td>${jo.memberId}</td>
							<td>${jo.auctionPay}eth</td>
						</tr>
					</c:forEach>
				</table>
				<form action="" id="join" name="join" method="post">
					아이디: <input class="form-control" id="memberId" name="memberId" value="세션3"><br>
					경매 가: <input class="form-control" id="auctionPay" name="auctionPay" value=""><br>
					경매번호: <input class="form-control" id="auctionId" name="auctionId" value="${vo.auctionId}"><br>
				</form>
			</div>

			<div class="col-1"></div>

			<div class="col-6">
				<div>
					<form id="frm" name="frm" action="actionJoinForm.do" method="post">
						<div class="form-group">
							<label for="">상품명</label> <input type="text" class="form-control info" id="" name=""
								value="${vo.auctionName}" style="width: 60%" readonly>
						</div>
						<div class="form-group">
							<label for="">경매번호</label> <input type="text" class="form-control info" id=""
								value="${vo.auctionId}" name="" style="width: 60%" readonly>
						</div>
						<div class="form-group">
							<label for="">브랜드명</label> <input type="text" class="form-control info" id=""
								value="${vo.auctionBrand}" name="" style="width: 60%" readonly>
						</div>
						<div class="form-group">
							<label for="bcontent">상세내용</label>
							<textarea type="text" class="form-control info" id="" value="auctionContent" name=""
								readonly></textarea>
						</div>
						<div class="form-group">
							<label for="">현재입찰가</label> <input type="text" class="form-control info" id="bestPrice"
								value="${vo.auctionBestPrice}" name="bestPrice" style="width: 30%" readonly>eth
						</div>
						<div class="form-group">
							<label for="">즉시낙찰가</label> <input type="text" class="form-control info" id=""
								value="${vo.auctionImmediateBid}" name="" style="width: 30%" readonly>eth
						</div>
						<br />
						<button type="button" class="btn btn-success" align="center" data-toggle="modal"
							data-target="#bidModal" id="joinBid">경매 참여</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-outline-secondary" align="center"
							onclick="location.href='auctionMain'">목록</button>
						<br />
						<br />
						<div class="modal fade" id="bidModal">
							<div class="modal-dialog modal-dialog-centered modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">입찰 정보</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label for="">아이디</label>
											<input type="text" class="form-control" id="name" value="세션아이디" name=""
												style="width: 60%" readonly><br />
										</div>
										<div class="form-group">
											<label for="">상품명</label>
											<input type="text" class="form-control" id="title" value="${vo.auctionName}"
												name="" style="width: 60%" readonly>
										</div>
										<br />
										<div class="form-group form-inline">
											<label for="">입찰가</label>&nbsp;&nbsp;
											<input type="text" class="form-control" id="bid" name="" value=""
												style="width: 10%; text-align: center; font-size: medium; font-weight: bold;">&nbsp;eth<br />
										</div>
									</div>
									<div class="modal-footer">
										<span class="rounded">
											<p>낙찰하기 버튼을 누르면 현재 최고가에서 1eth 증가한 경매가로 참여합니다.</p>
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
	$('#joinBid').click(function () {
		//경매 가 세팅
		var bestPrice = $('#bestPrice').val();
		console.log(bestPrice);

		var sum = parseInt(bestPrice) + parseInt(1);
		console.log(sum);

		$('#bid').attr('value', sum);
		$('#auctionPay').attr('value', sum);
	});
</script>

</html>