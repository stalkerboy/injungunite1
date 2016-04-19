$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='mem_id']").val(userInputId); 
     
    if($("input[name='mem_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='mem_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='mem_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='mem_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

function checkUser(formEl) {
    var errorMessage = null;
    var objFocus = null;
    if (formEl.id.value.length == 0) {
        errorMessage = "아이디를 넣어 주세요";
        objFocus = formEl.id;
    }
    else if (formEl.password.value.length == 0) {
        errorMessage = "비밀번호를 넣어 주세요";
        objFocus = formEl.password;
    }
    if (errorMessage != null) {
        swal({title:errorMessage, type:"warning"});
        objFocus.focus();
        return false;
    }
    return true;
}

var checkid = false;

$(function(){
	
	$("#mem_id_join").change( function(){
		$("#button-checkid").show();
		$("#image-checkid").hide();		
	});
	$( "#button-checkid" ).click( function(){
		var id = $("#mem_id_join").val();
		if( id == "" ) {
		return;
		} 
					
		$.ajax( {
		url : "/user/hasid?id=" + id,
		type: "get",
		dataType: "json",
		data: "",
		//  contentType: "application/json",
		success: function( response ){
			if(response.data == true) {
				$("#mem_id").val( "" );
				$("#mem_id").focus();
				$("#button-checkid").show();
				$("#image-checkid").hide();
				swal( 'Oops...','존재하는 ID입니다!    다른 아이디를 사용하세요.','error');
				return;
			}
			else{
				$("#button-checkid").hide();
				$("#image-checkid").show();
				checkid = true;
				swal( 'Success!!','사용가능한 ID입니다.','success');
			}
		},
		error: function( jqXHR, status, error ){
		console.error( status + " : " + error );
		}
		});
	});
});
			
		


function showfindid(){
    var email = $("#mem_email").val();
    var name = $("#mem_name").val();
    console.log(email);
    console.log(name);
    if( email == "" ) {
        return;
    }if(name ==""){
        return;
    }
    $.ajax( {
        url : "/user/findId?email=" + email + "&name=" + name,
        type: "get",
        dataType: "json",
        data: "",
        //contentType: "application/json",
        
        success: function( response ){
            if(response.data == null) {
            	   swal( 'Oops...','존재하지 않는 ID입니다!','error');

            return;
            }
            var find_id = response.data.mem_id;
            swal({ title: "Your ID", text: find_id, type:"info"}); 
        }
    });
};



function showfindpw(){
    var id = $("#pmem_id").val();
    var email = $("#pmem_email").val();
    var name = $("#pmem_name").val();

    if( id == "" ) {
        return;
    }else if( email == "" ) {
        return;
    }else if(name ==""){
        return;
    }
    $.ajax( {
        url : "/user/findPw?id=" + id + "&email=" + email + "&name=" + name,
        type: "get",
        dataType: "json",
        data: "",
        //  contentType: "application/json",
        success: function( response ){
            if(response.data == null) {
            	swal( 'Oops...','존재하지 않는 ID입니다!','error');
                return;
            }
            var find_pw = response.data.mem_passwd;
            swal({ title: "Your Password", text: find_pw, type:"info"}); 
        }
    });
 };
 
 
 function joinformSubmit(){
//	 alert($('#joinform input[name=id]').val());
 	 var base64img = myProfileImg.substring(myProfileImg.indexOf(',')+1);
	 if(checkJoin()){
		 $('#mem_profile').val(base64img);
		 $('#joinform').submit(); 
	 }
	 	 
 }
 
 function checkJoin() {  
	var errorMessage = null;  
	var objFocus = null;  
	if (!$('#mem_id_join').val()) {  
		errorMessage = "아이디를 넣어 주세요.";  	
	}
	else if (!checkid) {  
		errorMessage = "아이디 중복체크를 하세요.";  	
	}
	else if (!$('#mem_passwd').val()) {  
		errorMessage = "비밀번호를 넣어 주세요.";  
	}  
	else if (!$('#mem_name_join').val()) {  
		errorMessage = "이름를 넣어 주세요.";    
	}  
	else if (!$('#mem_email_join').val()) {  
		errorMessage = "email를 넣어 주세요.";   
	}    
	else if (!$('#mem_birth_join').val()) {  
		errorMessage = "생년월일을 선택해 주세요.";  
	}
	else if (!$('#agree-prov').is(":checked")) {  
		errorMessage = "정보 제공에 동의해 주세요.";  
	}
	
	if (errorMessage != null) {  
		 swal( 'Check...',errorMessage,'warning');
		return false;  
	}  
	return true;  
} 

 function onblur_event(){
		var mem_passwd = document.getElementById("mem_passwd").value;
	    if(mem_passwd == "")
	   	{
	    	swal( 'Oops...','필수 입력 정보입니다.','warning'); 	
	    	
	   	}else if(mem_passwd.length<4 || mem_passwd.length>15)
	    	{
	   		swal( 'Oops...','비밀번호는 4~15자를 입력하세요.','warning'); 	
	    	} 
	}
	function onblur_pwcheck() {
		 $('.error').hide();
		 var mem_passwd = document.getElementById("mem_passwd").value;
		 var mem_passwdck = document.getElementById("mem_passwdck").value;
		 if(mem_passwd!=mem_passwdck)
		{ 
			 swal( 'Oops...','패스워드가 일치하지 않습니다.','warning'); 	
		}
		
	}

	function onblur_idcheck() {
		var regExp = /^[0-9]+$/;
		if (regExp.test(document.getElementById('mem_id_join').value))
			{
				swal( 'error...','숫자로만 아이디 생성 할 수 없습니다.','error');
				$("#button-checkid").hide();
				$("#button-checkid-number").show();
			}
		else{
				$("#button-checkid-number").hide();
			}
	}
 
 
 
 
 
 