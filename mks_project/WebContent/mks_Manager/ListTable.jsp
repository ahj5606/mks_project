<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠기에 저장되있는 병원 코드를 가져옴..
	

%>    
<!-- 테이블 조회에 대한 코드//  -->    
<table id="hp_list" class="table table-sm">
 <thead>
   <tr>
	  <th scope="col" data-field="subject">학과</th> 	
	  <th scope="col" data-field="name">이름</th> 
	  <th scope="col" data-field="number">학번</th>
   </tr>
 </thead>
</table>
<button onClick="search('<%=//병원코드 넘겨요%>')">json으로 데이터</button> 
<!-- 테이블 조회에 대한 코드//  -->    