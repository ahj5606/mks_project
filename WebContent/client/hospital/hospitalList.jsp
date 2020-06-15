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
	input.form-control.mr-2{
		width:580px;
	}
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
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<div class="row" style="height:650px;">
	  		<div class="col-md">
				<div class="container" style="height:650px;padding-top:20px;">
					<div class="row mb-0">
						<label style="font-size:x-large;font-color:#4C4C4C;">제휴병원 목록</label>
					</div>
					<hr>
					<!-- 검색 -->
					<div class="row mb-2 mt-4">
						<div class="col-md">
							<form class="form-inline">
							   	<input class="form-control mr-2" type="search" placeholder="Ex) 서울 금천구" aria-label="Search">
								<button class="btn btn-dark btn-block" type="submit" style="width:110px">검색</button>
							</form>
						</div>
					</div>
					<!-- 테이블 -->
					<div class="row mb-4" style="height:450px; overflow-y: scroll;">
						<div class="col-md">
							<div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
							<div class="table-responsive-md">
								<table class="table">
									<thead class="thead-light">
										<tr>
											<th scope="col">병원이름</th>
											<th scope="col">주소</th>
											<th scope="col">운영시간</th>
											<th scope="col">진료과목</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">가산병원</th>
											<td>서울 금천구 가산동</td>
											<td>9:00 ~ 18:00</td>
											<td>내과, 이비인후과</td>
										</tr>
										<tr>
											<th scope="row">가산독산병원</th>
											<td>서울 금천구 독산동</td>
											<td>9:00 ~ 18:00</td>
											<td>내과, 외과, 정형외과, 소아과</td>
										</tr>
										<tr>
											<th scope="row">바로나아병원</th>
											<td>서울 금천구 가산동</td>
											<td>10:00 ~ 21:00</td>
											<td>외과, 정형외과</td>
										</tr>
										<tr>
											<th scope="row">어디보자병원</th>
											<td>서울 금천구 가산동</td>
											<td>9:00 ~ 18:00</td>
											<td>가정의학과, 소아과, 이비인후과</td>
										</tr>
										<tr>
											<th scope="row">엄마약손병원</th>
											<td>서울 금천구 가산동</td>
											<td>9:00 ~ 18:30</td>
											<td>가정의학과, 내과</td>
										</tr>
										<tr>
											<th scope="row">여기다고쳐병원</th>
											<td>서울 금천구 독산동</td>
											<td>9:00 ~ 18:30</td>
											<td>내과, 소아과</td>
										</tr>
										<tr>
											<th scope="row">맞다그병원</th>
											<td>서울 금천구 독산동</td>
											<td>9:30 ~ 19:30</td>
											<td>내과, 무슨일입니과</td>
										</tr>
										<tr>
											<th scope="row">지금병원</th>
											<td>서울 금천구 독산동</td>
											<td>9:30 ~ 18:30</td>
											<td>내과, 여기가어딥니과</td>
										</tr>
										<tr>
											<th scope="row">매일병원</th>
											<td>서울 금천구 독산동</td>
											<td>9:30 ~ 18:30</td>
											<td>정형외과, 누구십니과</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>