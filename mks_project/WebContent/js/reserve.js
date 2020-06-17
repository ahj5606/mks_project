	function kCalendar(id, date) {

	var kCalendar = document.getElementById(id);
	var _todate = new Date();
	var toYear = _todate.getFullYear();
	var toMonth = _todate.getMonth()+1;
	var toDate = _todate.getDate();

	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}

	var currentYear = date.getFullYear();
	//년도를 구함
	var currentMonth = date.getMonth() + 1;
	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	var currentDate = date.getDate();
	//오늘 일자.
	date.setDate(1);
	var currentDay = date.getDay();
	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
	lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
	
	if(currentMonth != 1)
	var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
	else
	var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	//만약 이번달이 1월이라면 1년 전 12월로 출력.


	if(currentMonth != 12)
	var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	else
	var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	//만약 이번달이 12월이라면 1년 후 1월로 출력.

	if( currentMonth < 10 )
	var currentMonth = '0' + currentMonth;
	
	//10월 이하라면 앞에 0을 붙여준다.

	
	var calendar = '';
		calendar += '<div id="header">';
		calendar += ' <span><a href="#" class="btn-prev" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
		calendar += ' <span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
		calendar += ' <span><a href="#" class="btn-next" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
		calendar += ' </div>';
		calendar += ' <table border="0" cellspacing="0" cellpadding="0">';
		calendar += ' <caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
		calendar += ' <thead>';
		calendar += ' <tr>';
		calendar += '   <th class="sun" scope="row">일</th>';
		calendar += '   <th class="mon" scope="row">월</th>';
		calendar += '   <th class="tue" scope="row">화</th>';
		calendar += '   <th class="wed" scope="row">수</th>';
		calendar += '   <th class="thu" scope="row">목</th>';
		calendar += '   <th class="fri" scope="row">금</th>';
		calendar += '   <th class="sat" scope="row">토</th>';
		calendar += ' </tr>';
		calendar += ' </thead>';
		calendar += ' <tbody>';
	
	
	
	
	var dateNum = 1 - currentDay;
	
	
	 for(var i = 0; i < week; i++) {
		calendar += ' <tr>';
			for(var j = 0; j < 7; j++, dateNum++) {
				if( dateNum < 1 || dateNum > currentLastDate ) {
					calendar += ' <td class="' + dateString[j] + '"> </td>';
					continue;
				}
				if(dateNum == toDate){
					calendar += ' <td style="cursor: pointer; cursor: hand;background-" onClick="openPop(\''+dateNum+'\')"> ' + dateNum + '</td>';
				}else{
					calendar += ' <td style="cursor: pointer; cursor: hand;" onClick="openPop(\''+dateNum+'\')">' + dateNum + '</td>';
				}
			}
		calendar += ' </tr>';
	} 
	kCalendar.innerHTML = calendar;
	} 
	function selectSDate(data) {
		  var sdate = document.getElementById('startDate').value;
		  var edate = document.getElementById('endDate').value;
		  alert("시작날짜"+sdate);
		  alert("종료날짜"+edate);
		}
	function resSearch(data) {
	    var sdate = document.getElementById('startDate').value;
	    var edate = document.getElementById('endDate').value;
		var dSearch = document.getElementById('docSearch').value;
		var pSearch = document.getElementById('patiSearch').value;
		alert("시작날짜:"+sdate+" | 종료날짜:"+edate);
		alert("의사 "+dSearch+" | 환자 "+pSearch);
	}
	function openPop(date){
	 		alert(date);
	 		alert(date);
	 	
		}
	
	window.onload = function () {
		kCalendar('kCalendar');
	};
	
	function test(){
		$.ajax({
			url:'p.json',
			dataType: 'json',
			success:function(data){
				var result = JSON.stringify(data);// 직관적인 정보String로 변환
//				$("#d_map").text(result);
				var jsonDoc = JSON.parse(result);//배열로 전환 - 재객체화(배열)
				for(var i=0; i<jsonDoc.length;i++){ 
					alert(jsonDoc[i].dept);//배열, 속성이름으로 꺼낸다		
					$("#res_list").bootstrapTable({ data: data });
					$("#hp_list").bootstrapTable('hideLoading');
				}////////end of for
			}//end of success
		});////end of ajax
	};
	function reserve(){
		// 테이블 표현할 데이터 표현
		 var mydata = [
			 { "reservedate": "2020-06-01", "dept": "안과", "pname": "김씨","number": "123", "doctor": "김의사" },
			 { "reservedate": "2020-06-02", "dept": "내과", "pname": "박씨","number": "456", "doctor": "박의사" },
			 { "reservedate": "2020-06-02", "dept": "내과", "pname": "박씨","number": "456", "doctor": "박의사" },
			 { "reservedate": "2020-06-03", "dept": "외과", "pname": "이씨","number": "789", "doctor": "김의사" },
			 { "reservedate": "2020-06-04", "dept": "정신과", "pname": "정씨","number": "1111", "doctor": "정의사" },
			 { "reservedate": "2020-06-01", "dept": "안과", "pname": "김씨","number": "123", "doctor": "김의사" },
			 { "reservedate": "2020-06-02", "dept": "내과", "pname": "박씨","number": "456", "doctor": "박의사" },
			 { "reservedate": "2020-06-03", "dept": "외과", "pname": "이씨","number": "789", "doctor": "김의사" },
			 { "reservedate": "2020-06-04", "dept": "정신과", "pname": "정씨","number": "1111", "doctor": "정의사" },
			 { "reservedate": "2020-06-05", "dept": "어쩌구과", "pname": "송씨","number": "222", "doctor": "박의사" }
			 ];
		$("#res_list").bootstrapTable({ data: mydata });
		$("#res_list").bootstrapTable('hideLoading');
	};

	function test2(){
		var requestURL = './p.json';
		var request = new XMLHttpRequest();
		request.open('GET', requestURL);
		request.responseType = 'json';
		request.send();
		request.onload = function(data) {
			  var data = request.response;
				$("#res_list").bootstrapTable({ data: data });
				$("#res_list").bootstrapTable('hideLoading');
			}
	}
