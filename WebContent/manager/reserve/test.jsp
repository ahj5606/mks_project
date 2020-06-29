<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%@include file="../../common/ManagerCommon.jsp" %>
	<div id="deptDrop"class="btn-group btn-default m-3" style="border: 1px solid #ccc;">
		<button class="btn dropdown-toggle" type="button"
			data-toggle="dropdown" style="border: 1px solid red;">
			진료과 전체
			<!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
 (없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
			<span class="caret"></span>
		</button>
		<!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
		<ul class="dropdown-menu text-center">
			<li><a href="javascript:void(0)">내과</a></li>
			<li><a href="javascript:void(0)">외과</a></li>
		</ul>
	</div>
<script type="text/javascript">
$('#deptDrop .dropdown-menu li > a').bind('click',function (e) {
	alert("눌");
    var dept = $(this).html();
    $('#deptDrop button.dropdown-toggle').html(dept +' <span class="caret"></span>');
    alert(dept);
});
</script>
					
</html>