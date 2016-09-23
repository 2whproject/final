<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>modifyPage.jsp</title>
<style>
</style>
</head>
<body>

	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">독서노트 수정하기</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">
						<div class="form-group">
							<input id="bno" type="hidden"
								name='bno' class="form-control" value="${bookVO.bno}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<input id="writer" type="hidden" name="writer" class="form-control" value='${bookVO.writer}' readonly="readonly"/>
						</div>
						<div class="form-group">
							<label for="title">제목</label> 
							<input id="title" type="text" name='title' class="form-control" value='${bookVO.title}' readonly="readonly">
						</div>
						<div class="form-group">
							<label for="author">작가</label> 
							<input id="author" type="text" name='author' class="form-control" value='${bookVO.author}' readonly="readonly">
						</div>
						<div class="form-group">
							<label for="overview">책 소개</label>
							<textarea id="overview" class="form-control" name="overview" rows="5" readonly="readonly">${bookVO.overview}</textarea>
						</div>
						<div class="form-group">
							<label for="content">메모</label>
							<textarea id="content" class="form-control" name="content" rows="5">${bookVO.content}</textarea>
						</div>
						<div class="form-group">
							<label for="publisher">출판사</label> 
							<input id="publisher" type="text" name="publisher" class="form-control" value='${bookVO.publisher}' readonly="readonly"/>
						</div>
						<div class="form-group">
							<label for="price">가격</label> 
							<input id="price" type="text" name="price" class="form-control" value='${bookVO.price}' readonly="readonly"/>
						</div>
						<div class="form-group">
							<a target="_blank" href='${bookVO.link}'>도서정보 자세히 보기</a>
						</div>
						<input id="link" type="hidden" name="link" class="form-control" value='${bookVO.link}' readonly="readonly"/>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">

						<button type="submit" class="btn btn-primary">저장</button>
						<button type="button" class="btn btn-warning">취소</button>

					</div>
				</form>

<script>
$(document).ready(function() {

	$(".btn-warning").on("click",function() {
		self.location = "/book/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
								+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
});
</script>

		</div>
		<!-- /.box -->
	</div>
	<!--/.col (left) -->

</div>
<!-- /.row -->

</body>
</html>
