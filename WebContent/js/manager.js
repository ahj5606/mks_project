	function find(){
		var pname = $("#p_name").val();
		alert("검색"+pname);
	};
	
	function menu(){
		alert("메뉴");
	};
	
	function search(){
		// 테이블 표현할 데이터 표현
		 var data = [
		 { "subject": "경영학과", "name": "가나다", "number": "20191234" },
		 { "subject": "체육학과", "name": "알란", "number": "20194567" }, 
		{ "subject": "심리학과", "name": "구론", "number": "20171227" }, 
		{ "subject": "심리학과", "name": "구론", "number": "20171227" } 
		]; 
		 
		$("#hp_list").bootstrapTable({ data: data });
		$("#hp_list").bootstrapTable('hideLoading');
	};
	
	