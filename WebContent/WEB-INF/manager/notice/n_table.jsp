<%@page import="mks.util.PageBarManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String hp_code = "635HP";
	
	List<Map<String,Object>> nList = (List<Map<String,Object>>)request.getAttribute("nList");

	int tot=nList.size();
	int numPerPage =1;
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
		table-layout: fixed;
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
		location.href="./s_writeform.jsp?dept=<%=h_dept%>"
	}
	function search(){
		alert("검색 버튼 호출 성공");
		//alert("셀렉트박스값=>"+select_val);
		alert("검색창에 입력한 값=>"+$("#notice_input").val());
		
		var title = $("#notice_input").val();
		
		$.ajax({
			url:'./memList.jsp'
			,datatype:'json'
			,method:'get'
			,data:"param="+title
			,success:function(data){
				alert("검색해서 나온 data=>"+data);
			}
		});
		
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
			<table id="notice_board" class="table table-striped table-bordered" >
				<thead>
				<tr style="text-align:center;">
					<th data-field="BOARD_NO">번호</th>
					<th data-field="BOARD_TITLE">제목</th>
					<th data-field="DEPT_NAME">작성자</th>
					<th data-field="BOARD_CONTENT" data-visible="false">내용</th>
					<th data-field="MKS_ID" data-visible="false">아이디</th>
				</tr>
				</thead>
				<tbody>
				<%
				for(int i=0;i<nList.size();i++){
					if(i<numPerPage*(nowPage+1) && i>=numPerPage*nowPage){
				%>
					<tr>
						<td><%=nList.get(i).get("BOARD_NO") %></td>
						<td><%=nList.get(i).get("BOARD_TITLE") %></td>
						<td><%=nList.get(i).get("DEPT_NAME") %></td>
						<td><%=nList.get(i).get("BOARD_CONTENT") %></td>
						<td><%=nList.get(i).get("MKS_ID") %></td>
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
		<div class="row" style="margin-left:200px;margin-right:-350px;">
		<!-- 
		<div class="col-md-2"  >	
		<select id="select" class="form-control" style="width:200px;margin-left:-20px;">
			<option>제목</option>
			<option>작성자</option>
		</select>
		</div>
		 -->
		<div class="col-md" style="margin-left:-30px;">
		<form id="notice_search_form" class="form-inline">
			<input id="notice_input"type="text" class="form-control" placeholder="  제목 또는 작성자 검색" style="width:500px;">
			<div class="input-group-btn" style="margin-left:10px;">
				<button id="notice_search" class="btn btn-block btn-light btn-outline-secondary" type="button" onclick="javascript:search()">검색</button>
			</div>
		</form>
		</div>
		</div>
		<div class="row" style="margin-top:10px;justify-content: center;">
<%
 		String pagePath ="/manager/notice/noticetSEL.mgr?hp_code="+hp_code;
 		PageBarManager pb = new PageBarManager(numPerPage,tot,nowPage,pagePath);
 		String pagination = pb.getPageBar();
 		out.print(pagination);
 %>   
		
		<!-- 
		<nav aria-label="Page navigation example">
			<ul class="pagination" style="">
				<li class="page-item"><a class="page-link" href="#"> < </a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">></a></li>
			</ul>
		</nav>
		 -->
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
					
					alert(select_no); 
					alert(select_title); 
					alert(select_content); 
					
					location.href="./noticeDetail.mgr?no="+select_no+"&title="+select_title+"&content="+select_content+"&writer=<%=h_dept%>&mks_id="+select_id;
			     }
			});		
			$("#notice_board").bootstrapTable('hideLoading');

			
		});
	</script>
</body>
</html>