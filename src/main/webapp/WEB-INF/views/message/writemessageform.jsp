<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="/resources/plugins/AdminLTE/css/AdminLTE.min.css">
	
	<link rel="stylesheet" href="/resources/custom/css/custom.css">
	<link rel="stylesheet" href="/resources/custom/css/hero.css">
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>	
	<c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
	<!-- modals -->
	<c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>

	<div class="wrapper" >
		<section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/portfolio-8.jpg" style="overflow-y: scroll;">
	   		<div style="height: 100px;"></div>
			<div class="box box-primary" style="margin:auto; width:90%; ">
				<form id="writeMessageForm" action="/message/messagewrite" method="post">	
					<h3>Write New Message</h3>
					<input type="email" class="form-control" name="not_getmem_id" id="not_getmem_id" placeholder="To:" value="${targetUser.mem_id}">
		          	<input type="text" class="form-control" id="not_subject" name="not_subject" placeholder="Subject:">           
					<textarea id="editor1" name="not_context" rows="10" cols="80">
					</textarea>
		            <div class="pull-right">
		            	<button type="button" class="btn btn-default" onclick="onClickMessageWriteBtn();"><i class="fa fa-envelope-o"></i> Send</button>
		            </div>		 
				</form>
			</div>
		</section>
	</div>
<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script src='/resources/plugins/fabric/js/fabric.min.js'></script>

<script src='/resources/custom/js/customwrite.js'></script>
<script src='/resources/custom/js/custommodals.js'></script>

<script src="/resources/custom/js/jquery.superslides.min.js"></script>
<script src="/resources/custom/js/custombackground.js"></script>

<script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('editor1',{height:500});
	});
	
	function onClickMessageWriteBtn(){
		var mem_id = $("#not_getmem_id").val() ;
		
		if(!$("#not_subject").val())
		{
			alert("제목을 입력해주세요.");
			return ;
		}
		$.ajax( {
			url : "/user/hasid?id="+mem_id,
			type: "get",
			dataType: "json",
			success: function( response ){
				var hasId = response.data;
				 
				if(hasId){
					$("#writeMessageForm").submit() ;
				}
				else{
					alert("check id!");
				}
				
				   
			}
		});
	}
</script>
</body>
</html>