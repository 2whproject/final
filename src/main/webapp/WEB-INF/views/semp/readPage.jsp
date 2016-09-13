<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>readPage.jsp</title>
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
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='bno' value="${empVO.bno}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

</form>
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Name</label> <input type="text"
								name='ename' class="form-control" value="${empVO.ename}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Employee Number</label>
							<textarea class="form-control" name="empno" readonly="readonly">${empVO.empno}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Job</label> <input type="text"
								name="job" class="form-control" value="${empVO.job}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Mgr</label> <input type="number"
								name="mgr" class="form-control" value="${empVO.mgr}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Hiredate</label> <input
								type="date" name="hiredate" class="form-control"
								value="${empVO.hiredate}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Sal</label> <input type="text"
								name="sal" class="form-control" value="${empVO.sal}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Comm</label> <input type="text"
								name="comm" class="form-control" value="${empVO.comm}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Dept.Number</label> <input
								type="text" name="deptno" class="form-control"
								value="${empVO.deptno}" readonly="readonly">
						</div>
					</div>
				<!-- /.box-body -->

				<div class="box-footer">
               <c:if test='${login.uid == "zerock"}'>
                  <button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
                  <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
               </c:if>
					<button type="submit" class="btn btn-primary">GO LIST</button>
				</div>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/semp/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/semp/removePage");
			formObj.submit();
		});

		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/semp/list");
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
