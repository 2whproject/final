<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html>
<!-- 헤드안에들어가면 sitemesh 영향이 생기므로 헤드 밖에다 위치시켜야함 -->
<head>
<title></title>
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
	<c:if test="${pass == qnaVO.pass||qnaVO.pass == ''||login.uname == 'ADMINISTRATOR'}">
    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
     <img id="popup_img">
    </div>

   <div class="row">
      <!-- left column -->
      <div class="col-md-6">
         <!-- general form elements -->
         <div class="box box-primary">
            <div class="box-header">
               <h3 class="box-title">READ BOARD</h3>
            </div>
            <!-- /.box-header -->

            <form role="form" action="modifyPage" method="post">

               <input type='hidden' name='bno' value="${qnaVO.bno}"> <input
                  type='hidden' name='page' value="${cri.page}"> <input
                  type='hidden' name='perPageNum' value="${cri.perPageNum}">
               <input type='hidden' name='searchType' value="${cri.searchType}">
               <input type='hidden' name='keyword' value="${cri.keyword}">

            </form>

            <div class="box-body">
               <div class="form-group">
                  <label for="exampleInputEmail1">Title</label> <input type="text"
                     name='title' class="form-control" value="${qnaVO.title}"
                     readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="exampleInputPassword1">Content</label>
                  <textarea class="form-control" name="content" rows="15"
                     readonly="readonly">${qnaVO.content}</textarea>
               </div>
               <div class="form-group">
                  <label for="exampleInputEmail1">Writer</label> <input type="text"
                     name="writer" class="form-control" value="${qnaVO.writer}"
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
               <c:if test="${login.uid == qnaVO.secret||login.uid == 'zerock' }">
                  <button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
                  <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
               </c:if>
               <button type="submit" class="btn btn-primary" id="goListBtn">GO
                  LIST</button>
            </div>

         </div>
         <!-- /.box -->
      </div>
      <!--/.col (left) -->
      <div class="col-md-6">
      </div>
   </div>
   <!-- /.row -->

   <!-- 댓글추가 부분 -->
   <div class="row">
      <div class="col-md-12">

         <div class="box box-success">
            <div class="box-header">
               <h3 class="box-title">ADD NEW REPLY</h3>
            </div>


         <!-- 로그인 상태 -->
            <c:if test="${not empty login}">
               <div class="box-body">
                  <label for="exampleInputEmail1">Writer</label> 
                  <input class="form-control" type="text" placeholder="USER ID"
                         id="newReplyWriter" value="${login.uname }" readonly="readonly">
                  <label for="exampleInputEmail1">Reply Text</label> 
                  <input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
               </div>

               <div class="box-footer">
                  <button type="submit" class="btn btn-primary" id="replyAddBtn">
                  ADD REPLY
                  </button>
               </div>
            </c:if>
         
         <!--  로그아웃 상태 -->
            <c:if test="${empty login}">
               <div class="box-body">
                  <div>
                     <a href="/user/login">Login Please</a>
                  </div>
               </div>
            </c:if>
         </div>



         <!-- The time line -->
         <ul class="timeline">
            <!-- timeline time label -->
            <li class="time-label" id="repliesDiv"><span class="bg-green">
                  Replies List <small id='replycntSmall'> [
                     ${qnaVO.replycnt} ] </small>
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
   <div id="modifyModal" class="modal modal-primary fade" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">댓글 수정 및 삭제</h4>
            </div>
            <div class="modal-body" data-rno>
               <p>
                  <input type="text" id="replytext" class="form-control">
               </p>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
               <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</c:if>

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
                  <li class="replyLi" data-rno={{rno}}>
                            <i class="fa fa-diamond bg-blue"></i>
                        <div class="timeline-item" >
                           <span class="time">
                                <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
                            </span>
                           <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
                            <div class="timeline-body">{{replytext}} </div>
                      <div class="timeline-footer">
                        {{#eqReplyer replyer }}
                                 <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
                        {{/eqReplyer}} 
                        {{#eqReplyer "ADMINISTRATOR" }}
                                 <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
                        {{/eqReplyer}} 
                      </div>
                        </div>         
                       </li>
                 {{/each}}
   </script>  
<script>
   
   Handlebars.registerHelper("eqReplyer", function(replyer, block) {
      var accum = '';
      if (replyer == '${login.uname}') {
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

   var bno = ${qnaVO.bno};//Board Number

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
   }; // 서버상에서 만들어지는것이 아니라 javaScript 로 만드는것

   
   $("#repliesDiv").on("click", function() {
      
      if ($(".timeline li").size() > 1) {
         return;
      }
      getPage("/qreplies/" + bno + "/1");

   });

   $(".pagination").on("click", "li a", function(event) {
      
      event.preventDefault();

      replyPage = $(this).attr("href");

      getPage("/qreplies/" + bno + "/" + replyPage);

   });

   $("#replyAddBtn").on("click", function() {
//       alert("replyAddBtn clicked........");
      
      var replyerObj = $("#newReplyWriter");
      var replytextObj = $("#newReplyText");
      var replyer = replyerObj.val();
      var replytext = replytextObj.val();

      $.ajax({
         type : 'post',
         url : '/qreplies/',
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
               getPage("/qreplies/" + bno + "/" + replyPage);
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
   
   // 댓글 수정 클릭시 뜨는 메세지창
   $("#replyModBtn").on("click", function() {
      
      
      var rno = $(".modal-title").html();
      var replytext = $("#replytext").val();

      $.ajax({
         type : 'put',
         url : '/qreplies/' + rno,
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
               getPage("/qreplies/" + bno + "/" + replyPage);
            }
         }
      });
   });

   $("#replyDelBtn").on("click", function() {

      var rno = $(".modal-title").html();
      var replytext = $("#replytext").val();

      $.ajax({
         type : 'delete',
         url : '/qreplies/' + rno,
         headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "DELETE"
         },
         dataType : 'text',
         success : function(result) {
            console.log("result: " + result);
            if (result == 'SUCCESS') {
               alert("삭제 되었습니다.");
               getPage("/qreplies/" + bno + "/" + replyPage);
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
      formObj.attr("action", "/qboard/modifyPage");
      formObj.attr("method", "get");      
      formObj.submit();
   });
   
/*    $("#removeBtn").on("click", function(){
      formObj.attr("action", "/qboard/removePage");
      formObj.submit();
   }); */

   
   $("#removeBtn").on("click", function(){
      
      var replyCnt =  ${qnaVO.replycnt};
      
      if(replyCnt > 0 ){
         alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
         return;
      }   
      
      var arr = [];
      $(".uploadedList li").each(function(index){
          arr.push($(this).attr("data-src"));
      });
      
      if(arr.length > 0){
         $.post("/deleteAllFiles",{files:arr}, function(){
            
         });
      }
      
      formObj.attr("action", "/qboard/removePage");
      formObj.submit();
   });   
   
   $("#goListBtn ").on("click", function(){
      formObj.attr("method", "get");
      formObj.attr("action", "/qboard/list");
      formObj.submit();
   });
   
   var bno = ${qnaVO.bno};
   var template = Handlebars.compile($("#templateAttach").html());
   
   $.getJSON("/qboard/getAttach/"+bno,function(list){
      $(list).each(function(){
         
         var fileInfo = getFileInfo(this);
         
         var html = template(fileInfo);
         
          $(".uploadedList").append(html);
         
      });
   });
   


   $(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
      
      var fileLink = $(this).attr("href");
      
      if(checkImageType(fileLink)){
         
         event.preventDefault();
               
         var imgTag = $("#popup_img");
         imgTag.attr("src", fileLink);
         
         console.log(imgTag.attr("src"));
               
         $(".popup").show('slow');
         imgTag.addClass("show");      
      }   
   });
   
   $("#popup_img").on("click", function(){
      
      $(".popup").hide('slow');
      
   });   
});
</script>
	<script type="text/javascript">
	function back() {
		history.back();
	}
	</script>
	<c:choose>
		<c:when test="${not empty qnaVO.pass}">
		<c:if test="${empty pass}">
		<c:if test="${login.uname!='ADMINISTRATOR'}">
   <div class="login-box">
      <div class="login-logo">
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">해당 글은 비밀글 입니다</p>
<form action="/qboard/readPage" method="post">
  <div class="form-group has-feedback">
  	<input type='hidden' id ="bno" name='bno' value="${qnaVO.bno}">
    <input type="password" id="pass" name ="pass" class="form-control" placeholder="비밀번호" required="required"/>
    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
  </div>
  <div class="row">
    <div class="pull-left">
      <button style="margin-left: 15px;" type="submit" class="btn btn-primary btn-block btn-flat">확인</button>
    </div>
    <div class="pull-right">
      <button style="margin-right: 15px;" type="button" onclick="back()" class="btn btn-primary btn-block btn-flat">취소</button>
    </div>
  </div>
</form>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
    </c:if>
    </c:if>
    </c:when>
</c:choose>
</body>
</html>