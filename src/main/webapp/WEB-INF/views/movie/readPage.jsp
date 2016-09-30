<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<!-- 헤드안에들어가면 sitemesh 영향이 생기므로 헤드 밖에다 위치시켜야함 -->
<head>
<title>readPage</title>
<style type="text/css">

li{
	text-decoration: none;
	list-style: none;
	font-size:11px;
	text-align: left;
	
}
#myImg {
	width:150px;
	height:100px;
	
	margin:10px 5px;
	float:left;
}

#newBtn {
	font-size:11px; 
	display: inline-block;
	float:right;
}

b{
	font-weight: bold;
}

td, a{
	font-size:11px;
}

#bno {
	font-size:12px;
	text-align: center;
}
th {
	text-align: center;
}
/* 댓글 */
#replytext{
	float:left;
	width:92%;
	height:10%;
	
}

#addReply {
	width:8%;
	height:10%;
}
/* modal */
#myImg {
    
    cursor: pointer;
    transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}

/* Caption of Modal Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation */
.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.5s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 50px;
    right: 35px;
    color: black;
    font-size: 80px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
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
					<h3 class="box-title" style="float:left;">MOVIE REVIEW >></h3>
				</div>

					<div class="row">
						<div class="box-body">

							<div class="col-md-8">
								<ul>
									<li><h3>${movie_title}</h3></li>
									<li>${eng_title},${year}</li>
									<hr>
								</ul>
								<ul>
									<li><b>개요 </b> ${genre_1} | ${nation} | ${open_info_time}
										| ${open_info_data} 개봉</li>
									<li><b>감독 </b> ${director}</li>
									<li><b>출연 </b>${actor1}</li>
									<li><b>등급 </b>${open_info_age}</li>
									<li><img id="myImg" alt="photo2" src="${photo2}"></li>
									<li><img id="myImg" alt="photo3" src="${photo3}"></li>
									<hr style="clear: both;">
								</ul>
								<!-- The Modal -->
								<div id="myModal" class="modal">
									<span class="close">×</span> <img class="modal-content"
										id="img01">
									<div id="caption"></div>
								</div>
								<ul style="margin-left: 10px;">
									<li><h4 style="font-weight: bold;">줄거리</h4></li>
									<li>${story}</li>
								</ul>
							</div>
							<div class="col-md-4">
								<img src='${photo1}' style="width: 275px; margin-left: 50px;" />
							</div>

						</div>
					</div>


				</div>
				<!--         게시물        -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title" style="margin-top: 5px;">REVIEW >></h3>
						<a
							href="/movie/register?movie_title=${movie_title}&eng_title=${eng_title}&genre_1=${genre_1}&nation=${nation}&open_info_time=${open_info_time}
								&open_info_data=${open_info_data}&director=${director}&actor1=${actor1}&open_info_age=${open_info_age}&photo1=${photo1}&year=${year}&title_link=${title_link}
						"
							id='newBtn' class="btn btn-info btn-md"> 리뷰쓰기 </a>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px; text-align: center;">NO</th>
								<th style="text-align: center;">제목</th>
								<th style="width: 100px; text-align: center;">작성자</th>
								<th style="width: 160px; text-align: center;">글 등록일</th>
								<th style="width: 40px; text-align: center;">VIEWCNT</th>
							</tr>

							<c:forEach items="${list}" var="movieVO">
								<tr>
									<td id="bno">${movieVO.bno}</td>
									<td><a href="/movie/reviewPage?bno=${movieVO.bno}&movie_title=${movie_title}&eng_title=${eng_title}&genre_1=${genre_1}&nation=${nation}&open_info_time=${open_info_time}
                        &open_info_data=${open_info_data}&director=${director}&actor1=${actor1}&open_info_age=${open_info_age}&photo1=${photo1}&year=${year}&title_link=${title_link}">
                                 ${movieVO.title} </a></td>
									<td style="cursor: pointer;" onclick="ang()">${movieVO.writer}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${movieVO.regdate}" /></td>
									<td><span class="badge bg-red">${movieVO.viewcnt }</span></td>
								</tr>
							</c:forEach>

						</table>
					</div>

					<div class="box-footer">

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx"> 
									<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a> 
									</li> 
							</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>
					</div>
					<!-- 				댓글  				-->
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title" style="margin-top: 5px;">REPLY</h3>
						</div>
						<div class="row">
							<div class="box-body">
								<div class="panel-body">
									<div class="form-group">
										<input class="form-control" type="text" id="replytext" 
										maxlength="140"
										placeholder="최대 140자까지 가능하며, 스포일러는 삭제될 수 있습니다."/>
										<button id="addReply" class="btn btn-info">등록</button>
										<input class="form-control" id="replyer" class="form-control"
											type="HIDDEN" value="${login.uname}" />
									</div>
									<div>
										<input type="hidden" id="title_link" class="form-control"
											value='${title_link}'>
									</div>
									<div id="reply" class="panel-content">
										<div class="panel-body"></div>
									</div>
								</div>


							</div>
						</div>

					</div>
				</div>
			</div>


		</div>
	<script id="mytemplate" type="text/x-handlebars-template">
	<ul class="list-group">
		{{#each .}}
		<li class="list-group-item">
			{{replyer}}<i class="fa fa-backward"></i> {{replytext}}
		</li>
		{{/each}}
	</ul>
</script>
		<script type="text/javascript">
		var page = 1;
		function printBody(list) {
			console.log("printBody(...)...")
			console.dir(list);
// 			var str = JSON.stringify(list);
			var template = Handlebars.compile($("#mytemplate").html());
			var str = template(list);	
			$('#reply .panel-body').html(str);
			$(".modify").on ("click", function() {
				var rno = $(this).attr("data-rno");
				var	replytext = $(this).attr("data-replytext");
				$("#replyprompt").val(replytext).attr("data-rno", rno);
			});
		}
		function printFooter(pageMaker) {
			console.log("printFooter(...)...")
			console.dir(pageMaker);
			//var str = JSON.stringify(pageMaker);
			var str = "";
			if (pageMaker.prev) {
				str += '<li><a href="#">' + (pageMaker.startPage - 1) + "prev</a></li>";
			}
				for(var i=pageMaker.startPage; i<=pageMaker.endPage; i++) {	
				str += '<li><a href="#" data-num="' + i + '">' + i + "</a></li>";
			}
			if (pageMaker.next) {
				str += '<li><a href="#">' + (pageMaker.endPage + 1) + "next</a></li>";
			}
			$('#reply .panel-footer .pagination').html(str);
			$('.pagination li > a').on("click", function(event) {
				event.preventDefault();
				var num =$(this).attr("data-num");
				page = num;
				getPage(page);
			});
		}
		function getPage(page) {
			$.getJSON("/movie/${movieId}/" + page + "?" + "xxx=" + new Date().getTime(),
					function(result) {
						console.dir(result);
						printBody(result.list);
						printFooter(result.pageMaker);
					});
		}
		$('#addReply').on('click', function() {
					var replytext = $('#replytext').val();
					var replyer = $('#replyer').val();
					var title_link = $('#title_link').val();
					var options = {
						url : "/movie",
						type : "POST",
						headers : {
							"Content-Type" : "application/json"
						},
						processData : false,
						data : JSON.stringify({
							replytext : replytext,
							replyer : replyer,
							title_link : title_link
						}),
						success : function(result) {
							console.log(result);
							if (result == "SUCCESS") {
								//self.location = "/sboard/readPage?bno=1";
								getPage(1);
							}
							//alert("result = " + result);
						}
					};
					$.ajax(options);
				});
		$(document).ready(function() {
			getPage(page);
		});
		$("#myModal #modify").on("click", function() {
			var rno = $("#replyprompt").attr("data-rno");
			var replytext =$("#replyprompt").val();
			console.log("rno = " + rno + ", replytext = " + replytext);
			$.ajax({
				type : "PUT",
				url : "/movie/" + rno,
				headers : {
					"Content-Type" : "application/json"
					},
				processData : false,
				data : JSON.stringify({
					"replytext" : replytext
					}),
				success : function(result) {
					if (result == "SUCCESS") {
						getPage(page);
						alert(result);
						}
					}
				});
			$("#myModal").modal("hide");
		});
		$("#myModal #delete").on("click", function() {
			var rno = $("#replyprompt").attr("data-rno");
			console.log("rno = " + rno);
			$.ajax({
				type : "DELETE",
				url : "/movie/" + rno,
				headers : {
					"Content-Type" : "application/json"
					},
				processData : false,
				success : function(result) {
					if (result == "SUCCESS") {
						getPage(page);
						alert(result);
						}
					}
				});
			$("#myModal").modal("hide");
		});
	</script>
	
	<!-- modal -->
	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// Get all images and insert the clicked image inside the modal
		// Get the content of the image description and insert it inside the modal image caption
		var images = document.getElementsByTagName('img');
		var modalImg = document.getElementById("img01");
		var captionText = document.getElementById("caption");
		var i;
		for (i = 0; i < images.length; i++) {
			images[i].onclick = function() {
				modal.style.display = "block";
				modalImg.src = this.src;
				modalImg.alt = this.alt;
				captionText.innerHTML = this.nextElementSibling.innerHTML;
			}
		}
	</script>

</body>
</html>