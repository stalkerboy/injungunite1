function onClickPwForModifyBtn() {
	var mem_passwd = $("#mem_passwd").val() ;
	$.ajax( {
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

function onClickModifyBtn(){
	var mem_profile = '';
	if (!$("#profile").text()){
		mem_profile = myProfileImg.substring(myProfileImg.indexOf(',')+1);
	}
	var mem_id = $("#mem_id").val();
	var mem_passwd = $("#m_mem_passwd").val();
	var mem_name = $("#mem_name").val();
	var mem_email = $("#mem_email").val();
	var mem_gender = $('input[name="mem_gender"]:checked').val()
	var mem_birth = $("#mem_birth").val();
	
	$.ajax( {
		url : "/user/userModify",
		type: "post",
		dataType: "json",
		data:{'mem_passwd': mem_passwd,"mem_name":mem_name,"mem_email":mem_email,"mem_gender":mem_gender,"mem_birth":mem_birth, "mem_profile":mem_profile },
		success: function( response ){
			post_to_url("/user/login", {'mem_id': mem_id,'mem_passwd': mem_passwd})
		}
	});
}


function post_to_url(path, params) {
    var form = document.createElement("form");
    form.setAttribute("method", 'post');
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

function notreadmessage(){
	$.ajax({
    	url :"/message/NotReadReceiveList",
        type:"POST",
        dataType:"json",
        success:function(result){
    		var item = result.data;
    	  	var newcode = "";
    	  	$("#messagemenu").empty();
    	  	for(var i = 0; i<item.length; i++){
    	  		newcode += "<li><a href=\"/message/receivereadmessageform?snum="+item[i].not_snum+"\"><div class=\"pull-left\"><img src=\""+item[i].not_postmem_profile +" \" class=\"img-circle\" alt=\"User Image\"></div><h4>"+item[i].not_postmem_id+"<small><i class=\"fa fa-clock-o\"></i>"+ item[i].not_regdate+"</small></h4><p>" +item[i].not_subject + "</p></a></li>"
			}
			$("#messagemenu").append(newcode);
    	},
        error:function(xhr, status, error){
        	console.error( status + " : " + error );
        }
	})
};

function onClickBoard(boa_snum){
	$.ajax( {
		url : "/board/view?bno="+boa_snum,
		type: "get",
		dataType: "json",
		success: function( response ){
			var boardVO = response.boardVO;
			var boardCommentList = response.boardCommentList;
			var hasMyInjung = response.hasMyInjung;
			var newStrCom = '';
			$("#viewmodalbox").empty();
//			헤더
			newStrCom += "<div class=\'box-header with-border\'><div class=\'user-block\'><img class=\'img-circle\' src=\'/resources/img/profile/" + boardVO.mem_profile + "\' alt=\'user image\' ><span class=\'username\'><a href=\"#\">" +boardVO.mem_id+"</a></span><span class=\'description\'>"+ boardVO.boa_regdate +"</span></div><div class=\'box-tools\'><button class=\'btn btn-box-tool\' data-dismiss=\'modal\'><i class=\'fa fa-times\'></i></button></div></div>";

//			바디 ~ overflow전
			newStrCom += "<div class=\'box-body row\'><div class=\"col-sm-7\"><img class=\"img-responsive pad\" src=\"/resources/img/boardimg/"+ boardVO.boa_imgpng.substring(0, 12) + boardVO.boa_imgpng.substring(14, 100) + "\" alt=\"Photo\" width=\"400\" height=\"200\" ></div><div class=\'col-sm-5\'><img class=\"img-responsive img-circle img-sm\" src=\'/resources/img/profile/"+ boardVO.mem_profile+ "\' alt=\"alt text\"><div class=\"input-group\"><input id=\"com_context\" type=\"text\" class=\"form-control input-sm\" placeholder=\"comment\"><span class=\"input-group-btn\"><button type=\"button\" class=\"btn\" onclick=\"onClickCommentWriteBtn(" + boardVO.boa_snum + ");\">comment</button></span></div><br>";

//			overflow~commets 
			newStrCom += "<div style=\"height: 500px; overflow: auto;\"><div id=\"div_comments\" class=\'box-comments\'>";
			for(var i=0; i<boardCommentList.length; i++){
				newStrCom += "<div class=\'box-comment\'><img class=\'img-circle img-sm\' src=\'/resources/img/profile/"+ boardCommentList[i].mem_profile +"\' alt=\'user image\'><div class=\'comment-text\'><span class=\"username\">"+ boardCommentList[i].mem_id + "<span class=\'text-muted pull-right\'>"+ boardCommentList[i].com_regdate +"</span></span>"+ boardCommentList[i].com_context + "</div></div>";
			}
//			comments루프 다음
			newStrCom += "</div><a href=\"#\" class=\"btn form-control\" style=\"text-align: center;\">view more</a></div></div></div><div class=\"box-footer\"><div id=\"divinjungbtn\">"; 
			if(hasMyInjung){
				newStrCom += "<button class=\'btn btn-default btn-xs\' onclick=\"onClickInjungCancelBtn("+ boardVO.boa_snum +");\"><i class=\'fa fa-thumbs-o-down\'></i> 인정취소</button>";
			}
			else{
				newStrCom += "<button class=\'btn btn-default btn-xs\' onclick=\"onClickInjungBtn("+boardVO.boa_snum+");\"><i class=\'fa fa-thumbs-o-up\'></i> 인정</button>";
			}
			newStrCom += "<span class=\'text-muted\'>"+ boardVO.boa_injeong+" 명이 인정했습니다.</span></div></div>";
			
			$("#viewmodalbox").append(newStrCom);
			
			$("#viewmodal").modal();
		}
	});	
}

function onClickCommentWriteBtn(boa_snum){
	var com_context = $("#com_context").val();
	$("#com_context").val('');
	if(com_context == null || com_context=='') return;
	$.ajax( {
		url : "/board/writecomment",
		type: "post",
		dataType: "json",
		data:{'com_context': com_context, 'boa_snum' : boa_snum},
		success: function( response ){
			var newcomments = response.data;
			var newStrCom = '';
			$("#div_comments").empty();
			for(var i=0; i<newcomments.length; i++){
				newStrCom += '<div class=\'box-comment\'><img class=\'img-circle img-sm\' src=\'/resources/img/profile/' + newcomments[i].mem_profile + '\' alt=\'user image\'><div class=\'comment-text\'><span class=\"username\">' + newcomments[i].mem_id + '<span class=\'text-muted pull-right\'>' + newcomments[i].com_regdate + '</span></span>' + newcomments[i].com_context + '</div></div>';
			}
			$("#div_comments").append(newStrCom);
		}
	});
}

function onClickInjungBtn(boa_snum){
	$.ajax( {
		url : "/board/injungAdd",
		type: "post",
		dataType: "json",
		data:{'boa_snum': boa_snum},
		success: function( response ){
			$("#divinjungbtn").empty();
			var innerInjung = "<button class=\'btn btn-default btn-xs\' onclick=\"onClickInjungCancelBtn(" + boa_snum + ");\"><i class=\'fa fa-thumbs-o-down\'></i> 인정취소</button>";
			innerInjung += "<span class=\'text-muted\'>" + response.data.boa_injeong +" 명이 인정했습니다.</span>";
			$("#divinjungbtn").append(innerInjung);
		}
	});
}

function onClickInjungCancelBtn(boa_snum){
	$.ajax( {
		url : "/board/injungCancel",
		type: "post",
		dataType: "json",
		data:{'boa_snum': boa_snum},
		success: function( response ){
			$("#divinjungbtn").empty();
			var innerInjungCancel = "<button class=\'btn btn-default btn-xs\' onclick=\"onClickInjungBtn("+ boa_snum +")\"><i class=\'fa fa-thumbs-o-up\'></i> 인정</button>";
			innerInjungCancel += "<span class=\'text-muted\'>" + response.data.boa_injeong +" 명이 인정했습니다.</span>";
			$("#divinjungbtn").append(innerInjungCancel);
		}
	});
}
