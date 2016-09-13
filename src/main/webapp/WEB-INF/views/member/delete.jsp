<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>  
</script>
<title>delete.jsp</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">회원 탈퇴</h3>
				</div>
				<form id="registerForm" role="form" method="post" onsubmit="return check()">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputPassword1"><b>비밀번호</b></label>
							<input type="hidden" id="uid" name="uid" class="form-control" value="${login.uid}">
							<input type="password" id="upw" name="upw" class="form-control" required="required">
						</div>
					</div>
					<div class="box-footer">
						<div>
							<hr>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			<script>
		var result = '${msg}';
		var name = '${name}';
		if (result == 'FAIL') {
			alert ("비밀번호가 다릅니다!");
		} else if (result == 'SUCCESS') {
			alert("탈퇴 처리가 정상적으로 되었습니다." + "\n" + "안녕히 가십시오.");
			location.href = "/user/logoff";
		}
			</script>
					<script type="text/javascript">
						function check() {
							var con = confirm("정말 탈퇴하시겠습니까?" + "\n" + "탈퇴한 계정의 ID로는 재가입이 불가능합니다.");
							if (con) {
								return true;
							} else {
								return false;
							}
						}
					</script>
			</div>
		</div>
	</div>
</body>
</html>