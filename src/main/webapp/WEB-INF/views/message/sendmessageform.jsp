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
	<div style="height: 50px;"></div>
	<h2 >&nbsp;&nbsp;Mailbox5 <small>13 new messages</small></h2>
	<div class="box box-primary" style=" width: 90%; left:5%;">
		<div class="box-header with-border">
			<h3 class="box-title">Inbox</h3>
			<div class="box-tools pull-right">
				<div class="has-feedback">
					<input type="text" class="form-control input-sm"
						placeholder="Search Mail"> <span
						class="glyphicon glyphicon-search form-control-feedback"></span>
				</div>
			</div>
			<!-- /.box-tools -->
		</div>
		<!-- /.box-header -->
		<div class="box-body no-padding">
			<div class="mailbox-controls">
				<!-- Check all button -->
				<button class="btn btn-default btn-sm checkbox-toggle">
					<i class="fa fa-square-o"></i>
				</button>
				<div class="btn-group">
					<button class="btn btn-default btn-sm">
						<i class="fa fa-trash-o"></i>
					</button>
					<button class="btn btn-default btn-sm">
						<i class="fa fa-reply"></i>
					</button>
					<button class="btn btn-default btn-sm">
						<i class="fa fa-share"></i>
					</button>
				</div>
				<!-- /.btn-group -->
				<button class="btn btn-default btn-sm">
					<i class="fa fa-refresh"></i>
				</button>
				<div class="pull-right">
					1-50/200
					<div class="btn-group">
						<button class="btn btn-default btn-sm">
							<i class="fa fa-chevron-left"></i>
						</button>
						<button class="btn btn-default btn-sm">
							<i class="fa fa-chevron-right"></i>
						</button>
					</div>
					<!-- /.btn-group -->
				</div>
				<!-- /.pull-right -->
			</div>
			<div class="table-responsive mailbox-messages">
				<table class="table table-hover table-striped">
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td class="mailbox-star"><a href="#"><i
									class="fa fa-star text-yellow"></i></a></td>
							<td class="mailbox-name"><a href="read-mail.html">Alexander
									Pierce</a></td>
							<td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> -
								Trying to find a solution to this problem...</td>
							<td class="mailbox-date">5 mins ago</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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
</body>
</html>