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

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>	
	<c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
	<!-- modals -->
	<c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>

	<div class="wrapper" >
		<section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/main.jpg" style="overflow-y: scroll;">
			<div style="height: 100px;"></div>
			<div class="box box-primary" style="width: 90%; left:5%;">
				<div class="box-header with-border">
					<h3 class="box-title">${messageVO.not_subject }</h3>
				</div><!-- /.box-header -->
	               
				<div class="box-body no-padding">
	            	<div class="mailbox-read-info">
	                    <h5>From: ${messageVO.not_postmem_id } <span class="mailbox-read-time pull-right">${messageVO.not_regdate }</span></h5>
					</div><!-- /.mailbox-read-info -->
	                  
	                <div id="divMessageContext" class="mailbox-read-message">${messageVO.not_context } 
	                </div><!-- /.mailbox-read-message -->
				</div><!-- /.box-body -->
	                
	            <div class="box-footer">  
	            	<a id="deletemessage" class="btn btn-default" href="/message/deletereceivemessage?snum=${messageVO.not_snum}"><i class="fa fa-trash-o"></i> Delete</a>
	                <a class="btn btn-default" href="/message/receivemessageform"><i class="glyphicon glyphicon-list-alt"></i> list</a>
	                <a class="btn btn-default" href="/message/writemessageform?mem_id=${messageVO.not_postmem_id }"><i class="fa fa-reply"></i> Reply</a>
	                  
				</div><!-- /.box-footer -->
			</div><!-- /. box -->
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
<script>
// $("#divMessageContext").append();
</script>

</body>
</html>