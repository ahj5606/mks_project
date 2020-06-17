<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> pList = (List<Map<String, Object>>)request.getAttribute("pList");
	if(pList==null){
		pList = new ArrayList();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
		<label>담당 업무자 선택</label>
		<div class="col-md-10">
     	<table class="table table-hover" id="p_list" data-page-size="10" data-search="true">
				<thead>
				  <tr>
					  <th scope="col" data-field="DOC_NAME">담당자 이름</th> 	
					  <th scope="col" data-field="DEPT_NAME">부서 이름</th> 
					  <th scope="col" data-field="DEPT_CODE" data-visible="false">부서 코드</th>
					  <th scope="col" data-field="DOC_CODE" data-visible="false">담당자 코드</th>
				  </tr>
				</thead>
				  <tbody>
			<%
				for(int i=0;i<pList.size();i++){
			%>
				<tr>
					<td><%=pList.get(i).get("DOC_NAME")%></td>
					<td><%=pList.get(i).get("DEPT_NAME")%></td>
					<td data-visible="false" ><%=pList.get(i).get("DEPT_CODE")%></td>
					<td data-visible="false" ><%=pList.get(i).get("DOC_CODE")%></td>
				</tr>
			<%
				}
			%>
		</tbody>
		</table>
		</div>
</body>
<script type="text/javascript">
		$(document).ready(function(){
			$("#p_list").bootstrapTable({
				onDblClickRow:function(row, $element, field)
			     { 
					select_no = JSON.stringify(row.MEM_MEMCODE);
					var jo = JSON.stringify(row);
					var d = JSON.parse(jo);
					var DOC_NAME = d.DOC_NAME;
					var DEPT_NAME = d.DEPT_NAME;
					var DEPT_CODE = d.DEPT_CODE;
					var DOC_CODE = d.DOC_CODE;
					alert(DOC_NAME);
					
			     }
			});		
			$("#p_list").bootstrapTable('hideLoading');
			
		})
</script>
</html>