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

$('#writemodal').on('hidden.bs.modal' ,function() {
	$('#textModal').modal('hide');
	$('#imgModal').modal('hide');
	$('#drawModal').modal('hide');
	$('#defaultModal').modal('hide');	
});

$('#writeSubmit').click(function(){
   canvas.deactivateAll();
   var imgjson = {};
   imgjson = JSON.stringify(canvas);
   $('#boa_imgjson').val(imgjson);
   imgpng = canvas.toDataURL('png');
   
   var base64img = imgpng.replace(/^data:image\/(png|jpg);base64,/, "");
//   var base64img = imgpng.substring(imgpng.indexOf(',')+1);
   
   if(checkWriteboard()){
   $('#boa_imgpng').val(base64img);
   tagTextList = [];
   $('.boardtag').each(function() {
       tagTextList.push( this.innerText );
   });

   $('#tags').val(tagTextList);
   
//   console.log(imgpng);
//   alert();
//   alert(imgpng);
//   alert(base64img);
   $('#writeform').submit();
   }
});

  function checkWriteboard(){
   var errorMessage = null;  
	var objFocus = null;  
	if (!$('#boa_subject').val()) {  
		errorMessage = "제목을 입력해주세요.";  	
	}
	if (errorMessage != null) {  
		 swal( 'Check...',errorMessage,'warning');
		return false;  
	}  
	return true;  
  }



canvas = new fabric.Canvas('canvas');

document.getElementById('imgLoader').onchange = function handleImage(e) {
  var files = e.target.files; // FileList object

  for (var i = 0, f; f = files[i]; i++) {

    if (!f.type.match('image.*')) {
      continue;
    }

    var reader = new FileReader();
    reader.onerror = function(e) {
    	swal( 'Oops...','File read Error','warning');
    };
    reader.onabort = function(e) {
    	swal( 'Oops...','File read Canceled','warning');
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
        canvas.setActiveObject(image);
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

$('#text-area').keyup(function(event) {
   var object = canvas.getActiveObject();
   object.set('text', $(this).val());
   canvas.renderAll();
});


function getActiveStyle(styleName, object) {
     object = object || canvas.getActiveObject();
     if (!object) return '';

     return (object.getSelectionStyles && object.isEditing)
       ? (object.getSelectionStyles()[styleName] || '')
       : (object[styleName] || '');
   };

   function setActiveStyle(styleName, value, object) {
     object = object || canvas.getActiveObject();
     if (!object) return;

     if (object.setSelectionStyles && object.isEditing) {
       var style = { };
       style[styleName] = value;
       object.setSelectionStyles(style);
       object.setCoords();
     }
     else {
       object[styleName] = value;
     }

     object.setCoords();
     canvas.renderAll();
   };

   var isBold = function() {
      return getActiveStyle('fontWeight') === 'bold';
   };
   var toggleBold = function() {
      setActiveStyle('fontWeight',
      getActiveStyle('fontWeight') === 'bold' ? '' : 'bold');
     };

  var isItalic = function() {
       return getActiveStyle('fontStyle') === 'italic';
     };
  var toggleItalic = function() {
     setActiveStyle('fontStyle',
       getActiveStyle('fontStyle') === 'italic' ? '' : 'italic');
  };

  var isUnderline = function() {
       return getActiveStyle('textDecoration').indexOf('underline') > -1;
     };
     var toggleUnderline = function() {
       var value = isUnderline()
         ? getActiveStyle('textDecoration').replace('underline', '')
         : (getActiveStyle('textDecoration') + ' underline');

       setActiveStyle('textDecoration', value);
     };

     var isLinethrough = function() {
        return getActiveStyle('textDecoration').indexOf('line-through') > -1;
     };
     var toggleLinethrough = function() {
        var value = isLinethrough()
            ? getActiveStyle('textDecoration').replace('line-through', '')
            : (getActiveStyle('textDecoration') + ' line-through');

       setActiveStyle('textDecoration', value);
     };
     var isOverline = function() {
       return getActiveStyle('textDecoration').indexOf('overline') > -1;
     };
     var toggleOverline = function() {
       var value = isOverline()
         ? getActiveStyle('textDecoration').replace('overline', '')
         : (getActiveStyle('textDecoration') + ' overline');

       setActiveStyle('textDecoration', value);
     };

     var fontfamily = document.getElementById("font-family");
      fontfamily.onchange = function() {
         console.log(fontfamily.value);
         var text = canvas.getActiveObject();
         text.fontFamily=fontfamily.value.toLowerCase();
         canvas.renderAll();
      }

      var textbgcolor = document.getElementById("text-bg-color");
      textbgcolor.onchange = function() {
         var text = canvas.getActiveObject();
         text.backgroundColor = textbgcolor.value;
         canvas.renderAll();
      }

      var textlinebgcolor = document.getElementById("text-lines-bg-color");
      textlinebgcolor.onchange = function() {
         var text = canvas.getActiveObject();
         text.textBackgroundColor = textlinebgcolor.value;
         canvas.renderAll();
      }

      var textstrokecolor = document.getElementById("text-stroke-color");
      textstrokecolor.onchange = function() {
         var text = canvas.getActiveObject();
         text.stroke = textstrokecolor.value;
         canvas.renderAll();
      }

      var textstrokewidth = document.getElementById("text-stroke-width");
      textstrokewidth.onchange = function() {
         var text = canvas.getActiveObject();
         text.strokeWidth = textstrokewidth.value;
         canvas.renderAll();
      }

      var textsize = document.getElementById("text-font-size");
      textsize.onchange = function() {
         var text = canvas.getActiveObject();
         text.fontSize = textsize.value;
         canvas.renderAll();
      }

      var textheight = document.getElementById("text-line-height");
      textheight.onchange = function() {
         var text = canvas.getActiveObject();
         text.lineHeight = textheight.value;
         canvas.renderAll();
      }

canvas
  .on('object:selected', updateScope)
  .on('group:selected', updateScope)
  .on('path:created', updateScope)
  .on('selection:cleared', updateScope);

function updateScope() {
  var selectedObjectType = getObjectType();
  refreashModal(selectedObjectType);
}
function getObjectType(){
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
  return selectedObjectType;
}

function refreashModal(type){
  if(type=="i-text"){
   var textarea = document.getElementById('text-area');
   $("#text-area").val(canvas.getActiveObject().getText());
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
    document.getElementById('selModeBtn').style.display = 'none';
  }
  else{
    document.getElementById('drawModeBtn').style.display = 'none';
    document.getElementById('selModeBtn').style.display = 'block';
    $('#textModal').modal('hide');
    $('#defaultModal').modal('hide');
    $('#drawModal').modal({
      backdrop:false
    });
    $('#imgModal').modal('hide');
  }
  canvas.isDrawingMode = !canvas.isDrawingMode;
}

fabric.Object.prototype.transparentCorners = false;

var drawingOptionsEl = document.getElementById('drawing-mode-options'),
drawingColorEl = document.getElementById('drawing-color'),
drawingShadowColorEl = document.getElementById('drawing-shadow-color'),
drawingLineWidthEl = document.getElementById('drawing-line-width'),
drawingShadowWidth = document.getElementById('drawing-shadow-width'),
drawingShadowOffset = document.getElementById('drawing-shadow-offset');

if (fabric.PatternBrush) {
    var vLinePatternBrush = new fabric.PatternBrush(canvas);
    vLinePatternBrush.getPatternSrc = function() {

      var patternCanvas = fabric.document.createElement('canvas');
      patternCanvas.width = patternCanvas.height = 10;
      var ctx = patternCanvas.getContext('2d');

      ctx.strokeStyle = this.color;
      ctx.lineWidth = 5;
      ctx.beginPath();
      ctx.moveTo(0, 5);
      ctx.lineTo(10, 5);
      ctx.closePath();
      ctx.stroke();

      return patternCanvas;
    };

    var hLinePatternBrush = new fabric.PatternBrush(canvas);
    hLinePatternBrush.getPatternSrc = function() {

      var patternCanvas = fabric.document.createElement('canvas');
      patternCanvas.width = patternCanvas.height = 10;
      var ctx = patternCanvas.getContext('2d');

      ctx.strokeStyle = this.color;
      ctx.lineWidth = 5;
      ctx.beginPath();
      ctx.moveTo(5, 0);
      ctx.lineTo(5, 10);
      ctx.closePath();
      ctx.stroke();

      return patternCanvas;
    };

    var squarePatternBrush = new fabric.PatternBrush(canvas);
    squarePatternBrush.getPatternSrc = function() {

      var squareWidth = 10, squareDistance = 2;

      var patternCanvas = fabric.document.createElement('canvas');
      patternCanvas.width = patternCanvas.height = squareWidth + squareDistance;
      var ctx = patternCanvas.getContext('2d');

      ctx.fillStyle = this.color;
      ctx.fillRect(0, 0, squareWidth, squareWidth);

      return patternCanvas;
    };

    var diamondPatternBrush = new fabric.PatternBrush(canvas);
    diamondPatternBrush.getPatternSrc = function() {

      var squareWidth = 10, squareDistance = 5;
      var patternCanvas = fabric.document.createElement('canvas');
      var rect = new fabric.Rect({
        width: squareWidth,
        height: squareWidth,
        angle: 45,
        fill: this.color
      });

      var canvasWidth = rect.getBoundingRectWidth();

      patternCanvas.width = patternCanvas.height = canvasWidth + squareDistance;
      rect.set({ left: canvasWidth / 2, top: canvasWidth / 2 });

      var ctx = patternCanvas.getContext('2d');
      rect.render(ctx);

      return patternCanvas;
    };

    var img = new Image();
    img.src = '/resources/img/00.jpg';

    var texturePatternBrush = new fabric.PatternBrush(canvas);
    texturePatternBrush.source = img;
  }

  document.getElementById('drawing-mode-selector').onchange = function() {
    if (this.value === 'hline') {
      canvas.freeDrawingBrush = vLinePatternBrush;
    }
    else if (this.value === 'vline') {
      canvas.freeDrawingBrush = hLinePatternBrush;
    }
    else if (this.value === 'square') {
      canvas.freeDrawingBrush = squarePatternBrush;
    }
    else if (this.value === 'diamond') {
      canvas.freeDrawingBrush = diamondPatternBrush;
    }
    else if (this.value === 'texture') {
      canvas.freeDrawingBrush = texturePatternBrush;
    }
    else {
      canvas.freeDrawingBrush = new fabric[this.value + 'Brush'](canvas);
    }

    if (canvas.freeDrawingBrush) {
      canvas.freeDrawingBrush.color = drawingColorEl.value;
      canvas.freeDrawingBrush.width = parseInt(drawingLineWidthEl.value, 10) || 1;
      canvas.freeDrawingBrush.shadowBlur = parseInt(drawingShadowWidth.value, 10) || 0;
    }
  };

  drawingColorEl.onchange = function() {
    canvas.freeDrawingBrush.color = this.value;
  };
  drawingShadowColorEl.onchange = function() {
    canvas.freeDrawingBrush.shadowColor = this.value;
  };
  drawingLineWidthEl.onchange = function() {
    canvas.freeDrawingBrush.width = parseInt(this.value, 10) || 1;
    this.previousSibling.innerHTML = this.value;
  };
  drawingShadowWidth.onchange = function() {
    canvas.freeDrawingBrush.shadowBlur = parseInt(this.value, 10) || 0;
    this.previousSibling.innerHTML = this.value;
  };
  drawingShadowOffset.onchange = function() {
    canvas.freeDrawingBrush.shadowOffsetX =
    canvas.freeDrawingBrush.shadowOffsetY = parseInt(this.value, 10) || 0;
    this.previousSibling.innerHTML = this.value;
  };

  if (canvas.freeDrawingBrush) {
    canvas.freeDrawingBrush.color = drawingColorEl.value;
    canvas.freeDrawingBrush.width = parseInt(drawingLineWidthEl.value, 10) || 1;
    canvas.freeDrawingBrush.shadowBlur = 0;
}

var bgcolor = document.getElementById('bgcolor');
bgcolor.onchange = function(event) {
   canvas.backgroundColor = bgcolor.value;
    canvas.renderAll();
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
var objectsInGroup = activeGroup.getObjects();

activeGroup.clone(function(newgroup) {
    canvas.discardActiveGroup();
    objectsInGroup.forEach(function(object) {
        canvas.remove(object);
    });
    canvas.add(newgroup);
    canvas.setActiveObject(newgroup);

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
if (getObjectType()=="i-text") object.initBehavior();

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

function applyFilter(index, filter) {
    var obj = canvas.getActiveObject();
    obj.filters[index] = filter;
    obj.applyFilters(canvas.renderAll.bind(canvas));
  }

  function applyFilterValue(index, prop, value) {
    var obj = canvas.getActiveObject();
    if (obj.filters[index]) {
      obj.filters[index][prop] = value;
      obj.applyFilters(canvas.renderAll.bind(canvas));
    }
  }

  fabric.Object.prototype.padding = 5;
  fabric.Object.prototype.transparentCorners = false;

  var f = fabric.Image.filters;


  canvas.on({
    'object:selected': function() {
      if(getObjectType!='group'){
        fabric.util.toArray(document.getElementsByClassName('writeProperty')).forEach(function(el){ el.disabled = false; })

        var filters = ['grayscale', 'invert', 'remove-white', 'sepia', 'sepia2',
                        'brightness', 'noise', 'gradient-transparency', 'pixelate',
                        'blur', 'sharpen', 'emboss', 'tint', 'multiply', 'blend'];

        // for (var i = 0; i < filters.length; i++) {
        //   $(filters[i]).checked = !!canvas.getActiveObject().filters[i];
        // }
      }
    },
    'selection:cleared': function() {
      fabric.util.toArray(document.getElementsByClassName('writeProperty')).forEach(function(el){ el.disabled = true; })
    }
  });


  $('#grayscale').click(function() {
    applyFilter(0, this.checked && new f.Grayscale());
  });
  $('#invert').click(function() {
    applyFilter(1, this.checked && new f.Invert());
  });
  $('#remove-white').click(function () {
    applyFilter(2, this.checked && new f.RemoveWhite({
      threshold: $('remove-white-threshold').value,
      distance: $('remove-white-distance').value
    }));
  });
  $('#remove-white-threshold').change(function() {
    applyFilterValue(2, 'threshold', this.value);
  });
  $('#remove-white-distance').change(function() {
    applyFilterValue(2, 'distance', this.value);
  });
  $('#sepia').click(function() {
    applyFilter(3, this.checked && new f.Sepia());
  });
  $('#sepia2').click(function() {
    applyFilter(4, this.checked && new f.Sepia2());
  });
  $('#brightness').click(function () {
    applyFilter(5, this.checked && new f.Brightness({
      brightness: parseInt($('brightness-value').value, 10)
    }));
  });
  $('#brightness-value').change(function() {
    applyFilterValue(5, 'brightness', parseInt(this.value, 10));
  });
  $('#noise').click(function () {
    applyFilter(6, this.checked && new f.Noise({
      noise: parseInt($('noise-value').value, 10)
    }));
  });
  $('#noise-value').change(function() {
    applyFilterValue(6, 'noise', parseInt(this.value, 10));
  });
  $('#gradient-transparency').click(function () {
    applyFilter(7, this.checked && new f.GradientTransparency({
      threshold: parseInt($('gradient-transparency-value').value, 10)
    }));
  });
  $('#gradient-transparency-value').change(function() {
    applyFilterValue(7, 'threshold', parseInt(this.value, 10));
  });
  $('#pixelate').click(function() {
    applyFilter(8, this.checked && new f.Pixelate({
      blocksize: parseInt($('pixelate-value').value, 10)
    }));
  });
  $('#pixelate-value').change(function() {
    applyFilterValue(8, 'blocksize', parseInt(this.value, 10));
  });
  $('#blur').click(function() {
    applyFilter(9, this.checked && new f.Convolute({
      matrix: [ 1/9, 1/9, 1/9,
                1/9, 1/9, 1/9,
                1/9, 1/9, 1/9 ]
    }));
  });
  $('#sharpen').click(function() {
    applyFilter(10, this.checked && new f.Convolute({
      matrix: [  0, -1,  0,
                -1,  5, -1,
                 0, -1,  0 ]
    }));
  });
  $('#emboss').click(function() {
    applyFilter(11, this.checked && new f.Convolute({
      matrix: [ 1,   1,  1,
                1, 0.7, -1,
               -1,  -1, -1 ]
    }));
  });
  $('#tint').click(function() {
    applyFilter(12, this.checked && new f.Tint({
      color: document.getElementById('tint-color').value,
      opacity: parseFloat(document.getElementById('tint-opacity').value)
    }));
  });
  $('#tint-color').change(function() {
    applyFilterValue(12, 'color', this.value);
  });
  $('#tint-opacity').change(function() {
    applyFilterValue(12, 'opacity', parseFloat(this.value));
  });
  $('#multiply').click(function() {
    applyFilter(13, this.checked && new f.Multiply({
      color: document.getElementById('multiply-color').value
    }));
  });
  $('#multiply-color').change(function() {
    applyFilterValue(13, 'color', this.value);
  });

  $('#blend').click(function() {
    applyFilter(14, this.checked && new f.Blend({
      color: document.getElementById('blend-color').value,
      mode: document.getElementById('blend-mode').value
    }));
  });

  $('#blend-mode').change(function() {
    applyFilterValue(14, 'mode', this.value);
  });

  $('#blend-color').change(function() {
    applyFilterValue(14, 'color', this.value);
  });

  var opacity = document.getElementById('opacity');
  opacity.onchange = function() {
     var activeObject = canvas.getActiveObject();
     activeObject.set({opacity : opacity.value/100});
     canvas.renderAll();
  }

  var objcolor = document.getElementById('objectColor');
  objcolor.onchange = function() {
     var activeObject = canvas.getActiveObject();
     activeObject.setColor(objcolor.value);
     canvas.renderAll();
  }

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
            strOption += "<option value=\""+ categorylist[i].boa_category + "\">" + categorylist[i].boa_category +"</option>"
         }
         $("#datalist").append(strOption);
         $("#formType").val('w-modal');
         
         $("#writeform").trigger("reset");
         
         $("#writemodal .box-title").html("POSTING");
         $("#writeSubmit").html("Write");
         
         $("div#taglistdiv").empty();
//         onClickClearBtn();
      }
   });
}

function onClickModifyBoardBtn(boa_snum){
	$('.modal').modal('hide');
	$.ajax( {
		url : "/board/modifyBoardForm?boa_snum="+boa_snum,
		type: "get",
		dataType: "json",
		success: function( response ){
			
			board = response.board;
			taglist = response.taglist;
			categorylist = response.categorylist;
			
			
			$("#boa_snum").val(boa_snum) ;
			canvas.loadFromJSON(response.data, function(){
		        canvas.renderAll();
		    });
			
			$("#boa_subject").val(board.boa_subject);
			
			
	         $("#datalist").empty();
	         var strOption = "";
	         for(var i=0; i<categorylist.length; i++){
	            strOption += "<option value=\""+ categorylist[i].boa_category + "\">" + categorylist[i].boa_category +"</option>"
	         }
	         $("#datalist").append(strOption);
	         
	         $("#datalist").val(board.boa_category);
	         
			
			$("div#taglistdiv").empty();
			tagNum = 0;
			for(var i=0; i<taglist.length; i++){
				var tagText = taglist[i].tag;
			   	var newtagcode =
			      "<div id=\'tag" + tagNum + "\'><span  class=\' boardtag label label-danger pull-right\'>" + tagText + "<a href=\'#\' onclick=\'onClickTagRemove(" + tagNum + ");\'><i class=\'fa fa-close\'></a></span></div>";
			   tagNum = tagNum + 1;
			   $("div#taglistdiv").append(newtagcode);
			}
		   $("#formType").val("m-modal");

	         $("#writemodal .box-title").html("MODIFY");
	         $("#writeSubmit").html("MODIFY");
			$("#writemodal").modal();
		}
	});
}
