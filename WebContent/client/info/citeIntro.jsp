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
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<div class="row pt-4">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">이용안내</label>
					</div>
				</div>
				<hr>
				<!-- 메뉴 버튼 -->
				<div class="row ml-2">
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
				<div class="row mx-2 my-0" style="background-color:#E4F7BA;height:450px;">코스모 메디컬은...
				</div>
			</div>
		</div>
	</div>
</body>
</html>