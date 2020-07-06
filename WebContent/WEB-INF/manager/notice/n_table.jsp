<%@page import="mks.util.PageBarManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> nList = (List<Map<String,Object>>)request.getAttribute("nList");
	String search = request.getParameter("search");

	int tot=nList.size();
	int numPerPage =5;
	int nowPage =0;
	if(request.getParameter("nowPage")!=null){
		nowPage =Integer.parseInt(request.getParameter("nowPage"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	.table{
		text-align:center;
	}

</style>
<script type="text/javascript">
	var select_val = null;
	var select_no = null;
	var select_title = null;
	var select_content = null;
	var select_id = null;
	
	function writeform(){
		//alert("글쓰기 버튼 호출 성공");
		location.href="./s_writeform.jsp?dept=<%=dept_name%>"
	}
	function search(){
		//alert("검색 버튼 호출 성공");
		//alert("셀렉트박스값=>"+select_val);
		//alert("검색창에 입력한 값=>"+$("#notice_input").val());
		
		var search = $("#notice_input").val();
		
		location.href="/manager/notice/noticeSEARCH.mgr?search="+search;
		
/* 		$.ajax({
			url:'./memList.jsp'
			,datatype:'json'
			,method:'get'
			,data:"param="+title
			,success:function(data){
				alert("검색해서 나온 data=>"+data);
			}
		}); */
		
		/*
		if(select_val=="제목"){
			alert("제목선택");
			
		}else if(select_val=="작성자"){
			alert("작성자선택");
			$.ajax({
				url:'./memList.jsp'
				,datatype:'json'
				,method:'get'
				,data:"param="+writer
				,success:function(data){
					alert("작성자 검색으로 나온 data=>"+data);
				}
			});
			
		}
		*/
	}
</script>
</head>
<body>
<div style="margin:20px;">
<h2>공지사항</h2>
</div>
<div style="margin:10px;">
	<div class="row" style="margin-bottom:10px;">
		<div class="col-md-11" style="text-align:right;">
			<button type="button" class="btn btn-default btn-light btn-outline-secondary" onclick="javascript:writeform()">글쓰기</button>
		</div>
	</div>
	<div class="row">
	<div class="col-md-11">
		<div class="table-responsive-md">
			<table id="notice_board" class="table table-bordered" >
				<thead>
				<tr class="d-flex" style="text-align:center;">
					<th class="sortable"data-sortable="true">번호</th>
					<th data-field="BOARD_NO"data-visible="false">번호</th>
					<th data-field="BOARD_TITLE">제목</th>
					<th data-field="DEPT_NAME">작성자</th>
					<th data-field="BOARD_DATE">게시일</th>
					<th data-field="HIT">조회수</th>
					<th data-field="BOARD_CONTENT" data-visible="false">내용</th>
					<th data-field="MKS_ID" data-visible="false">아이디</th>
					<th data-field="BOARD_FILE" data-visible="false">파일</th>
				</tr>
				</thead>
				<tbody>
				<%
				for(int i=0;i<nList.size();i++){
					if(i<numPerPage*(nowPage+1) && i>=numPerPage*nowPage){
				%>
					<tr>
						<td><%=++i%></td>
						<td><%=nList.get(--i).get("BOARD_NO") %></td>
						<td><%=nList.get(i).get("BOARD_TITLE") %></td>
						<td><%=nList.get(i).get("DEPT_NAME") %></td>
						<td><%=nList.get(i).get("BOARD_DATE") %></td>
						<td><%=nList.get(i).get("HIT") %></td>
						<td><%=nList.get(i).get("BOARD_CONTENT") %></td>
						<td><%=nList.get(i).get("MKS_ID") %></td>
						<td><%=nList.get(i).get("BOARD_FILE") %></td>
					</tr>
				<%
					}
				}
				%>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	
	<div>
		<div class="row" style="margin-left:430px;justify-content: center;">
		<!-- 
		<div class="col-md-2"  >	
		<select id="select" class="form-control" style="width:200px;margin-left:-20px;">
			<option>제목</option>
			<option>작성자</option>
		</select>
		</div>
		 -->
		<div class="col-md" >
		<form id="notice_search_form" class="form-inline">
			<input id="notice_input"type="text" class="form-control" placeholder="  제목 또는 작성자 검색" style="width:500px;">
			<div class="input-group-btn" style="margin-left:10px;">
				<button id="notice_search" class="btn btn-block btn-light btn-outline-secondary" type="button" onclick="javascript:search()">검색</button>
			</div>
		</form>
		</div>
		</div>
		<div class="row" style="margin-top:10px;margin-left:-80px;justify-content: center;">
<%
		if(search!=null){
	 		String pagePath ="/manager/notice/noticeSEARCH.mgr?search="+search;
	 		PageBarManager pb = new PageBarManager(numPerPage,tot,nowPage,pagePath);
	 		String pagination = pb.getPageBar();
	 		out.print(pagination);
			
		}else{
 		String pagePath ="/manager/notice/noticeSEL.mgr?";
 		PageBarManager pb = new PageBarManager(numPerPage,tot,nowPage,pagePath);
 		String pagination = pb.getPageBar();
 		out.print(pagination);
		}
 %>   

		</div>
	</div>	
		
</div>
	<script type="text/javascript">
		$(document).ready(function(){
			/*
			select_val = $("#select option:selected").val();
			if($("#select").change){
				$("#select").change(function(){
					select_val = $(this).val();
					//alert(val);
				});	
			}
			*/
			//alert(val);
			
			/* $.ajax({
				url:'./noticeSEL.mgr'
				,dataType:'json'
				,success:function(data){
					//alert(JSON.stringify(data));
					$("#notice_board").bootstrapTable({
						data:data
						,onDblClickRow:function(row, $element, field)
					     { alert(JSON.stringify(row.BOARD_NO)); }
					});
					$("#notice_board").bootstrapTable('hideLoading');
				}
			}); */
			
			$("#notice_board").bootstrapTable({
				onDblClickRow:function(row, $element, field)
			     { 
					var imsi = JSON.stringify(row.BOARD_NO)
					select_no = JSON.parse(imsi);
					var imsi = JSON.stringify(row.BOARD_TITLE)
					select_title = JSON.parse(imsi);
					var imsi = JSON.stringify(row.BOARD_CONTENT)
					select_content = JSON.parse(imsi);
					var imsi = JSON.stringify(row.MKS_ID)
					select_id = JSON.parse(imsi);
					var imsi = JSON.stringify(row.BOARD_FILE)
					board_file = JSON.parse(imsi);
					
					/* alert(select_no); 
					alert(select_title); 
					alert(select_content); 
					alert(select_id); 
					alert(board_file);  */
					
					location.href="./noticeDetail.mgr?no="+select_no;
			     }
			});		
			$("#notice_board").bootstrapTable('hideLoading');

			
		});
	</script>
</body>
</html>