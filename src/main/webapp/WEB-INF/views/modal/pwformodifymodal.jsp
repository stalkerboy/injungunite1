<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="modal fade" id="checkPw1" role="dialog">
	<div class="modal-dialog modal-sm">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<p>Enter Password</p>
			</div>
			<div class="modal-body">
				<input type="password" id="mem_passwd" name="mem_passwd" class="form-control" placeholder="PASSWORD" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-circle btn-md" onclick="onClickPwForModifyBtn();">확인</button>
			</div>
		</div>
	</div>
</div>
