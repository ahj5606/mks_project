<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    
    function addrSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('i_zipcode').value = data.zonecode;
                document.getElementById("i_addr").value = addr;

            }
        }).open();
    }
</script>
<input type="button" onclick="addrSearch()" value="우편번호 찾기"><br>

								<div class="form-group row" >
    							<label id="i_addr1" style="width:80px;">주소</label>
    							<div class="col-md">
     					 			<input type="text" readonly class="form-control"  id="i_addr">
    							</div>
  							</div>
  								<div class="form-group row" >
    							<label id="i_zipcode1" style="width:80px;">우편번호</label>
    							<div class="col-md">
     					 			<input type="text" readonly class="form-control"  id="i_zipcode">
    							</div>
  							</div>
</body>
</html>