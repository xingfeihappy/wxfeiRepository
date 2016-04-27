//搜索功能
   $(".search").click(function(){
		  var tab ="#"+$(this).attr("value");
	   $(tab).find(".line").show();
	   if($(tab).find(".projectName").val()||$(tab).find(".projectNo").val()||$(tab).find(".projectPerson").val()||$(tab).find(".projectType").children("option:selected").val()>=0){
		   $(tab).find(".line").each(function(){
			   if($(tab).find(".projectName").val()){//课题名称判别
				   if($(tab).find(".projectName").val().trim().indexOf($(this).children(":eq(3)").html())<0&&$(this).children(":eq(3)").html().indexOf($(tab).find(".projectName").val().trim())<0){
					   $(this).hide();
				   }
			   }
			   if($(tab).find(".projectNo").val()){//课题编号判别
				   if($(tab).find(".projectNo").val().trim().indexOf($(this).children(":eq(2)").html())<0&&$(this).children(":eq(2)").html().indexOf($(tab).find(".projectNo").val().trim())<0){
					   $(this).hide();
				   }
			   }
			   if($(tab).find(".projectPerson").val()){//负责人判别
				   if($(tab).find(".projectPerson").val().trim().indexOf($(this).children(":eq(4)").html())&&$(this).children(":eq(4)").html().indexOf($(tab).find(".projectPerson").val().trim())){
					   $(this).hide();
				   }
			   }
			   if($(tab).find(".projectType").children("option:selected").val()>=0){//分类判别
				   if($(tab).find(".projectType").children("option:selected").html()!=$(this).children(":eq(7)").children(":first").html()){
					   $(this).hide();
				   }
			   }
		   })
	   } 
	// l 为满足条件的数量 重新设定序号
		var l = 0;
		$(tab).find(".line").each(function(){
			if($(this).css("display")!="none")
				l++;
			$(this).children(":first").html(l);
		})
		
		//表格样式
		var hei = $(tab).find(".dcontainer").height();
		if($(tab).find(".topam1").height()+2<=hei){
			$(tab).find(".topam").parent().css("overflow-y","auto");
		}
		else $(tab).find(".topam").parent().css("overflow-y","scroll")
   });