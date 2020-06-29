<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var name;
//이름 기준체크 메소드
function checkNames(inputnames, s, e) {
	var sum;
	if(s<=inputnames.length()&&inputnames.length()<=e) {//문자길이 맞니?
		var result = new int[inputnames.length()];
		for(var i=0; i<inputnames.length(); i++) {
			var cha = inputnames.charCodeAt(i);
			if((33<=cha&&cha<=47)||(58<=cha&&cha<=64)||
						(91<=cha&&cha<=96)||(123<=cha&&cha<=126)) {//특수문자니? 문제군
				result[i]=1;
			}else {
				result[i]=0;
			}
		}
	}else {
		sum = inputnames.length();
	}
	if(sum>0) {//기준미통과
		$("#here").text()
		name = 0;
	}else {//기준통과
		jv.jl_name_warning.setVisible(false);
		name = 1;
	}
}
</script>
</head>
<body>
	<input type="text" style="width:200px;">
	<button onClick="checkNames()">버튼</button>
	<div id="here">여기</div>
</body>
</html>