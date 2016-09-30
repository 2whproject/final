<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<title>register.jsp</title>
<script type="text/javascript">
	function back() {
		history.back();
	}
</script>
<style type="text/css">
li{
	text-decoration: none;
	list-style: none;
	font-size:12px;
	text-align: left;
	
}
label{
	float:left;
}
</style>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>



</head>
<body>
	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title" style=" float:left;">MOVIE REVIEW >></h3>
				</div>

					<div class="row" style="clear:both;">
						<div class="box-body">
							<div class="col-md-1">
								<img src='${photo1}' style="width: 100px;" />
							</div>
							<div class="col-md-11">
								<ul>
									<li><h3>${movie_title}</h3>${eng_title},${year}</li>
									<li style="float: left;"><b>개요 </b> ${genre_1} | ${nation}
										| ${open_info_time} | ${open_info_data} 개봉</li>
									<li><b>&nbsp;등급 </b>${open_info_age}</li>
									<li style="float: left;"><b>감독 </b> ${director}</li>
									<li><b>&nbsp;출연 </b>${actor1}</li>
									
								</ul>
							</div>


						</div>
					</div>


				</div>
				<!-- general form elements -->
				<div class='box'>

					<!-- /.box-header -->

					<form id='registerForm' role="form"  method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1" >영화</label> <input
									type="text" name="movie_title" class="form-control"
									id="movie_review"
									value='${movie_title}'  readonly>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">제목</label>
								<input type="text" name='title' id="movie_review" class="form-control"
									placeholder="리뷰 제목을 입력하세요.">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" >작성자</label> <input
									type="text" name="writer" id="movie_review"  class="form-control"
									value='${login.uid}' readonly>
							</div>
							<div class="form-group">
								<label for="exampleInputP`assword1">내용</label>
								<textarea class="form-control" id="movie_review"  name="content" rows="6"
									placeholder="내용을 입력하세요."></textarea>
							</div>
							<div>
								<input type="hidden"
								class="form-control"value='${title_link }'
								>
							</div>
							<div>
								<label>작성기준</label>
								<p style="clear:both; text-align: left;">영화 리뷰는 200자 (공백제외) 이상으로 작성해주시기 바랍니다.<br>
 								   짧은 영화평은 평점·140자평을 이용해주시기 바랍니다
								</p>
								
							</div>
						</div>
						<div class="box-footer">
							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>
							<div style="margin:0 auto;">
								<button type="submit" id="addBoard" class="btn btn-primary">Submit</button>
								<button onclick="back()" type="button" class="btn btn-danger">Cancel</button>
							</div>
						</div>
					</form>

				</div>
			</div>
			<!-- /.box -->
		</div>
	</div>
	<!--/.col (left) -->
	
	
</body>
</html>