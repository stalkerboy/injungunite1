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

    <section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/mypage1.jpg" style="overflow-y: scroll;">
        <div class="inline-block" style="height: 10%;"></div>
        <form id="modify_form" name="modifyform" action="/user/modify" method="post" onsubmit="return checkJoin(this);">
            <div class="row text-center" >
            	<h1 style="color:white;letter-spacing: 1px;font-family: 'Raleway', sans-serif;font-weight: 500;">ACCOUNT SETTING</h1>
            </div>
            <div class="row text-center" >
                <div class="row text-center">
					<button type="button"  class="btn btn-default btn-sm" style="padding: 2px 24px;" onclick="document.getElementById('profileLoader').click()"><i class="fa fa-photo">profile</i></button>
					<button type="button"  hidden><input type="file" id="profileLoader" multiple></button>
				</div>
				<div class="fileDrop" id="profile">
				    Drag files here!
				</div>
            </div>
            <div class="row text-center">
                <label>ID</label><br>
                <input class="input-sm" id="id" name="id" type="text" value="${authUser.mem_id }" size="20" isabled>
            </div>
            <br>

            <div class="row text-center">
                <label>PASSWORD</label><br>
                &nbsp; <input id="password" name="password" type="password" value="" class="input-sm"><br>
                &nbsp; <input id="passwordcheck" name="passwordcheck" type="password" value="" class="input-sm">
            </div>
            <br>


            <div class="row text-center">
                <label>NAME</label><br>
                <input id="name" name="name" type="text" value="${authUser.mem_name }" class="input-sm">
            </div>
            <br>

            <div class="row text-center">
                <label>EMAIL</label><br>
                <input id="email" name="email" type="text" value="${authUser.mem_email }" class="input-sm">
            </div>
            <br>

            <div class="row text-center">
                <label>GENDER</label><br>
                
                <fieldset>
					<input type="radio" name="gender" value="female" checked="checked"><label><i class="fa fa-fw fa-female"></i>FEMALE</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="male"><label><i class="fa fa-fw fa-male"></i>MALE</label>
				</fieldset><br>
                
            </div>
            <br>
            

            <div class="row text-center">
            	<label>BIRTH-DATE</label><br>
                <div style="display: inline-block; width:200px;">
                    <div class="input-group">
                        <input id="date-picker-2" type="text" class="date-picker form-control" name="birthDate" placeholder="BirthDate" size="50" />
                        <label for="date-picker-2" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span></label>
                    </div>
                </div>
            </div>
            <br>


            <div class="row text-center">
<!--                 <a href="/user/mypage"  class="btn btn-white-line btn-lg">CANCEL</a> -->
                <input type="reset" class="btn btn-white-line btn-lg" value="REWRITE">
                <input type="submit" class="stone-btn stone-btn-dark stone-btn-round btn-md" value="UPDATE" >
            </div>
        </form>
    </section>


<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script src='/resources/plugins/fabric/js/fabric.min.js'></script>

<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/resources/custom/js/jquery.superslides.min.js"></script>
<script src="/resources/custom/js/custombackground.js"></script>
<script src="/resources/custom/js/customfiledrop.js"></script>
<script src='/resources/custom/js/custommodals.js'></script>
<script>
$(".date-picker").datepicker();
</script>
</body>
</html>