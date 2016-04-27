//计算经费合计
var budgetNumbers = $(".budgetNumber");
var total,totalYear;
$(".budgetNumber").change(function(){
	total=0;
	totalYear=0;
	//$(this).value = $(this).value.toFixed(1);
	for(var i=0; i<11;i++){
		total+=isNaN(parseFloat(budgetNumbers[i].value))==false?parseFloat(budgetNumbers[i].value):0;
	}
	for(var i=12;i<=15;i++){
		totalYear+=isNaN(parseFloat(budgetNumbers[i].value))==false?parseFloat(budgetNumbers[i].value):0;
	}
	budgetNumbers[11].value=total;
	budgetNumbers[16].value=totalYear;
})
//校验开始
var jy = $(".jy"),jy1 = $(".jy1"),zc = $(".zc"),submit = $(".submit"),generate = $(".generate"),down = $(".down");
var isNumber = /^\d*\.*\d*$/;
var isSubmit = new Array(100);//课题名称、关键词等等的校验
var isFileTwo = new Array(50);//课题论证\研究条件与保障的验证
var isFileRelate = true;//相关附件的验证
var isEmpty = new Array(100);//参与者判断
var isResult = new Array(100);//成果判断
//var isNumber = true;//检查填入的是否是数字
var currentSubmit = 0;
var currentFile = 0;
var currentEmpty = 0;
var currentResult = 0;
//从myProjection页面进去
$(".jy,.submit,#down").click(function(){
	$(".validate1").css("display","none");
	$(".validate2").css("display","none");
	for(var i=0;i<isSubmit.length;i++){
		isSubmit[i] = true;
	}
	for(var j=0;j<isEmpty.length;j++){
		isEmpty[j] = true;
	}
	for(var k=0;k<isFileTwo.length;k++){
		isFileTwo[k] = true;
	}
	for(var m=0;m<isResult.length;m++){
		isResult[m] = true;
	}
	currentSubmit = 0;
	currentFile =0;
	currentEmpty=0;
	currentResult =0;
	$(".tag,.title,.datetimepicker,.bir,.atitle,.afis,.awords").blur();
	//参与者列表失去焦点的时候都去判断全部，是否还有空信息
	$(".parname,.specialSkill,.positionLevel,.duty,.unit").blur(function(){
		for(var j=0;j<isEmpty.length;j++){
	    	if(isEmpty[j] == false){
	    		$(".noValidate").html("提示：检查参与者列表是否还有为空信息");
	    		$(".noValidate").css("display","inline-block");
	    		$(".validate1").css("display","inline-block");
	    	}else{
	    		$(".noValidate").css("display","none");
	    		$(".validate1").css("display","none");
	    	}
	    }
	})
	$(".type").change();
	$(".degree,.education,.aform,.atype").change();
	var oneval = $(".uploadone").parent().parent().parent().children(":eq(0)").children(":eq(0)").attr("value");
    var twoval = $(".uploadtwo").parent().parent().parent().children(":eq(0)").children(":eq(0)").attr("value");
    var val1 = $(".upload1").parent().parent().parent().children(":eq(0)").children(":eq(0)").attr("value");
    //三个文件都为空
    if(oneval == "" || typeof(oneval) =="undefined"){
		if(twoval == "" || typeof(twoval) =="undefined"){
			if(val1 == "0" || typeof(val1) =="undefined" || val1 == ""){
				$(".noValidate").html("提示：课题论证和研究条件与保障文件是否都上传,或者相关附件是否上传");
				$(".noValidate").css("display","inline-block");
				return ;
			}
		}else{
			$(".noValidate").html("提示：课题论证必须上传");
    		$(".noValidate").css("display","inline-block");
    		return ;
		}
    }else{
    	if(twoval == "" || typeof(twoval) =="undefined"){
    		$(".noValidate").html("提示：研究条件与保障必须上传");
    		$(".noValidate").css("display","inline-block");
    		return ;
        }
   }	
    
	for(var i=0;i<isSubmit.length;i++){
    	if(isSubmit[i] == false){
    		$(".noValidate").html("提示：名称、主题词、学科分类、预计完成时间不能为空");
    		$(".noValidate").css("display","inline-block");
    		return ;
    	}
    }
    /*for(var a=0;a<isFileTwo.length;a++){
    	if(isFileTwo[a] == false){
    		$(".noValidate").html("提示：课题论证、研究条件与保障文件格式是否符合要求");
    		$(".noValidate").css("display","inline-block");
    		return ;
    	}
    }*/
    for(var j=0;j<isEmpty.length;j++){
    	if(isEmpty[j] == false){
    		$(".noValidate").html("提示：检查参与者列表是否还有为空信息");
    		$(".noValidate").css("display","inline-block");
    		return ;
    	}
    }
    for(var k=0;k<isResult.length;k++){
    	if(isResult[k] == false){
    		$(".noValidate").html("提示：检查成果列表是否还有为空信息");
    		$(".noValidate").css("display","inline-block");
    		return ;
    	}
    }
    
    //经费合计校验------资助课题不需要校验这个部分
    if(budgetNumbers.length > 1){
    	if(budgetNumbers[11].value != budgetNumbers[16].value){
    		$(".noValidate").html("提示：检查经费预算\"合计\"数额是否相等");
    		$(".noValidate").css("display","inline-block");
    		$(".changered").parent().next().children(":eq(0)").css("background-color","rgba(255, 192, 203, 0.41)")
    		return false;
    	}
    }
	//判断是保存还是提交还是下载
	if($(this).attr("id") == "save"){//如果是提交
		var input = $(".tempsave");
		input.attr("value","save");
		Showbo.Msg.confirm('是否提交？',function(flag){
			if(flag=='yes'){
				$(".font-tip").html("已提交")
				$("#dvMsgBox1").css("display","block");
			    $("#form").submit();		
			}				
	    });
	}else if($(this).attr("id") == "jy"){//如果是保存
		var input = $(".tempsave");
		input.attr("value","temp");
		$(".isDownload").attr("value",0)
		$(".font-tip").html("已保存")
		$("#dvMsgBox1").css("display","block");
	    $("#form").submit();
	}else if($(this).attr("id") == "down"){//如果是下载
		var input = $(".tempsave");
		input.attr("value","temp");
		$(".isDownload").attr("value",1)
		$(".font-tip").html("已保存")
		$("#dvMsgBox1").css("display","block");
	    $("#form").submit();
	}
	
})
//结题时候的校验
$(".jy1,.submit1,.down1").click(function(){
	var cval = $(".uploadC").parent().parent().parent().children(":eq(0)").children(":eq(0)").attr("value");
	if(cval == "" || typeof(cval) =="undefined"){
		$(".noValidate").html("提示：检查总结报告是否上传");
		$(".noValidate").css("display","inline-block");
		return ;
	}
	if($(this).attr("id") == "save"){
		  var input = $(".tempsave");
		  input.attr("value","save");
		  Showbo.Msg.confirm('是否提交？',function(flag){
				if(flag=='yes'){
					$(".font-tip").html("已提交")
					$("#dvMsgBox1").css("display","block");
				    $("#form").submit();		
				}				
		    });
	}else if($(this).attr("id") == "jy"){
		  var input = $(".tempsave");
		  input.attr("value","temp");
		  $(".isDownload").attr("value",0)
		  $(".font-tip").html("已保存")
		  $("#dvMsgBox1").css("display","block");
		  $("#form").submit();
	}else if($(this).attr("id") == "down"){
		  var input = $(".tempsave");
		  input.attr("value","temp");
		  $(".isDownload").attr("value",1)
		  $(".font-tip").html("已保存")
		  $("#dvMsgBox1").css("display","block");
		  $("#form").submit();
	}
})
/*实时校验---part1*/
$(".title,.tag,.datetimepicker").blur(function(){
	var val = $.trim($(this).val());
	common(val,$(this));
})
/*实时校验---part2*/
$(".type").change(function(){
	if($(this).val() == "请选择"){
		var tipMess = $(this).parent().prev().children(":eq(0)").text();
		$(this).next().css("display","inline-block");
		var tipMess = $(this).parent().prev().children(":eq(0)").text();
		$(".noValidate").html("提示："+tipMess+"不能为空");
		$(".noValidate").css("display","inline-block");
		isSubmit[currentSubmit++] = false;
	}else{
		isSubmit[currentSubmit++] = true;
		$(this).next().css("display","none");
		$(".noValidate").css("display","none");
	}
})
$(".money").blur(function(){
	var val = $.trim($(this).val());
	if(!(isNumber.test(val))){
		$(this).next().html("<i class='Validform_wrong'></i>格式错误！");
		$(this).next().css("display","inline-block");
		//isSubmit[currentSubmit++] = false;
	}else{
		$(this).next().css("display","none");
		//isSubmit[currentSubmit++] = true;
	}
})
//用于参与者的校验,除时间外-----JS增加-----开始
function validate(e){
	var val = $.trim($(e).val());
	if(val == ""){
		$(".validate1").css("display","inline-block");
		isEmpty[currentEmpty++] = false;
	}else if(val == "请选择"){
		$(".validate1").css("display","inline-block");
		isEmpty[currentEmpty++] = false;
	}
 }
//用于参与者里面的时间校验
function validateBir(e){
	$(e).change(function(){
		if($(e).val() == ""){
			$(".validate1").css("display","inline-block");
			isEmpty[currentEmpty++] = false;
		}
	})
}
//用于参与者的校验,除时间外-----JS增加-----结束
//用于成果的校验,除时间外-----JS增加-----开始
function validate1(e){
    var val = $.trim($(e).val());
	if(val == ""){
		$(".validate2").css("display","inline-block");
		isResult[currentResult++] = false;
	}else if(val == "请选择"){
		$(".validate2").css("display","inline-block");
		isResult[currentResult++] = false;
	}
}
function validateFis(e){
	$(e).change(function(){
		if($(e).val() == ""){
			$(".validate2").css("display","inline-block");
			isResult[currentResult++] = false;
		}else{
			$(".validate2").css("display","none");
		}
	})
}
//用于成果的校验,除时间外-----JS增加-----结束
/*$("input[type='number']").blur(function(){
	var val = $(this).val()
	if(!(isNumber.test(val))){
		isSubmit[currentSubmit++] = false;
		$(".validate").css("display","inline-block");
	}else{
		isSubmit[currentSubmit++] = true;
		$(".validate").css("display","none");
	}
})*/
//为空验证 --开始
function common(val,e){
	if(val == ""){
		var tipMess = e.parent().prev().children(":eq(0)").text();
		$(".noValidate").html("提示："+tipMess+"不能为空");
		$(".noValidate").css("display","inline-block");
		e.next().css("display","inline-block");
		isSubmit[currentSubmit++] = false;
	}else{
		e.next().css("display","none");
		var tipMess = e.parent().prev().children(":eq(0)").text();
		$(".noValidate").css("display","none");
		isSubmit[currentSubmit++] = true;
	}
}
//为空验证 --结束
//文件pdf格式验证---开始
$(".uploadone,.uploadtwo,.upload1,.uploadC").change(function(){
	var val = $(this).val(),t;
	if(val=="" || val =="0"){
		if($(this).hasClass('upload1')){
			isFileRelate = false;
		}else{
			isFileTwo[currentFile++] = false;
		}
	}
	if($(this).hasClass('upload1')){
		var ary = ["pdf","doc","docx"];
	}else{
		var ary = ["pdf"];
	}
	var docs = val.split(".");
	var doc = docs[docs.length-1];
	/*var doc = val.substr(val.length-4);*/
	t = $.inArray(doc,ary);
	if(t != -1){
		//格式正确
		//判断文件大小
		try{
			var fileSize = 0;
			//for IE
			if($.support.msie){
				var objFSO = new ActiveXObject("Scripting.FileSystemObject"); 
				var filePath = $(this)[0].value;
				var objFile = objFSO.getFile(filePath);
				var fileSize = objFile.size;//size in kb
				fileSize = fileSize / 1048576;//size in mb
			}
			//for FF safari  Opera and onther
			else{
				fileSize = $(this)[0].files[0].size;//size in kb
				fileSize = fileSize / 1048576;//size in mb
			}
			if($(this).hasClass('upload1')){
				var sizeLimit = 800;
			}else{
				var sizeLimit = 3;
			}
			if(fileSize >sizeLimit){//格式正确大小不对,超过800M就不让传了
				$(this).parent().parent().prev().prev().children(":eq(0)").css("display","none");
				$(this).parent().parent().prev().prev().children(":eq(1)").css("display","none");
				$(this).parent().parent().prev().prev().children(":eq(3)").css("display","none");
				$(this).parent().parent().prev().prev().children(":eq(2)").css("display","inline-block");//大小不正确
				$(this).val("");
			}else{
				var input = $(".tempsave");
				input.attr("value","temp");
				$("#dvMsgBox1").css("display","block");
				$("#form").submit();
			}
		}catch(e){
			
		}
		
	}else{
		//格式错误
		$(this).val("");
		if($(this).hasClass('upload1')){
			isFileRelate = false;
		}else{
			isFileTwo[currentFile++] = false;
		}
		$(this).parent().parent().prev().prev().children(":eq(0)").css("display","none");
		$(this).parent().parent().prev().prev().children(":eq(1)").css("display","inline-block");
		$(this).parent().parent().prev().prev().children(":eq(3)").css("display","none");
		$(this).parent().parent().prev().prev().children(":eq(2)").css("display","none");
	}
})
//上传扫描件格式验证
$(".reviewFile").change(function(){
	var val = $(this).val(),t;
	/*var doc = val.split(".")[1];*/
	var doc = val.substr(val.length-4);
	var ary = [".pdf"];
	t = $.inArray(doc,ary);
	if(t != -1){
		//格式正确
		try{
			var fileSize = 0;
			//for IE
			if($.support.msie){
				var objFSO = new ActiveXObject("Scripting.FileSystemObject"); 
				var filePath = $(this)[0].value;
				var objFile = objFSO.getFile(filePath);
				var fileSize = objFile.size;//size in kb
				fileSize = fileSize / 1048576;//size in mb
			}
			//for FF safari  Opera and onther
			else{
				fileSize = $(this)[0].files[0].size;//size in kb
				fileSize = fileSize / 1048576;//size in mb
			}
			if(fileSize >3){//格式正确大小不对
				$(this).parent().next().next().css("display","none");
				$(this).parent().next().next().next().css("display","none");
				$(this).parent().next().next().next().next().css("display","inline-block");
				$(this).val("");
			}else{
				$(this).parent().next().next().css("display","inline-block");
				$(this).parent().next().next().next().css("display","none");
				$(this).parent().next().next().next().next().css("display","none");
			}
		}catch(e){
			
		}
	}else{
		//格式错误
		$(this).parent().next().next().css("display","none");
		$(this).parent().next().next().next().css("display","inline-block");
		$(this).parent().next().next().next().next().css("display","none");
	}
})
//文件pdf格式验证--结束
