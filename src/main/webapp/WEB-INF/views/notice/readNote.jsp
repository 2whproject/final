<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html>
<!-- 헤드안에들어가면 sitemesh 영향이 생기므로 헤드 밖에다 위치시켜야함 -->
<head>
<script type="text/javascript">
	function back() {
		location.href ="/notice/list";
	}
</script>
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

               <input type='hidden' name='no' value="${noteVO.no}"> <input
                  type='hidden' name='page' value="${cri.page}"> <input
                  type='hidden' name='perPageNum' value="${cri.perPageNum}">
               <input type='hidden' name='searchType' value="${cri.searchType}">
               <input type='hidden' name='keyword' value="${cri.keyword}">

            </form>

            <div class="box-body">
               <div class="form-group">
                  <label for="exampleInputEmail1">Title</label> <input type="text"
                     name='title' class="form-control" value="${noteVO.title}"
                     readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="exampleInputPassword1">Content</label>
                  <textarea class="form-control" name="content" rows="3"
                     readonly="readonly">${noteVO.content}</textarea>
               </div>
               <div class="form-group">
                  <label for="exampleInputEmail1">Sender</label> <input type="text"
                     name="Sender" class="form-control" value="${noteVO.sender}"
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
                  <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
               <button type="button" class="btn btn-primary" onclick="back()">GO
                  LIST</button>
            </div>
         </div>
         <!-- /.box -->
      </div>
      <!--/.col (left) -->
      <div class="col-md-6">
      </div>
   </div>
<script>

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

   var no = ${NoteVO.no};//Board Number

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
      getPage("/replies/" + no + "/1");

   });

   $(".pagination").on("click", "li a", function(event) {
      
      event.preventDefault();

      replyPage = $(this).attr("href");

      getPage("/replies/" + no + "/" + replyPage);

   });

   $("#replyAddBtn").on("click", function() {
//       alert("replyAddBtn clicked........");
      
      var replyerObj = $("#newReplySender");
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
            no : no,
            replyer : replyer,
            replytext : replytext
         }),
         success : function(result) {
            console.log("result: " + result);
            if (result == 'SUCCESS') {
               alert("등록 되었습니다.");
               replyPage = 1;
               getPage("/replies/" + no + "/" + replyPage);
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
               getPage("/replies/" + no + "/" + replyPage);
            }
         }
      });
   });

   $("#replyDelBtn").on("click", function() {

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
               getPage("/replies/" + no + "/" + replyPage);
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
      formObj.attr("action", "/sboard/modifyPage");
      formObj.attr("method", "get");      
      formObj.submit();
   });
   
/*    $("#removeBtn").on("click", function(){
      formObj.attr("action", "/sboard/removePage");
      formObj.submit();
   }); */

   
   $("#removeBtn").on("click", function(){
      formObj.attr("action", "/notice/removeNote");
      formObj.submit();
   });   
   var no = ${noteVO.no};
   var template = Handlebars.compile($("#templateAttach").html());
   
   $.getJSON("/sboard/getAttach/"+no,function(list){
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
</body>
</html>