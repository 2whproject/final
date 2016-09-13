<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>register.jsp</title>
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
						<h3 class="box-title">REGISTER EMPLOYEE</h3>
					</div>
					<!-- /.box-header -->
					<form role="form" method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">NAME</label> <input type="text"
									name='ename' class="form-control" placeholder="Enter Name"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">EMP.NO</label> <input
									type="number" name='empno' class="form-control"
									placeholder="Enter Emp.NO" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">JOB</label> <input type="text"
									name="job" class="form-control" placeholder="Enter Job"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">MGR</label> <input type="number"
									name="mgr" class="form-control" placeholder="Enter Mgr"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">HIREDATE</label> <input type="date"
									name="hiredate" class="form-control" placeholder="Enter Hiredate"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">SAL</label> <input type="number"
									name="sal" class="form-control" placeholder="Enter sal"
									required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">COMM</label> <input
									type="number" name="comm" class="form-control"
									placeholder="Enter comm" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Dept.NO</label> <input
									type="number" name="deptno" class="form-control"
									placeholder="Enter Dept. Number" required="required">
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
							<a href="/emp/list" class="btn btn-warning">CANCEL</a>
						</div>
					</form>
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