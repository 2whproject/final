<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<head>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
</script>
<title>find.jsp</title>
</head>
<body class="register-page">
	<div class="register-box">
				<div class="register-logo">
					<p class="register-box-msg">계정찾기</p>
				</div>
				<div class="register-box-body">
				<form id="registerForm" role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">이메일 주소</label>
							<input type="email" id="email" name="email" class="form-control" placeholder="가입 시 입력한 이메일 주소를 입력해주세요" required="required">
							<p id="email" style="color: red;"> </p>
						</div>
					</div>
					<div class="box-footer text-right">
						<button type="submit" class="btn btn-primary">확인</button>
					</div>
				</form>
				</div>
			<script>
		var result = '${msg}';
		var id = '${id}';
		var pw = '${pass}';
		var email = '${email}';
		if (result == 'FAIL') {
			alert ("해당 이메일로 가입된 아이디가 없습니다!");
		} else if (result == 'SUCCESS') {
			alert("ID와 비밀번호를 찾았습니다." + "\n" + "ID = " + id + "\n" + "비밀번호 = " + pw);
		}
			</script>
	</div>
</body>
</html>