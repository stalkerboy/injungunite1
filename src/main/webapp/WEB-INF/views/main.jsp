<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- css import -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/custom/css/custom.css" rel="stylesheet">

<link href="/resources/plugins/datepicker/datepicker3.css" rel="stylesheet">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
<style>
#joinmodal:before{
	height:0;
}
</style>

</head>

<body>
	<section id="intro" class="full-screen-intro ">
		<div class="media-wapper">
			<div id="video" class="player" data-property="{videoURL:'https://https://www.youtube.com/watch?v=DEepArNj4fg', startAt:6, opacity:1, quality:'large', autoPlay:true, mute:true}">
			</div>
		</div>
	</section>


	<div class="div-align-center" >
		<div class="col item-align-center">
			<div class="centent-align-center">

				<hr class="divider" style="width:250px">
				<h4 style="font-weight: 900">사람의 정을 나누다</h4>
				<h1><a href="#">INJUNG</a></h1>
				<hr class="divider" style="width:250px">
				<button type="button" class="btn btn-md btn-white-line xs-hidden" data-toggle="modal" data-target="#login" >Log In</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-md btn-white" data-toggle="modal" data-target="#joinmodal" >Sign Up</button><br>

			</div>
		</div>
	</div>


	<div class="modal fade" id="login" role="dialog">
		<div class="modal-dialog modal-sm">
            <form id="login-form" name="login" action="/user/login" method="post" onsubmit=" return checkUser(this);">
                <div class="form-group left-inner-addon">
					<i class="fa fa-user"></i>
						<input type="text" id="id" name="mem_id" class="form-control" placeholder="USER ID" />
				</div>
				<div class="form-group left-inner-addon">
				    <i class="fa fa-key"></i>
					<input type="password" id="password" name="mem_passwd" class="form-control" placeholder="Password" />
				</div>
				<div class="row">
				    <div class="col-xs-7">
                        <fieldset>
    						<input type="checkbox" id="useCookie" name="useCookie"/>
                            <label>Remember ID</label>
						</fieldset>
					</div>
					<div class="col-xs-5">
                        <button type="submit" class="btn btn-sm">LOG IN</button>
					</div>
				</div>
			</form>



            <a href="#findId" data-toggle="collapse" data-target="#findId" style="color: #ffffff"><i class="fa fa-anchor">Find ID</i></a>
                <div id="findId" class="collapse">
                    <label class="block-label">Please Write your Info</label>
                    <input type="text" id="femail" name="email" class="form-control" placeholder="E-MAIL" />
                    <input type="text" id="fname" name="name" class="form-control" placeholder="NAME" />
                    <input id="button-findid" type="button" value="Find ID" onclick="showfindid();"  class="btn btn-sm btn-block btn-flat">
                    <br>
                </div>

                <br>
                <legend></legend>
            <a href="#findPw"data-toggle="collapse" data-target="#findPw"style="color: #ffffff"><i class="fa  fa-anchor">Find Password</i></a>

            <div id="findPw" class="collapse">
                <label class="block-label">Please Write your Info</label>
                <input type="text" id="pid" name="id" class="form-control" placeholder="ID" />
                <input type="text" id="pemail" name="email" class="form-control" placeholder="E-MAIL" />
                <input type="text" id="pname" name="name" class="form-control" placeholder="NAME" />
                <input id="button-findpw" type="button" value="Find PW" onclick="showfindpw();"  class="btn btn-sm btn-block btn-flat">
                <br>
            </div>
            <legend></legend>

        </div>
    </div>


    <div class="modal fade" id="joinmodal" role="dialog">
        <div class="modal-dialog modal-sm">
            
			<div class="row text-center">
				<button type="button"  class="btn btn-default btn-sm" style="padding: 2px 24px;" onclick="document.getElementById('profileLoader').click()"><i class="fa fa-photo">profile</i></button>
				<button type="button"  hidden><input type="file" id="profileLoader" multiple></button>
			</div>
			<div class="fileDrop" id="profile">
			    Drag files here!
			</div>
            <br>
            <form id="joinform" name="joinform" method="post" action="/user/join">
                <input id="mem_profile" name="mem_profile" type="hidden">
				<legend></legend>
                <label class="block-label" for="myid">ID</label>
				<img src="data:image/png;base64,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" id="image-checkid" style="display:none; width:16px"><br>
				<div class="row">
			        <div class="col-xs-8">
                        <input id="mem_id" name="mem_id" type="text" class="form-control" placeholder="USER ID" >
					</div>
					<div class="col-xs-4">
                        <input id="button-checkid" class="btn btn-sm" type="button" value="check ID">
					</div>
				</div><br>

                <label class="block-label">PASSWORD</label><br>&nbsp;
                <input id="mem_passwd" name="mem_passwd" type="password" value="" class="form-control" placeholder="Password" >
				<input id="mem_passwdck" name="mem_passwdck" type="password" value="" class="form-control" placeholder="Password Check" ><br>

				<label class="block-label" for="name">NAME</label><br>
				<input id="mem_name" name="mem_name" type="text" value="" class="form-control" placeholder="Name" ><br>

				<label class="block-label" for="email">E-MAIL</label><br>
				<input id="mem_email" name="mem_email" type="email" value="" class="form-control" placeholder="Email" ><br>


                <label>GENDER</label>
				<fieldset>
					<input type="radio" id="mem_gender" name="mem_gender" value="female" checked="checked"><label><i class="fa fa-fw fa-female"></i>FEMALE</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="mem_gender" name="mem_gender" value="male"><label><i class="fa fa-fw fa-male"></i>MALE</label>
				</fieldset><br>

                <label class="block-label" for="birthDate">BirthDate</label>
                <div class="controls">
					<div class="input-group">
						<input id="mem_birth" type="text" class="date-picker form-control" name="mem_birth" placeholder="BirthDate"/>
						<label for="mem_birth" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span></label>
					</div>
			    </div><br>
                <legend></legend>
				<fieldset>
					<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
					<label>서비스 약관에 동의합니다.</label>
				</fieldset>
				
				<div class="row text-center">
					<input type="button" class="btn btn-sm " size="30" value="CANCLE" data-dismiss="modal">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-sm" size="30" value="JOIN" onclick="joinformSubmit();"><br>
				</div>
				<legend></legend>
			</form>
        </div>
    </div>



<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- intro video  -->
<script src="http://pupunzi.com/mb.components/mb.YTPlayer/demo/inc/jquery.mb.YTPlayer.js"></script>

<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>

<script src="/resources/custom/js/customlogin.js"></script>

<script src="/resources/custom/js/customfiledrop.js"></script>
<!-- video player -->
<script>
$(document).ready(function () {
	$(".player").YTPlayer();
});
</script>

<!-- datepicker -->
<script>
$(".date-picker").datepicker();
</script>



</body>
</html>