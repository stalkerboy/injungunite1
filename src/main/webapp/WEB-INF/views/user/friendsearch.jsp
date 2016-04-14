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
	<div style="height: 100px;"></div>
		<div class="box box-info" style="width: 80%; left:10%;">
	   
	   <div class="box-header with-border">
	    <h3 class="box-title">MemberSearch</h3>
		<div class="text-center">
			<div class="input-group">
		        <input id="friendsearch" type="text" class="form-control input-sm search-form" placeholder="Search">
	        	<span class="input-group-btn"><button type="button" class="stone-btn stone-btn-dark btn-md search-btn" onclick="">
	        		<i class="fa fa-search"></i></button>
	        	</span>
		    </div>
	    </div>
	  </div><!-- /.box-header -->
	  <div class="box-body no-padding">
	    <ul class="users-list clearfix">
   			<li>
            <div class="pull-right">
                <span data-toggle="tooltip" title="add" class="add-badge badge bg-green" style="margin:0;" onclick="onClickFriendAdd();"><i class="fa fa-user-plus"></i></span>
                <span data-toggle="tooltip" title="delete" class="del-badge badge bg-red" style="margin:0; display:none;" onclick="onClickFriendDel();"><i class="fa fa-user-times"></i></span>
            </div>
              <img src="/resources/img/00.jpg" alt="User Image">
              <a class="users-list-name" href="#">Alexander Pierce</a>
              <span class="users-list-date">Today</span>
            </li>            
    </ul><!-- /.users-list -->
  </div><!-- /.box-body -->
  <div class="box-footer text-center">
  </div><!-- /.box-footer -->	   
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
<script src='/resources/custom/js/customfriend.js'></script>
<script src='/resources/custom/js/custommodals.js'></script>

</body>
</html>