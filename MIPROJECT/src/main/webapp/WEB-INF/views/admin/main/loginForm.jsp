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
<script>
function result(){
	let id = $('#id').val();
	let pwd = $('#password').val();
	$.ajax({
		url : "/etoile/admin/loginResult",
		data : {
			id : id,
			password : pwd
		},
		type : "POST",
		success : function(result) {
			if (result == 0) {
				alert("로그인에 실패했습니다. 정보를 다시 확인해주세요.");
			} else {
				document.frm.submit();
			}
		},
		error : function(reject) {
			console.log(reject);
		}
	})

}
</script>
</head>
<body>
	<div class="container text-center" >
		<div class="row mt-3">
			<div class="col-3"></div>
			<div class="col-6">
				<form id="frm" name="frm" method="post" action="/etoile/admin/login">
					<div class="row mb-3">
						<div class="col-3">
							<label for="id" class="form-label">Id</label>
						</div>
						<div class="col-9">
							<input type="text" class="form-control" name="id" id="id">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<label for="password" class="form-label">Password</label>
						</div>
						<div class="col-9">
							<input type="password" class="form-control" name="password"
								id="password">
						</div>
					</div>
					<div class="mb-3 form-check"></div>
					<input type="button" id="submitBtn" onclick="result()"class="btn btn-dark" value="Login">
				</form>
			</div>
			<div class="col-3"></div>
		</div>

	</div>

</body>
</html>