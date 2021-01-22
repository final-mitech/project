<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	text-align: center;
}

tr {
	hight: 20px;
}

th {
	font-size: 10px;
}

input {
	float: left;
	BORDER-BOTTOM: 1px solid;
	BORDER-LEFT: medium none;
	BORDER-RIGHT: medium none;
	BORDER-TOP: medium none;
}
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function PostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#rental_pay").click(function() {
			IMP.init('imp74103314');
			IMP.request_pay({
				pg : 'inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				//결제창에서 보여질 이름
				amount : 10000,
				//가격
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : document.getElementById('address').value,
				buyer_postcode : '123-456',
				m_redirect_url : 'ProductList.do'
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
				} else {
					var msg = '결제에 실패하였습니다.';
				}
				alert(msg);
			});
		});
	})
</script>
<script>
$(function() {
		var dday = new Date(${startRental}).getTime();
		var now = new Date(${endRental}).getTime();
		var distance = dday - now + 1;
		document.getElementById("renDay").value = distance;
})
</script>

</head>
<body>
	<br />
	<div class="container">
		<div>
			<table align="center">
				<tr>
					<th></th>
					<th width="300">상품명</th>
					<th width="300">주문 금액</th>
				</tr>
				<tr>
					<th><img src="${product.productImage }" width="200"></th>
					<th width="400" style="font-size: 15px;">
						"${product.productName }"</th>
					<th width="300" style="font-size: 15px;">
						${product.productRental }</th>
				</tr>
			</table>
		</div>
		<hr>
		<div class="row">
			<div class="col-8">
				<br> <br> <br> <br>
				<table align="center">
					<tr>
						<th width="200px" style="font-size: 15px;">대여자 명</th>
						<td width="400px"><input type="text" style="float: left;"
							size="50">
					</tr>
					<tr>
						<th width="200px" style="font-size: 15px;">대여 일수</th>
						<td width="400px"><input type="text" id="renDay" name="renDay" style="float: left;"
							size="50">
					</tr>
					<tr>
						<th width="200px" style="font-size: 15px;" rowspan="4">주소</th>
						<td width="400px"><input type="text" id="postcode" size="10"
							placeholder="우편번호" readonly>
						<button onclick="PostCode()" style="float: left">검색</button>
					</tr>
					<tr>
						<td><input type="text" id="address" size="50"
							placeholder="주소" readonly /></td>
					</tr>
					<tr>
						<td><input type="text" id="detailAddress" size="50"
							placeholder="상세주소"></td>
					</tr>
					<tr>
						<td><input type="text" id="extraAddress" size="50"
							placeholder="참고항목" readonly></td>
					</tr>
				</table>
			</div>
			<div class="col-4">
				<br> <br> <br>
				<table align="center">
					<tr>
						<th style="font-size: 15px;">결제 금액</th>
					</tr>
					<tr>
						<th style="font-size: 18px; vertical-align: top;" height="50px">${product.productRental }</th>
					</tr>
					<tr>
						<th style="font-size: 13px;">총 상품금액</th>
					</tr>
					<tr>
						<th><button type="button" class="btn btn-secondary"
								id="rental_pay">결제하기</button></th>
					</tr>
				</table>
			</div>

		</div>
	</div>
</body>
</html>