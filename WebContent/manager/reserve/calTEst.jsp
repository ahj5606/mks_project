<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }
   
    .fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */
.fc-agendaWeek-view tr {
    height: 40px;
}

.fc-agendaDay-view tr {
    height: 40px;
}

</style>
</head>

<%StringBuilder sb = new StringBuilder(); %>
	<%@include file="../../common/ManagerCommon.jsp" %>
	<script type="text/javascript">
	   document.addEventListener('DOMContentLoaded', function() {
	         var calendarEl = document.getElementById('calendar');
	         var calendar = new FullCalendar.Calendar(calendarEl, {
	             plugins: [ 'interaction', 'dayGrid' ]
	            ,defaultView: 'dayGridMonth'
	            ,selectable: true
	            ,dateClick: function(info) {
	               var day = info.dateStr;
	               alert("선택: "+day);
	            }

	         });
	         calendar.render();
	      });

</script>
<body>
<div class="container-fluid">
<div style="margin:10px;">
<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
<button data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Click</button>
</div>
<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->
<div class="dropdown">
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
    Dropdown button
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">Link 1</a>
    <a class="dropdown-item" href="#">Link 2</a>
    <a class="dropdown-item" href="#">Link 3</a>
  </div>
</div>



<!-- - -->
<div class="collapse" id="collapseExample">
<div class="well">
hello world
<div id="calendar"></div>
</div>
</div>
</div>
</body>
</html>