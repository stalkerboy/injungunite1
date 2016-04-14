<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="modal fade" id="checkPw2" role="dialog">
	<div class="modal-dialog modal-sm">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<p>Enter Password</p>
			</div>
			<div class="modal-body">
				<input type="password" id="password_d" name="password_d"
					class="form-control" placeholder="PASSWORD" /> <input
					type="hidden" id="authpw" name="authpw"
					value="${authUser.password}">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-circle btn-md"
					onclick="checkPw2();">CHECK OUT</button>
			</div>
		</div>
	</div>
</div>
<script>
function checkPw2() {
	var pw = document.getElementById('password_d').value;
	var authpw = document.getElementById('authpw').value;
	if (authpw == pw) {
		location.href = "/user/remove";
		alert("Success Delete Account")
	} else {
		alert("NOT MATCH YOUR PASSWORD");
	}
}
</script>