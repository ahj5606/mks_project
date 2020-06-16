<%@page import="mks.util.PageBar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hp_code = "280HP";//실제론쿠키로 가져올 값임.
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
	        	 <input type="text" class="form-control" style="margin-top: 30px;" placeholder="환자이름" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <input type="text" class="form-control" style="margin-top: 30px;" placeholder="주민번호" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 30px;">환자 검색</button>
	        </div>
	        <div class="col-sm-8" id="main">
	        	 <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      	<div class="float-right">
			      	<button type="button" class="btn btn-outline-success">환자추가</button>
			      	</div>
			      	<table class="tbl paginated" id="tbl">
					  <thead>
					    <tr>
						  <th scope="col" data-field="MEM_MEMCODE">환자번호</th> 	
						  <th scope="col" data-field="MEM_NAME">환자이름</th> 
						  <th scope="col" data-field="MEM_SOCIALNUM">주민등록번호</th>
						  <th scope="col" data-field="MEM_PHONE">전화번호</th>
					    </tr>
					  </thead>
					</table>
			      </div>
			      <!--  -->
						
			      <!--  -->
			     </div>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:'./patientList.mgr?hp_code='+'<%=hp_code%>'
			,dataType:'json'
			,success:function(data){
				$("#tbl").bootstrapTable({ data: data });
				$("#tbl").bootstrapTable('hideLoading');
				
				page();
			}
			,error:function(request,status,error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		})
	})
	function page(){
		var reSortColors = function($table) {
			  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
			  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
			 };
			 $('#tbl').each(function() {
			  var pagesu = 10;  //페이지 번호 갯수
			  var currentPage = 0;
			  var numPerPage = 10;  //목록의 수
			  var $table = $(this);    
			  
			  //length로 원래 리스트의 전체길이구함
			  var numRows = $table.find('tbody tr').length;
			  //Math.ceil를 이용하여 반올림
			  var numPages = Math.ceil(numRows / numPerPage);
			  //리스트가 없으면 종료
			  if (numPages==0) return;
			  //pager라는 클래스의 div엘리먼트 작성
			  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
			  
			  var nowp = currentPage;
			  var endp = nowp+10;
			  
			  //페이지를 클릭하면 다시 셋팅
			  $table.bind('repaginate', function() {
			  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			  
			   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
			   $("#remo").html("");
			   
			   if (numPages > 1) {     // 한페이지 이상이면
			    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
			     nowp = 0;     // 1부터 
			     endp = pagesu;    // 10까지
			    }else{
			     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
			     endp = nowp+pagesu;   // 10까지
			     pi = 1;
			    }
			    
			    if (numPages < endp) {   // 10페이지가 안되면
			     endp = numPages;   // 마지막페이지를 갯수 만큼
			     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
			    }
			    if (nowp < 1) {     // 시작이 음수 or 0 이면
			     nowp = 0;     // 1페이지부터 시작
			    }
			   }else{       // 한페이지 이하이면
			    nowp = 0;      // 한번만 페이징 생성
			    endp = numPages;
			   }
			   // [처음]
			   $('<button  type="button" class="page-number btn btn-outline-primary">처음</button>').bind('click', {newPage: page},function(event) {
			          currentPage = 0;   
			          $table.trigger('repaginate');  
			          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
			      }).appendTo($pager).addClass('clickable');
			    // [이전]
			      $('<button type="button" class="page-number btn btn-outline-primary">이전</button>').bind('click', {newPage: page},function(event) {
			          if(currentPage == 0) return; 
			          currentPage = currentPage-1;
			    $table.trigger('repaginate'); 
			    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			    // [1,2,3,4,5,6,7,8]
			   for (var page = nowp ; page < endp; page++) {
			    $('<button type="button" class="page-number btn btn-outline-primary"></button>').text(page + 1).bind('click', {newPage: page}, function(event) {
			     currentPage = event.data['newPage'];
			     $table.trigger('repaginate');
			     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			     }).appendTo($pager).addClass('clickable');
			   } 
			    // [다음]
			      $('<button type="button" class="page-number btn btn-outline-primary">다음</button>').bind('click', {newPage: page},function(event) {
			    if(currentPage == numPages-1) return;
			        currentPage = currentPage+1;
			    $table.trigger('repaginate'); 
			     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			    // [끝]
			   $('<button type="button" class="page-number btn btn-outline-primary">Primary</button>').bind('click', {newPage: page},function(event) {
			           currentPage = numPages-1;
			           $table.trigger('repaginate');
			           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			     
			     $($(".page-number")[2]).addClass('active');
			reSortColors($table);
			  });
			   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
			   $pager.appendTo($table);
			   $table.trigger('repaginate');
			 });
	}
	</script>
</body>
</html>