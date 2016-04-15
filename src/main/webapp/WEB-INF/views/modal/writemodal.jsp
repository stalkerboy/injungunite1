
<div class="writeform-modal">
   <div id="writemodal" class="modal fade">
      <div class="modal-dialog " style="width: 80%; ">

      <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">글쓰기</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-dismiss="modal"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">


                  <form id="writeform" action="/board/write" method="post">
            <input type="text" id="boa_imgjson" name="boa_imgjson" value="" hidden>
            <input type="text" id="boa_imgpng" name="boa_imgpng" value="" hidden>
            <input type="text" id="tags" name="tags" value="" hidden>
            <div class="modal-content">
               <div class="modal-header text-align">
                  <div class="row">
                     <div class="col-sm-2">

                        <select id="datalist"  name="category" id="category" class="form-control"></select>
                     </div>
                     <div class="col-sm-10">
                        <input type="text" id="boa_subject" name="boa_subject" value="" class="form-control" placeholder="주제">
                     </div>
                  </div>


               </div>
               <div class="modal-body">
                  <button type="button" class="btn btn-default btn-sm" id="textBtn"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAtklEQVQ4T73SsQkCQRCF4e+6ELQAYyNFjC1ABFswMzSwAusQTAQxtAArsARDS1BQ9tiV8zyEO9CNFnbev2/mTYaZ+ueES5BleNTXm2KXAPfo4oBbhIXHSbyHT1JtF3usioAjxiUXVYBUMse1CKjq4BvgrT7ZK0N+CgipbWMAeQp1W2gMSMLGM+igjyEW5Lvw3xaS9eTktYl1h9h4BpVxlWMcoYclWlGxxhmbKkIZMED7y258PD0BkYoiZMYTzLwAAAAASUVORK5CYII=" style="width:12px;height:12px;" >텍스트</i></button>

            <button type="button"  class="btn btn-default btn-sm" onclick="document.getElementById('imgLoader').click()"><i class="fa fa-photo">이미지</i></button>
            <button type="button"  hidden><input type="file" id="imgLoader" multiple></button>

            <div class="btn-group">
              <button type="button"  class="btn btn-default btn-sm" id="drawModeBtn" onclick="onClickDrawingModeBtn();"><i class="fa fa-pencil">그리기모드</i></button>
              <button type="button"  class="btn btn-default btn-sm" id="selModeBtn" onclick="onClickDrawingModeBtn();" style="display:none;"><i class="fa fa-mouse-pointer">일반선택모드</i></button>
            </div>

            <button type="button"  class="btn btn-default btn-sm"><i class="fa fa-remove" onclick="onClickClearBtn();">초기화</i></button>
               배경색 : <input type="color" id="bgcolor">
               채우기 : <input type="color" id="objectColor">

            <div class="pull-right">
              <button type="button"  class="btn btn-default btn-sm"><i class="fa fa-save">내pc저장</i></button>
            </div><!-- /.pull-right -->

                  <div class="table-responsive">
              <table class="table table-hover table-striped">
                        <tbody>
                   <div class="canvas-wrapper">
                     <canvas class="responsive" id="canvas" width="800" height="450" style="border:1px solid #000000"></canvas>
                           </div>
                </tbody>
              </table><!-- /.table -->
                  </div>
                  <div class="row">
                     <div class="col-lg-3 pull-right">
                        <div class="input-group">
                   <input id="addTagText" type="text" class="input-sm" placeholder="new tag">
                           <button id="addTagBtn" type="button" class="btn btn-primary btn-xs">tagAdd</button>
                </div><!-- /input-group -->
                     </div>
                     <div class="col-lg-9" id="taglistdiv">
<!--                         <span class="label label-danger pull-right">태그1<a href="#"> X</a></span> -->
                     </div>
                  </div>
               </div>

            </div><!-- /.modal-content -->
         </form>


                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                             <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                <button id="writeSubmit" type="button" class="btn btn-default pull-right" >글쓰기</button>




                </div><!-- /.box-footer -->
              </div><!-- /.box -->

      </div><!-- /.modal-dialog -->
   </div><!-- /.modal -->
</div>



<div class="myattr-modal">
  <div id="textModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">글쓰기속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" style="CURSOR:hand;" title="삭제"><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group" style="CURSOR:hand;" title="그룹"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup" style="CURSOR:hand;" title="그룹해제"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" style="CURSOR:hand;" title="좌우반전"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy" style="CURSOR:hand;" title="복사"><i class="fa fa-copy"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-sendbackwards" style="CURSOR:hand;" title="맨뒤로"><i class="fa fa-angle-double-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-sendtoback" style="CURSOR:hand;" title="뒤로"><i class="fa fa-angle-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringforward" style="CURSOR:hand;" title="앞으로"><i class="fa fa-angle-right"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringtofront" style="CURSOR:hand;" title="맨앞으로"><i class="fa fa-angle-double-right"></i></button>
            </div>


          </div>

          <div style="background-color:blue; height: 5px; margin-top: 5px"></div>
          <div>

<textarea id="text-area" class="form-control" rows="3" ></textarea>


<div class="btn-group">
  <button class="btn btn-default btn-sm" style="CURSOR:hand;" title="가운데정렬" onclick="onClickAlginCenterBtn();"><i class="fa fa-align-center"></i></button>
  <button class="btn btn-default btn-sm" style="CURSOR:hand;" title="양쪽정렬" onclick="onClickAlginJustifyBtn();"><i class="fa fa-align-justify"></i></button>
  <button class="btn btn-default btn-sm" style="CURSOR:hand;" title="왼쪽정렬" onclick="onClickAlginLeftBtn();"><i class="fa fa-align-left"></i></button>
  <button class="btn btn-default btn-sm" style="CURSOR:hand;" title="오른쪽정렬" onclick="onClickAlginRightBtn();"><i class="fa fa-align-right"></i></button>
</div>

<input type="range" value="0" min="0" max="50" bind-value-to="thcik">
<div id="text-controls-additional">
      <button type="button" class="btn btn-object-action writeProperty"
        onclick="toggleBold()">
        Bold
      </button>
      <button type="button" class="btn btn-object-action writeProperty" id="text-cmd-italic"
        onclick="toggleItalic()">
        Italic
      </button>
      <button type="button" class="btn btn-object-action writeProperty" id="text-cmd-underline"
        onclick="toggleUnderline()">
        Underline
      </button>
      <button type="button" class="btn btn-object-action writeProperty" id="text-cmd-linethrough"
        onclick="toggleLinethrough()">
        Linethrough
      </button>
      <button type="button" class="btn btn-object-action writeProperty" id="text-cmd-overline"
        onclick="toggleOverline()">
        Overline
      </button>
</div>
<div id="text-wrapper" style="margin-top: 10px">
  <div id="text-controls">
      <label for="font-family" style="display:inline-block">Font family:</label>
      <select id="font-family" class="btn-object-action">
        <option value="arial">Arial</option>
        <option value="helvetica" selected>Helvetica</option>
        <option value="myriad pro">Myriad Pro</option>
        <option value="delicious">Delicious</option>
        <option value="verdana">Verdana</option>
        <option value="georgia">Georgia</option>
        <option value="courier">Courier</option>
        <option value="comic sans ms">Comic Sans MS</option>
        <option value="impact">Impact</option>
        <option value="monaco">Monaco</option>
        <option value="optima">Optima</option>
        <option value="hoefler text">Hoefler Text</option>
        <option value="plaster">Plaster</option>
        <option value="engagement">Engagement</option>
      </select>
  </div>
  <div>
        <label for="text-bg-color">Background color:</label>
        <input type="color" id="text-bg-color" size="10" class="btn-object-action">
      </div>
      <div>
        <label for="text-lines-bg-color">Background text color:</label>
        <input type="color" id="text-lines-bg-color" size="10" class="btn-object-action">
      </div>
      <div>
        <label for="text-stroke-color">Stroke color:</label>
        <input type="color" id="text-stroke-color" class="btn-object-action">
      </div>
      <div>
        <label for="text-stroke-width">Stroke width:</label>
        <input type="range" value="1" min="1" max="5" id="text-stroke-width" class="btn-object-action">
      </div>
      <div>
        <label for="text-font-size">Font size:</label>
        <input type="range" value="" min="1" max="120" step="1" id="text-font-size" class="btn-object-action">
      </div>
      <div>
        <label for="text-line-height">Line height:</label>
        <input type="range" value="" min="0" max="10" step="0.1" id="text-line-height" class="btn-object-action">
      </div>
</div>

          </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>


<div class="myattr-modal">
  <div id="drawModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">그리기속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" style="CURSOR:hand;" title="삭제"><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group" style="CURSOR:hand;" title="그룹"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup" style="CURSOR:hand;" title="그룹해제"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" style="CURSOR:hand;" title="좌우반전"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy" style="CURSOR:hand;" title="복사"><i class="fa fa-copy"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-sendbackwards" style="CURSOR:hand;" title="맨뒤로"><i class="fa fa-angle-double-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-sendtoback" style="CURSOR:hand;" title="뒤로"><i class="fa fa-angle-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringforward" style="CURSOR:hand;" title="앞으로"><i class="fa fa-angle-right"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringtofront" style="CURSOR:hand;" title="맨앞으로"><i class="fa fa-angle-double-right"></i></button>
              <br/>
              <label for="opacity">Opacity:</label>
              <input type="range" value="100" min="0" max="100" id="opacity">
            </div>
          </div>

          <div id="drawing-mode-options">
            <label for="drawing-mode-selector">Mode:</label>
            <select id="drawing-mode-selector" style="color:black;">
              <option>Pencil</option>
              <option>Circle</option>
              <option>Spray</option>
              <option>Pattern</option>

              <option>hline</option>
              <option>vline</option>
              <option>square</option>
              <option>diamond</option>
              <option>texture</option>
            </select>

            <label for="drawing-line-width">Line width:</label>
            <span class="info">5</span><input type="range" value="5" min="0" max="150" id="drawing-line-width">

            <label for="drawing-color">Line color:</label>
            <input type="color" value="#005E7A" id="drawing-color">

            <label for="drawing-shadow-color">Shadow color:</label>
            <input type="color" value="#005E7A" id="drawing-shadow-color">

            <label for="drawing-shadow-width">Shadow width:</label>
            <span class="info">0</span><input type="range" value="0" min="0" max="50" id="drawing-shadow-width">

            <label for="drawing-shadow-offset">Shadow offset:</label>
            <span class="info">0</span><input type="range" value="0" min="0" max="50" id="drawing-shadow-offset">
          </div>
        </div>

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>




<div class="myattr-modal">
  <div id="imgModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">이미지속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" style="CURSOR:hand;" title="삭제"><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group" style="CURSOR:hand;" title="그룹"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup" style="CURSOR:hand;" title="그룹해제"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" style="CURSOR:hand;" title="좌우반전"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy" style="CURSOR:hand;" title="복사"><i class="fa fa-copy"></i></button>
            </div>
            <br>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-sendbackwards" style="CURSOR:hand;" title="맨뒤로"><i class="fa fa-angle-double-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-sendtoback" style="CURSOR:hand;" title="뒤로"><i class="fa fa-angle-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringforward" style="CURSOR:hand;" title="앞으로"><i class="fa fa-angle-right"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringtofront" style="CURSOR:hand;" title="맨앞으로"><i class="fa fa-angle-double-right"></i></button>
            </div>
          </div>

          <div id="img-fillter">

    <label><span>Grayscale:</span> <input type="checkbox" id="grayscale" class="writeProperty" disabled></label>
    <label><span>Invert:</span> <input type="checkbox" id="invert" class="writeProperty" disabled></label><br>
    <label><span>Sepia:</span> <input type="checkbox" id="sepia" class="writeProperty" disabled></label>
    <label><span>Sepia2:</span> <input type="checkbox" id="sepia2" class="writeProperty" disabled></label><br>

    <label><span>Remove white:</span> <input type="checkbox" id="remove-white" class="writeProperty" disabled></label>
    <br>
    <label>Threshold: <input type="range" id="remove-white-threshold" value="60" min="0" max="255" class="writeProperty" disabled></label>
    <br>
    <label>Distance: <input type="range" id="remove-white-distance" value="50" min="0" max="255" class="writeProperty" disabled></label>
     <br>
    <label><span>Brightness:</span> <input type="checkbox" id="brightness" class="writeProperty" disabled></label>
    <br>
    <label>Value: <input type="range" id="brightness-value" value="100" min="0" max="255" class="writeProperty" disabled></label>
     <br>
    <label><span>Noise:</span> <input type="checkbox" id="noise" class="writeProperty" disabled></label>
    <br>
    <label>Value: <input type="range" id="noise-value" value="100" min="0" max="1000" class="writeProperty" disabled></label>
     <br>
    <label><span>GradientTransparency:</span> <input type="checkbox" id="gradient-transparency" class="writeProperty" disabled></label>
    <br>
    <label>Value: <input type="range" id="gradient-transparency-value" value="100" min="0" max="255" class="writeProperty" disabled></label>
     <br>
    <label><span>Pixelate:</span> <input type="checkbox" id="pixelate" class="writeProperty" disabled></label>
    <br>
    <label>Value: <input type="range" id="pixelate-value" value="4" min="2" max="20" class="writeProperty" disabled></label>
     <br>
    <label><span>Blur:</span> <input type="checkbox" id="blur" class="writeProperty" disabled></label>

    <label><span>Sharpen:</span> <input type="checkbox" id="sharpen" class="writeProperty" disabled></label>

    <label><span>Emboss:</span> <input type="checkbox" id="emboss" class="writeProperty" disabled></label>
     <br>
    <label><span>Tint:</span> <input type="checkbox" id="tint" class="writeProperty" disabled></label><br>
    <label>Color: <input type="color" id="tint-color" value="" class="writeProperty" ></label><br>
    <label>Opacity: <input type="range" id="tint-opacity" min="0" max="1" value="1" step="0.1" class="writeProperty" ></label><br>

    <label><span>Multiply:</span> <input type="checkbox" id="multiply" class="writeProperty" disabled></label><br>
    <label>Color: <input type="color" id="multiply-color" value="" class="writeProperty" ></label><br>


  <label><span>Blend:</span> <input type="checkbox" id="blend" class="writeProperty" disabled></label>
  <br>
  <label>Mode:</label>
    <select id="blend-mode" name="blend-mode">
      <option selected value="add">Add</option>
      <option value="diff">Diff</option>
      <option value="subtract">Subtract</option>
      <option value="multiply">Multiply</option>
      <option value="screen">Screen</option>
      <option value="lighten">Lighten</option>
      <option value="darken">Darken</option>
    </select>
    <br>
    <label>Color: <input type="color" id="blend-color" value="#00f900" class="writeProperty" ></label><br>

  </div>
        </div>

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>


<div class="myattr-modal">
  <div id="defaultModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">기본속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" style="CURSOR:hand;" title="삭제"><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group" style="CURSOR:hand;" title="그룹"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup" style="CURSOR:hand;" title="그룹해제"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" style="CURSOR:hand;" title="좌우반전"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy" style="CURSOR:hand;" title="복사"><i class="fa fa-copy"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-sendbackwards" style="CURSOR:hand;" title="맨뒤로"><i class="fa fa-angle-double-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-sendtoback" style="CURSOR:hand;" title="뒤로"><i class="fa fa-angle-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringforward" style="CURSOR:hand;" title="앞으로"><i class="fa fa-angle-right"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringtofront" style="CURSOR:hand;" title="맨앞으로"><i class="fa fa-angle-double-right"></i></button>
            </div>
          </div>

          <div style="background-color:blue; height: 5px; margin-top: 5px"></div>


          <div>


<div class="btn-group">
  <button class="btn btn-default btn-sm"><i class="fa fa-align-center"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-justify"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-left"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-right"></i></button>
</div>

</div>
        </div>

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>