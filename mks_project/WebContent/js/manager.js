	function find(){
		var pname = $("#p_name").val();
		alert("검색"+pname);
	};
	
	function menu(){
		alert("메뉴");
	};
	
	function search(){
		// 테이블 표현할 데이터 표현
		//ajax로 넘겨서 json데이터를 받아 부트스트랩 테이블에 보여줌.
		 var data = [
		 { "subject": "경영학과", "name": "가나다", "number": "20191234" },
		 { "subject": "체육학과", "name": "알란", "number": "20194567" }, 
		{ "subject": "심리학과", "name": "구론", "number": "20171227" }, 
		{ "subject": "심리학과", "name": "구론", "number": "20171227" } 
		]; 
		$("#hp_list").bootstrapTable({ data: data });
		$("#hp_list").bootstrapTable('hideLoading');
	};
	function test(){
		$.ajax({
			url:'/login/login.mgr'
			,success:function(data){
				alert("호출성공");
			}
		})
	}
	
	function doc_list(){
		// 테이블 표현할 데이터 표현
		var data = [
			{ "subject": "내과", "name": "장동건", "edu": "서울대학교" ,"docCode":"456789","phoneNum":"02-384-4480" ,"state":"휴가"},
			{ "subject": "일반외과", "name": "송중기", "edu": "서울대학교","docCode":"456781","phoneNum":"02-384-4482" ,"state":"출근"}, 
			{ "subject": "산부인과", "name": "소지섭", "edu": "연세대학교","docCode":"456782","phoneNum":"02-384-4483" ,"state":"출근"}, 
			{ "subject": "정형외과", "name": "원빈", "edu": "고려대학교","docCode":"456783","phoneNum":"02-384-4484" ,"state":"휴직"} 
			]; 
		
		$("#doc_list").bootstrapTable({ data: data });
		$("#doc_list").bootstrapTable('hideLoading');
	};
	
