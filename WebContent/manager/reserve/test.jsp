<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%@include file="../../common/ManagerCommon.jsp" %>
	<div id="deptDrop"class="btn-group btn-default m-3" style="border: 1px solid #ccc;">
		<button class="btn dropdown-toggle" type="button"
			data-toggle="dropdown" style="border: 1px solid red;">
			����� ��ü
			<!-- ��ư�±� ���� �޴������ ���� ȭ��ǥǥ��
 (��� �����ϳ� �޴���ư�̶�°��� �˷��ֱ� ����) -->
			<span class="caret"></span>
		</button>
		<!--�޴���ư Ŭ���� �ϴ� ǥ��� ����Ʈ ����  -->
		<ul class="dropdown-menu text-center">
			<li><a href="javascript:void(0)">����</a></li>
			<li><a href="javascript:void(0)">�ܰ�</a></li>
		</ul>
	</div>
<script type="text/javascript">
$('#deptDrop .dropdown-menu li > a').bind('click',function (e) {
	alert("��");
    var dept = $(this).html();
    $('#deptDrop button.dropdown-toggle').html(dept +' <span class="caret"></span>');
    alert(dept);
});
</script>
					
</html>