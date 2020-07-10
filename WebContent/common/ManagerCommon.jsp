<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<link rel="stylesheet" type="text/css" href="<%=path %>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path %>css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="<%=path %>css/bootstrap-reboot.css">
<link rel="stylesheet" type="text/css" href="<%=path %>css/sb-admin-2.css">
<link rel="stylesheet" type="text/css"href="<%=path %>css/all.min.css"  >
<link href='<%=path.toString()%>fullcalendar/core/main.css' rel='stylesheet' />
<link href='<%=path.toString()%>fullcalendar/daygrid/main.css' rel='stylesheet' />
<script src='<%=path.toString()%>fullcalendar/core/main.js'></script>
<script src='<%=path.toString()%>fullcalendar/daygrid/main.js'></script>
<script src='<%=path.toString()%>fullcalendar/interaction/main.js'></script>
<script src="<%=path %>js/jquery.min.js"></script>
<script src="<%=path %>js/bootstrap.bundle.min.js"></script> 
<script src="<%=path %>js/dist/bootstrap-table.min.js"></script>
<script src="<%=path %>js/manager.js"></script>
<script src="<%=path.toString()%>js/commons.js"></script>

<script>
function waittime(){
   cmm_window_popup('/manager/waiting/wait.jsp','400','400','원무과 대기 정보');
   
   
}
</script>
<script>
function kiosk(){
   cmm_window_popup('https://192.168.0.247:7000/msg/managerLogin.jsp','600','600','키오스크');
   
   
}
function logout(){
	$.ajax({
		url:'/manager/login/logout.mgr'
		,success:function(data){
			location.href="/manager/login/s_login.jsp"
		}
	
	})
	
}
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<<<<<<< HEAD
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->

<!-- <script src="jquery.twbsPagination.js" type="text/javascript"></script> -->

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  -->
