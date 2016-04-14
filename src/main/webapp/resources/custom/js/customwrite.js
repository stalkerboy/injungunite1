tagNum = 1;
$('#addTagBtn').click(function(){	
	var tagText = $('#addTagText').val();
	var newtagcode = 
		"<div id=\'tag" + tagNum + "\'><span  class=\' boardtag label label-danger pull-right\'>" + tagText + "<a href=\'#\' onclick=\'onClickTagRemove(" + tagNum + ");\'><i class=\'fa fa-close\'></a></span></div>";
	tagNum = tagNum + 1;	
	$("div#taglistdiv").append(newtagcode);	
});
function onClickTagRemove(tagNum){	
	var targetdiv ='#tag'+tagNum;
	$(targetdiv).remove();	
}

$('#writeSubmit').click(function(){
	canvas.deactivateAll();	
	var imgjson = {};
	imgjson = JSON.stringify(canvas);	
	$('#boa_imgjson').val(imgjson);
	imgpng = canvas.toDataURL('png');
	var base64img = imgpng.substring(imgpng.indexOf(',')+1);
	$('#boa_imgpng').val(base64img);
	
	tagTextList = [];	
	$('.boardtag').each(function() {
		 tagTextList.push( this.innerText );
	});	
	
	$('#tags').val(tagTextList);
	
	$('#writeform').submit();	
});



canvas = new fabric.Canvas('canvas');

document.getElementById('imgLoader').onchange = function handleImage(e) {
  var files = e.target.files; // FileList object

  for (var i = 0, f; f = files[i]; i++) {

    if (!f.type.match('image.*')) {
      continue;
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
        var image = new fabric.Image(imgObj);
        image.set({
            left: 50,
            top: 50,
            angle: 0,
            padding: 10,
            cornersize: 10
        });
        canvas.add(image);
      }
    });
    reader.readAsDataURL(f);
  }
  this.value = null;
}

$("#textBtn").click(function(){

  var text = 'text';
  var itext = new fabric.IText(text, {
      left: 100,
      top: 100,
      fontSize: 40,
      fill: '#000'
  })
  canvas.add(itext);
  canvas.setActiveObject(itext);

});


canvas
  .on('object:selected', updateScope)
  .on('group:selected', updateScope)
  .on('path:created', updateScope)
  .on('selection:cleared', updateScope);

function updateScope() {
  var activeObject = canvas.getActiveObject(),
    activeGroup = canvas.getActiveGroup();

  var selectedObjectType = '';
  if(activeGroup){
    selectedObjectType = "group";
  }
  else if (activeObject){
    selectedObjectType = activeObject.get('type');

  }
  else{
    selectedObjectType = "null";
  }

  refreashModal(selectedObjectType);
}


function refreashModal(type){
  if(type=="i-text"){
    $('#textModal').modal({
      backdrop:false
    });
    $('#defaultModal').modal('hide');
    $('#drawModal').modal('hide');
    $('#imgModal').modal('hide');

  }
  else if(type=="image"){
    $('#textModal').modal('hide');
    $('#defaultModal').modal('hide');
    $('#drawModal').modal('hide');
    $('#imgModal').modal({
      backdrop:false
    });
  }
  else if(type=="path"){
    $('#textModal').modal('hide');
    $('#defaultModal').modal('hide');
    $('#drawModal').modal({
      backdrop:false
    });
    $('#imgModal').modal('hide');
  }
  else if(type=="group"){
    $('#textModal').modal('hide');
    $('#defaultModal').modal({
      backdrop:false
    });
    $('#drawModal').modal('hide');
    $('#imgModal').modal('hide');
  }
  $('.modal-backdrop').remove();
}

function onClickClearBtn(){
  canvas.deactivateAll();
  canvas.clear();
}

function onClickDrawingModeBtn(){
  if(canvas.isDrawingMode){
    document.getElementById('drawModeBtn').style.display = 'block';
    document.getElementById('selModeBtn').style.display = 'none';;
  }
  else{
    document.getElementById('drawModeBtn').style.display = 'none';
    document.getElementById('selModeBtn').style.display = 'block'
  }
  canvas.isDrawingMode = !canvas.isDrawingMode;
}

function onClickAlginRightBtn(){
  var activeObject = canvas.getActiveObject();
  activeObject.textAlign = 'right';
  canvas.renderAll();
}
function onClickAlginLeftBtn(){
  var activeObject = canvas.getActiveObject();
  activeObject.textAlign = 'left';
  canvas.renderAll();
}
function onClickAlginCenterBtn(){
  var activeObject = canvas.getActiveObject();
  activeObject.textAlign = 'center';
  canvas.renderAll();
}
function onClickAlginJustifyBtn(){
  var activeObject = canvas.getActiveObject();
  activeObject.textAlign = 'justify';
  canvas.renderAll();
}



function removeSelected(){
var activeObject = canvas.getActiveObject(),
  activeGroup = canvas.getActiveGroup();

if (activeGroup) {
  var objectsInGroup = activeGroup.getObjects();
  canvas.discardActiveGroup();
  objectsInGroup.forEach(function(object) {
    canvas.remove(object);
  });
}
else if (activeObject) {
  canvas.remove(activeObject);
}
}

$(document).keydown(function(event) {
if (event.keyCode == '46') {
  removeSelected();
}
});

$(".modalbtn-common-remove").click(function(){
removeSelected();
});


$(".modalbtn-common-group").click(function(){
var activeObject = canvas.getActiveObject(),
    activeGroup = canvas.getActiveGroup();
var objectsInGroup = activegroup.getObjects();

activegroup.clone(function(newgroup) {
    canvas.discardActiveGroup();
    objectsInGroup.forEach(function(object) {
        canvas.remove(object);
    });
    canvas.add(newgroup);

});
});


$(".modalbtn-common-ungroup").click(function(){
var activeObject = canvas.getActiveObject(),
    activeGroup = canvas.getActiveGroup();
if(activeObject){
  var items = activeObject._objects;
  activeObject._restoreObjectsState();
  canvas.remove(activeObject);
  for(var i = 0; i < items.length; i++) {
    canvas.add(items[i]);
    canvas.item(canvas.size()-1).hasControls = true;
  }
}
canvas.renderAll();
});


$(".modalbtn-common-mirror").click(function(){
var obj = canvas.getActiveObject();
if (obj==null) return;
obj.set('flipX', !obj.get('flipX'));
canvas.renderAll()
});

$(".modalbtn-common-copy").click(function(){
var object = fabric.util.object.clone(canvas.getActiveObject());
object.set("top", object.top+5);
object.set("left", object.left+5);
canvas.add(object);
canvas.renderAll();
});


$(".modalbtn-common-sendbackwards").click(function(){
var activeObject = canvas.getActiveObject();
if (activeObject) {
  canvas.sendBackwards(activeObject);
}
});


$(".modalbtn-common-sendtoback").click(function(){
var activeObject = canvas.getActiveObject();
if (activeObject) {
  canvas.sendToBack(activeObject);
}
});


$(".modalbtn-common-bringforward").click(function(){
var activeObject = canvas.getActiveObject();
if (activeObject) {
  canvas.bringForward(activeObject);
}
});


$(".modalbtn-common-bringtofront").click(function(){
var activeObject = canvas.getActiveObject();
if (activeObject) {
  canvas.bringToFront(activeObject);
}
});



$(".myattr-modal").draggable({
    handle: ".modal-header"
});


function onClickWriteModal(){
	$.ajax( {
		url : "/board/getCategoryList",
		type: "get",
		dataType: "json",
		success: function( response ){
			var categorylist = response.data;
			$("#datalist").empty();
			var strOption = "";
			for(var i=0; i<categorylist.length; i++){
				strOption += "<option value=\""+ categorylist[i].cat_name + "\">" + categorylist[i].cat_name +"</option>"
			}
			$("#datalist").append(strOption);
		}
	});
}


