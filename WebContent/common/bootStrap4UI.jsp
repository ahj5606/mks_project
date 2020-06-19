<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<link rel="stylesheet" href="<%=path.toString()%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=path.toString()%>css/bootstrap-grid.css">
<link rel="stylesheet" href="<%=path.toString()%>css/bootstrap-reboot.css">
<script src="<%=path.toString()%>js/jquery.min.js"></script>
<script src="<%=path.toString()%>js/bootstrap.min.js"></script>
<script src="<%=path.toString()%>js/dist/bootstrap-table.min.js"></script>
<script src="<%=path.toString()%>js/manager.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>css/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
<script src="<%=path.toString()%>js/commons.js"></script>
<script src="<%=path.toString()%>js/pagination.js"></script>
