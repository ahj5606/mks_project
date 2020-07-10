<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hp_code=null;
	if( request.getParameter("hp_code")!=null){
		     hp_code =  request.getParameter("hp_code");
	}
%>
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
		var wait_number="";
		var wait_time="";
		var hp_code = '<%=hp_code%>';
		
		function wait(){
    		$.ajax({
          		url:'/reservation/waitCheck.crm?hp_code='+hp_code    
         		,success: function (data){
         			var res = JSON.parse(data);  
         			wait_number=res[0].DEPT_LASTWAIT;
         			wait_time =res[0].WAIT_TIME;
   					document.getElementById("dept_lastwait").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+wait_number+" 명";
   					document.getElementById("wait_time").innerHTML = "&nbsp;&nbsp;약 "+wait_time+" 분 ";
               }
      		}); 
		}
		
		var time = setTimeout(function(){//setTimeout(함수, term)
		   location.reload();
		},3000);

		$(document).ready(function(){//대기시간, 대기인원 가져오는 ajax **********************
		   var today = new Date();   
		   var seconds = today.getSeconds();
		      wait();
		});

		function btn_qr(){//qr코드 생성 **************************************************
			$("#wait_num").html(wait_number+1);
   			clearTimeout(time);
   			$('#qr').attr('disabled', true);
   			$('#modal_qr').modal('show');
            $.ajax({
                url: '/reservation/waitUpd.crm'
                ,data: 'hp_code='+hp_code
                ,success: function(data) {
                   var res = data.trim();
                   if(res == '실패') {
                      alert('대기인원  +1 실패');
                   }
                   else {
                	   share(wait_number+1);
                   }
                }
             });
            
		}
		
		function share(wait) {
			var url = 'http://192.168.0.245:5000/client/waitNum.jsp?wait='+wait;
			Kakao.Link.createDefaultButton({
				container: '#kakao-link-btn',
				objectType: 'feed',
				content: {
					title: "mks 코스모 병원",
					description: "대기번호 발급",
					imageUrl: './health_96630.png',
					link: {
						mobileWebUrl: url,
						androidExecParams: 'test'
					}
				},
				buttons: [
					{
						title: '웹으로 이동',
						link: {
							webUrl: url
						},
					},
					{
						title: '앱으로 이동',
						link: {
							mobileWebUrl: url
						},
					}, 
				],
				success: function(response) {
					console.log(response);
				},
				fail: function(error) {
					console.log(error);
				}
			});
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
               <tr><th style='padding:2px;text-align:right;'>대기 인원수</th><td style='padding:2px;' id="dept_lastwait"></td></tr>
               <tr><th style='padding:2px;text-align:right;'>대기 시간</th><td style='padding:2px;' id="wait_time"></td></tr>
         </table>
        </div>
        <div class="row mb-3 mt-5" style="justify-content: center">
           <button type="button" class="btn btn-success" id="qr" onClick="btn_qr()">대기번호 받기</button>
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
                     <div class="row" id="wait_num"></div>
                 </div>
              </div>
              <!-- footer -->
              <div class="modal-footer">
                 <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="self.close();">닫기</button>
                 <button type="button" id="kakao-link-btn" class="btn btn-warning">공유하기</button>
               </div>
          </div>
        </div>
   </div>
	<!-- 돔구성 -->
	<script type="text/javascript">
		$(document).ready(function(){
			Kakao.init("265447647e1cb17951a10eb622ba9fbc");
		});
	</script>
</body>
</html>
