<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<html>
<head>
	<title>register.jsp</title>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>
</head>
<body>

<!-- Main content -->

	<div id="comic-information">
		<ul style="list-style:none;">
			<li style='float:left;'><img src = "${cover_l_url}"/></li>
			<li id='title' style='font-size:1.3em; margin-left: 3.5cm;'>${title}</li><br>
			<li style='font-size:12px; margin-left: 3.5cm;'>${author_t}</li>
			<li style='font-size:12px; margin-left: 3.5cm;'>${pub_nm}</li>
			<li style='font-size:12px; margin-left: 3.5cm;'>${list_price} 원</li><br>
			<li style='font-size:14px; margin-left: 3.5cm;'><a href= '${link}' >책정보</a></li>
		</ul>
	</div>
	<hr>

	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Review 작성</h3>
				</div>
				<!-- /.box-header -->

<form id='registerForm' action="register" role="form" method="post">
	<div class="box-body">

		<div class="form-group">
			<label for="exampleInputEmail1">만화책이름</label>
			<input type="text" name='title' class="form-control" value="${title}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">작가</label> 
			<input type="text" name='author' class="form-control" value="${author_t}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">만화책번호</label>
			<input type="text" name='isbn' class="form-control" value="${isbn}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> 
			<input type="text" name='title2' class="form-control" placeholder="Enter Title">
		</div>
		
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="5" placeholder="Enter ..."></textarea>
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> 
			<input type="text" name="writer" class="form-control" value='${login.uid}' readonly>
		</div>
</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<div>
			<hr>
		</div>

		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>

		<button type="submit" class="btn btn-primary">Submit</button>
		<button type="submit" class="btn btn-danger">Cancel</button>
	</div>
</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>


$("#registerForm").submit(function(event){
	event.preventDefault();
	
// 	alert("aa");
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
	that.append(str);
	
	$('#registerForm [name="title"]').each(function name(idx, data) {
		console.log(idx + "=" + $(data).val());
	});

	that.get(0).submit();
});


</script>
</body>
</html>
 

