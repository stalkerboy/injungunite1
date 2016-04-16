<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="sidebar">
	<nav class="navbar navbar-custom font-alt">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#custom-collapse">
			<span class="sr-only">toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<a class="navbar-brand" href="/user/main">INJUNG</a>
	</div>

	<div class="collapse navbar-collapse" id="custom-collapse">
		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="/user/mypage"
				class="dropdown-toggle binded" data-toggle="dropdown">MY PAGE</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#" data-toggle="modal" data-target="#writemodal" onclick="onClickWriteModal();">
						<i class="fa fa-pencil"></i> 글쓰기 </a></li>
					<li><a href="/board/boardlist?user=${authUser.mem_id }" >
						<i class="fa fa-child"></i> 내글보기 </a></li>
					<li><a href="/board/injungboardlist">
						<i class="fa fa-columns"></i> 인정 글보기 </a></li>
					<li><a href="#" data-toggle="modal" data-target="#checkPw1"  >
						<i class="fa fa-cogs"></i> 계정관리 </a></li>
				</ul>
			</li>

			<li class="dropdown"><a href="#" class="dropdown-toggle binded"
				data-toggle="dropdown">FRIEND</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/user/friendlist">
						<i class="fa fa-users"></i> 내친구 리스트 </a></li>
				</ul></li>

			<li class="dropdown"><a href="#" class="dropdown-toggle binded"
				data-toggle="dropdown">MESSAGE</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/message/writemessageform">
						<i class="fa fa-sticky-note-o"></i> 쪽지 보내기 </a></li>
					<li><a href="/message/receivemessageform">
						<i class="fa fa-archive"></i> 받은 쪽지함 </a></li>
					<li><a href="/message/sendmessageform">
						<i class="fa fa-share-square"></i> 보낸 쪽지함 </a></li>
				</ul></li>
		</ul>
	</div>
	</nav>
</div>
<!-- ------------------------------------------------------------------------------------------------------------------------ -->



