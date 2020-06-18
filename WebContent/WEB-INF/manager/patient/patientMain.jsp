<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="mks.util.PageBarManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hp_code = "280HP";//실제론쿠키로 가져올 값임.
	//모든 hp_code는 서블릿에서 세션값으로 가져올것
	String dept_code ="58";
	
	
	
	List<Map<String, Object>> pList = (List<Map<String, Object>>)request.getAttribute("pList");
	if(pList==null){
		pList = new ArrayList();
	}
	int tot=pList.size();
	int numPerPage =10;
	int nowPage =0;
	if(request.getParameter("nowPage")!=null){
		nowPage =Integer.parseInt(request.getParameter("nowPage"));
	}
	String mem_name = request.getParameter("mem_name");
	String mem_socialnum = request.getParameter("mem_socialnum");
	if(mem_name==null){
		mem_name="";
	}
	if(mem_socialnum==null){
		mem_socialnum="";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 페이지 </title>
</head>
<body>  
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	        <div class="col-sm-2">
	        	 <input id="p_name" type="text" class="form-control" style="margin-top: 30px;" placeholder="환자이름" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <input id="p_social" type="text" class="form-control" style="margin-top: 30px;" placeholder="주민번호" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 30px;" onClick="p_search()">환자 검색</button>
	        </div>
	        <div class="col-sm-8" id="main">
	        	 <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      	<div class="float-right">
			      		<button type="button" class="btn btn-outline-success" onClick="pai_add()">환자추가</button>
			      	</div>
			      	<table class="table table-hover" id="p_list" data-page-size="10">
					  <thead>
					    <tr>
						  <th scope="col" data-field="MEM_MEMCODE">환자번호</th> 	
						  <th scope="col" data-field="MEM_NAME">환자이름</th> 
						  <th scope="col" data-field="MEM_SOCIALNUM">주민등록번호</th>
						  <th scope="col" data-field="MEM_PHONE">전화번호</th>
					    </tr>
					  </thead>
					    <tbody>
<%
	for(int i=0;i<pList.size();i++){
		if(i<numPerPage*(nowPage+1) && i>=numPerPage*nowPage){
%>
	<tr>
					<td><%=pList.get(i).get("MEM_MEMCODE")%></td>
					<td><%=pList.get(i).get("MEM_NAME")%></td>
					<td><%=pList.get(i).get("MEM_SOCIALNUM")%></td>
					<td><%=pList.get(i).get("MEM_PHONE")%></td>
	</tr>
<%
	}
	}
%>
				    </tbody>
					</table>
			      </div>
			      <!--  -->
 <%
 		String pagePath ="/manager/patient/patientSEL.mgr?hp_code="+hp_code+"&mem_name="+mem_name+"&mem_socialnum="+mem_socialnum;
 		PageBarManager pb = new PageBarManager(numPerPage,tot,nowPage,pagePath);
 		String pagination = pb.getPageBar();
 		out.print(pagination);
 %>   
			      <!--  -->
			     </div>
	        </div>
	    </div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#p_list").bootstrapTable({
			onDblClickRow:function(row, $element, field)
		     { 
				select_no = JSON.stringify(row.MEM_MEMCODE);
				var jo = JSON.stringify(row);
				var d = JSON.parse(jo);
				var mem_code = d.MEM_MEMCODE;
				alert(mem_code);
				location.href="/manager/patient/patientDetail.mgr?hp_code=<%=hp_code%>&mem_code="+mem_code;
				
		     }
		});		
		$("#p_list").bootstrapTable('hideLoading');
		
	})
		function p_search(){
			var p_name = $("#p_name").val();
			var p_social =$("#p_social").val();
			location.href="./patientSEL.mgr?hp_code=<%=hp_code%>&mem_name="+p_name+"&mem_socialnum="+p_social
		}
	
		function pai_add(){
				location.href="/manager/patient/mgr_patientWrite.jsp";
		}
</script>
</body>
</html>