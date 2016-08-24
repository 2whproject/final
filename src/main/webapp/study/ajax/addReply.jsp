<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template.jsp</title>

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
<div class="panel panel-primary">
	<div class="panel-heading">
	<h1>댓글 추가</h1>
	</div>
	<div class="panel-bdoy">
	<div class="form-group">
		<label for="replytext">replytext: </label> <input class="form-control"
			type="text" id="replytext"><br>
	</div>
	
	<div class="form-group">
		<label for="replyer">replyer :</label> <input class="form-control"
			type="text" id="replyer" value="USER001" />
	</div>
	
	</div>
</div>


	<button id="addReply" class="btn btn-primary">add Reply</button>

	<script type="text/javascript">
		$('#addReply').on(
				'click',
				function() {

					var bno = 1;
					var replytext = $('#replytext').val();
					var replyer = $('#replyer').val();

					alert("bno=" + bno + ", replytext =" + replytext
							+ ", replyer=" + replyer);
				
					var options = {
							url : "/replies",
							type : "POST",
							headers : {
								"Content-Type" : "application/json"
							},
							processData : false,
							data : JSON.stringify({
								bno : bno,
								replytext : replytext,
								replyer : replyer
							}),
							success : function(result) {	
								console.log(result);
								if(result=="SUCCESS"){
									self.location = "/sboard/readPage?bno=1";
								}
								
								
// 								alert("result =" + result);
								
							}
					};
					$.ajax(options);
				
				});
	</script>
	<!-- AJAX를 이용하여 댓글 작성 -->

</body>
</html>