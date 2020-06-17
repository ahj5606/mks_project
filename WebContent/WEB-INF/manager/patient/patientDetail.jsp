<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_code = request.getParameter("mem_code");
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
<script type="text/javascript">
	function back(){
		location.href="./s_table.jsp";
	}
	function notice_save(){
		alert("저장 버튼 호출 성공");
		var title = $("#notice_title").val();
		var writer = $("#notice_writer").val();
		var content = $("#notice_content").val();
		//alert(title+"/"+writer+"/"+content);
		$("#notice_write_form").attr('method','get');
		$("#notice_write_form").attr('action','./save.jsp');
		$("#notice_write_form").submit();
	}
</script>
</head>
<body>
<div style="margin:20px;">
<h2>환자상세</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	<form id="notice_write_form">
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-4">
		    <label>환자번호</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="제목" value="<%=pList.get(0).get("MEM_MEMCODE")%>">
	    </div>
		<div class="col-md-8">
		    <label>환자이름</label>
		    <input id="notice_writer" type="text" class="form-control" placeholder="환자이름" value="<%=pList.get(0).get("MEM_NAME")%>">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-6">
		    <label>주민번호</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="주민번호" value="<%=pList.get(0).get("MEM_SOCIALNUM")%>">
	    </div>
		<div class="col-md-6">
		    <label>전화번호</label>
		    <input id="notice_writer" type="text" class="form-control" placeholder="전화번호" value="<%=pList.get(0).get("MEM_PHONE")%>">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>주소</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="주소" value="<%=pList.get(0).get("MEM_ADDRESS")%>">
	    </div>
	 </div>
	 
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>지난진료내역</label>
		    <table class="table table-hover" id="p_list" data-page-size="10">
		    		<thead class="thead-dark">
					    <tr>
						  <th scope="col" data-field="MEM_MEMCODE">환자번호</th> 	
						  <th scope="col" data-field="HIS_CONTENT">내용</th> 	
						  <th scope="col" data-field="DOC_NAME">의사</th> 	
						  <th scope="col" data-field="DEPT_NAME">부서</th> 	
					    </tr>
					 </thead>
					 <tbody>
					 <%
					 	for(int i=0;i<pList.size();i++){
					 		
					 %>
					 	<tr>
					 	<td><%=pList.get(i).get("MEM_MEMCODE") %></td>
					 	<td><%=pList.get(i).get("HIS_CONTENT") %></td>
					 	<td><%=pList.get(i).get("DOC_NAME") %></td>
					 	<td><%=pList.get(i).get("DEPT_NAME") %></td>
					 	</tr>
					 <%
					 	}
					 %>
					 </tbody>
		    </table>
	    </div>
	 </div>
	 
	<div class="row">
	  <div class="col-md-12" style="text-align:right;">
	  		<!-- 삭제 모달  -->
				<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#DeleteModal">
					 삭제
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">확인</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       			 삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary">삭제</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>

	  		<!-- 삭제 모달  -->
	  		<!-- 수정 모달  -->
	  		<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#UpdateModal">
					 수정
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">확인</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       			 수정 하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary">수정</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
	  		
	  		<!--  수정 모달 -->
		  <button type="button" class="btn btn-default btn-light btn-outline-secondary" onClick="javascript:back()">취소</button>
	 </div>
	  </div>
	</form>	
</div>
</body>
</html>