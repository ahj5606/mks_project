<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="./jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src='./jquery-ui.js'></script>
</head>
<body>
<input type="text" id="m_phone" name="m_phone" class="inputTxt" maxlength="13" />
<script type="text/javascript">
$("#m_phone").autocomplete({
    source: [
        "파크사이드재활의학병원",
        "성신고려요양병원",
        "서울대효병원",
        "구로한방병원",
        "녹십자요양병원",
        "부산아동병원",
        "제니스파크요양병원",
        "실버한방병원",
        "아카시아병원",
        "뉴연세여성병원",
        "서울바른세상병원",
        "효메디요양병원",
        "그랜드자연요양병원",
        "성지병원",
        "금천수요양병원",
        "새라새요양병원",
        "우리들40플란트치과병원",
        "부산성소병원",
        "위대항병원",
        "새움병원",
        "희명병원",
        "윌리스요양병원",
        "용당요양병원"
        ]
});

</script>

</body>
</html>