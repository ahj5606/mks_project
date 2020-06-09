<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//병원 이름 받아오기창
String hName = request.getParameter("hName");
String hDept = request.getParameter("hDept");
if(hName==null){
	hName="가산병원";
}
if(hDept==null){
	hDept="원무과";
}
%>   
<!-- 메뉴바 ------------------------------------->
<nav  class="navbar  navbar-expand-sm  bg-dark navbar-dark fixed-left"> 
 	<a class="navbar-brand" hrfe="./manager_List.jsp"><%=hName %>&nbsp;<%=hDept %></a>
  	<button  class="navbar-toggler"   type="button" data-toggle="collapse"   data-target="#collapsibleNavbar"> 
    	<span class="navbar-toggler-icon"></span> 
  	</button> 
  	 <div class="collapse navbar-collapse"   id="collapsibleNavbar"> 
  	<ul  class="navbar-nav"> 
  	<!-- 공지사항 버튼  -->
   <li class="nav-item"> 
      <a class="nav-link" href="./manager_List.jsp">공지사항</a> 
    </li> 
  	<!-- 공지사항 버튼  -->
  	<!-- 예약 버튼  -->
   <li class="nav-item"> 
      <a class="nav-link" href="./manager_reservation.jsp">예약</a> 
    </li> 
  	<!-- 예약 버튼  -->
  	<!-- 환자 버튼  -->
 	<li class="nav-item"> 
      <a class="nav-link" href="./manager_patient.jsp">환자</a> 
    </li> 
  	<!-- 환자 버튼  -->
  	<!-- 의사 버튼  -->
 	<li class="nav-item"> 
      <a class="nav-link" href="./manager_doctor.jsp">의사</a> 
    </li> 
  	<!-- 의사 버튼  -->
  	<!-- 대기시간 버튼  -->
 	<li class="nav-item"> 
      <a class="nav-link" href="./manager_wait.jsp">대기시간</a> 
    </li> 
  	<!-- 대기시간 버튼  -->
  	</ul> 
	<!-- 환자 바로 검색  -->
	<form class="form-inline" action="javascript:find()">  
    	<input id="p_name" class="form-control" type="text" placeholder="환자 이름 검색">  
    	<button class="btn btn-success" type="submit">찾기</button>  
  	</form> 
	<!-- 환자 바로 검색  -->
  	</div>
</nav> 
<!-- 메뉴바 ------------------------------------->
