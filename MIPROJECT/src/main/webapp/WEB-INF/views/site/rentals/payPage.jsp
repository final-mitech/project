<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
	height: 25px;
}

th {
	font-size: 17px;
}

input {
	float: left;
	BORDER-BOTTOM: 1px solid;
	BORDER-LEFT: medium none;
	BORDER-RIGHT: medium none;
	BORDER-TOP: medium none;
}

input[type= "checkbox" ] {
	float: none;
}

input:focus {
	outline: none;
}
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	//주소찾기 API
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
<script>
	//기간별 금액적용
$(function() {
		var dday = new Date(${rentalStart}).getTime();
		var now = new Date(${rentalEnd}).getTime();
		var distance = dday - now + 1;
		
		var rPay = distance * ${product.productRental}; 
		var pRental = (rPay).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		document.getElementById("renDay").value = distance;
		document.getElementById("rentalPay").value = pRental;
		document.getElementById("totalrentalPay").value = pRental;
})
</script>
<script>
	//쿠폰적용
	$(document).ready( function() {
		$("#couponUsed").on("change", function() {
			var rentalPay = Number((document.getElementById("rentalPay").value).replace(/,/g , ''));
			var rentalDay = document.getElementById("renDay").value;
			var couponUsed = document.getElementById("couponUsed").value;
			var kind = $("#couponUsed option:selected").data("kind");
			var id = $("#couponUsed option:selected").data("id");
			
			console.log(id);
			if (couponUsed == "notused") {
				var notCpnPay = 0;
				$("#couponUse").val(notCpnPay);
				var pRental = (rentalPay).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#totalrentalPay").val(pRental);
			}  else if (kind == 'g') {
				var gCpn = $("#couponUsed option:selected").val();
				var gCpn = gCpn * 0.01;
				var gCpnPay = gCpn * rentalPay;
				var pRental = (gCpnPay).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#couponUse").val(pRental);
				var gCpnUsePay = rentalPay - Number($("#couponUse").val().replace(/,/g , ''));
				var pRental = (gCpnUsePay).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#totalrentalPay").val(pRental);
				$("#couponId").val(id);
			} else if (kind == 'f') {
				var fCpn = $("#couponUsed option:selected").val();
				var gCpn = fCpn * ${product.productRental };
				var pRental = (gCpn).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#couponUse").val(pRental);
				
				var gCpnUsePay = Number($("#couponUse").val().replace(/,/g , ''));
				
				if ( 0 > rentalPay-gCpnUsePay) {
					$("#totalrentalPay").val("0");
				} else {
					var pRental = (rentalPay-gCpnUsePay).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#totalrentalPay").val(pRental);
				}
				$("#couponId").val(id);
			}  
		})
	})
</script>
<script type="text/javascript">
	//결제 API
	$(function() {
		$("#rental_pay").click(function() {
			var rentalPay = Number((document.getElementById("totalrentalPay").value).replace(/,/g , ''));
			var rentalName= document.getElementById('rentalName').value;
			var rentalEmail = document.getElementById('email').value;
			var renTalAddress = document.getElementById('address').value;
			var renTalPostcode = document.getElementById('postcode').value;
			var ProductName = document.getElementById('productName').value;
			var rentalOrder = 'ren_' + new Date().getTime();
			document.getElementById('rentalOrder').value = rentalOrder;
			IMP.init('imp74103314');
			IMP.request_pay({
				pg : 'inicis',
				pay_method : 'card',
				merchant_uid : 'ren_' + new Date().getTime(),
				name : ProductName,
				//결제창에서 보여질 이름
				amount : rentalPay,
				//가격
				buyer_email : rentalEmail,
				buyer_name : rentalName,
				buyer_tel : "010-1234-1234",
				buyer_addr : renTalAddress,
				buyer_postcode : renTalPostcode,
				m_redirect_url : 'ProductList.do'
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					//결제 성공시 상품리스트로 이동
					$("#frm").submit();
				} else {
					var msg = '결제에 실패하였습니다.';
				}
				alert(msg);
			});
		});
	})
</script>

<script>
	function checkA(tag) {
		var check = document.getElementsByName("checkAddress");
		var totalA = "${member.address}";
		var array = totalA.split(","); 
		
		for (var i=0; i<check.length; i++) {
			if (check[i] != tag){
			check[i].checked = false;
			}
		}
		
		for(var j=0; j<check.length; j++) {
			if (check[j].checked == true) {
				if (check[j].value == "memUser"){
					document.getElementById("rentalName").value = "${member.name}";
					document.getElementById("phone").value = "${member.phone}";
					document.getElementById("postcode").value = array[0].substr(0,7);
					document.getElementById("address").value = array[0].substr(8);
					document.getElementById("detailAddress").value = array[1].substr(1);
				}
				else if (check[j].value == "newUser") {
					document.getElementById("rentalName").value = "";
					document.getElementById("phone").value = "";
					document.getElementById("postcode").value = "";
					document.getElementById("address").value = "";
					document.getElementById("detailAddress").value = "";
				}
			}
		}
	}
</script>

</head>
<body>
	<br />
	<form id="frm" action="RentalInsert.do">
		<div class="container" style="max-width: 1400px;">
			<div>
				<table align="center">
					<tr style="height:5px">
						<th></th>
						<th width="400">상품명</th>
						<th width="300">주문 금액</th>
						<th width="200">쿠폰</th>
					</tr>
					<tr style="height:10px">
						<th><img src="${product.productImage }" width="200"></th>
						<th width="400" style="font-size: 15px;">
							"${product.productName }"</th>
						<th width="300" style="font-size: 15px;">
							<fmt:formatNumber type="currency" maxFractionDigits="3" value="${product.productRental }" /></th>
						<th width="200" style="font-size: 15px;">
							<select id="couponUsed">
								<option value="notused" selected>사용안함</option>
								<c:forEach var="coupons" items="${coupon }">
									<c:if test="${coupons.fundingCoupon eq 0 && coupons.couponUsed eq 0}">
										<option data-id="${coupons.couponId}" data-kind="g" value="${coupons.gradeCoupon }">${coupons.gradeCoupon } % 할인쿠폰</option>
									</c:if>
									<c:if test="${coupons.gradeCoupon eq 0 && coupons.couponUsed eq 0 && coupons.couponSort eq product.productName}">
										<option data-id="${coupons.couponId}" data-kind="f" value="${coupons.fundingCoupon }">${coupons.fundingCoupon } 일 대여권</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
					</tr>
				</table>
			</div>
			<hr>
			<div class="row">
				<input type="hidden" id="couponId" name="couponId">
				<input type="hidden" name="productId" value="${product.productId }">
				<input type="hidden" id="rentalOrder" name="rentalOrder">
				<input type="hidden" id="productName" name="productName"
					value="${product.productName }">
				<div class="col-9">
					<br>
					<table align="center">
						<tr>
							<th style="font-size:13px">
								<input type="checkbox" name="checkAddress" value="newUser" onclick='checkA(this)'>새 주소
							</th>
							<th style="font-size:13px">
								<input type="checkbox" name="checkAddress" value="memUser" onclick='checkA(this)'>내 주소
							</th>
						</tr>
						<tr>
							<th width="200px" style="font-size: 15px;">대여자 명</th>
							<td width="400px" colspan="2"><input type="text"
								style="float: left;" id="rentalName" name="rentalName"
								size="50"></td>
						</tr>
						<tr>
							<th width="200px" style="font-size: 15px;">연락처</th>
							<td width="400px" colspan="2"><input type="text" id="phone"
								name="phone" style="float: left;" size="50"
								></td>
						</tr>
						<tr>
							<th width="200px" style="font-size: 15px;" rowspan="4">주소</th>
							<td width="100px"><input type="text" id="postcode" size="10"
								placeholder="우편번호" readonly></td>
							<td>
								<button type="button" onclick="PostCode()" style="float: left">검색</button>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" id="address"
								name="address" size="50" placeholder="주소" readonly /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" id="detailAddress"
								name="detailAddress" size="50" placeholder="상세주소"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" id="extraAddress"
								size="50" placeholder="참고항목" readonly></td>
						</tr>
						<tr>
							<th width="200px" style="font-size: 15px;">대여 일수</th>
							<td width="400px" colspan="2">
								<input type="text" id="renDay" name="renDay" style="float: left;" size="50" readonly>
							</td>
						</tr>
						<tr>
							<th width="200px" style="font-size: 15px;">대여 일</th>
							<td width="180px">start <input type="text" id="rentalStart"
								name="rentalStart" value="${rentalStart }" size="15"
								style="float: none;" readonly>
							</td>
							<td width="180px">end <input type="text" id="rentalEnd"
								name="rentalEnd" value="${rentalEnd }" size="15"
								style="float: none;" readonly>
							</td>
						</tr>
						<tr>
							<th width="200px" style="font-size: 15px;">EMail</th>
							<td width="400px" colspan="2"><input type="text"
								style="float: left;" id="email" name="email" value="${email }"
								size="50">
						</tr>
					</table>
				</div>
				<div class="col-3">
					<br> <br> <br>
					<table align="center">
						<tr>
							<th style="font-size: 13px;">총 상품금액</th>
						</tr>
						<tr>
							<th style="height:20">
								<input type="text" id="rentalPay" name="rentalPay" size="30" 
									style="text-align: center; BORDER-BOTTOM: none; font-size: 15px;" readonly>
							</th>
						</tr>
						<tr>
							<th style="font-size: 13px;">쿠폰적용가</th>
						</tr>
						<tr>
							<th>
								<input type="text" id="couponUse" name="couponUse" value="0" size="30" 
									style="text-align: center; BORDER-BOTTOM: none; font-size: 15px;" readonly>
							</th>
						</tr>
						<tr>
							<th style="font-size: 15px;">결제 금액</th>
						</tr>
						<tr>
							<th style="font-size: 18px; vertical-align: top;" height="50px">
								<input type="text" id="totalrentalPay" name="totalrentalPay" value="${product.productRental }"
									style="font-size: 18px; font-weight: bold; text-align: center; BORDER-BOTTOM: none;" readonly>
							</th>
						</tr>
						<tr>
							<th>
								<button type="button" class="btn btn-secondary" id="rental_pay">결제하기</button>
							</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>