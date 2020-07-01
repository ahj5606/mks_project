<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>내 정보</title>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
	footer {
		left: 0;
		bottom: 0;
		width: 100%;
		overflow-x:hidden;
		text-align: center;
		font-family:'Do Hyeon';
		margin-top:30px;
	}
	body{
	  	font-family: 'Do Hyeon', sans-serif;
	}
	a.page-link{
		color:#4C4C4C;
	}
</style>
<script type="text/javascript">
	function res_pageGet(num){
		$('#t_myReList').bootstrapTable('refreshOptions', {
	          url: "/client/myPage/jsonMyReservationList.jsp?num="+num
		});
		$("div.fixed-table-loading").remove();
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
	  	<div class="row pt-4">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">내 정보</label>
					</div>
				</div>
				<hr>
				<!-- 메뉴 버튼 -->
				<div class="row mb-0 mt-3  ml-2">
					<button class="btn btn-md" 
							style="font-size:large;color:#F6F6F6;background-color:#007bff;" 
									onClick="location.href='./myReservationList.jsp'">예약목록</button>
					<button class="btn btn-md" 
							style="font-size:large;color:#353535;background-color:#EAEAEA;" 
									onClick="location.href='./pwInput.jsp'">개인정보</button>
				</div>
				<!-- 내용 -->
				<div class="border mb-0 mt-0">
					<div class="row mx-2">
						<div class="col">
							<!-- 나의 예약 리스트 -->
							<div class="container mb-0 my-4">
								<div class="table-responsive-md">
									<table class="table" id="t_myReList" data-toggle="table">
										<thead class="thead-light">
											<tr>
												<th data-field="HOP_NAME">병원이름</th>
												<th data-field="DEPT_NAME">진료과</th>
												<th data-field="DOC_NAME">담당의</th>
												<th data-field="RES_DATE">날짜</th>
												<th data-field="RES_TIME">시간</th>
												<th data-field="RES_QR">QR코드</th>
												<th class="d-none" data-field="RES_CODE">예약코드</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<!-- 페이지네이션 -->
							<div class="row mb-4">
								<div class="col-md">
									<ul class="pagination pagination-small justify-content-center mb-0">
										<li class="page-item">
											<a class="page-link py-1 px-2 my-1 mr-1" href="#" onClick="pageMove(this)" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
											</a>
										</li>
										<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a></li>
										<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_2"  onClick="page(this)" >2</a></li>
										<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_3"  onClick="page(this)" >3</a></li>
										<li class="page-item mr-1">
											<a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
												<span class="sr-only">Next</span>
											</a>
										</li>
									</ul>
								</div>
							</div><!-- 페이지네이션 끝 -->
						</div>
					</div>
				</div><!-- 내용 끝 -->
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
	
	<!-- 돔 구성이 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#t_myReList').bootstrapTable('refreshOptions', {
		          url: "/client/myPage/jsonMyReservationList.jsp?num="+1
				  ,onClickRow : function(row,element,field){
				  }
			});
			$("div.fixed-table-loading").remove();
		});
	</script>
</body>
</html>