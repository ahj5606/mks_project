<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String board_no = request.getParameter("board_no");

	Object obj = session.getAttribute("mks_id"); //관리자 아이디.
	String mks_id = null;
	if(obj != null) {
		mks_id = (String)obj;
	}
	String hp_name = request.getParameter("hp_name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>공지사항 상세 화면</title>
	<%@ include file="/common/bootStrap4UI.jsp"%>
	<style type="text/css">
		.container{
			padding:5px;
		}
		a.navbar-brand{/*네비바 글자 가운데 정렬*/
		margin: auto;
	}
	.navbar .navbar-brand {
	  	color: #F6F6F6;
	  	font-family: 'Do Hyeon', sans-serif;
	 	font-size: xx-large;
	}
	.navbar .navbar-brand:hover,
	.navbar .navbar-brand:focus {
	 	color: #FFFFFF;
	 	font-family: 'Do Hyeon', sans-serif;
	}
		h5.card-header a, h6.card-header, .card-body{
			color:#353535;
		}
		th, td{
			height:40px;
			font-size:medium;
			color:#353535;
			/* padding:2px; ===> 왜 안먹지...?*/
		}
		a.page-link{
			color:#4C4C4C;
		}
		label{
			margin:8px;
		}
		body{
		  	font-family: 'Do Hyeon', sans-serif;
		}
	</style>
	<script type="text/javascript">
		var mks_id = '<%=mks_id %>';
		var board_no = <%=board_no %>; //자바에 있는 변수를 스크립틀릿 변수에 넣겠다.
		function board_list() {
			alert("목록");
			location.href="/client/notice/noticeList.jsp"
		}
	</script>
</head>
<body>
	<!-- 메뉴바 -->
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
	  	<div class="row pt-4">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">공지사항 상세보기</label>
					</div>
				</div>
				<hr>
				<!-- 테이블 -->
				<div class="row m-2" style="justify-content:center;">
					<form id="f_board">
						<div class="form-group row mb-2 mt-3">
							<label for="board_title" style="width:50px;margin-left:12px;">제목</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_title" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-2">
							<label for="board_writer" style="width:50px;margin-left:12px;">작성자</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="mks_id" value='<%=mks_id%>' style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-4">
							<label for="board_date" style="width:50px;margin-left:12px;">작성날짜</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_date" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row">
							<textarea readonly class="form-control ml-1" rows="10" name="board_content" id="board_content" placeholder="내용을 입력해 주세요" ></textarea>
	    				</div>
					</form>
				</div>
				<!-- 버튼 -->
				<div class="row mb-2">
					<div class="col-md" style="text-align:right">
						<button class="btn btn-md btn-dark" onClick="board_list()">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 돔구성 완료. -->
	<script type="text/javascript">
		$(document).ready(function(){
			alert("board_no: " + board_no);
			$.ajax({
				url: "/notice/noticeDetail.crm?num=1&board_no="+board_no
			   ,success: function(data) {
				   var res = JSON.parse(data);
				   alert("본문사이즈: " + res.length);
				   $("#board_title").val(res[0].BOARD_TITLE);
				   $("#mks_id").val(res[0].MKS_ID);
				   $("#board_date").val(res[0].BOARD_DATE);
				   $("#board_content").val(res[0].BOARD_CONTENT);
			   }
			});
		});
	</script>
</body>
</html>