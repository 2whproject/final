<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Log in</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>	
  <body class="login-page">
    <c:if test="${login.uname == null}">
		<div class="login-box">
			<div class="login-logo">
				<a href="/resources/index2.html"><b>Zerock</b>Project</a>
			</div>
			<!-- /.login-logo -->
			<div class="login-box-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form action="/user/loginPost" method="post">
					<div class="form-group has-feedback">
						<input type="text" name="uid" class="form-control"
							placeholder="ID" required="required" /> <span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="upw" class="form-control"
							placeholder="비밀번호" required="required" /> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-xs-8">
							<div class="checkbox icheck">
								<label> <input type="checkbox" name="useCookie">
									자동 로그인
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-xs-4">
							<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<!-- /.col -->
					</div>
				</form>


				<a href="/member/find">ID & 비밀번호 찾기</a><br> <a
					href="/member/register" class="text-center">새로운 회원으로 가입</a><br>
				<br>
				<p id="error" style="color: red;"></p>

			</div>
			<!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->

		<!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
    <script>
		var result = '${msg}';
		var log = '${log}';
		var name = '${name}';
		var id = '${id}';
		var pw = '${pass}';
		if (result == 'SUCCESS') {
			alert("계정 등록 성공." + "\n" + "환영합니다, " + name + "!");
		}
		if (log == 'FAIL') {
			document.getElementById("error").innerHTML="ID가 존재하지 않거나 비밀번호가 잘못되었습니다.";
		}
		if (result == 'FIND') {
			alert("ID와 비밀번호를 찾았습니다." + "\n" + "ID = " + id + "\n" + "비밀번호 = " + pw);
		}
	</script>
  </c:if>
	<c:if test="${login.uname != null}">
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			location.href ="/";
		</script>
	</c:if>
  </body>
</html>