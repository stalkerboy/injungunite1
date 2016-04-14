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
	
	<style>
		.users-list>li {
			width: 200px;
		}	
		.box-header.with-border {
			border-bottom: 1px solid transparent;
		}
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>	
	<c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
	<!-- modals -->
	<c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>
 
 <section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/mypage1.jpg" style="overflow-y: scroll;">
 <div class="wrapper" >
	<div class="col-md-12" style="height: 100px" ></div>
		<h1 class="hero-title" style="text-align: center"><a href="/user/friendlist"><font color="black">Friend List</font></a></h1>
    <div class="container-fluid container-custom">
        <div class="col-md-6">
          <div class="counter text-light" >
            <div class="counter-icon" style="color:black;">
              <i class="fa fa-hand-pointer-o"></i>
            </div>
            <div class="counter-header" >
              <h4 class="counter-title">
                <span class="counter-timer" data-from="0" data-to="124" style="color:black;">0</span>
              </h4>
            </div>
            <div class="counter-content">
              <h5><font color="black">Following</font></h5>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="counter text-light">
            <div class="counter-icon" style="color:black;">
              <i class="fa fa-hand-peace-o"></i>
            </div>
            <div class="counter-header">
              <h4 class="counter-title">
                <span class="counter-timer" data-from="0" data-to="50" style="color:black;">0</span>
              </h4>
            </div>
            <div class="counter-content">
              <h5><font color="black">Follower</font></h5>
            </div>
          </div>
        </div>
        
      </div>
    <div class="row">
    	<div class="input-group col-sm-3 pull-right" style="right:5%; margin:5px 10px">
    		<input type="text" class="form-control input-sm search-form" placeholder="친구검색">
    		<span class="input-group-btn">
    			<button type="submit" class="stone-btn stone-btn-dark btn-md search-btn"
    			data-target="#search-form" name="q">
    			<i class="fa fa-search"></i>
    			</button>
    		</span>
    	</div>
    </div>
	<div class="box box-danger" style="width: 90%; left:5%; background-color:rgba(255,255,255,0);">
  		<div class="box-header with-border">
    		<h3 class="box-title">FriendList</h3>
   			<div class="box-tools pull-right">
				<button class="label label-danger" onclick="onClickFriendEdit();">편집</button>
   			</div>
		</div><!-- /.box-header -->
		<div class="box-body no-padding">
    		<ul id="divFriendList" class="users-list clearfix">
    
<%--    	<c:forEach items="${firendlist }" var="friendVO"> --%>
<!--       <li> -->
<!--       	<div class="pull-right" style="margin:0;"> -->
<%-- 			<span data-toggle="tooltip" title="delete" class="badge bg-red" onclick="friendDelete(${friendVO.fri_mem_snum})"><i class="fa fa-times"></i></span> --%>
<!--         </div> -->
<!--         <img src="dist/img/user1-128x128.jpg" alt="User Image"> -->
<%--         <a class="users-list-name" href="#">${friendVO.fri_mem_id}</a> --%>
<%--         <span class="users-list-date">${friendVO.fri_mem_name}</span> --%>
<!--       </li> -->
<%--       </c:forEach> --%>
			<c:forEach items="${friendlist}" var="friendVO">
				<li class="dropdown friend-menu">
            		<div class="pull-right">
                		<span title="delete" class="del-badge badge bg-red" style="margin:0; display:none;" onclick="onClickFriendDel(${friendVO.fri_snum });"><i class="fa fa-user-times"></i></span>
            		</div>
              		<img src="/resources/img/profile/${friendVO.fri_mem_profile }" alt="User Image">
              		<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false" style="color:black"><b>${friendVO.fri_mem_id }</b> ${friendVO.fri_mem_name }</a>
              		<ul class ="dropdown-menu">
						<li class="header">
							<a href="/user/boardlist?user=${friendVO.fri_mem_id }"><i class="fa fa-user"></i>Friend Page</a>         		
           					<hr class="divider">
    						<a href="#" onclick="onClickFriendDel(${friendVO.fri_snum });"><i class="fa fa-user-times"></i>Friend Delete</a>        		
           					<hr class="divider">
    						<a href="/message/messagewriteform?mem_id=${firendVO.not_postmem_id }"><i class="fa fa-envelope-o"></i>Sent Message</a>         		
     	       			</li>
              		</ul>
            	</li>
           	</c:forEach>
           	
			</ul><!-- /.users-list -->
		</div><!-- /.box-body -->
	</div><!--/.box -->
</div>
</section>



<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src='/resources/plugins/fabric/js/fabric.min.js'></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script src='/resources/custom/js/customwrite.js'></script>
<script src='/resources/custom/js/customfriend.js'></script>

<script src="/resources/custom/js/custombackground.js"></script>
<script src='/resources/custom/js/custommodals.js'></script>

<script src='/resources/custom/js/appear.js'></script>
<script src="/resources/custom/js/jquery.superslides.min.js"></script>
</body>
</html>