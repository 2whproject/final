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
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">
	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<input id="bno"
							       type="text" name='bno' class="form-control" value="${aniVO.bno}"
								   readonly="readonly">
						</div>

						<div class="form-group">
							<label for="title">글제목</label> 
							<input type="text" name='title2' class="form-control" value="${aniVO.title2}">
						</div>
						<div class="form-group">
							<label for="content">리뷰내용</label>
							<textarea class="form-control" name="content" rows="5">${aniVO.content}</textarea>
						</div>
						
						<div class="form-group">
							<label for="writer">작성자</label> 
							<input type="text" name="writer" class="form-control" value="${aniVO.writer}" readonly="readonly">
						</div>
						
					</div>
					<!-- /.box-body -->

	<div class="box-footer">

    <button type="submit" class="btn btn-primary">저장</button> 
    <button type="submit" class="btn btn-warning">취소</button>

	</div>
</form>

<script>
$(document).ready(function() {

	$(".btn-warning").on("click",function() {
		self.location = "/comic/reviewPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
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
