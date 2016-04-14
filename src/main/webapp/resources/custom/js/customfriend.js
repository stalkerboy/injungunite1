var friendEditMode = false;
function onClickFriendEdit(){
	if(friendEditMode){
		$(".del-badge").css("display","none");
	}
	else{
		$(".del-badge").css("display","block")
	}
	friendEditMode = !friendEditMode;
	
}
;
function onClickFriendSearchBtn(){
	var friendsearch = $("#friendsearch").val();
	$.ajax({
		url : "/user/checkPwForModify",
		type: "post",
		dataType: "json",
		data:{'mem_passwd': mem_passwd},
		success: function( response ){
			var pwValidation = response.data;
			if(pwValidation){
				post_to_url("/user/modifyform");
			}
			else{
				alert("check pw!");
			}
		}
	});
}
;

function onClickFriendDel(fri_snum){	
	var snum = fri_snum;
	$.ajax( {
		url : "/user/frienddel",
		type: "post",
		dataType: "json",
		data:{'fri_snum': snum},
		success: function( response ){
			var divFriendList = $("#divFriendList");
			divFriendList.empty();
			var friendlist = response.data;
			var innerStr = '';
			for(var i=0; i<friendlist.length; i++){
				innerStr += "<li class=\"dropdown friend-menu\"><div class=\"pull-right\"><span title=\"delete\" class=\"del-badge badge bg-red\" style=\"margin:0; display:block;\" onclick=\"onClickFriendDel(${friendVO.fri_snum });\"><i class=\"fa fa-user-times\"></i></span></div><img src=\"/resources/img/profile/${friendVO.fri_mem_profile }\" alt=\"User Image\"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\"><b>${friendVO.fri_mem_id }</b> ${friendVO.fri_mem_name }</a><ul class=\"dropdown-menu\"><li class=\"header\"><a href=\"/user/boardlist?user=${friendVO.fri_mem_id }\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\"><a href=\"#\" onclick=\"onClickFriendDel(${friendVO.fri_snum });\"><i class=\"fa fa-user-times\"></i>Friend Delete</a><hr class=\"divider\"><a href=\"/message/messagewriteform?mem_id=${firendVO.not_postmem_id }\"><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li>"
			}
			divFriendList.append(innerStr);
			
		}
	});
}
;
function onClickFriendAdd(fri_mem_snum){
	$.ajax( {
		url : "/user/friendadd",
		type: "post",
		dataType: "json",
		data:{'fri_mem_snum': fri_mem_snum},
		success: function( response ){
			var friendType = response.type;
			alert(friendType);
//			var alertStr = '';
//			if(friendType=="old_fri") {
//				alertStr = "<div>이미 친구로 등록되어 있습니다.</div>";
//			}
//			else if(friendType==2) {
//				alertStr = "<div>없는 회원입니다.</div>";
//			}
//			else if(friendType==3) {
//				friendlist = respose.data;
//				var innerFriendList = '';
//				for(var i=0; friendlist.length; i++){
//					innerfirendList += friendlist[i].fri_mem_id;
//				}
//				alert(innerFriendList);
//				alertStr = "<div>등록되었습니다.</div>";
//			}
//			else if(friendType==4) {
//				alertStr = "<div>자신의 ID는 등록할 수 없습니다.</div>";
//			}
			
		}
	});
}
;