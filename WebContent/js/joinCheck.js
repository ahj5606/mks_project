/*********************************************************************************
 * 
 * 이름 기준체크
 * 1) 길이 1~6
 * 2) 특수문자 불가
 * 3) 빈문자 불가
 */
function checkNames(inputname, s, e) {
	var sum = 0;
	if(s<=inputname.length && inputname.length<=e) {//문자길이 맞니?
		for(var i=0; i<inputname.length; i++) {
			var cha = inputname.charCodeAt(i);
			if((33<=cha&&cha<=47)||(58<=cha&&cha<=64)||
						(91<=cha&&cha<=96)||(123<=cha&&cha<=126)) {//특수문자니? 문제군
				sum++;
			}
		}
	}else{
		if(inputname.length==0){
			sum = -1;
		}else{
			sum = inputname.length;
		}
	}
	if(sum>0) {//기준미통과
		$("#loginFail").html("1~7자이어야 하며 특수문자는 입력불가합니다.");
		$("#loginFail").attr('class','text-danger');
		name_check =0;
	}else if(sum==0) {//기준통과
		$("#loginFail").html("통과");
		$("#loginFail").attr('class','text-success');
		name_check =1;
	}else if(sum==-1){
		$("#loginFail").html("문자를 입력해주세요");
		$("#loginFail").attr('class','text-danger');
		name_check =0;
	}
}
/*********************************************************************************
 * 
 * 비번 기준체크
 * 1) 길이 7~12자
 * 2) 특수문자 불가
 * 3) 빈문자 불가
 */
function checkPw(inputpw, s, e) {
	var sum =0;
	if(s<=inputpw.length && inputpw.length<=e) {//문자길이 맞니?
		for(var i=0; i<inputpw.length; i++) {
			var cha = inputpw.charCodeAt(i);
			if(33>cha||cha>126){//한글, 공백이니? 문제군
				sum++;
			}
		}
	}else {
		if(inputpw.length==0){
			sum = -1;
		}else{
			sum = inputpw.length;
		}
	}
	if(sum>0) {//기준미통과
		$("#pwFail").html("7~12자이어야 하며 공백은 불가합니다.");
		$("#pwFail").attr('class','text-danger');
		pw_check=0;
	}else if(sum==0) {//기준통과
		$("#pwFail").html("통과");
		$("#pwFail").attr('class','text-success');
		pw_check=1;
	}else if(sum==-1){
		$("#pwFail").html("문자를 입력해주세요");
		$("#pwFail").attr('class','text-danger');
		pw_check=0;
	}
}
 
/*********************************************************************************
 * 
 * 아이디 기준체크
 * 1) 길이 7~12자
 * 2) 한글 불가
 * 3) 빈문자 불가
 */
function checkId (inputId, s, e) {
	var sum = 0;
	if(s<=inputId.length && inputId.length<=e) {//문자 길이가 7~12니?
		for(var i=0; i<inputId.length; i++) {
			var cha = inputId.charCodeAt(i);
			if(33<=cha&&cha<=126) {//영문, 숫자, 특수문자니?
				if((33<=cha&&cha<=47)||(58<=cha&&cha<=64)||
						(91<=cha&&cha<=96)||(123<=cha&&cha<=126)) {//특수문자니? 문제군
					sum++;
				}
			}else {//공백, 한글이니? 문제야
				sum++;
			}
		}
	}else {//문자길이가 기준에 맞지 않군
		if(inputId.length==0){
			sum = -1;
		}else{
			sum = inputId.length;
		}
	}
	if(sum>0) {//기준미통과
		$("#idFail").html("7~12자이어야 하며 공백과 한글은 불가합니다.");
		$("#idFail").attr('class','text-danger');
		id_check=0;
	}else if(sum==0) {//기준통과
		$("#idFail").html("중복검사 버튼을 눌러주세요.");
		$("#idFail").attr('class','text-danger');
		id_check=1;
	}else if(sum==-1){
		$("#idFail").html("문자를 입력해주세요");
		$("#idFail").attr('class','text-danger');
		id_check=0;
	}
}
 
/*********************************************************************************
* 
* 이메일 기준체크
* 로컬부분:대문자A~Z,소문자a~z,숫자0~9,특수문자!#$%&'*+-/=?^_{|}~,(.은사용가능하나첫번째, 마지막아니어야됨) 
* 도메인부분 : 대문자 A~Z, 소문자 a~z, 숫자 0~9, 하이픈-(첫번째 또는 마지막 아니어야됨)
* 정의) 로컬부분 + @ + 도메인부분 (상세하게 하면 매우다르지만 일반적으로 이정도)
*/
function checkEmail(inputemail) {
	var local = null;
	var domain = null;
	var sum = 0;
	var sum2 = 0;
	if(inputemail.length==0) {//이메일을 적지 않았다면,
		sum = -1;
		sum2 = -1;
	}else {//이메일을 적었다면,
		//먼저 @ 갯수를 확인할게
		var checking = 0;
		for(var i =0; i<inputemail.length; i++) {
			var cha = inputemail.charCodeAt(i);
			if(cha[i]==64) {
				checking++;
			}
		}
		if(checking>1) {//@가 여러개니?
			sum = 1;
			sum2 = 1;
		}
		else {//@가 하나니?
			var strs = inputemail.split("@");//그럼 이제 로컬과 도메인 검사 할게
			local = strs[0];
			if(strs.length==2) {//@가 있다면,
				domain = strs[1];
				if(domain!=null) {
					//로컬 검사
					if(local.charCodeAt(0)==46||local.charCodeAt(local.length-1)==46) {//.이 첫번째 혹은 마지막이니?
						sum = local.length;
					}else {//아니라면 다음 기준 간다
						for(var i=0; i<local.length; i++) {
							var cha = local.charCodeAt(i);
							if(33<=cha&&cha<=126){//영문, 숫자, 특수문자 니?
								if(cha==34||cha==40||cha==41||
										cha==44||cha==46||cha==58||cha==59||
										cha==60||cha==62||cha==64||(91<=cha&&cha<=96)) {
									sum++;//문제군
								}
							}else {//아니니?
								sum++;//문제군
							}
						}
					}
					//도메인 검사
					if(domain.charCodeAt(0)==45||domain.charCodeAt(domain.length-1)==45) {//-이 첫번째 혹은 마지막이니?
						sum2 = domain.length;
					}else {//아니라면 다음 기준 간다
						for(var i=0; i<domain.length; i++) {
							var cha = domain.charCodeAt(i);
							if((48<=cha&&cha<=57)||(65<=cha&&cha<=90)||(97<=cha&&cha<=122)||cha==45||cha==46) {//영문, 숫자, -니?
								sum2 = sum2;
							}else {//아니니?
								sum2++;
							}
						}
					}
				}else {//domain==null 이라면,
					sum = local.length;
					sum2 = 1;
				}
			}else {//@이 하나도 없니?
				sum = local.length;
				sum2 = 1;
			}
		}
	}
	var f_sum = sum +sum2;
	if(f_sum>0) {//기준미통과
		$("#emailFail").html("이메일 형식에 맞지 않습니다.");
		$("#emailFail").attr('class','text-danger');
		email_check=0;
	}else if(f_sum==0) {//기준통과
		$("#emailFail").html("입력 가능 시간은 3분입니다.");
		$("#emailFail").attr('class','text-danger');
		email_check=1;
	}else if(f_sum==-2){
		$("#emailFail").html("문자를 입력해주세요");
		$("#emailFail").attr('class','text-danger');
		email_check=0;
	}
}

/*********************************************************************************
 * 
 * 주민번호 
 * 1) 앞자리: 6자리 숫자만
 * 2) 뒷자리: 첫번째 1~4, 7자리 숫자만
 */
function regFirst(inputreg){
	var sum =0;
	if(inputreg.length>0){
		for(var i=0; i<inputreg.length; i++){
			var cha = inputreg.charCodeAt(i);
			if(cha<48||cha>57){
				sum++;
			}
		}
	}else{
		sum = -1;
	}
	if(sum>0){
		if(inputreg.length==6){
			$('#i_reg1').blur();
		}else if(inputreg.length>6){
			var input = $("#i_reg1").val();
			input = input.substring(0,6);
			$("#i_reg1").val(input);
		}
		$("#regFail").html("숫자만 입력해주세요.");
		$("#regFail").attr('class','text-danger');
		reg_check1=0;
	}else if(sum==0){
		if(inputreg.length==6){
			reg_check1=1;
			$('#i_reg2').focus();
			$("#regFail").html("주민번호 뒷자리를 입력해주세요.");
			$("#regFail").attr('class','text-danger');
		}else if(inputreg.length>6){
			var input = $("#i_reg1").val();
			input = input.substring(0,6);
			$("#i_reg1").val(input);
			$('#i_reg1').blur();
		}
	}else if(sum==-1){
		$("#regFail").html("숫자를 입력해주세요.");
		$("#regFail").attr('class','text-danger');
		reg_check1=0;
	}
}

function regSec(inputreg){
	var sum =0;
	if(inputreg.length>0){
		var imsi = inputreg.charCodeAt(0);
		if(49<=imsi && imsi<=52){
			for(var i=0; i<inputreg.length; i++){
				var cha = inputreg.charCodeAt(i);
				if(cha<48||cha>57){
					sum++;
				}
			}
		}else{
			sum=-2;
		}
	}else{
		sum = -1;
	}
	if(sum>0){
		if(inputreg.length==7){
			$('#i_reg2').blur();
		}else if(inputreg.length>7){
			var input = $("#i_reg2").val();
			input = input.substring(0,7);
			$("#i_reg2").val(input);
		}
		$("#regFail").html("숫자만 입력해주세요.");
		$("#regFail").attr('class','text-danger');
		reg_check2=0;
	}else if(sum==0){
		if(inputreg.length==7){
			$('#i_reg2').blur();
			$("#regFail").html("가입 확인 버튼을 눌러주세요.");
			$("#regFail").attr('class','text-danger');
			reg_check2=1;
		}else if(inputreg.length>7){
			var input = $("#i_reg2").val();
			input = input.substring(0,7);
			$("#i_reg2").val(input);
			$('#i_reg2').blur();
		}
	}else if(sum==-1){
		$("#regFail").html("주민번호 뒷자리를 입력해주세요.");
		$("#regFail").attr('class','text-danger');
		reg_check2=0;
	}else if(sum==-2){
		$("#regFail").html("주민번호 형식에 맞지 않습니다.");
		$("#regFail").attr('class','text-danger');
		reg_check2=0;
	}
}









