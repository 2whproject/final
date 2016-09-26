<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>register.jsp</title>
<script type="text/javascript">
	function back() {
		self.location="list";
	}
	function normal() {
		self.location="register";
	}
</script>
</head>
<body>
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class='box-body'>
					<button onclick="normal()">일반 글 쓰기</button>
				</div>
			</div>
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">공지 글 쓰기</h3>
				</div>
				<!-- /.box-header -->

				<form id='registerForm' role="form" method="post">
							<input name="notice" class="form-control" type="hidden" value="false">
					<div class="box-body">
						<div class="form-group">
							<label style="float: left" for="exampleInputPassword1">비밀번호 </label>
							<input id="secpass" class="form-control" type="password" name="pass" style="position:relative; width: 100px;">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='title' class="form-control">
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content" rows="15"></textarea>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label> <input type="text"
								name="writer" class="form-control" value='${login.uname}'
								readonly>
						</div>
						<div class="form-group">
						<input type="hidden"
								name="secret" class="form-control" value='${login.uid}'>
					</div>
					<div class="box-footer">
						<div>
							<hr>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<button onclick="back()" type="button" class="btn btn-danger">Cancel</button>
					</div>
				</form>
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
</body>
</html>