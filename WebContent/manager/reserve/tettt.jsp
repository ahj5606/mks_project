<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	List<String> id = (List<String>)request.getAttribute("id");
	System.out.println("확인");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="./client/css/member.css" />
<title>회원가입</title>
	<script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script>
$(function(){
	
	$('.onlyAlphabetAndNumber').keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9]/gi,''));
        }
    });
	
	$('.onlyNumber').keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^0-9]/gi,''));
        }
	});
	
	$("#pass").keyup(function(event){
		var pass=$("#pass").val();
		var reg=/^.{8,20}$/;
		if(reg.test(pass)){
			$("#passRegErr").hide();
			successState("#pass");
		}else{
			$("#passRegErr").show();
			errorState("#pass");
		}
	});
	
	$("#passTest").keyup(function(event){
        var passTest=$("#passTest").val();
        var pass=$("#pass").val();
        if(passTest==pass){
            $("#testPassErr").hide();
            successState("#passTest");
        }else{
            $("#testPassErr").show();
            errorState("#passTest");
        }
    });
	
    $("#email").keyup(function(event){
        var email=$("#email").val();
        var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(reg.test(email)){
			$("#emailErr").hide();
            successState("#email");
        }else{
            $("#emailErr").show();
			errorState("#email");
        }
    });
    
    $("#name").keyup(function(event){
    	var name=$.trim($("#name").val());
    	if(name!=""){
    		$("#nameErr").hide();
    		successState("#name");
    	}else{
    		$("#nameErr").show();
    		errorState("#name");
    	}
    });
    
    $("#birth").keyup(function(event){
    	var birth=$.trim($("#birth").val());
    	if(birth!=""){
    		$("#birthErr").hide();
    		successState("#birth");
    	}else{
    		$("#birthErr").show();
    		errorState("#birth");
    	}
    });
    
    $("#phone").keyup(function(event){
    	var phone=$.trim($("#phone").val());
    	if(phone!=""){
    		$("#phoneErr").hide();
    		successState("#phone");
    	}else{
    		$("#phoneErr").show();
    		errorState("#phone");
    	}
    });
    
    $("#address").keyup(function(event){
    	var address=$.trim($("#address").val());
    	if(address!=""){
    		$("#addressErr").hide();
    		successState("#address");
    	}else{
    		$("#addressErr").show();
    		errorState("#address");
    	}
    });
    
    function successState(sel){
        $(sel)
        .parent()
        .removeClass("has-error")
        .addClass("has-success")
        .find(".glyphicon")
        .removeClass("glyphicon-remove")
        .addClass("glyphicon-ok")
        .show();
 
        $("#joinform input[type=submit]")
			.removeAttr("disabled");
    };

    function errorState(sel){
        $(sel)
        .parent()
        .removeClass("has-success")
        .addClass("has-error")
        .find(".glyphicon")
        .removeClass("glyphicon-ok")
        .addClass("glyphicon-remove")
        .show();
 
        $("#joinform input[type=submit]")
        	.attr("disabled","disabled");
    };
	
});
</script>

<script>
var list = [];
<c:forEach var="member" items="${id}">
list.push("${member}");
</c:forEach>

function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
    return false; 
} 

var tId = document.joinform.id.value;

function id_check() {
	var idCheck = document.joinform.id.value;
	var flag = true;	
	if(idCheck==""){
		alert("아이디를 입력해주세요.");
		return;
	}
	
	for(var i = 0; i < list.length; i++){
		if(idCheck.toLowerCase() == list[i].toLowerCase()){
			flag = false;
			break;
		}
	}
	
	if(flag){
		alert("사용 가능한 아이디 입니다.");
		tId = idCheck;
		document.getElementById("overlapErr").style.display = "none";
		document.getElementById("someid").classList.remove("has-error");
		document.getElementById("someid").classList.add("has-success");
		document.getElementById("glyId").classList.remove("glyphicon-remove");
		document.getElementById("glyId").classList.add("glyphicon-ok");
		document.getElementById("glyId").style.display = "block";
		document.joinform.idHidden.value="check";
		document.joinform.pass.focus();
	}else{
		alert("중복된 아이디 입니다.");
		document.getElementById("overlapErr").style.display = "block";
		document.getElementById("someid").classList.remove("has-success");
		document.getElementById("someid").classList.add("has-error");
		document.getElementById("glyId").classList.remove("glyphicon-ok");
		document.getElementById("glyId").classList.add("glyphicon-remove");
		document.getElementById("glyId").style.display = "block";
		document.joinform.id.value="";
		document.joinform.id.focus();
	}
}

function check_onclick() {
	
	var idCheck = document.joinform.id.value;
	var flag = true;	
	if(idCheck==""){
		alert("아이디를 입력해주세요.");
		return false;
	}
	
	for(var i = 0; i < list.length; i++){
		if(idCheck.toLowerCase() == list[i].toLowerCase()){
			flag = false;
			break;
		}
	}
	
	if(flag == false){
		alert("중복된 아이디 입니다.");
		document.getElementById("overlapErr").style.display = "block";
		document.getElementById("someid").classList.remove("has-success");
		document.getElementById("someid").classList.add("has-error");
		document.getElementById("glyId").classList.remove("glyphicon-ok");
		document.getElementById("glyId").classList.add("glyphicon-remove");
		document.getElementById("glyId").style.display = "block";
		document.joinform.id.value="";
		document.joinform.id.focus();
		return false;
	}
	
	theForm = document.joinform
	if(theForm.id.value==""){
		alert("아이디가 비어있습니다. 확인해주세요.");
		theForm.id.focus();
		return false;
	}else if(theForm.id.value != tId){
		tId = theForm.id.value;
		theForm.idHidden.value="";
		alert("아이디 중복체크를 해주세요.");
		theForm.id.focus();
		return false;
	}else if(theForm.idHidden.value==""){
		alert("아이디 중복체크를 해주세요.");
		theForm.id.focus();
		return false;
	}else if(theForm.pass.value==""){
		alert("비밀번호가 비어있습니다. 확인해주세요.");
		theForm.pass.focus();
		return false;
	}else if(theForm.PASStest.value==""){
		alert("비밀번호 재확인이 비어있습니다. 확인해주세요.");
		theForm.PASStest.focus();
		return false;
	}else if(theForm.pass.value != theForm.PASStest.value){
		alert("입력하신 비밀번호와 비밀번호 재입력이 다릅니다.");
		theForm.PASStest.focus();
		return false;
	}else if(theForm.name.value==""){
		alert("이름이 비어있습니다. 확인해주세요.");
		theForm.name.focus();
		return false;
	}else if(theForm.birthday.value==""){
		alert("생년월일이 비어있습니다. 확인해주세요.");
		theForm.birthday.focus();
		return false;
	}else if(theForm.email.value==""){
		alert("이메일이 비어있습니다. 확인해주세요.");
		theForm.email.focus();
		return false;
	}else if(theForm.phone.value==""){
		alert("전화번호가 비어있습니다. 확인해주세요.");
		theForm.phone.focus();
		return false;
	}else if(theForm.addr.value==""){
		alert("주소가 비어있습니다. 확인해주세요.");
		theForm.addr.focus();
		return false;
	}else{
		return true;
		document.joinform.submit();
	}

}

</script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
    <div class="container">
    <h2 class="maintitle" title="회원가입" alt="회원가입 페이지" >회원가입</h2>
    <br/><br/>
	<form role="form" class="form-horizontal" id="joinform" name="joinform" onsubmit="return check_onclick()" onkeydown="return captureReturnKey(event)" action="./MemberJoinAction.me" method="post">
		<div class="form-group has-feedback" id="someid">
			<label class="control-label col-sm-3" for="id" title="아이디" alt="아이디 표시" >아이디:</label>
		<div class="col-sm-9">
			<input class="form-control onlyAlphabetAndNumber" type="text" name="id" 
			title="아이디" alt="아이디 입력란" />
			<input type="hidden" id="idHidden" name="idHidden" />
			<input type="button"  id="overlap" name="overlap" value="중복확인"
			 onclick="id_check()" title="중복확인" alt="중복확인 버튼" />
			<span id="overlapErr" class="help-block" title="사용불가" alt="사용할 수 없는 아이디 입니다" >
			사용할 수 없는 아이디 입니다.</span>
			<span id="glyId" class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="pass" title="비밀번호" alt="비밀번호 표시" >비밀번호:</label>
		<div class="col-sm-9">
			<input class="form-control onlyAlphabetAndNumber" type="password" id="pass" name="pass" title="비밀번호" alt="비밀번호 입력란" />
			<span id="passRegErr" class="help-block" title="사용불가" alt="특수문자와 한글이 아닌 8글자 이상 20자 미만으로 입력하세요" >특수문자('_' 제외)와 한글이 아닌 8글자 이상 20자 미만으로 입력하세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="passtest" title="비밀번호 재확인" alt="비밀번호 재확인 표시" >비밀번호 재확인:</label>
		<div class="col-sm-9">
			<input class="form-control" type="password" id="passTest" name="PASStest" title="비밀번호 재확인" alt="비밀번호 재확인 입력란" />
			<span id="testPassErr" class="help-block" title="불일치" alt="비밀번호와 일치하지 않습니다" >비밀번호와 일치하지 않습니다.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="name" title="이름" alt="이름 표시" >이름:</label>
		<div class="col-sm-9">
			<input class="form-control" type="text" id="name" name="name" title="이름" alt="이름 입력란" />
			<span id="nameErr" class="help-block" title="미입력" alt="이름을 입력해주세요" >이름을 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div></div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="gender" title="성별" alt="성별 체크 표시" >성별:</label>
		<div class="col-sm-4">
			<input type="radio" id="gen" name="gen" value="남" title="남자" alt="남자에 체크" checked />남자
		</div>
		<div class="col-sm-4">
			<input type="radio" id="gen" name="gen" value="여" title="여자" alt="여자에 체크" />여자
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="birthday" title="생년월일" alt="생년월일 표시" >생년월일:</label>
		<div class="col-sm-9">
			<input class="form-control" type="date" id="birth" name="birthday" title="생년월일" alt="생년월일 입력란"  min="1900-01-01" max="${today}" />
			<span id="birthErr" class="help-block" title="미입력" alt="생년월일을 입력해주세요" >생년월일을 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="email" title="이메일" alt="이메일 표시" >이메일:</label>
		<div class="col-sm-9">
			<input class="form-control" type="email" id="email" name="email" title="이메일" alt="이메일 입력란" />
			<span id="emailErr" class="help-block" title="사용불가" alt="올바른 이메일 형식이 아닙니다" >올바른 이메일 형식이 아닙니다.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="phone" title="전화번호" alt="전화번호 표시" >전화번호:</label>
		<div class="col-sm-9">
			<input class="form-control onlyNumber" type="tel" id="phone" name="phone" placeholder="(-)빼고 입력" title="전화번호" alt="전화번호 입력란 (-)빼고 입력" />
			<span id="phoneErr" class="help-block" title="미입력" alt="전화번호를 입력해주세요" >전화번호를 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div></div>
		<div class="form-group has-feedback">
			<label class="control-label col-sm-3" for="address" title="주소" alt="주소 표시" >주소:</label>
		<div class="col-sm-9">
			<input class="form-control" type="text" id="address" name="addr" title="주소" alt="주소 입력란" />
			<span id="addressErr" class="help-block" title="미입력" alt="주소를 입력해주세요" >주소를 입력해주세요.</span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div></div>
		<br/><br/>
		<div class="form-group">
			<div class="col-sm-12">
				<input type="submit" id="submit" class="submit" value="회원가입" title="회원가입" alt="회원가입 버튼" />
		</div></div>
		<div class="form-group">
			<div class="col-sm-12">
				<input type="button" class="retry" onclick="location.href='javascript:joinform.reset()'" value="다시작성" title="다시작성" alt="다시작성 버튼" />
		</div></div>
	</form>
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>