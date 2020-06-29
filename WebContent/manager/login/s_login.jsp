<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>병원관리시스템</title>
<%@include file="../../common/ManagerCommon.jsp" %>
<script type="text/javascript">
	function a(){
		alert("로그인 후 사용 가능합니다.");
	}
</script>
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
			<a class="nav-link" href="javascript:a()">
				<i class="fas fa-clipboard-list"></i>
				<span>공지사항</span>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:a()">
				<i class="fas fa-notes-medical"></i>
				<span>예약</span>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:a()">
				<i class="fas fa-user"></i>
				<span>환자</span>
			</a>
		</li>		
		<li class="nav-item">
			<a class="nav-link" href="javascript:a()">
				<i class="fa fa-stethoscope"></i>
				<span>의사</span>
			</a>
		</li>		
		<li class="nav-item">
			<a class="nav-link" href="javascript:a()">
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
		</p>
        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
		<!--==============================================================  -->
		<%@ include file="./n_login.jsp" %>
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

</body>
</html>