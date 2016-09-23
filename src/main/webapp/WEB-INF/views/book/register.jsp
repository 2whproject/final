<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<head>
<title>register.jsp</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">독서노트 작성하기</h3>
				</div>
				<!--작성란 시작 -->
				<div class="box-body">
					<form id='registerForm' action="/book/register" role="form" method="post">
						<div class="form-group">
							<label for="writer">작성자</label> 
							<input id="writer" type="hidden" name="writer" class="form-control" value='${login.uid}' readonly="readonly"/>
						</div>
						<div class="form-group">
							<label for="title">제목</label> 
							<input id="title" type="text" name='title' class="form-control" value='${title}'>
						</div>
						<div class="form-group">
							<label for="author">작가</label> 
							<input id="author" type="text" name='author' class="form-control" value='${author}'>
						</div>
						<div class="form-group">
							<label for="overview">책 소개</label>
							<textarea id="overview" class="form-control" name="overview" rows="5">${overview}</textarea>
						</div>
						<div class="form-group">
							<label for="content">메모</label>
							<textarea id="content" class="form-control" name="content" rows="5"></textarea>
						</div>
						<div class="form-group">
							<label for="publisher">출판사</label> 
							<input id="publisher" type="text" name="publisher" class="form-control" value='${publisher}'/>
						</div>
						<div class="form-group">
							<label for="price">가격</label> 
							<input id="price" type="text" name="price" class="form-control" value='${price}'/>
						</div>
						<div class="form-group">
							<a target="_blank" href='${link}'>도서정보 자세히 보기</a>
						</div>
						<input id="link" type="hidden" name="link" class="form-control" value='${link}'/>
						<div class="form-group text-right">
							<button type="reset" class="btn btn-danger">다시작성</button>
							<button type="submit" class="btn btn-primary">작성완료</button>
						</div>
					</form>
				</div>
				<!--작성란 끝 -->
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
<script type="text/javascript">
$(document).ready(function () {    
	var login = ${login.uid};
	if (login==null) {
		self.location= "http://localhost:8080/user/login";
	}
	
});	
	
</script>
</body>
</html>