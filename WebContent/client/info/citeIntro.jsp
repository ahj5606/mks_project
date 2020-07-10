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
<title>사이트 소개</title>
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
							style="font-size:large;color:#F6F6F6;background-color:#007bff;" 
									onClick="location.href='./citeIntro.jsp'">사이트소개</button>
					<button class="btn btn-md" 
							style="font-size:large;color:#353535;background-color:#EAEAEA;" 
									onClick="location.href='./nonmemServiceIntro.jsp'">비회원 서비스</button>
					<button class="btn btn-md" 
							style="font-size:large;color:#353535;background-color:#EAEAEA;" 
									onClick="location.href='./memServiceIntro.jsp'">회원 서비스</button>
				</div>
				<!-- 내용 -->
				<div class="border mb-0 mt-0">
					<div class="row mx-2 mt-2" style="height:420px;">
						<div class="col">
							<!-- 설명1 -->
							<div class="row mt-4 mb-3 ml-2">
								<div class="col-md-1 mr-5 pr-2">
									<img src="./hp.png" style="width:120px;">
								</div>
								<div class="col-md mt-3">
									<b style="font-size:xx-large">KO:MEDI</b><br>
									<p>
										코메디(Korean Medical Reservation Service)는 국내 병원의 진료예약 서비스를 제공합니다.<br>
										쉽고 간편한 온라인 예약을 통해 시간과 비용을 절약하세요.
									</p>
								</div>
							</div>
							<!-- 설명2 -->
							<div class="row my-2 ml-2">
								<div class="col-md">
									<img src="./pin.png" style="width:20px;">&nbsp;
												진료예약 정보 qr코드로 발급<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												qr코드 지갑 모바일 앱 서비스 제공<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												실제 진료 예약을 한 회원들의 후기 공유<br>
								</div>
							</div>
							<!-- 설명3 -->
							<div class="row mb-2 mt-4 ml-2">
								<div class="col-md-1 mr-5 pr-2">
									<img src="./admin.png" style="width:90px;padding-left:7px;">
								</div>
								<div class="col-md mt-2">
									<b>병원 관리 시스템</b><br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												의사, 환자 정보 관리 서비스<br>
									<img src="./pin.png" style="width:20px;">&nbsp;
												진료예약 관리 서비스<br>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 내용 끝-->
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
</body>
</html>