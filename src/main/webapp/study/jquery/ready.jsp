<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ready.jsp</title>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#btn1').on('click', function() {
		alert('btn1 click...');
		self.location = '/sboard/list?page=1&perPageNum=10' + '&searchType=' 
				+ $("select option:selected").val()
				+ '&keyword=' + $('#keyword').val()
	});
});
</script>
</head>
<body>
	<section>
		<h1>jQuery Test : javascript library</h1>
		<select>
			<option values="t">Title</option>
			<option values="c">Content</option>
			<option values="w">Writer</option>
			<option values="tc">Title && Content</option>
			<option values="tw">Writer && Writer</option>
			<option values="tcw">Title && Content && Writer</option>
		</select>
		<input id ="keyword">
		<button id="btn1">btn1</button>
	</section>
</body>
</html>