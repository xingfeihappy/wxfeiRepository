$(document).ready(function() {
    var t = $('.datatable').DataTable({
    	"sDom": 'T<"clear">lfrtp',
    	 "Processing": true,
    	 /*"oTableTools": {
             "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
             "aButtons":[{"sExtends":"copy",
            	 "sButtonText":"Copy to clipboard"} ]
         },*/
    	 "bFilter":false,//搜索框
    	 "bScrollInfinite":true,
    	 "bPaginate":false,
    	 "sScrollY":"700px",
    	 "bSort":false,
    	 "bLengthChange":false,
        "columnDefs": [{
            "searchable": false,
            "orderable": false,
            "sortable": false,
            "targets": 5
        },
        {
            "searchable": false,
            "orderable": false,
            "sortable": false,
            "targets": 3
        }],
       
        "oLanguage": {
				//"sUrl":"http://sandbox.runjs.cn/uploads/rs/238/n8vhm36h/zh_CN.json"
			"sProcessing":   "处理中...",
		    "sLengthMenu":   "_MENU_ 记录/页",
		    "sZeroRecords":  "没有匹配的记录",
		    "sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
		    "sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
		    "sInfoFiltered": "(由 _MAX_ 项记录过滤)",
		    "sInfoPostFix":  "",
		    "sSearch":       "模糊搜索:",
		    "sUrl":          "",
		    "oPaginate": {
		     "sFirst":    "首页",
		     "sPrevious": "上页",
		     "sNext":     "下页",
		     "sLast":     "末页"
		    }
		} 
    });
   t.on('order.dt search.dt',//第一列序号
    function() {
        t.column(0, {
            search: 'applied',
            order: 'applied'
        }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1;
        });
    }).draw();
    
    var k = $('.datatable2').DataTable({
    	"sDom": 'T<"clear">lfrtp',
    	 "Processing": true,
    	 /*"oTableTools": {
             "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
             "aButtons":[{"sExtends":"copy",
            	 "sButtonText":"Copy to clipboard"} ]
         },*/
    	 "bFilter":false,//搜索框
    	 "bScrollInfinite":true,
    	 "bPaginate":false,
    	 "sScrollY":"700px",
    	 "bSort":false,
        "columnDefs": [{
            "searchable": false,
            "orderable": false,
            "sortable": false,
            "targets": 0
        }],
       
        "oLanguage": {
				//"sUrl":"http://sandbox.runjs.cn/uploads/rs/238/n8vhm36h/zh_CN.json"
			"sProcessing":   "处理中...",
		    "sLengthMenu":   "_MENU_ 记录/页",
		    "sZeroRecords":  "没有匹配的记录",
		    "sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
		    "sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
		    "sInfoFiltered": "(由 _MAX_ 项记录过滤)",
		    "sInfoPostFix":  "",
		    "sSearch":       "模糊搜索:",
		    "sUrl":          "",
		    "oPaginate": {
		     "sFirst":    "首页",
		     "sPrevious": "上页",
		     "sNext":     "下页",
		     "sLast":     "末页"
		    }
		} 
    });
    k.on('order.dt search.dt',//第一列序号
    function() {
        k.column(0, {
            search: 'applied',
            order: 'applied'
        }).nodes().each(function(cell, j) {
            cell.innerHTML = j + 1;
        });
    }).draw();
    
    var m = $('.datatable3').DataTable({
    	"sDom": 'T<"clear">lfrtp',
    	 "Processing": true,
    	 /*"oTableTools": {
             "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
             "aButtons":[{"sExtends":"copy",
            	 "sButtonText":"Copy to clipboard"} ]
         },*/
    	 "bFilter":false,//搜索框
    	 "bScrollInfinite":true,
    	 "bPaginate":false,
    	 "sScrollY":"700px",
        "columnDefs": [{
            "searchable": false,
            "orderable": false,
            "sortable": false,
            "targets": 0
        }],
       
        "oLanguage": {
				//"sUrl":"http://sandbox.runjs.cn/uploads/rs/238/n8vhm36h/zh_CN.json"
			"sProcessing":   "处理中...",
		    "sLengthMenu":   "_MENU_ 记录/页",
		    "sZeroRecords":  "没有匹配的记录",
		    "sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
		    "sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
		    "sInfoFiltered": "(由 _MAX_ 项记录过滤)",
		    "sInfoPostFix":  "",
		    "sSearch":       "模糊搜索:",
		    "sUrl":          "",
		    "oPaginate": {
		     "sFirst":    "首页",
		     "sPrevious": "上页",
		     "sNext":     "下页",
		     "sLast":     "末页"
		    }
		} 
    });
    m.on('order.dt search.dt',//第一列序号
    function() {
        m.column(0, {
            search: 'applied',
            order: 'applied'
        }).nodes().each(function(cell, n) {
            cell.innerHTML = n + 1;
        });
    }).draw();
});