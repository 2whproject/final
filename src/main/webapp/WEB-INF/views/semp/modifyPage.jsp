<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>modifyPage.jsp</title>
</head>
<!-- Main content -->
<body>
	<section class="content">
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

						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">BNO</label> <input type="text"
									name='bno' class="form-control" value="${empVO.bno}"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									name='ename' class="form-control" value="${empVO.ename}"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Employee Number</label>
								<textarea class="form-control" name="empno" required="required">${empVO.empno}</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Job</label> <input type="text"
									name="job" class="form-control" value="${empVO.job}"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Mgr</label> <input type="text"
									name="mgr" class="form-control" value="${empVO.mgr}"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Hiredate</label> <input
									type="date" name="hiredate" class="form-control"
									value="${empVO.hiredate}" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Sal</label> <input type="text"
									name="sal" class="form-control" value="${empVO.sal}"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Comm</label> <input type="text"
									name="comm" class="form-control" value="${empVO.comm}"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Dept.Number</label> <input
									type="text" name="deptno" class="form-control"
									value="${empVO.deptno}" required="required">
							</div>
						</div>
						<!-- /.box-body -->
					</form>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">SAVE</button>
						<button type="submit" class="btn btn-warning">CANCEL</button>
					</div>

					<script>
						$(document)
								.ready(
										function() {

											var formObj = $("form[role='form']");

											console.log(formObj);

											$(".btn-warning")
													.on(
															"click",
															function() {
																self.location = "/semp/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
																		+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
															});

											$(".btn-primary").on("click",
													function() {
														formObj.submit();
													});
										});
					</script>




				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>
