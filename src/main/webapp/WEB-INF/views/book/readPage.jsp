<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<head>
<title>readPage.jsp</title>
<!-- 업로드 -->
<script type="text/javascript" src="/resources/js/upload.js"></script>
<!-- 댓글 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
*{
/* 	border: 1px solid red; */
}
</style>
</head>
<body>
   <div class='popup back' style="display:none;"></div>
   <div id="popup_front" class='popup front' style="display:none;">
    <img id="popup_img">
   </div>

<div class="row">
	<!-- left column -->
	<div class="col-md-12">
		<!-- general form elements -->
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">독서노트 보기</h3>
			</div>
			<!-- /.box-header -->
			<form role="form" action="modifyPage" method="post">
				<input type='hidden' name='bno' value="${bookVO.bno}"> 
				<input type='hidden' name='page' value="${cri.page}">
				<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">
			</form>

			<div class="box-body">
					<div class="form-group">
						<input id="writer" type="hidden" name="writer" class="form-control" value='${bookVO.writer}' readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="title">제목</label> 
						<input id="title" type="text" name='title' class="form-control" value='${bookVO.title}' readonly="readonly">
					</div>
					<div class="form-group">
						<label for="author">작가</label> 
						<input id="author" type="text" name='author' class="form-control" value='${bookVO.author}' readonly="readonly">
					</div>
					<div class="form-group">
						<label for="overview">책 소개</label>
						<textarea id="overview" class="form-control" name="overview" rows="5" readonly="readonly">${bookVO.overview}</textarea>
					</div>
					<div class="form-group">
						<label for="content">메모</label>
						<textarea id="content" class="form-control" name="content" rows="5" readonly="readonly">${bookVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="publisher">출판사</label> 
						<input id="publisher" type="text" name="publisher" class="form-control" value='${bookVO.publisher}' readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="price">가격</label> 
						<input id="price" type="text" name="price" class="form-control" value='${bookVO.price}' readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="detail">더 많은 정보가 필요하신가요?</label>&nbsp&nbsp
						<a id="detail" target="_blank" href='${bookVO.link}'>도서정보 자세히 보기</a>
					</div>
					<input id="link" type="hidden" name="link" class="form-control" value='${bookVO.link}' readonly="readonly"/>
			</div>
			<!-- /.box-body -->

			<div class="box-footer">
					<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
					<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
				<button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
			</div>
		</div>
		<!-- /.box -->
	</div>
</div>
<!-- /.row -->


<!-- 댓글보기 -->
<ul class="timeline">
	<!-- timeline time label -->
	<li class="time-label" id="repliesDiv"><span class="bg-green">
		댓글목록
		<small id='replycntSmall'> [${bookVO.replycnt} ] </small></span>
	</li>
</ul>

<div class='text-center'>
	<ul id="pagination" class="pagination pagination-sm no-margin ">

	</ul>
</div>
<!-- 댓글 템플릿 -->
<script id="template" type="text/x-handlebars-template">
		{{#each .}}
	         <li class="replyLi" data-rno={{rno}}>
           	 	<i class="fa fa-comment bg-blue"></i>
             	<div class="timeline-item">
                	<span class="time">
                  		<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
                	</span>
                <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
                <div class="timeline-body">{{replytext}} </div>
				<div class="timeline-footer">
					{{#eqReplyer replyer }}
                		<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
					{{/eqReplyer}}
				</div>
	            </div>			
           </li>
        {{/each}}
	</script>  

<!-- 댓글달기 -->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-success">
				<!--로그인 상태 -->
				<c:if test="${not empty login}">
					<div class="box-body">
						<input class="form-control" type="text" placeholder="USER ID"
                         id="newReplyWriter" value="${login.uid}" readonly="readonly">
						<input id="newReplyText" class="form-control" type="text">
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">댓글등록</button>
					</div>
				</c:if>
				<!-- 로그아웃 상태 -->
				<c:if test="${empty login}">
					<div class="box-body">
						<div>
							<a href="http://localhost:8080/user/login">댓글은 로그인후에 등록할 수 있습니다.</a>
						</div>
					</div>
				</c:if>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->


	<!--댓글 수정 -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


<script>
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${login.uid}') {
			accum += block.fn();
		}
		return accum;
	});

	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var bno = ${bookVO.bno};

	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};
	
// 	댓글목록 버튼
	var clicked = true;
	$("#repliesDiv").on("click", function() {
		if (clicked==true) {
			getPage("/replies/" + bno + "/1");
			clicked = false;
			return;
		}if(clicked==false){
			$(".replyLi").remove();
			clicked = true;
			return;
		}
	});

	$(".pagination").on("click", "li a", function(event) {
		
		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + bno + "/" + replyPage);

	});
	
// 	댓글등록
	$("#replyAddBtn").on("click", function() {
		
		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();

		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext : replytext
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/" + bno + "/" + replyPage);
					replytextObj.val("");
				}
			}
		});
	});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));

	});

	$("#replyModBtn").on("click", function() {
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : replytext
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});

	$("#replyDelBtn").on("click", function() {
// 		alert("replyDelBtn clicked...")
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/book/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		
		var replyCnt =  $("#replycntSmall").html();
		
		if(replyCnt > 0 ){
			alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
			return;
		}	
		
		
		formObj.attr("action", "/book/removePage");
		formObj.submit();
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/book/list");
		formObj.submit();
	});
	
	var bno = ${bookVO.bno};
	var template = Handlebars.compile($("#templateAttach").html());
	
});
</script>

</body>
</html>

