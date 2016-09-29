<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>reviewPage.jsp</title>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
	<div class='popup back' style="display: none;"></div>
	<div id="popup_front" class='popup front' style="display: none;">
		<img id="popup_img">
	</div>

	<div class="row">
      <!-- left column -->
      <div class="col-md-12">
         <!-- general form elements -->
         <div class="box box-primary">
            <div class="box-header">
               <h3 class="box-title">Read Review</h3>
            </div>
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
            <!-- /.box-header -->

            <form role="form" action="modifyPage" method="post">

               <input type='hidden' name='bno' value="${aniVO.bno}"> 
               <input type='hidden' name='page' value="${cri.page}"> 
               <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
               <input type='hidden' name='searchType' value="${cri.searchType}">
               <input type='hidden' name='keyword' value="${cri.keyword}">

            </form>
            

            <div class="box-body">
            <br>
            <br>
               <div class="form-group">
                  <label for="exampleInputEmail1">Title</label> <input type="text"
                     name='title' class="form-control" value="${aniVO.title2}"
                     readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="exampleInputPassword1">Content</label>
                  <textarea class="form-control" name="content" rows="5"
                     readonly="readonly">${aniVO.content}</textarea>
               </div>
               <div class="form-group">
                  <label for="exampleInputEmail1">Writer</label> <input type="text"
                     name="writer" class="form-control" value="${aniVO.writer}"
                     readonly="readonly">
               </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">

               <div>
                  <hr>
               </div>

               <ul class="mailbox-attachments clearfix uploadedList">
               </ul>
<%--                <c:if test="${login.uid == aniVO.writer}"> --%>
                  <button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
                  <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
<%--                </c:if> --%>
<!--                <button type="submit" class="btn btn-primary" id="goListBtn">리스트</button> -->
            </div>

         </div>
         <!-- /.box -->
      </div>
      <!--/.col (left) -->
   </div>
   <!-- /.row -->


	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>


				<!-- 로그인 상태 -->
<%-- 				<c:if test="${not empty login}"> --%>
					<div class="box-body">
						<input class="form-control" type="text" placeholder="USER ID"
							id="newReplyWriter" value="${login.uid}" readonly="readonly">
						<input class="form-control" type="text" placeholder="REPLY TEXT"
							id="newReplyText">
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">
							ADD REPLY</button>
					</div>
<%-- 				</c:if> --%>

<!-- 				로그아웃 상태 -->
<%-- 				<c:if test="${empty login}"> --%>
<!-- 					<div class="box-body"> -->
<!-- 						<div> -->
<!-- 							<a href="javascript:goLogin();">Login Please</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</c:if> --%>
			</div>



			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green" style="margin-left: 10px;">
						댓글 목록 
					<small id='replycntSmall'> [${AniVO.replycnt}] </small>
				</span></li>
			</ul>
			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">
				</ul>
			</div>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->


	<!-- Modal -->
<!-- 	<div id="modifyModal" class="modal modal-primary fade" role="dialog"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<!-- Modal content-->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 					<h4 class="modal-title">댓글 수정 & 삭제</h4> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body" data-rno> -->
<!-- 					<p> -->
<!-- 						<input type="text" id="replytext" class="form-control"> -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button> -->
<!-- 					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button> -->
<!-- 					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->



	<script id="templateAttach" type="text/x-handlebars-template">
      <li data-src='{{fullName}}'>
           <span class="mailbox-attachment-icon has-img">
				<img src="{{imgsrc}}" alt="Attachment">
		   </span>
              <div class="mailbox-attachment-info">
                <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
             </div>   
         </span>
           
      </li>                
   </script>



	<script id="template" type="text/x-handlebars-template">
            {{#each .}}
               <li class="replyLi">
                   <i class="fa fa-diamond bg-blue"></i>
                       <div class="timeline-item" >
                          <span class="time">
                                <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
                          </span>
                            <h3 class="timeline-header"><strong></strong>{{replyer}}</h3>
                            <div class="timeline-body">{{replytext}} </div>
                      <div class="timeline-footer">
                        {{#eqReplyer replyer }}
                        {{/eqReplyer}}
                      </div>
                   </div>         
               </li>
           {{/each}}
   </script>

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
			target.after(html); // 댓글 관련 출력

		}

		var bno = '${AniVO.bno}'; //Board Number
// 		alert("bno=" + bno);
		var replyPage = 1;

		function getPage(pageInfo) {

			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));

				$("#modifyModal").modal('hide');
				$("#replycntSmall").html(
						"[ " + data.pageMaker.totalCount + " ]");

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
		}; // 서버상에서 만들어지는것이 아니라 javaScript 로 만드는것
			var clicked = true;
			$("#repliesDiv").on("click", function() {
				
				if ($(".timeline li").size() > 1) {
					return;
				}
					getPage("/Anireply/" + bno + "/1");
	
			});

		$(".pagination").on("click", "li a", function(event) {

			event.preventDefault();

			replyPage = $(this).attr("href");

			getPage("/Anireply/" + bno + "/" + replyPage);

		});

		$("#replyAddBtn").on("click", function() {
			alert("replyAddBtn clicked........");

			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();

			$.ajax({
				type : 'post',
				url : '/Anireply/',
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
// 						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/Anireply/" + bno + "/" + replyPage);
						replyerObj.val("");
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

// 		// 댓글 수정 클릭시 뜨는 메세지창
// 		$("#replyModBtn").on("click", function() {

// 			//       alert("replyModBtn clicked...")

// 			var rno = $(".modal-title").html();
// 			var replytext = $("#replytext").val();

// 			$.ajax({
// 				type : 'put',
// 				url : '/Anireply/' + rno,
// 				headers : {
// 					"Content-Type" : "application/json",
// 					"X-HTTP-Method-Override" : "PUT"
// 				},
// 				data : JSON.stringify({
// 					replytext : replytext
// 				}),
// 				dataType : 'text',
// 				success : function(result) {
// 					console.log("result: " + result);
// 					if (result == 'SUCCESS') {
// // 						alert("수정 되었습니다.");
// 						getPage("/Anireply/" + bno + "/" + replyPage);
// 					}
// 				}
// 			});
// 		});

// 		$("#replyDelBtn").on("click", function() {

// 			var rno = $(".modal-title").html();
// 			var replytext = $("#replytext").val();

// 			$.ajax({
// 				type : 'delete',
// 				url : '/Anireply/' + rno,
// 				headers : {
// 					"Content-Type" : "application/json",
// 					"X-HTTP-Method-Override" : "DELETE"
// 				},
// 				dataType : 'text',
// 				success : function(result) {
// 					console.log("result: " + result);
// 					if (result == 'SUCCESS') {
// // 						alert("삭제 되었습니다.");
// 						getPage("/Anireply/" + bno + "/" + replyPage);
// 					}
// 				}
// 			});
// 		});
	</script>


	<script>
		$(document).ready(
				function() {

					var formObj = $("form[role='form']");

					console.log(formObj);

					$("#modifyBtn").on("click", function() {
						formObj.attr("action", "/comic/modifyPage");
						formObj.attr("method", "get");
						formObj.submit();
					});

 					    $("#removeBtn").on("click", function(){

					$("#removeBtn").on("click", function() {

						var replyCnt = $("#replycntSmall").html();

						if (replyCnt > 0) {
							alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
							return;
						}

 					 	formObj.attr("action", "/comic/removePage");
 					 	formObj.submit();
 					 });
					
// 					$("#goListBtn").on("click", function() {
// 						formObj.attr("action", "/comic/list");
// 						formObj.attr("method", "get");
// 						formObj.submit();
// 					});

					var bno = '${AniVO.bno}';
					var template = Handlebars.compile($("#templateAttach")
							.html());

					});
				});
	</script>

</body>
</html>
