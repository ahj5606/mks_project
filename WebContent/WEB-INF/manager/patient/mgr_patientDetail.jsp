<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String h_name = "가산사랑병원";
	String h_dept = "원무과";
%>
<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>병원관리시스템</title>
  <!-- Custom fonts for this template-->
	<%@include file="/common/ManagerCommon.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon icon-hospital">
          <i class="fas fa-hospital"></i>
        </div>
        <div class="sidebar-brand-text mx-3">통합예약시스템</div>
      </a>

      <!-- Divider -->
      <!-- 메뉴 사이 ㅡ  -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="sidebar.jsp">
          <i class="fas fa-clipboard-list"></i>
          <span>공지사항</span></a>
      </li>


      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="sidebar.jsp">
          <i class="fas fa-notes-medical"></i>
          <span>예약</span>
        </a>
      </li>
      
      
      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="sidebar.jsp">
          <i class="fas fa-user"></i>
          <span>환자</span>
        </a>
       
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="sidebar.jsp">
          <i class="fa fa-stethoscope"></i>
          <span>의사</span>
        </a>
        
      </li>
	
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="sidebar.jsp">
          <i class="fas fa-clock"></i>
          <span>대기시간</span></a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

    </ul>
    <!-- End of Sidebar -->
    
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
    

      <!-- Main Content -->
      <div id="content" class="bg-white">
    
    
     <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow">
			<p class="col-sm-12 col-md-9">
			<p class="text-right"><strong><h4><%=h_name %></h4></strong></p>
			<p class="text-right"><strong><h4>/</h3></strong></p>
			<p class="text-right"><strong><h4><%=h_dept %></h3></strong></p>
		</p>
        <!-- end of Topbar -->
        </nav>
        <!--====================================== 여기에 코드를 메인 코드를 넣어야 함  -->
        <%@include file="./patientDetail.jsp" %>
        <!--======================================  -->
        <!-- end of Main Content -->
        </div>
        <!-- end of Content Wrapper -->
        </div>
        <!-- end of Page Wrapper -->
        </div>
        </body>