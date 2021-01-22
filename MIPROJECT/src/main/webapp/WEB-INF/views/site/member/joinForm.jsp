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
		console.log(id);
		if (id != '' && $('#checked').val() == 0) {
			$.ajax({
				url : "idChecked",
				data : {
					memberId : id
				},
				type : "POST",
				success : function(result) {
					if (result == 0) {
						alert("아이디를 사용할 수 있습니다.");
						$('#checked').val(1);
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
		if ($('#checked').val() == 1) {
			checkedId = true;
		}
		console.log($('#password').val())
		//비밀번호 일치여부
		if ($('#password').val() != ''
				&& $('#password').val() == $('#rePwd').val()) {
			checkedPwd = true;
		}
		if (checkedId && checkedPwd) {
			return true;
		} else if (checkedPwd) {
			alert("중복 체크를 진행해주시기 바랍니다.");
			return false;
		} else if (checkedId) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}

		return false;

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
				<form action="#" method="POST" onsubmit="return inputCheck()">
					<!-- 아이디 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-id-badge"></i>
							</span>
						</div>
						<input id="memberId" name="memberId" class="form-control"
							placeholder="Id" type="text">
						<button class="btn btn-secondary" onclick="idCheck()">중복체크</button>
						<input id="checked" name="checked" vale="0" type="hidden">
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
					<!-- 전송버튼 -->
					<div class="form-group">
						<button type="submit" class="btn btn-dark btn-block">
							Create Account</button>
					</div>

					<!-- 로그인 버튼 -->
					<p class="text-center">
						Have an account? <a href="">Log In</a>
					</p>
				</form>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
</body>
</html>