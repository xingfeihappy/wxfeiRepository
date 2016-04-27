

/*newApplication.jsp中的项目类型判断   <%-- onclick='down(<s:property value="projection.id" />,3)' --%>*/
//以下东西，1开头表示是申报人自己填的，0开头表示是操作管理员帮忙填的，91,92,93表示从help.jsp页面传过来的项目类型参数并且是申报人自己填写的
var projectionType = location.search.split("=")[1];
var url = location.search;
var Request = new Object();
if(url.indexOf("?"!=-1)){
	  var str = url.substr(1);
	  strs = str.split("&");
	  for(var i = 0;i<strs.length;i++){
		  Request[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
	  }
	  if(Request["projection.projectionType"]==11){
		  
	  }else if(Request["projection.projectionType"]==12){
		/*  $(".budget .changeGray td input").attr("readOnly","true").removeClass("datetimepickerYear").removeClass("budgetNumber");
		  $(".total").css("color","#333").attr({"value":"预计总额"}).parent().next().children(":eq(0)").css("color","#333");
		  $(".total").parent().parent().parent().children().children().css("color","#999")*/
	  }else if(Request["projection.projectionType"]==13){
		  $(".generate,.down").css("display","none")
	  }
	//根据项目类型选择help
	  $(".projectionType").attr("value",Request["projection.projectionType"]);
	  if($(".projectionType").attr("value") == 11){
		  
	  }
	  if($(".projectionType").attr("value") == 12){
		  /*$(".budget tr td input[readOnly='true'],.budget tr td textarea,.budget .changeGray td").attr("readOnly","true").removeClass("datetimepickerYear");
		  $(".total").css("color","#333").attr({"value":"预计总额"}).parent().next().children(":eq(0)").removeAttr("readOnly").css("color","#333");
		  $(".total").parent().parent().parent().children().children().css("color","#999")*/
	  }
	  if($(".projectionType").attr("value") == 13){
		  $(".generate,.down").css("display","none")
	  }
	  
}

function backHelp(id){
	 window.location.href="HelpPage?from="+id;
}
function getReviewFileName(e){
	$(e).parent().next().attr("value",e.value.split('\\')[2])
}
/*tab页的切换*/
  //$('#myTab li:eq(2) a').tab('show')
  function tabChange(){
	$("#myTab li").each(function(){
		if($(this).hasClass("active")){
			var preTab = $(this).prev();
			preTab.find("a").tab("show");
		}
	})
}
setInterval("timeStr=new Date().toLocaleString();timer.innerText=timeStr;",
			1000)
/*tab页的切换*/

var list = $("#myTab li");

function foo(){
	for(var i =0 ;i<list.length;i++){
		list[i].onclick= (function(k){
			return function(){
				//$('#myTab li:eq('+k+') a').tab('show')
				$(".tab").attr("value",k);
			}
		})(i);
	}
}
foo();
//获取点击的tab框的索引
  
/*iframe框高度自适应*/
function iFrameHeight(){
	  var ifr = document.getElementById("iframe");
	  var subWeb = document.frames?document.frames["iframe"].document:ifr.contentDocument;
	  if(ifr!=null&&subWeb!=null){
		  ifr.height=subWeb.body.scrollHeight+30;
	  }
}
/*iframe框高度自适应*/

/*左侧菜单的切换*/
$(".leftsidebar_box dt,.leftsidebar_box dd").mouseover(function(){
$(this).css( "background-color", "#317eb4" );
});
$(".leftsidebar_box dt,.leftsidebar_box dd").mouseout(function(){
$(this).css( "background-color", "#3992d0" );
});

$(".leftsidebar_box dt img").attr("src","resource/image/select_xl01.png");
$(function(){
$(".leftsidebar_box dd").hide();
$(".leftsidebar_box dt").click(function(){
	$(".leftsidebar_box dt").css({"background-color":"#3992d0"});
	$(this).css({"background-color": "#317eb4"});
	$(this).parent().find('dd').removeClass("menu_chioce");
	$(".leftsidebar_box dt img").attr("src","resource/image/select_xl01.png");
	$(this).parent().find('img').attr("src","resource/image/select_xl.png");
	$(".menu_chioce").slideUp(); 
	$(this).parent().find('dd').slideToggle();
	$(this).parent().find('dd').addClass("menu_chioce");
});
})
/*左侧菜单的切换*/

/*角色切换*/
function role_change(obj){
	$(".usertypeForm").submit();
}
/*角色切换*/


//当选择其他的时候可编辑
$(".newApplication table tr select.type").change(function(){
	  if($(this).children('option:selected').val()=="其他"){
		  $(this).next().next().css({"display":""});
	  }else{
		  $(this).next().next().css({"display":"none"});
	  }
})
$(".resultForm").change(function(){
	if($(this).children('option:selected').val()=="其他"){
		  $(this).next().css({"display":""});
	  }else{
		  $(this).next().css({"display":"none"});
	  }
})
//新增页面里里面的增加主要参与者
var add = $(".addParticipation"),addCols = $(".addCols"),participationInput = $("#participationInput"),resultInput = $("#resultInput"),budgetTotal = $("#budgetTotal");
var conrel = $(".conrel");
var partitionCount = 1,resultCount = 1;
var oldparSizeValue = parseInt($("#oldparSize").val());
var oldresultSize = parseInt($("#oldresultSize").val());
var oldfileSize = parseInt($("#oldfileSize").val());
var sizep;
var node1;
add.click(function(){
	  sizep = parseInt(partitionCount + oldparSizeValue);
	  if(partitionCount < 8){
	   node1 = $(this).parent().parent().parent();
       /*$("<tr class='participation'>" +
       		"<td style='text-align:left'><input datatype='*' type='text' style='width:90%;text-align:center' class='username' onblur='validate(this)' name='participationList["+((sizep-1))+"].name'/></td>" +
       		"<td style='text-align:left'><input datatype='*' type='text' name='participationList["+(sizep-1)+"].birthday'  style='width:70%;' readOnly='true' data-date-format='yyyy-mm-dd' class='datetimepicker"+sizep+"'/></td>" +
       				"<td style='text-align:left'><select style='width:90%;text-align:center' class='education' onchange='validate(this)' name='participationList["+((sizep-1))+"].education'><option>请选择</option><option>博士研究生</option><option>硕士研究生</option><option>本科</option><option>专科</option></select></td><td style='text-align:left'><input datatype='*' onblur='validate(this)' type='text' class='specialSkill' name='participationList["+(sizep-1)+"].specialSkill'/></td><td style='text-align:left'><select onchange='validate(this)' class='degree' name='participationList["+((sizep-1))+"].degree' style='width:90%;text-align:center'><option>请选择</option><option>博士学位</option><option>硕士学位</option><option>学士学位</option></select></td><td style='text-align:left'><input datatype='*' onblur='validate(this)' type='text' name='participationList["+(sizep-1)+"].positionLevel' class='positionLevel'></td><td style='text-align:left'><input datatype='*' onblur='validate(this)' class='duty' type='text' name='participationList["+(sizep-1)+"].duty'/></td><td style='text-align:left' colspan='2'><input datatype='*' type='text' onblur='validate(this)' class='unit' name='participationList["+(sizep-1)+"].unit'/><a onclick='deletePar1(this)' title='删除'><i class='icon-del'></i></a></td></tr><script>$(\".datetimepicker\"+sizep+\"\").datetimepicker({format:\'yyyy-mm-dd\',language : \'fr\',weekStart : 1,todayBtn : 1,autoclose : 1,todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,showMeridian:1,})<\/script>").insertAfter(node1);
       */
	   node1.append($("<tr class='participation'>" +
       		"<td style='text-align:left'><input type='text' style='width:90%;text-align:center' class='parname' onblur='validate(this)' name='participationList["+((sizep-1))+"].name'/></td>" +
       		"<td style='text-align:left'><input type='text' name='participationList["+(sizep-1)+"].birthday' onblur='validateBir(this)' style='width:100%;' readOnly='true' data-date-format='yyyy-mm-dd' class='bir datetimepicker"+sizep+"'/></td>" +
       				"<td style='text-align:left'><select style='width:90%;text-align:center' class='education' onchange='validate(this)' name='participationList["+((sizep-1))+"].education'><option>请选择</option><option>大学专科</option><option>大学本科</option><option>硕士研究生</option><option>博士研究生</option></select></td><td style='text-align:left'><input onblur='validate(this)' style='width:100%' type='text' class='specialSkill' name='participationList["+(sizep-1)+"].specialSkill'/></td><td style='text-align:left'><select onchange='validate(this)' class='degree' name='participationList["+((sizep-1))+"].degree' style='width:90%;text-align:center'><option>请选择</option><option>学士</option><option>硕士</option><option>博士</option><option>博士后</option></select></td><td style='text-align:left'><input onblur='validate(this)' style='width:100%' type='text' name='participationList["+(sizep-1)+"].positionLevel' class='positionLevel'></td><td style='text-align:left' colspan='2'><input type='text' onblur='validate(this)' class='unit' name='participationList["+(sizep-1)+"].unit'/><a onclick='deletePar1(this)' title='删除'><i class='deleteProfessor'></i></a></td></tr><script>$(\".datetimepicker\"+sizep+\"\").datetimepicker({format:\'yyyy-mm-dd\',language : \'fr\',weekStart : 1,todayBtn : 1,autoclose : 1,todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,showMeridian:1,pickerPosition: 'top-right'})<\/script>"));
	   partitionCount++; 
	  }else add.css("disabled",true);
})


//新增页面里面的删除参与者
function deletePar1(e){
	var child = $(e).parent().parent();
	child.remove();
	partitionCount--;
	//(sizep-1)--;
}
var oldSizeValue = 0;
var size;
//申报时
  addCols.click(function(){
	  size = parseInt(resultCount + oldresultSize);
	  if(resultCount < 6){
		  var node1 = $(this).prev();
		  node1.append($("<tr><td><select class='atype' style='width:95%' onchange='validate1(this)' name='achievementList["+(size-1)+"].achievementType'><option>阶段性研究成果</option><option>最终研究成果</option></select></td><td><input onblur='validateFis(this)' readOnly='true' type='text' style='width:98%' data-date-format='yyyy-mm-dd' class='afis datetimepicker"+size+"' name='achievementList["+(size-1)+"].finishTime'"
				  +"/></td><td><input onblur='validate1(this)' style='width:98%' class='atitle' type='text' name='achievementList["+(size-1)+"].title'/></td><td><input onchange='validate1(this)' class='aform' style='width:98%' name='achievementList["+(size-1)+"].achievementForm' type='text'/></td>" +
				  		"<td><input onblur='validate1(this)' class='awords' type='text' name='achievementList["+(size-1)+"].achievementWords' /></td><td><input type='text' name='achievementList["+(size-1)+"].participation'><a class='del' onclick='deleteResult(this)' title='删除'><i class='deleteProfessor'></i></a></td></tr><script>$(\".datetimepicker\"+size+\"\").datetimepicker({format:\'yyyy-mm-dd\',language : \'fr\',weekStart : 1,todayBtn : 1,autoclose : 1,todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,showMeridian:1})<\/script>"));
		  resultCount++;
	  }else addCols.css("disabled",true);
	  resultInput.attr("value",resultCount-1+oldSizeValue);
  })
  //结题时
  conrel.click(function(){
	  size = parseInt(resultCount + oldresultSize);
	  if(resultCount < 6){
		  var node1 = $(this).prev();
		  node1.append($("<tr><td><select style='width:95%' onchange='validate1(this)' name='achievementList["+(size-1)+"].achievementType'><option>最终研究成果</option></select></td><td><input onblur='validate1(this)' readOnly='true' type='text' style='width:98%' data-date-format='yyyy-mm-dd' class='datetimepicker"+size+"' name='achievementList["+(size-1)+"].finishTime'"
				  +"/></td><td><input onblur='validate1(this)' style='width:98%' class='resultTitle' type='text' name='achievementList["+(size-1)+"].title'/></td><td><input onchange='validate1(this)' class='aform' style='width:98%' name='achievementList["+(size-1)+"].achievementForm' type='text'/></td>" +
				  		"<td><input onblur='validate1(this)' class='resultWords' type='text' name='achievementList["+(size-1)+"].achievementWords' /></td><td><input type='text' name='achievementList["+(size-1)+"].participation'><a class='del' onclick='deleteResult(this)' title='删除'><i class='deleteProfessor'></i></a></td></tr><script>$(\".datetimepicker\"+size+\"\").datetimepicker({format:\'yyyy-mm-dd\',language : \'fr\',weekStart : 1,todayBtn : 1,autoclose : 1,todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,showMeridian:1})<\/script>"));
		  resultCount++;
	  }else addCols.css("disabled",true);
	  resultInput.attr("value",resultCount-1+oldSizeValue);
  })
  //增加书籍信息
  $(".con").click(function(){
	  size = parseInt(resultCount + oldresultSize);
	  if(resultCount < 6){
		  var node1 = $(this).prev();
		  node1.append($("<tr><td><input type='text' style='width:95%' class='abook' onblur='validate1(this)' name='achievementList["+(size-1)+"].bookName' /></td><td><input class='apublisher' onblur='validate1(this)' type='text' name='achievementList["+(size-1)+"].publisher'"
				  +"/></td><td><input style='width:98%' class='apprice' onblur='validate1(this)' type='text' name='achievementList["+(size-1)+"].publishPrice' onkeyup='(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,\"\");}).call(this)' onblur='this.v();'/></td><td><input type='text' class='aISBN' style='width:98%' onblur='validate1(this)' name='achievementList["+(size-1)+"].ISBN' /></td>" +
				  		"<td><input class='awords' type='text' onblur='validate1(this)' name='achievementList["+(size-1)+"].price' onkeyup='(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,\"\");}).call(this)' onblur='this.v();'/></td><td><input type='text' class='acount' onblur='validate1(this)' name='achievementList["+(size-1)+"].count' onkeyup='(this.v=function(){this.value=this.value.replace(/[^0-9\.]+/,\"\");}).call(this)' onblur='this.v();'/><a class='del' onclick='deleteResult(this)' title='删除'><i class='deleteProfessor'></i></a></td></tr>"));
		  resultCount++;
	  }else addCols.css("disabled",true);
	  resultInput.attr("value",resultCount-1+oldSizeValue);
  })
  //增加文件
  var addFile = $(".addFile"),filesCount = $("#filesCount");
  var fileCount = 0;
  var sizeFile ;
  addFile.click(function(){
	  sizeFile = fileCount + oldfileSize;
	  if(fileCount < 3){
			var node = $(this).prev().children(":eq(1)")/*.children(":eq(0)")*/;
			node.append($("<tr><td><div class='fileUpload btn btn-primary back'><span>上传</span><input type='file' name='otherFile' onchange='getFileName(this)' class='upload upload"+1+"'></div></td><td><input type='text' placeholder='文件名称' class='fileName'/></td><td><input type='text' readonly='true' value='.pdf' /></td><td><span class='validate'><i class='Validform_right'></i>格式正确</span><span class='novalidate'><i class='Validform_wrong'></i>格式错误,限pdf格式</span><span>未选择任何上传文件</span></td><td><input type='text' readOnly='true' value='' class='timer' /></td><td><input type='text' readOnly='true' placeholder='文件格式限pdf,文件大小限'/></td><td><a onclick='deleteFiles(this)' title='删除'><i class='deleteProfessor'></i></a></td></tr>"));
		    fileCount++; 
	    }else addFile.css("disabled",true);
	  		filesCount.attr("value",fileCount);
  })
  //删除成果
  function deleteResult(e){
	  var child = $(e).parent().parent();
	  child.remove();
	  resultCount--;
	  //size--;
	  
  }
  
  //删除文件
  function deleteFiles(e){
	  var child = $(e).parent().parent();
	  child.remove();
	  fileCount--;
	  filesCount.attr("value",fileCount);
  }
  
  //验证上传文件格式并//获取到文件的名字
  function getFileName(e){
	$(e).parent().parent().parent().children(":eq(0)").children(":eq(0)").attr("value",e.value.split('\\')[2]);
 	var val = e.value,t;
	/*var doc = val.split(".")[1];*/
 	var doc = val.substr(val.length-4)
	var ary = [".pdf"];
	t = $.inArray(doc,ary);
	if(t != -1){
		//格式正确
		$(e).parent().parent().next().next().next().children(":eq(0)").css("display","inline-block");
		$(e).parent().parent().next().next().next().children(":eq(1)").css("display","none");
		$(e).parent().parent().next().next().next().children(":eq(2)").css("display","none");
		$(e).parent().parent().next().next().next().children(":eq(3)").css("display","inline-block");
	}else{
		//格式错误
		$(e).parent().parent().next().next().next().children(":eq(0)").css("display","none");
		$(e).parent().parent().next().next().next().children(":eq(1)").css("display","inline-block");
		$(e).parent().parent().next().next().next().children(":eq(2)").css("display","none");
		$(e).parent().parent().next().next().next().children(":eq(3)").css("display","none");
	}
  }

function help(from,id){
	  var url = "HelpPage?argue="+from+"&projection.id="+id;
	  location.href=url;
}
$(".commonbtn input[type='submit']").click(function(){
	  var type = $(this).attr("id");
	  var form = $("#form");
	  var input = $(".tempsave");
	  input.attr("value",type);
	  $(".font-tip").html("已保存")
	  $("#dvMsgBox1").css("display","block");
	  form.submit();
}) 

 function fun1(){
	fun4();
}
function fun2(){
	fun4();
}
function fun3(){
	fun4();
}
function fun4(){
	$('.datetimepickeradd').datetimepicker({
		   language : 'fr',weekStart : 1,todayBtn : 1,autoclose : 1,
		   todayHighlight : 1,startView : 2,minView : 2,forceParse : 0,
	});
};


/*页面滚到顶部*/
$("body").scrollTop(0);