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
<title>예약상세 화면</title>
<%@ include file="/common/bootStrap4UI.jsp"%>
</head>
<body>
	  			<!-- 날짜테이블 -->
				<div class="row pt-2">
					<div class="col-md">
						<div id='calendar'></div>
					</div>
				</div>
	<!-- 돔 구성이 완료되었을 때 -->
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				 plugins: [ 'interaction', 'dayGrid' ]
				,defaultView: 'dayGridMonth'
				,selectable: true
				,dateClick: function(info) {
					var s = new Date('2020-06-20');
					var e = new Date('2020-07-05');
					var d = new Date(info.dateStr);
					if(s<=d&&d<=e){
						alert('Clicked on: ' + info.dateStr);
						// change the day's background color just for fun
						info.dayEl.style.backgroundColor = 'red';
					}
				}
				,events: [{
			        start: '2020-06-20',//여기에 예약가능 날짜의 가장 첫 날짜
			        end: '2020-07-05',//여기에 예약가능 날짜의 가장 마지막 날짜
			        rendering: 'background'
			    }]
				,dragOpacity: 1
			    ,eventConstraint: {
			           start: '2020-06-20',
			           end: '2020-07-05',
			           
			    }
			});
			calendar.render();
		});
		
	</script>
</body>
</html>