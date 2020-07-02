<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="mks.util.PageBarManager"%>

<%
	//String hp_code = "280HP";
	
	
	List<Map<String,Object>> docList = (List<Map<String, Object>>)request.getAttribute("docList");
		if(docList==null){
			docList = new ArrayList();
		}
	
	List<Map<String,Object>> deptList = (List<Map<String, Object>>)request.getAttribute("deptList");
		if(deptList==null){
			deptList = new ArrayList();
		}
		 
		int tot=docList.size();
		int numPerPage =15;
		int nowPage =0;
		if(request.getParameter("nowPage")!=null){
			nowPage =Integer.parseInt(request.getParameter("nowPage"));
		}
		String doc_code = request.getParameter("doc_code");
		String doc_name = request.getParameter("doc_name");
		if(doc_code==null){
			doc_code="";
		}
		if(doc_name==null){
			doc_name="";
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 페이지 </title>
  
</head>
<body>  
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	        <div class="col-sm-2" style="margin-top: 45px">
	       						<!-- 진료과 드롭다운 태그 -->
							<div id="deptDrop"class="btn-group btn-default m-3" >
								<button id="selDept"class="btn dropdown-toggle btn-primary" type="button"
									data-toggle="dropdown">
									진료과 전체
									<!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
									(없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
									<span class="caret"></span>
								</button>
								
								<!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
								<ul class="dropdown-menu text-center">
									
							<%
								for(int i=0;i<deptList.size();i++){
							%>
									<li><a href="javascript:void(0)"><%=deptList.get(i).get("DEPT_NAME") %></a></li>
							<%
								}
							%>
								</ul>
														
								<!-- 진료과 드롭다운 태그 -->
							</div>
	        	 <input id="d_name" type="text" class="form-control" style="margin-top: 30px;" placeholder="의사이름" aria-label="doctorName" aria-describedby="basic-addon1">
	        	 <input id="d_code" type="text" class="form-control" style="margin-top: 30px;" placeholder="의사코드" aria-label="doctorCode" aria-describedby="basic-addon1">
	        	 <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 30px;" onclick="docSearch()">의사 검색</button>
	        </div>
	        <div class="col-sm-8" id="main">
	        	 <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      	<div style="margin-top: 25px">
			      		<div class="float-right" style="margin-bottom: 10px">
			      			<button type="button" class="btn btn-outline-success" onclick="docIns()">의사관리</button>
			      		</div>
				
			      	<table id="doc_list" class="table table-sm">
					  <thead>
					    <tr>
						  <th scope="col" data-field="DEPT_NAME">부서</th>
						  <th scope="col" data-field="DOC_CODE">의사코드</th>
						  <th scope="col" data-field="HP_CODE">병원코드</th>
						  <th scope="col" data-field="DOC_STATE">상태</th> 	
						  <th scope="col" data-field="DOC_NAME">이름</th> 
						  <th scope="col" data-field="DOC_POSITION">직급</th> 
						  <th scope="col" data-field="DOC_EDUCATION">학력</th>
						  <th scope="col" data-field="DOC_PHONE">전화</th>
						  <th scope="col" data-field="DOC_OFFDAY">휴무일</th>
					    </tr>
					  </thead>
					  <tbody>
<%
	for(int i=0;i<docList.size();i++){
		if(i<numPerPage*(nowPage+1) && i>=numPerPage*nowPage){
%>
					  	<tr class='clickable-row' data-href='url://link-for-first-row/'> 
    					  <td><%=docList.get(i).get("DEPT_NAME") %></td>
					  	  <td><%=docList.get(i).get("DOC_CODE") %></td>
					  	  <td><%=docList.get(i).get("HP_CODE") %></td>
					  	  <td><%=docList.get(i).get("DOC_STATE") %></td>
					  	  <td><%=docList.get(i).get("DOC_NAME") %></td>
					  	  <td><%=docList.get(i).get("DOC_POSITION") %></td>
					  	  <td><%=docList.get(i).get("DOC_EDUCATION") %></td>
					  	  <td><%=docList.get(i).get("DOC_PHONE") %></td>
					  	  <td><%=docList.get(i).get("DOC_OFFDAY") %></td>
					  	<tr>
<%
	}
	}
%>					  	
					  </tbody>
					</table>
					<div class="text-center">
<%
 		String pagePath ="/manager/doctor/doctorList.mgr?doc_code="+doc_code+"&doc_name="+doc_name;
 		PageBarManager pb = new PageBarManager(numPerPage,tot,nowPage,pagePath);
 		String pagination = pb.getPageBar();
 		out.print(pagination);
 %> 
					</div>
					</div>
			      </div>
			     </div>
	        </div>
	    </div>
	</div>
	<div>
	  
	</div>
<script type="text/javascript">
$(document).ready(function(data){
	$("#doc_list").bootstrapTable({
		onDblClickRow:function(row, $element, field)
	     { 
			var jo = JSON.stringify(row);
			var d = JSON.parse(jo);
			var doc_code = d.DOC_CODE;
			location.href="/manager/doctor/doctorDetail.mgr?doc_code="+doc_code;
			alert("클릭"+doc_code);
	     }
	})
	$("#doc_list").bootstrapTable('hideLoading');
	})
	var dept_name =null;
	$('#deptDrop .dropdown-menu li > a').bind('click',function (e) {
		//alert("dept_name");
	    dept_name = $(this).html();
	    $('#deptDrop button.dropdown-toggle').html(dept_name);
	    //alert("진료과:"+dept_name);
	    location.href='./doctorSEL.mgr?dept_name='+dept_name
	});
	function docSearch(){
		//alert("의사검색");
		var d_name = $("#d_name").val();
		var d_code =$("#d_code").val();
		location.href='./doctorSEL.mgr?doc_name='+d_name+'&doc_code='+d_code
	}
	function docIns(){
		//alert("의사추가");
		location.href="./mgr_doctorDetail.jsp"
	}
	
	
	
</script>
</body>
</html>