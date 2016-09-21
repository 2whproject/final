<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>register.jsp</title>
<script type="text/javascript">
	function back() {
		history.back();
	}
</script>
</head>
<body>
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">쪽지 보내기</h3>
				</div>
				<!-- /.box-header -->
				<form id='registerForm' role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1"></label>
							<input id="viewing" type="hidden" name="viewing" value="0">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">받는 사람 닉네임</label>
							<input id="uname" type="text" name="uname">
							<p id="unamenull" style="color: red;"> </p>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='title' class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label for="exampleInputP`assword1">내용</label>
							<textarea class="form-control" name="content" rows="3"
								placeholder="Enter ..."></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">보내는 사람</label> <input type="text"
								name="sender" class="form-control" value='${login.uname}'
								readonly>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div>
							<hr>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<button onclick="back()" type="button" class="btn btn-danger">Cancel</button>
					</div>
				</form>
			</div>
		<script>
		var result = '${msg}';
		if (result == 'FAIL') {
			document.getElementById("unamenull").innerHTML= "해당 닉네임은 존재하지 않습니다!";
		} 
		</script>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
</body>
</html>