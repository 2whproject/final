<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pagination.jsp</title>
<style type="text/css">
	.progress {
		width: 50%;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var reply = $('#reply');
		var replytext = $('#replytext');
		$('#btnmodal').on('click', function() {
			replytext.val(reply.val());
		});
		$('#modify').on('click', function() {
			reply.val(replytext.val());
			$('#myMadal').modal('hide');
		});
	});
</script>
</head>
<body>
	<input id="reply" class="form-control"/>
	<button id="btnmodal" type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal">Open Modal</button>
<div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar"
  aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
    60%
  </div>
</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><i class="fa fa-times-circle fa-spin"></i></button>
					<h4 class="modal-title">댓글 수정 & 삭제</h4>
				</div>
				<div class="modal-body">
					<input class="form-control" type="text" id="replytext"/>
				</div>
				<div class="modal-footer">
					<button id="modify" type="button" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>