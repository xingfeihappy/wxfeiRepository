var count = 1;//条件数量
// 增加条件
$(".plus").click(function(){

	if(count<8){
		var last = $(".parent").children(":last");
		var newdiv = $(".parent").children(":eq(1)").clone();
		newdiv.css({"display":""});
	    last.after(newdiv);
	    count = count + 1;
	}
	else{
		$(".plus").css({"disabled":"disabled"}); 
	}
	
});
// 删除条件
$('.parent').on('click','.minus', function() {
    var mul = $(this).parent().parent();
	mul.remove();
	count = count - 1;
});

// difInput(obj)根据不同的搜索条件对应不同的输入状态 1=状态 5=课题类型 6=申请时间 7=结题时间
function difInput(obj){
	if(obj.children('option:selected').val()==1){
	  obj.next().children(":first").css({"display":"none"});
	  obj.next().children(":eq(1)").css({"display":"inline-block"});
	  obj.next().children(":eq(2)").css({"display":"none"});
	  obj.next().children(":first").removeAttr("placeholder");
  	}
	else if(obj.children('option:selected').val()==5){
		  obj.next().children(":first").css({"display":"none"});
		  obj.next().children(":eq(1)").css({"display":"none"});
		  obj.next().children(":eq(2)").css({"display":"inline-block"});
		  obj.next().children(":first").removeAttr("placeholder");
	  	}
	else if(obj.children('option:selected').val()==6||obj.children('option:selected').val()==7){
		obj.next().children().css({"display":"none"});
		obj.next().children(":first").css({"display":"inline-block"});
		obj.next().children(":first").attr("placeholder","如输入：2016");
	}
  	else{
	  obj.next().children().css({"display":"none"});
	  obj.next().children(":first").css({"display":"inline-block"});
	  obj.next().children(":first").removeAttr("placeholder");
	  obj.next().children(":first").val("");
  	}
}
$(".mulSearch .condition").change(function(){
	difInput($(this));
})
$('.parent').on('change','.condition1', function() {
	difInput($(this));
});

//实现数据list中的搜索功能
$(".search").click(function(){
	var l = 0;
	var myarr = new Array();
	var a = $(".condition").children('option:selected').val();//搜索条件
	var b = $(".searchContent1:eq(0)").children('option:selected').val();//当选择状态条件是对应的输入条件
	var t = $(".searchContent2:eq(0)").children("option:selected").val();//当选择课题类型是对应的输入条件
	//$(".condition,.searchContent").css("border","1px solid #ccc");
	if(a!=-1&&$(".searchContent:eq(0)").val()||(a==1&&b!=-1)||(a==5&&t!=-1)){
		myarr.push(a);
		$(".condition1:gt(0)").each(function (index) {
	        myarr.push($(this).children('option:selected').val());
	    });
		$(".line").show();//显示所有的数据
	    for(var i=0;i<count;i++){
	    	var c =parseInt(myarr[i])+parseInt(1);
	    	var j = i+1;
	    	$(".line").each(function(){
	    		//i=0表示只有一个搜索条件，i!=0说明有多个条件
	    		if(i==0){
	    			//c=2表示搜索条件是2.c=7申请年份，c=8结题年份
	    			var n1 = $(".searchContent1:eq(0)").children('option:selected');
	    			var n2 = $(".searchContent2:eq(0)").children('option:selected');
	    			if(c==2&&n1.val()>=0){
	    				if(($(this).children(":eq("+c+")").html())!=(n1.html())){
	            			$(this).hide();
	            		}
	    			}
	    			else if(c==6&&n2.val()>=0){
	    				if(($.trim($(this).children(":eq("+c+")").html()))!=(n2.html())){
	            			$(this).hide();
	            		}
	    			}
	    			else if(c==7){
	    				if($(this).children(":eq("+c+")").html().substring(0,4)!=$.trim($(".searchContent:eq(0)").val())){
	            			$(this).hide();
	            		}
	    			}
	    			else if(c==8){
	    				var k=c-1;
	    				var string = $(this).children(":eq("+k+")").html();
	    				if(string.substring(string.indexOf("至")+1,string.indexOf("至")+5)!=$.trim($(".searchContent:eq(0)").val())){
	            			$(this).hide();
	            		}
	    			}
	    			else{
	    				var ss =$.trim($(".searchContent:eq(0)").val());
	    				if(c==3)  var ss1 = $(this).children(":eq("+c+")").children(":first").html();//对标题链接特殊处理
	    				else   var ss1 = $(this).children(":eq("+c+")").html();
	    				if(ss1.indexOf(ss)<0&&ss.indexOf(ss1)<0){//搜索内容包含数据库中数据或数据库中数据包含搜索内容则显示;  if(ss1.indexOf(ss)<0{
	    					$(this).hide();
	    				}
	    			}
	    			
	    		}
	    		else{
	    			var m1 = $(".searchContent1:eq("+j+")").children('option:selected');
	    			var m2 = $(".searchContent:eq("+j+")");//搜索条件对应的搜索内容
	    			var m3 = $(".searchContent2:eq("+j+")").children('option:selected');
	    			var andOr = $(".andOr:eq("+i+")").children("option:selected");//与或非
	    			if(c==2&&m1.val()>=0){
	    				if(andOr.val()==0){
	    					if($(this).children(":eq("+c+")").html()!=m1.html()){
		            			$(this).hide();
		            		}
	    				}
	    				else if(andOr.val()==1){
	    					if($(this).children(":eq("+c+")").html()==m1.html()){
		            			$(this).show();
		            		}
	    				}
	    				else if(andOr.val()==2){
	    					if($(this).children(":eq("+c+")").html()==m1.html()){
		            			$(this).hide();
		            		}
	    				}
	    			}
	    			else if(c==6&&m3.val()>=0){
	    				if(andOr.val()==0){
	    					if($.trim($(this).children(":eq("+c+")").html())!=m3.html()){
		            			$(this).hide();	
	    					}
	    				}
	    				else if(andOr.val()==1){
	    					if($.trim($(this).children(":eq("+c+")").html())==m3.html()){
		            			$(this).show();	
	    					}
	    				}
	    				else if(andOr.val()==2){
	    					if($.trim($(this).children(":eq("+c+")").html())==m3.html()){
		            			$(this).hide();	
	    					}
	    				}
	    			}
	    			else if(c==7&&m2.val()){
	    				if(andOr.val()==0){
	    					if($(this).children(":eq("+c+")").html().substring(0,4)!=$.trim(m2.val())){
		            			$(this).hide();
		            		}
	    				}
	    				else if(andOr.val()==1){
	    					if($(this).children(":eq("+c+")").html().substring(0,4)==$.trim(m2.val())){
		            			$(this).show();
		            		}
	    				}
	    				else if(andOr.val()==2){
	    					if($(this).children(":eq("+c+")").html().substring(0,4)==$.trim(m2.val())){
		            			$(this).hide();
		            		}
	    				}
	    			}
	    			else if(c==8&&m2.val()){
	    				var k=c-1;
	    				var string = $(this).children(":eq("+k+")").html();
	    				if(andOr.val()==0){
	    					if(string.substring(string.indexOf("至")+1,string.indexOf("至")+5)!=$.trim(m2.val())){
		            			$(this).hide();
		            		}
	    				}
	    				else if(andOr.val()==1){
	    					if(string.substring(string.indexOf("至")+1,string.indexOf("至")+5)==$.trim(m2.val())){
		            			$(this).show();
		            		}
	    				}
	    				else if(andOr.val()==2){
	    					if(string.substring(string.indexOf("至")+1,string.indexOf("至")+5)==$.trim(m2.val())){
		            			$(this).hide();
		            		}
	    				}
	    			}
		    		else if(m2.val()){
		    			var ss = $.trim($(".searchContent:eq("+j+")").val());
		    			var ss1 = $(this).children(":eq("+c+")").html();
		    			if(andOr.val()==0){
		    				if(ss1.indexOf(ss)<0&&ss.indexOf(ss1)<0){
			        			$(this).hide();
			        		}
		    			}
		    			else if(andOr.val()==1){
		    				if(ss1.indexOf(ss)>=0||ss.indexOf(ss1)>=0){
			        			$(this).show();
			        		}
		    			}
		    			else if(andOr.val()==2){
		    				//if(ss1.indexOf(ss)>=0||ss.indexOf(ss1)>=0){
		    				if(ss1==ss){
			        			$(this).hide();
			        		}
		    			}
		    		}
	    			
	    		}
	    	});
	    }
    }
	else if(a==-1){
		$(".condition").css("border","1px solid red");
		$(".line").show();//显示所有的数据
	}
	else if((a==1&&b==-1)){
		$(".searchContent1:first").css("border","1px solid red");
		$(".line").show();//显示所有的数据
	}
	else if((a==5&&t==-1)){
		$(".searchContent2:first").css("border","1px solid red");
		$(".line").show();//显示所有的数据
	}
	else{
		$(".line").show();//显示所有的数据
		$(".searchContent:first").css("border","1px solid red");
	}
   // l 为满足条件的数量 重新设定序号
	$(".line").each(function(){
		if($(this).css("display")!="none")
			l++;
		$(this).children(":first").html(l);
	})
	//表格样式
	var hei = $(".dcontainer").height();
	if($(".topam1").height()+2<=hei){
		$(".topam").parent().css("overflow-y","auto");
	}
	else $(".topam").parent().css("overflow-y","scroll")
});
//表格样式
var hei = $(".dcontainer").height();
if($(".topam1").height()+2<=hei){
	$(".topam").parent().css("overflow-y","auto");
}
else $(".topam").parent().css("overflow-y","scroll")
/*window.onresize = function(){//当改变窗口大小时适应滚动条
	   if( $(".topam").height()>41){
		   $(".topam").parent().height($(".topam").height()+2)
	   }
	   else 	 $(".topam").parent().height(41);
 } */
//搜索条件样式
$(".condition").blur(function(){
	$(".condition").css("border","1px solid #ccc");
})
$(".searchContent").blur(function(){
	if($(".searchContent").val()){
	$(".searchContent").css("border","1px solid #ccc");}
})
$(".searchContent1").blur(function(){
	if($(".searchContent1").val()>=0){
	$(".searchContent1").css("border","1px solid #ccc");}
})
$(".searchContent2").blur(function(){
	if($(".searchContent2").val()>=0){
	$(".searchContent2").css("border","1px solid #ccc");}
})

$(".clear").click(function(){
	for(var i=count;i>=2;i--){
		$(".parent").children(":eq("+i+")").remove();
		$(".condition").val(-1);
		$(".searchContent,.searchContent1,.searchContent2").val("");
	}
	count=1;
	var l = 0;
	$(".line").show();
	$(".line").each(function(){
		if($(this).css("display")!="none")
			l++;
		$(this).children(":first").html(l);
	})
	var hei = $(".dcontainer").height();
	if($(".topam1").height()+2<=hei){
		$(".topam").parent().css("overflow-y","auto");
	}
	else $(".topam").parent().css("overflow-y","scroll")
})