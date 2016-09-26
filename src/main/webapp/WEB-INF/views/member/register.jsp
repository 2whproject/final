<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>register.jsp</title>
</head>
<body>
<c:if test="${login.uname == null}">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">회원 가입</h3>
				</div>
				<form id="registerForm" role="form" method="post" onsubmit="return check()">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1"><b>ID</b></label>
							<input type="text" id="uid" name="uid" class="form-control" required="required" placeholder="4~12자 사이의 영어와 숫자로 입력해주세요">
							<p id="idnull" style="color: red;"> </p>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">이메일 주소</label>
							<input type="email" id="email" name="email" class="form-control" placeholder="ID&비밀번호 찾기에 필요합니다. 필요 시 기입해주세요">
							<p id="emailerror" style="color: red;"> </p>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"><b>비밀번호</b></label>
							<input type="password" id="pw" name="upw" class="form-control" required="required">
							<p id="pwnull" style="color: red;"> </p>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">비밀번호 확인</label>
							<input type="password" id="cpw" class="form-control">
							<p id="pwin" style="color: red;"> </p>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><b>닉네임</b></label>
							<input type="text" id="uname" name="uname" class="form-control" required="required" placeholder="2~8자 사이, 특수문자 제외">
							<p id="namenull" style="color: red;"> </p>
						</div>
					</div>
					<div class="box-footer">
						<div>
							<hr>
						</div>
						<button type="submit" onclick ="check()"class="btn btn-primary">Submit</button>
					</div>
				</form>
			<script>
		var result = '${msg}';
		var id = '${id}';
		var email = '${email}';
		var name = '${name}';
		if (result == 'FAIL') {
			document.getElementById("idnull").innerHTML= id +" = " + "이미 존재하는 ID입니다.";
			$("#uid").val(id);
			$("#email").val(email);
			$("#uname").val(name);
		} 
		if (result == 'FAILANOTHER') {
			document.getElementById("idnull").innerHTML= id +" = " + "이미 존재하거나 이전에 탈퇴한 ID입니다.";
			$("#uid").val(id);
			$("#email").val(email);
			$("#uname").val(name);
		}
		if (result == 'NICKFAIL') {
			document.getElementById("namenull").innerHTML= name +" = " + "이미 존재하는 닉네임입니다.";
			$("#uid").val(id);
			$("#email").val(email);
			$("#uname").val(name);
		} 
		if (result == 'NICKFAILANOTHER') {
			document.getElementById("namenull").innerHTML= name +" = " + "이미 존재하거나 이전에 탈퇴한 닉네임입니다.";
			$("#uid").val(id);
			$("#email").val(email);
			$("#uname").val(name);
		}
			</script>
					<script type="text/javascript">
						function check() {
							var idcheck = /^[A-Za-z0-9]{4,12}$/;
							var namecheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}$/;
							var pw = $("#pw").val();
							var cpw = $("#cpw").val();
							var id = $("#uid").val();
							var nick = $("#uname").val();
							document.getElementById("idnull").innerHTML= "";
							document.getElementById("namenull").innerHTML= "";
							if (idcheck.test(id) == false) {
								document.getElementById("idnull").innerHTML="ID는 4글자 이상 12글자 미만의 영문과 숫자만이 가능합니다.";
							return false;
							} else {
								document.getElementById("idnull").innerHTML="";
							}
							if (pw != cpw) {
								document.getElementById("pwin").innerHTML="비밀번호 입력이 다릅니다. 다시 확인해주세요";
							return false;
							} else {
								document.getElementById("pwin").innerHTML="";
							}
							if (namecheck.test(nick) == false) {
								document.getElementById("namenull").innerHTML="NICKNAME은 2글자 이상 8글자 미만이며, 특수문자 삽입은 불가능합니다.";
							return false;
							} else {
								document.getElementById("namenull").innerHTML="";
							}
						}
					</script>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${login.uname != null }">
	<script type="text/javascript">
		alert("잘못된 접근입니다");
		location.href = "/";
	</script>
	</c:if>
</body>
</html>