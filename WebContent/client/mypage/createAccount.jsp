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
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
   .container{
      padding:5px;
   }
   /* .col-4, .col{
      padding-right:10px;
      padding-left:10px;
   } */ 
   body{
        font-family: 'Do Hyeon', sans-serif;
   }
</style>
<script type="text/javascript">
   /*****************************************************************************
   * 회원가입을 위한 조건들.........
   * 1) id, reg, email에 저장된 값 = input에 현재 입력되어있는 값
   * 2) id_check + reg_check + email_check + pw_check = 4 
   * 두 조건을 만족해야 ==> insert 가능
   */
   var id = null;//아이디 저장
   var email = null;//이메일 저장
   var email_num = null;//인증번호 저장
   var time_check = null;//인증번호 발송버튼 눌렀을 때의 시간 저장
   var reg;//주민번호 저장
   
   var name_check=0;//이름 조건 통과시1로
   var pw_check=0;//비밀번호 일치시 1로
   var id_check=0;//아이디 중복검사 통과시 1로
   var email_check=0;//이메일 인증성공시 1로
   var reg_check1=0;//주민번호 가입검사 통과시 1로
   var reg_check2=0;//주민번호 가입검사 통과시 1로
   
   function addrSearch() {
       new daum.Postcode({
           oncomplete: function(data) {
              var zip = data.zonecode;
               var addr = data.sigungu; // 최종 주소 변수
               var addr1 = data.sido; // 최종 주소 변수
               var addr2 = data.bname; // 최종 주소 변수
               /* $("#i_addr").val(addr+" "+addr1+" "+addr2);
               $("#i_zipcode").val(zip); */
               document.getElementById("i_addr").value = addr+" "+addr1+" "+addr2;
               document.getElementById("i_zipcode").value = zip;
           }
       }).open();
   }
   function acc_check(){
      alert("회원가입버튼 호출");
      var imsi = $("#i_reg1").val()+"-"+$("#i_reg2").val();
      if((name_check+pw_check+id_check+email_check+reg_check1+reg_check2)==6){
         alert("id: "+id+", i_id: "+$("#i_id").val());
         alert("email: "+email+", i_email: "+$("#i_email").val());
         alert("reg: "+reg+", imsi: "+imsi,"i_tel"+i_tel);
         
         if(id==$("#i_id").val() && email==$("#i_email").val() && reg==imsi ){
            alert("회원가입하러 go~!!!");
            var addr=$("#i_addr").val()+","+$("#i_addr2").val()
            
            alert(addr);
            
            $.ajax({
	          	url:'/mypage/proc_mem_Add.crm'
	          	,method:'post'
	          	,data:'reg='+reg+'&i_id='+id
      			+'&i_pw='+$("#i_pw").val()+'&i_name='+$("#i_name").val()
      			+'&addr='+addr+'&i_email='+email
      			+'&i_tel='+$("#i_tel").val()
	          	,success:function(data){
	          	var res = data.trim();
	          	alert(res);
	          	location.href = "../login/main.jsp";
	          	}//succseefunction
	          	});//ajax	
	          	
         }else{
    	  alert("기준미달");
         }
      }else{
    	  alert("기준미달");
      }
   }
   function check_id(){
      alert("아이디 중복검사!");
      id = null;
      if(id_check==1){//아이디 기준 통과시
         //ajax로 아이디 중복검사하러~~~~~
         //1) 통과되었다면...
         var i_id = $("#i_id").val();
        $.ajax({
        	url:'/mypage/idCheck.crm?i_id='+i_id
        	,success:function(data){
        		var res = data.trim();
        		alert(res);
        		if(res=="통과"){
			         $("#idFail").html("통과");
			         $("#idFail").attr('class','text-success');
			         id = $("#i_id").val();
			         id_check=1;
        		}else{
        			 $("#idFail").html("존재하는 아이디입니다.");
        	         $("#idFail").attr('class','text-danger');
        	         id_check=0;
        		}
        	}
        });	 
     
      }else{
         alert("아이디가 형식에 맞지 않습니다.");
         id_check=0;
      }
   }//function end
   
   function check_reg(){
	      alert("주민번호 가입검사!");
	      reg = null;
	      if(reg_check2==1&&reg_check1==1){//주민번호 기준 통과시
	            //ajax로 주민번호 중복검사하러~~~~~
	            //1) 통과되었다면...
	             reg = $("#i_reg1").val()+"-"+$("#i_reg2").val();
	            	alert(reg);
	          $.ajax({
	          	url:'/mypage/socialnumCheck.crm?i_reg='+reg
	          	,success:function(data){
	          	var res = data.trim();
	          	alert(res);
					if(res=="통과"){
	            		$("#regFail").html("통과");
	            		$("#regFail").attr('class','text-success');
	            		reg = $("#i_reg1").val()+"-"+$("#i_reg2").val();
	            		reg_check2=1;
	            		reg_check1=1;
					}else{
						
	            		//2) 중복된다면...
	            		$("#regFail").html("이미 가입된 주민번호입니다.");
	            		$("#regFail").attr('class','text-danger');
	            		reg_check2=0;
	            		reg_check1=0;
	            		
					}
	          	}//succseefunction
	          	});//ajax	
	      }else{
	         alert("주민번호가 형식에 맞지 않습니다.");
	         reg_check2=0;
	         reg_check1=0;
	      }
	   }
   
   function send_mail(){
      alert("인증번호 발송!");
      email = null;
      email_num = null;
      var input = $("#i_email").val();
      checkEmail(input);
      if(email_check==1){//이메일 기준 통과시
         email = input;
         var time = new Date();
         time_check = time.getTime();
         $.ajax({
            url: './mailing.jsp?i_email='+email
            ,success: function(data){
               var res = data.trim();
               email_num = res;
               alert("인증번호: "+email_num);
            }
         });
      }else{
         alert("이메일이 형식에 맞지 않습니다.");
      }
      
   }
   function check_mail(){
      if(email_num==null){
         alert("인증번호가 발송되지 않았습니다.");
         email_check=0;
      }else{
         var time = new Date();
         time = time.getTime();
         if((time-time_check)>60000){//540000
            $("#emailFail").html("입력시간이 초과되었습니다.");
            $("#emailFail").attr('class','text-danger');
            email_check=0;
         }else{
            var input = $("#i_email_check").val();
            if(input==email_num){
            alert("같음");
               $("#emailFail").html("통과");
               $("#emailFail").attr('class','text-success');
               email_check=1;
            }
         }
      }
   }
 
</script>
</head>
<body>
   <!-- 메뉴바 -->
   <jsp:include page="../login/menu.jsp"/>
   <!-- 본문 -->
   <div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
        <div class="row pt-3">
           <div class="col-md">
            <div class="row mb-0">
               <div class="col-md">
                  <label style="font-size:x-large;font-color:#4C4C4C;margin-left:0;">회원가입</label>
               </div>
            </div>
            <hr>
            <!-- 회원가입 입력폼 -->
            <div class="border mb-0 mt-3">
               <div class="row m-2 my-0 mb-4" style="justify-content: center">
                  <form id="check">
                      <!-- 이름 -->
                       <div class="form-group row mb-1 mt-3">
                         <label for="i_name" style="width:80px;">이름</label>
                         <div class="col-md">
                              <div class="input-group">
                                 <input type="text" class="form-control" id="i_name">
                              </div>
                              <small id="loginFail" class="text-muted">1~7자이어야 하며 특수문자는 입력불가합니다.</small>
                           </div>
                       </div>
                       <!-- 아이디 -->
                       <div class="form-group row mb-1">
                         <label for="i_id" style="width:80px;">아이디</label>
                         <div class="col-md">
                              <div class="input-group">
                                 <input type="text" class="form-control" id="i_id" name="i_id">
                                 <input type="button" onclick="check_id()" value="중복 검사" 
                                                style="background-color:#353535;color:#F6F6F6;"><br>
                              </div>
                              <small id="idFail" class="text-muted">7~12자이어야 하며 공백과 한글은 불가합니다.</small>
                         </div>
                       </div>
                       <!-- 비밀번호 -->
                       <div class="form-group row mb-1">
                         <label for="i_pw" style="width:80px;">비밀번호</label>
                         <div class="col-md">
                             <div class="input-group">
                                 <input type="password" class="form-control" id="i_pw">
                             </div>
                             <small id="pwFail" class="text-muted">7~12자이어야 하며 공백은 불가합니다.</small>
                         </div>
                       </div>
                       <!-- 주민번호 -->
                       <div class="form-group row mb-1">
                         <label for="i_reg" style="width:80px;">주민번호</label>
                         <div class="col-md">
                              <div class="input-group">
                                 <input type="text" class="form-control" id="i_reg1">
                                 <label>&nbsp;-&nbsp;</label>
                                 <input type="password" class="form-control" id="i_reg2">
                                 <label></label>
                                 <input type="button" onclick="check_reg()" value="가입 확인" 
                                                style="background-color:#353535;color:#F6F6F6;"><br>
                              </div>
                              <small id="regFail" class="text-muted">주민번호를 입력해주세요.</small>
                         </div>
                       </div>
                       <!-- 우편번호 -->
                       <div class="form-group row mb-1">
                         <label style="width:80px;">우편번호</label>
                         <div class="col-md">
                            <div class="input-group">
                                 <input type="text" readonly class="form-control" id="i_zipcode">
                                 <input type="button" onclick="addrSearch()" value="우편번호 찾기" 
                                                style="background-color:#353535;color:#F6F6F6;"><br>
                              </div>
                         </div>
                       </div>
                       <!-- 주소 -->
                       <div class="form-group row mb-1" >
                         <label style="width:80px;">주소</label>
                         <div class="col-md">
                              <input type="text" readonly class="form-control" id="i_addr">
                         </div>
                       </div>
                       <!-- 상세주소 -->
                       <div class="form-group row mb-1">
                         <label for="i_addr2" style="width:80px;">상세주소</label>
                         <div class="col-md">
                              <input type="text" class="form-control" id="i_addr2">
                         </div>
                       </div>
                       <!-- 전화번호 -->
                       <div class="form-group row mb-1">
                         <label for="i_tel" style="width:80px;">전화번호</label>
                         <div class="col-md">
                              <input type="text" class="form-control" id="i_tel">
                         </div>
                       </div>
                       <!-- 이메일 -->
                       <div class="form-group row mb-1">
                         <label for="i_email" style="width:80px;">이메일</label>
                         <div class="col-md">
                            <div class="input-group">
                                 <input type="text" class="form-control" id="i_email">
                                 <input type="button" onclick="send_mail()" value="인증번호 받기" 
                                                style="background-color:#353535;color:#F6F6F6;"><br>
                              </div>
                         </div>
                       </div>
                       <!-- 인증번호 입력 -->
                       <div class="form-group row mb-1">
                         <label for="i_email_check" style="width:80px;"></label>
                         <div class="col-md">
                            <div class="input-group">
                                 <input type="text" class="form-control" id="i_email_check">
                                 <input type="button" onclick="check_mail()" value="인증하기" 
                                                style="background-color:#353535;color:#F6F6F6;"><br>
                              </div>
                              <small id="emailFail" class="text-muted">이메일을 입력해주세요.</small>
                         </div>
                       </div>
                  </form>
               </div>
               <!-- 버튼 -->
               <div class="row mb-4 mr-1">
                  <div class="col-md pr-1" style="text-align:right">
                     <button class="btn btn-md btn-dark" onClick="acc_check()">회원가입하기</button>
                  </div>
               </div>
            </div><!-- 회원가입 입력폼 끝 -->
         </div>
      </div>
   </div>
   <!-- footer -->
   <jsp:include page="../login/footer.jsp"/>
   <!-- 돔구성 완료되었을 때 -->
   <script type="text/javascript">
      $(document).ready(function(){
         $("#i_name").keyup(function(){
            var input = $("#i_name").val();
            checkNames(input,1,7);
         });
         $("#i_pw").keyup(function(){
            var input = $("#i_pw").val();
            checkPw(input,7,12);
         });
         $("#i_id").keyup(function(){
            var input = $("#i_id").val();
            checkId(input,5,12);
         });
         $("#i_reg1").keyup(function(){
            var input = $("#i_reg1").val();
            regFirst(input);
         });
         $("#i_reg2").keyup(function(){
            var input = $("#i_reg2").val();
            regSec(input);
         });
      });
   </script>
</body>
</html>