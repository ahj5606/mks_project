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
<title>회원 서비스 소개</title>
	<%@ include file="/common/bootStrap4UI.jsp"%>
	<style type="text/css">
		.container {
			padding: 5px;
		}
	</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
	  	<div class="row pt-4">
	  		<div class="col-md" style="min-height: 590px">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">이용안내</label>
					</div>
				</div>
				<hr>
				<!-- 메뉴 버튼 -->
				<div class="row mb-0 mt-3 ml-2">
					<button class="btn btn-md" 
							style="font-size:large;color:#353535;background-color:#EAEAEA;" 
									onClick="location.href='./citeIntro.jsp'">사이트소개</button>
					<button class="btn btn-md" 
							style="font-size:large;color:#353535;background-color:#EAEAEA;" 
									onClick="location.href='./nonmemServiceIntro.jsp'">비회원 서비스</button>
					<button class="btn btn-md" 
							style="font-size:large;color:#F6F6F6;background-color:#007bff;" 
									onClick="location.href='./memServiceIntro.jsp'">회원 서비스</button>
				</div>
				<!-- 내용 -->
				<div class="border mb-0 mt-0">
					<div class="row mx-2" style="height:420px;">
						<div class="col">
							<!-- 병원위치 서비스 -->
							<div class="row my-4 ml-2">
								<div class="col-md-1 mr-5 pr-2">
									<img src="./loc.png" style="width:100px;">
								</div>
								<div class="col-md mt-3">
									<b>병원위치 서비스</b><br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												병원 위치지도로 손쉬운 병원위치 확인<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												방문 전에 진료시간, 병원소재, 의료진, 진료내용 등 병원에 대한 정보 미리확인<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												관심 병원 즐겨찾기 추가<br>
								</div>
							</div>
							<!-- 대기번호 및 진료예약 서비스 -->
							<div class="row my-4 ml-2">
								<div class="col-md-1 mr-5 pr-2">
									<img src="./qrcode.png" style="width:90px;padding-left:7px;">
								</div>
								<div class="col-md mt-2">
									<b>진료예약 서비스</b><br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												인터넷/모바일을 통한 진료예약으로 대기시간 절약<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												예약 정보를 QR 코드로 발급<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												모바일 앱을 통해 즐겨찾기된 병원 진료 예약 및 QR 코드 확인 가능<br>
								</div>
							</div>
							<!-- 고객참여 게시판 -->
							<div class="row my-4 ml-2">
								<div class="col-md-1 mr-5 pr-2">
									<img src="./pen.png" style="width:90px;padding-left:7px;">
								</div>
								<div class="col-md mt-2">
									<b>고객참여 게시판</b><br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												매주 연제되는 건강정보 칼럼<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												카카오톡을 통해 공유가능<br>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 내용 끝 -->
				
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
</body>
</html>