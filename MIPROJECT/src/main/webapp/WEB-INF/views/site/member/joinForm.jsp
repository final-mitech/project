<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<script>
	//아이디 중복체크
	function idCheck() {
		let id = $('#memberId').val();

		if (id != '' && ($('#checked').val() == 0 || id != $('#checked').val())) {
			$.ajax({
				url : "idChecked",
				data : {
					memberId : id
				},
				type : "POST",
				success : function(result) {
					if (result == 0) {
						alert("아이디를 사용할 수 있습니다.");
						$('#checked').val(id);
					} else {
						alert("아이디를 사용할 수 없습니다.");
					}
				},
				error : function(reject) {
					console.log(reject);
				}
			})
		}
	}

	//전송 전 중복체크 여부 및 비밀번호 일치여부 확인
	function inputCheck() {
		let checkedId = false;
		let checkedPwd = false;

		//중복체크여부
		if ($('#memberId').val() == $('#checked').val()) {
			checkedId = true;
		} else {
			alert("중복 체크를 진행해주시기 바랍니다.");
		}

		//비밀번호 일치여부
		if ($('#password').val() != ''
				&& $('#password').val() == $('#rePwd').val()) {
			checkedPwd = true;
		} else {
			alert("비밀번호가 일치하지 않습니다.");
		}


		if (checkedId && checkedPwd) {
			document.frm.action = "memberInsert";
			document.frm.submit();
		}

	}
</script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수


                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<br />
		</div>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<form id="frm" name="frm" action="#" method="POST"
					onsubmit="return inputCheck()">
					<!-- 아이디 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-id-badge"></i>
							</span>
						</div>
						<input id="memberId" name="memberId" class="form-control"
							placeholder="Id" type="text"> <input type="button"
							class="btn btn-secondary" onclick="idCheck()" value="Check">
						<input id="checked" name="checked" value="0" type="hidden">
					</div>

					<!-- 이름 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input id="name" name="name" class="form-control"
							placeholder="Full name" type="text">
					</div>

					<!-- 이메일 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input id="email" name="email" class="form-control"
							placeholder="Email address" type="text">
					</div>

					<!-- 휴대폰 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-phone"></i>
							</span>
						</div>
						<input id="phone" name="phone" class="form-control"
							placeholder="Phone number" type="text">
					</div>

					<!-- 비밀번호 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input id="password" name="password" class="form-control"
							placeholder="Create password" type="password">
					</div>

					<!-- 비밀번호 재입력 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input id="rePwd" name="rePwd" class="form-control"
							placeholder="Repeat password" type="password">
					</div>
					<div>
						<input id="checkedPwd" name="checkedPwd" value="0" type="hidden">
					</div>
					<!-- 주소 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-search"></i>
							</span>
						</div>
						<input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호">
						<input type="button" class="btn btn-secondary" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 

					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-address-book"></i>
							</span>
						</div>
						<input type="text" class="form-control" id="address" name="address" placeholder="주소"><br> 
						<input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
					</div>
					<!-- 회원 구분 -->
					
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-id-badge"></i>
							</span>
						</div>
						<div class="form-check form-check-inline">&nbsp;&nbsp;&nbsp;
						  <input class="form-check-input" type="radio" name="grade" id="visit" value="VISIT">
						  <label class="form-check-label" for="visit">개인회원</label>
						</div>
						<div class="form-check form-check-inline">&nbsp;&nbsp;&nbsp;
						  <input class="form-check-input" type="radio" name="grade" id="business" value="BUSINESS">
						  <label class="form-check-label" for="business">기업회원</label>
						</div>
					</div>
					
					<!-- 전송버튼 -->
					<div class="form-group">
						<button type="submit" class="btn btn-dark btn-block">
							Create Account</button>
					</div>

					<!-- 로그인 버튼 -->
					<p class="text-center">
						Have an account? <a href="loginForm">Log In</a>
					</p>
				</form>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
</body>
</html>