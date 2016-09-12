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
<title>register.jsp</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MEMBER REGISTER</h3>
				</div>
				<form id="registerForm" role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">USER ID</label>
							<input type="text" name="uid" class="form-control" required="required" placeholder="Enter ID">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">PASSWORD</label>
							<input type="password" name="upw" class="form-control" required="required" placeholder="Enter PASSWORD">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">NICKNAME</label>
							<input type="text" name="uname" class="form-control" required="required" placeholder="Enter NICKNAME">
						</div>
					</div>
					<div class="box-footer">
						<div>
							<hr>
						</div>
						<button type="submit" class="btn btn-primary">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$("#registerForm").submit(
				function(event) {
					event.preventDefault();
					var that = $(this);
					var str = "";
					$(".uploadedList .delbtn").each(
							function(index) {
								str += "<input type='hidden' name='files["
										+ index + "]' value='"
										+ $(this).attr("href") + "'> ";
							});
					that.append(str);
					that.get(0).submit();
				});
	</script>
</body>
</html>