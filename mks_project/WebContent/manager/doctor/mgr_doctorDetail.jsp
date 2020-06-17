<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 상세</title>
<script type="text/javascript">
	function docIns() {
		alert("저장");
		location.href="./docIns.jsp";
	}
	function docUpd() {
		alert("수정");
		location.href="./docUpd.jsp";
	}
	function docDel() {
		alert("삭제");
		location.href="./docDel.jsp";
	}
	function docClose() {
		alert("닫기");
		location.href="./doctorMain2.jsp";
	}

</script>
	<%@include file="../../common/ManagerCommon.jsp" %>
<body>
	<div class="container">
  	
     		<div class="form-group" style="margin-top: 30px">
	      	  <label>의사코드</label>
	      	  <input type="text" class="form-control" id="docCode" name="docCode" style="width: 245px">
	    	</div>
		    <div class="form-group">
		      <label>전공</label>
		      <input type="text" class="form-control" id="subject" name="subject" style="width: 245px">
		    </div>
		    <div class="form-group">
		      <label>이름</label>
		      <input type="text" class="form-control" id="name" name="name" style="width: 245px">
		    </div>
		    <div class="form-group">
		      <label>직급</label>
		      <input type="text" class="form-control" id="position" name="position" style="width: 245px">
		    </div>
	    	<div class="form-group">
		      <label>학력</label>
		      <input type="text" class="form-control" id="edu" name="edu" style="width: 245px">
		    </div>
		    <div class="form-group">
		      <label>전화</label>
		      <input type="text" class="form-control" id="phoneNum" name="phoneNum" style="width: 245px">
		    </div>
		    <div class="form-group">
		      <label>상태</label>
		      <input type="text" class="form-control" id="offDay" name="offDay" style="width: 245px">
		    </div>
	    <div>
		    <div style="margin-top: 30px">
			  <button class="btn btn-primary" onclick="docIns()">저장</button>
			  <button class="btn btn-primary" onclick="docUpd()">수정</button>
			  <button class="btn btn-primary" onclick="docDel()">삭제</button>
			  <button class="btn btn-primary" onclick="docClose()">닫기</button>
		    </div>
	    </div>
	</div>
</body>
</html>