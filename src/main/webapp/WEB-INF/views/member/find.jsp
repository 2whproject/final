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
<title>find.jsp</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">ID & 비밀번호 찾기</h3>
				</div>
				<form id="registerForm" role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">이메일 주소</label>
							<input type="email" id="email" name="email" class="form-control" placeholder="가입 시 입력한 이메일 주소를 입력해주세요" required="required">
							<p id="email" style="color: red;"> </p>
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
		</div>
	</div>
</body>
</html>