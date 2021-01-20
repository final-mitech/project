<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	 text-align : center;
}
tr{
	hight : 20px;
}
th {
	font-size : 10px;
}
input {
	 float: left;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function PostCode(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	var addr = ''; 
                var extraAddr = ''; 
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
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
					<th width="400" style="font-size:15px;">${product.productName }</th>
					<th width="300" style="font-size:15px;">${product.productRental }</th>
				</tr>
			</table>
		</div>
		<hr>
		<div class="row">
			<div class="col-8">
				<br> <br> <br> <br>
				<table align="center">
					<tr>
						<th width="200px" style="font-size:15px;">대여자 명</th>
						<td width="400px"><input type="text" style="float: left;">
					</tr>
					<tr>
						<th width="200px" style="font-size:15px;">대여 일수</th>
						<td width="400px"><input type="text" style="float: left;">
					</tr>
					<tr>
						<th width="200px" style="font-size:15px;">주소</th>
						<td width="400px">
							<input type="text" id="postcode" size="15"> <button onclick="PostCode()">검색</button><br />
							<input type="text" id="address" size="50"  placeholder="주소" readonly /><br />
							<input type="text" id="detailAddress" size="50" placeholder="상세주소"><br />
							<input type="text" id="extraAddress" size="50" placeholder="참고항목" readonly>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-4">
				<br><br><br>
				<table align="center">
					<tr>
						<th style="font-size:15px;">결제 금액</th>
					</tr>
					<tr>
						<th style="font-size:18px; vertical-align: top;" height="50px">${product.productRental }</th>
					</tr>
					<tr>
						<th style="font-size:13px;">총 상품금액</th>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
</body>
</html>