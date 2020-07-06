<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hp_code = "";
	String hp_name = "";
	String dept_name = "";
	String dept_code="";
	String mks_id="";
	
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0){
		for(int i =0;i<cookies.length;i++){
			String name = cookies[i].getName();
			if(name.equals("hp_name")){
				hp_name = cookies[i].getValue();
			}
			if(name.equals("dept_name")){
				dept_name = cookies[i].getValue();
			}
			if(name.equals("dept_code")){
				dept_code = cookies[i].getValue();
			}
			if(name.equals("mks_id")){
				mks_id = cookies[i].getValue();
			}
			
		}
	}
	
	HttpSession sess = request.getSession();
	hp_code = (String)sess.getAttribute("hp_code");
	
%>
<!DOCTYPE html>
<head>
<title>병원관리시스템</title>
<%@include file="../../common/ManagerCommon.jsp" %>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
	
		<ul class="navbar_nav bg-gradient-primary sidebar sidebar-dark accordion" style="list-style:none;padding-left:0px;">
		
		<!-- 통합정보예약시스템 -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="s_sidebar.jsp">
				<div class="sidebar-brand-icon icon-hospital">
					<i class="fas fa-hospital"></i>
				</div>
				<div class="sidebar-brand-text mx-3">통합예약시스템</div>
			</a>
		<!-- 통합정보예약시스템 끝 -->
		
		<!-- 메뉴구분선 -->
		<hr class="sidebar-divider my-0">
		
		<!-- 메뉴들 시작  -->
		<li class="nav-item">
			<a class="nav-link" href="/manager/notice/noticeSEL.mgr">
				<i class="fas fa-clipboard-list"></i>
				<span>공지사항</span>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/manager/reserve/reserveList.mgr">
				<i class="fas fa-notes-medical"></i>
				<span>예약</span>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/manager/patient/patientList.mgr">
				<i class="fas fa-user"></i>
				<span>환자</span>
			</a>
		</li>		
		<li class="nav-item">
			<a class="nav-link" href="/manager/doctor/doctorList.mgr">
				<i class="fa fa-stethoscope"></i>
				<span>의사</span>
			</a>
		</li>		
		<li class="nav-item">
			<a class="nav-link" href="sidebar.jsp">
				<i class="fas fa-clock"></i>
				<span>대기시간</span>
			</a>
		</li>		
		
		<!-- 메뉴구분선 -->
		<hr class="sidebar-divider my-0">

		</ul>
		<!-- sidebar 끝 -->
		

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow">
			<p class="col-sm-12 col-md-9">
			<p class="text-right"><strong><h4><%=hp_name %></h4></strong></p>
			<p class="text-right"><strong><h4>/</h3></strong></p>
			<p class="text-right"><strong><h4><%=dept_name %></h3></strong></p>
		</p>
        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
		<!--==============================================================  -->
		<%-- <%@include file="./s_table.jsp" %> --%>
		<%-- <%@include file="./notice_writeform.jsp" %> --%>
		<!--==============================================================  -->
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

</body>

</html>