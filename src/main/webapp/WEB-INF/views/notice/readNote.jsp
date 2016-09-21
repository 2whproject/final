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
               <h3 class="box-title">쪽지 읽기</h3>
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
                  <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
               <button type="button" class="btn btn-primary" onclick="back()">GO
                  LIST</button>
            </div>
         </div>
         <!-- /.box -->
      </div>
      <!--/.col (left) -->
   </div>
</body>
</html>