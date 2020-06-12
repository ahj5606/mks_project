<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<link rel="stylesheet" href="<%=path %>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=path %>css/bootstrap-grid.css">
<link rel="stylesheet" href="<%=path %>css/bootstrap-reboot.css">
<script src="<%=path %>js/jquery.min.js"></script>
<script src="<%=path %>js/bootstrap.min.js"></script>
<script src="<%=path %>js/dist/bootstrap-table.min.js"></script>
<script src="<%=path %>js/manager.js"></script>
