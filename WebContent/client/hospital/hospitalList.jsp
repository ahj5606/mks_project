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
<title>제휴병원</title>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
	th, td{
		height:40px;
		font-size:large;
		color:#353535;
		/* padding:2px; ===> 왜 안먹지...?*/
	}
	a.page-link{
		height:28px;
		color:#4C4C4C;
	}
</style>
<script type="text/javascript">
	function res_pageGet(num){
		$.ajax({
			url:"/mks_project/client/hospital/jsonHospitalList.jsp?num="+num
			,success:function(data){
				var imsi = data.trim();
				alert(imsi);
				var res = JSON.parse(imsi);
				var inner = "";
				for(var i=0; i<res.length; i++){
					inner += "<tr><th scope='row'>"+res[i].HP_NAME+"</th>";
					inner += "<td>"+res[i].HP_ADDR+"</td>";
					inner += "<td>"+res[i].HP_TIME+"</td>";
					inner += "<td>"+res[i].HP_GAW+"</td></tr>";
				}
				$("#t_hospitalList").html(inner);
			}
		});
	}
	<%@ include file="/common/pagination.js"%>
	function search_h_name(){
		alert("입력한 병원이름: "+$("#h_name").val());
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<div class="row pt-4" style="height:650px;">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">제휴병원 목록</label>
					</div>
				</div>
				<hr>
				<!-- 검색 -->
				<div class="row mb-2">
					<div class="col-md pr-2 mr-2">
						<div class="form-group row">
	    					<div class="col-md">
		    					<div class="input-group">
		      						<input type="text" class="form-control" id="h_name" name="h_name" type="search" placeholder="Ex) 가산독산병원">
		      						<div class="input-group-prepend">
		      							<button class="btn btn-dark btn-block" onClick="search_h_name()">이름검색</button>
		      						</div>
		   						</div>
	    					</div>
	    					<div class="col-md-7"></div>
	  					</div>
   					</div>
				</div>
				<!-- 운영시간 선택 -->
 				<div class="row mb-2 pb-2">
			    	<label class="form-check-label ml-4" for="exampleCheck1">운영시간 &nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="form-check ml-4">
	  					<input class="form-check-input" type="checkbox" value="" id="timeCheck1">
	 					<label class="form-check-label" for="timeCheck1">오전 9:00 이전</label>
					</div>
					<div class="form-check ml-4">
	  					<input class="form-check-input" type="checkbox" value="" id="timeCheck2">
	 					<label class="form-check-label" for="timeCheck2">오후 18:00 이후</label>
					</div>
				</div> 
				<!-- 테이블 -->
				<div class="row mb-0" style="height:400px;">
					<div class="col-md">
						<div class="table-responsive-md">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr>
										<th scope="col">병원이름</th>
										<th scope="col">주소</th>
										<th scope="col">운영시간</th>
										<th scope="col">진료과목</th>
									</tr>
								</thead>
								<tbody id="t_hospitalList">
									<tr>
										<th scope="row">가산독산병원</th>
										<td>서울 금천구 독산동</td>
										<td>9:00 ~ 18:00</td>
										<td>내과, 외과, 정형외과, 소아과</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 페이지네이션 -->
				<div class="row mb-4" style="height:50px;">
					<div class="col-md">
						<ul class="pagination justify-content-center" style="height:5px;">
							<li class="page-item mx-1">
								<a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
								</a>
							</li>
							<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1"onClick="page(this)" >1</a></li>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>