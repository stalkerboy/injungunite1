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
<link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
<style>
#joinmodal:before{
	height:0;
}
.divJoinWarning{
	color: red;
	text-align: center;
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
				<h4 style="font-weight: 900; color:white">사람의 정을 나누다</h4>
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
                    <input type="text" id="mem_email" name="mem_email" class="form-control" placeholder="E-MAIL" />
                    <input type="text" id="mem_name" name="mem_name" class="form-control" placeholder="NAME" />
                    <input id="button-findid" type="button" value="Find ID" onclick="showfindid();"  class="btn btn-sm btn-block btn-flat"> 
                    <br>
                </div>
                
                <br>
                <legend></legend>
                
           <a href="#findPw"data-toggle="collapse" data-target="#findPw"style="color: #ffffff"><i class="fa  fa-anchor">Password</i></a>
              	<div id="findPw" class="collapse">
					<label class="block-label">Please Write your Info</label>
					<input type="text" id="pmem_id" name="mem_id" class="form-control" placeholder="ID" /> 
					<input type="text" id="pmem_email" name="mem_email" class="form-control" placeholder="E-MAIL" /> 
					<input type="text" id="pmem_name" name="mem_name" class="form-control" placeholder="NAME" /> 
					<input id="button-findpw" type="button" value="Find PW" onclick="showfindpw();"  class="btn btn- btn-block btn-flat">
					<br>
				</div>
			<br>						
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
				<div class="row">
			        <div class="col-xs-8">
                        <input id="mem_id_join" name="mem_id" type="text" class="form-control" placeholder="USER ID"  onblur="onblur_idcheck();">
					</div>
					<div class="col-xs-4">
                        <input id="button-checkid" class="btn btn-sm" type="button" value="check ID">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAEc0lEQVR42q2UXUxbZRzGn3N6Ts9pT1tOacv3R/nY2JjL6MYcuzF0hpFtunSJmWYxhsUoURdDE43Ri203Xhq4wKibWty8MMZkaIbbwNAyYGUIlM9NLjYKK7LSQgstDLp++LbJdDMgCDznoien7/v8znne//9PYYtEX6BFCSUxMbREz9Ksc/50oCH+nNoqc5qirfu1ZSUaTotgeB5354acrIQ5sSUA5iJjPal/vXyf5nkshhcRjcUwE3Ljl8kfbZsGsBdZU6Fq25W3is5gIuBCt7sPMoZHliIDnTPXNxcR97VUlDPC2PvFH4oyiRzNrlYsR5ahZBXIFDJgn23eHED2DV97OPNozaGMw+jz9sMZeAAJTUOvzEHg8SxGAwONGwYI38rJgWocH+05C8+SFx1uOyiKQgqvhVKqQN9Mhz8cCxk2DFBZlI7qnWdKchR6dEzfQvBxEHJWjiwSzdBsD3zLHnOvabBuQ4CkBmXNfl1Z7cmCUxgLjpGSHAVDM8hRZBFjL4a8PbYe04AxvvZ/A8TvkvQCIzg+NpwVIwjD7u0mLjHoSDQCI0ebq9kfjUUMt4/3Of8BfA6R3Jni+8mvDe+gfzWA5pL6yiv5r5kMur3o8zngCXkgY3lkC1m4Mz0Az6Lb3HW8t+7Jegr1KCHZWUt1ZaKMkWHYP4DJRVcj+ec0quF/2lx7Kbk8T5VvfWPHm3A9cmE4MASe4ZCnyMXckh/DbofN/nKv8ek9FHn7sQ92f6JPEzKxQLqQlUhw092K666r/WS2GCNvRxKQlMtakQLlqH7uPb1WroPddwvxiNLkqUhilWgba/VHoxFDx0vdzmcB9XSs9mA9RnyjGJwZgZpPQoYiDQ+XHsD68Ea/lJaeIIPLmfZ9yvnyzEPnjNkvYnRhFFOhSYicikSTjV5XN6aDbnP7sdt1/46UwhfwfVr6mTjovYt78/cTNc2zUhSpC8kUC6HHY/dHETFreI2leve7CJFrMDiQWKMn0fgWZ9A13mVrP9ZlxAqi8CXOk5I7d1BbjvYpO8YXJhKbRV6FXZodSBe0aBpvxKvbTiFPzIMj0IcQtYQccqgCqftrd675w9GwwXa007kyIK6vYMmU6asKFLuwEAnCs+wBL+WgliUlviSNZL5dLMTksgsTISc0MnWiarqcdvw5P2W2Humowyr6uw8kFySWDHluVbFYgsXoAhm3M5BzPJScQMzzkaXMTJhzLIsCVT5mF7zovN9paz3SYcR/6JlGU1oUBJJTtVO9B0uxR/CHfRA4GZS8AAUvI0AOuYrsxKx5Ek1LZZtz3YC4Ui/rLEmcusqgO4AIHUEgOpcwV3By6ARNAtAz8TumSDTNlbY6rKEVR4X+h+wakUuu3Zt6AFISyVxslkDk2K4qxDxpqO7xbtuNSqtxLfNVAXEV/1RUJfKiZV96GTlwKaRShtS9EjfvtfkjpKF+rfjNuSlAXKU/lyQghvRSJAsi/pgegTfoNTdVtKwZzboAcb3QVGZiJWwtSzMiQzENVytazOs1j+svAUmopjhH/bkAAAAASUVORK5CYII=" id="image-checkid" style="display:none; width:16px">
                        <input id="button-checkid-number" class="btn btn-sm" type="button" value="check ID" style="display: none">
					</div>
				</div><br>
				
				<div class="divJoinWarning" id="idcheckmsg" style="display: none;">이미 존재하는 아이디입니다.</div>
				<div class="divJoinWarning" id="idlimit" style="display: none;">5~20자의 영문만 가능합니다.</div>
	
                <label class="block-label">PASSWORD</label><br>&nbsp;
                <input id="mem_passwd" name="mem_passwd" type="password" value="" class="form-control" placeholder="Password" onblur="onblur_event();">
						
				<input id="mem_passwdck" name="mem_passwdck" type="password" value="" class="form-control" placeholder="Password Check" onblur="onblur_pwcheck();">
		
				<br>
								
				<label class="block-label" for="name">NAME</label><br>
				<input id="mem_name_join" name="mem_name" type="text" value="" class="form-control" placeholder="Name" ><br>

				<label class="block-label" for="email">E-MAIL</label><br>
				<input id="mem_email_join" name="mem_email" type="email" value="" class="form-control" placeholder="Email" ><br>


                <label>GENDER</label>
				<fieldset>
					<input type="radio" id="mem_gender" name="mem_gender" value="female" checked="checked"><label><i class="fa fa-fw fa-female"></i>FEMALE</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="mem_gender" name="mem_gender" value="male"><label><i class="fa fa-fw fa-male"></i>MALE</label>
				</fieldset><br>

                <label class="block-label" for="birthDate">BirthDate</label>
                <div class="controls">
					<div class="input-group">
						<input id="mem_birth_join" type="text" class="date-picker form-control" name="mem_birth" placeholder="BirthDate" readonly/>
						<label for="mem_birth_join" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span></label>
					</div>
			    </div><br>
                <legend></legend>
				<fieldset>
					<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
					<label>사용자 정보 제공에 동의합니다.</label>
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
<script src="/resources/plugins/sweetalert/sweetalert.min.js"></script>
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