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
<title>원무과 대기 정보</title>
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
	 	font-size: x-large;
	}
	.navbar .navbar-brand:hover,
	.navbar .navbar-brand:focus {
	 	color: #FFFFFF;
	}
	#qr, #qr:hover{
		border-color:#EAEAEA; 
	}
	body{
	 	font-size: large;
	  	font-family: 'Do Hyeon', sans-serif;
	}
	div.modal-header{
		text-align:center;
	}
</style>
<script type="text/javascript">
	var time = setTimeout(function(){//setTimeout(함수, term)
		location.reload();
	},1000);
	$(document).ready(function(){//대기시간, 대기인원 가져오는 ajax **********************
		var today = new Date();   
		var seconds = today.getSeconds();
		document.getElementById("wait_num").innerHTML = "&nbsp;&nbsp;"+seconds+" 번";
		document.getElementById("wait_time").innerHTML = "&nbsp;&nbsp;"+seconds+" 분 ";
	});
	function btn_qr(){//qr코드 생성 **************************************************
		alert("QR코드 DB에 저장하고 전송해야함!");
		var imsi = document.getElementById("wait_num").innerHTML;
		imsi = imsi.substring(imsi.lastIndexOf(";")+1);
		var qrcode = new QRCode(document.getElementById("qr_img"), {
		 	text: imsi,
			width: 128,
			height: 128,
			colorDark : "#000000",
			colorLight : "#ffffff",
			correctLevel : QRCode.CorrectLevel.H
		});
		clearTimeout(time);
		$('#qr').attr('disabled', true);
		$('#modal_qr').modal('show');
	}
</script>
</head>
<body>
	<!-- 네이게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#007bff;">
	    <a class="navbar-brand" href="#">원무과 대기 정보<input type="hidden" value="12345"></a><!-- 병원코드 숨겨두기 -->
    </nav>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:30px;">
	  	<div class="row mb-3 mt-5" style="justify-content: center">
      		<table id="t_waiting">
      			<tr><th style='padding:2px;text-align:right;'>대기 인원수</th><td style='padding:2px;' id="wait_num"></td></tr>
      			<tr><th style='padding:2px;text-align:right;'>대기 시간</th><td style='padding:2px;' id="wait_time"></td></tr>
			</table>
  		</div>
	  	<div class="row mb-3 mt-5" style="justify-content: center">
	  		<button type="button" class="btn btn-success" id="qr" onClick="btn_qr()">QR코드 받기</button>
  		</div>
	</div>
	
	<!-- qr 모달 -->
	<div class="modal fade bd-example-modal-sm" id="modal_qr" tabindex="-1" role="dialog" aria-hidden="true">
  		<div class="modal-dialog modal-sm" role="document">
   			<div class="modal-content">
   				<!-- head -->
     	 		<div class="modal-header">
        			<h5 class="modal-title">발급된 qr 대기번호</h5>
      			</div>
      			<!-- body -->
      			<div class="modal-body">
   					<div class="row" style="justify-content: center">
      					<div class="row" id="qr_img"></div>
     				</div>
     			</div>
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="self.close();">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
</body>
</html>