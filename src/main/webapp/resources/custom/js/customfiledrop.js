document.getElementById('profileLoader').onchange = function handleImage(e) {
  var files = e.target.files; // FileList object
  elDrop.innerHTML = '';
  for (var i = 0, f; f = files[i]; i++) {

    if (!f.type.match('image.*')) {
      continue;
    }
    if(f.size > 2000000){
        alert("20 mb이하의 사진이 필요합니다.");
        myProfileImg = defaultProfile;
        return;
    }
    var reader = new FileReader();
    reader.onerror = function(e) {
      alert('File read error');
    };
    reader.onabort = function(e) {
      alert('File read cancelled');
    };

    reader.onload = (function(event) {
      var imgObj = new Image();
      imgObj.src = event.target.result;
      imgObj.onload = function () {
        elDrop.innerHTML = '';
        var elImage = document.createElement('img');
        elImage.src = imgObj.src;
        myProfileImg = imgObj.src;
        elDrop.appendChild(elImage);
        elImage.style.cssText = "width: 120px; height: 180px;"
      }
    });
    reader.readAsDataURL(f);
  }
  this.value = null;
}

var defaultProfile = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAC0CAYAAABfTugdAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAGySURBVHhe7dExEQAgEMCwB/+egQEVuWapgK7zTFj7N6gG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xqMazCuwbgG4xpMm7n47AVk0tsanQAAAABJRU5ErkJggg==';
var myProfileImg = defaultProfile;


var elDrop = document.getElementById('profile');


elDrop.addEventListener('dragover', function(event) {
        event.preventDefault();
        event.dataTransfer.dropEffect = 'copy';
        showDropping();
});

elDrop.addEventListener('dragleave', function(event) {
        hideDropping();
});

elDrop.addEventListener('drop', function(event) {
    event.preventDefault();
    hideDropping();

    var files = event.dataTransfer.files;

    elDrop.innerHTML = '';

    for (var i=0, l=files.length; i<l; i++) {
        var file = files[i];
        if(file.size > 2000000){
            alert("20 mb이하의 사진이 필요합니다.");
            myProfileImg = defaultProfile;
            return;
        }
        if (file.type.indexOf('image/') === 0) {
            var elImage = document.createElement('img');
            elDrop.appendChild(elImage);

            var reader = new FileReader();
            reader.onload = function(event) {
                var src = event.target.result;
                elImage.src = src;
                myProfileImg = src;
                elImage.style.cssText = "width: 120px; height: 180px;"
            };
            reader.readAsDataURL(file);
        }
    }
});

function showDropping() {
        elDrop.classList.add('dropover');
}

function hideDropping() {
        elDrop.classList.remove('dropover');
}


function profileImgShow(src){
    elImage.src = src;
    elImage.style.cssText = "width: 120px; height: 180px;"
}



function imgSizeValidate(base64Img){
	 maxiumWidth = 200;
	 maxiumHight = 300;
	 var img = new Image();
	 img.src = base64Img;

	 if(img.width>maxiumWidth || img.height >maxiumHight){
		 return false;
	 }
	 return true;
}



//	$.ajax({
//		url: '/uploadAjax',
//		data: formData,
//		dataType: 'text',
//		processData: false,
//		contentType: false,
//		type: 'POST',
//		success: function(data){						
//			var str = "";
//			if(checkImageType(data)) {
//			str = "<div><a href=/displayFile?fileName="+getImageLink(data)+">"
//			+ "<img src='/displayFile?fileName="+data+"'/>"
//			+ "</a></div>"; 
//			}else {
//			alert("이미지 파일만 가능합니다.");
//			}
//		
//			var filepath = document.getElementById("Myprofile");
//			filepath.innerHTML = "<input id="+"Myprofile"+" name="+"profile"+" type="+"hidden"+" value="+data+">";
//						
//			var profile = document.getElementById("profile");
//			profile.innerHTML = str;
//		}
//	});

//function checkImageType(fileName) {
//	var pattern = /jpg|gif|png|jpeg/i;	
//	return fileName.match(pattern);
//}
//
//function getImageLink(fileName) {
//	if(!checkImageType(fileName)) {
//		return;
//	}
//	var front = fileName.substr(0,12);
//	var end = fileName.substr(14);
//	return front+end;
//}