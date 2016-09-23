<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html>
<!-- 헤드안에들어가면 sitemesh 영향이 생기므로 헤드 밖에다 위치시켜야함 -->
<head>
<title>home.jsp</title>
   <script type="text/javascript" src="/resources/js/upload.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />   
   <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />   
      
   <!-- Main content -->
   <style type="text/css">
   .popup {
      position: absolute;
   }
   
   .back {
      background-color: gray;
      opacity: 0.5;
      width: 100%;
      height: 300%;
      overflow: hidden;
      z-index: 1101;
   }
   
   .front {
      z-index: 1110;
      opacity: 1;
      boarder: 1px;
      margin: auto;
   }
   
   .show {
      position: relative;
      max-width: 1200px;
      max-height: 800px;
      overflow: auto;
   }
   </style>
</head>
<body>
<!--  			<div class="box"> -->
<!-- 				<div class="box-header with-border"> -->
<!-- 					<h3 class="box-title">빠른 글 내용 보기</h3> -->
<!-- 				</div> -->
<!-- 				<div class="box-body"> -->
<!-- 							<select class="op" id="value"> -->
<!-- 								<option value="">선택하세요</option> -->
<!-- 								<optgroup label="자유 게시판"> -->
<%-- 									<c:forEach items="${list}" var="quickVO"> --%>
<%-- 								<option value="${quickVO.content}">글 제목 : ${quickVO.title}&nbsp; / 글쓴이 : &nbsp;${quickVO.writer}</option> --%>
<%-- 									</c:forEach> --%>
<!-- 								</optgroup> -->
<!-- 							</select> -->
<!-- 							<hr> -->
<!-- 							<p onclick="move()" id="select" style="cursor: pointer;"></p> -->
<!-- 				</div> -->
<!-- 				/.box-body -->
<!-- 			</div> -->
		</div>
	<script>
	var result = '${msg}';
	if (result == 'LOGOFF') {
		alert ("정상적으로 로그아웃 되었습니다");
	}
	</script>
	<script type="text/javascript">
		var op = document.querySelector('.op');
			op.addEventListener('change', function(e) {
				if (e.currentTarget.value == "") {
					document.getElementById("select").innerHTML="";
				} else {
					var brand = e.currentTarget.value;
					document.getElementById("select").innerHTML="글 내용 : " + brand;
				}
			});
		function move() {
			alert("테스트");
			}
	</script>
</body>
</html>