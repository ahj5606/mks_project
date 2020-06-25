


function reserveDetail() {
	alert("reserveDetail눌");
	location.href = "./mgr_reserveReadForm.jsp";
}
function back() {
	alert("눌");
	location.href = "mgr_reserve.jsp";
}

function selectSDate(data) {
	var sdate = document.getElementById('startDate').value;
	var edate = document.getElementById('endDate').value;
	var dept = document.getElementById('selDept').value;
	alert("진료과 "+dept);
	alert("시작날짜" + sdate);
	alert("종료날짜" + edate);
}
function resSearch(data) {
	var sdate = document.getElementById('startDate').value;
	var edate = document.getElementById('endDate').value;
	var dSearch = document.getElementById('docSearch').value;
	var pSearch = document.getElementById('patiSearch').value;
	var dept = $('#deptDrop button.dropdown-toggle').html();
	var sedept = document.getElementById('selDept').value;
	alert("de"+dept);
	alert("se"+sedept);
	alert("시작날짜:" + sdate + " | 종료날짜:" + edate);
	alert("의사 " + dSearch + " | 환자 " + pSearch);
}

function test() {
	$.ajax({
		url : 'p.json',
		dataType : 'json',
		success : function(data) {
			var result = JSON.stringify(data);// 직관적인 정보String로 변환
			// $("#d_map").text(result);
			var jsonDoc = JSON.parse(result);// 배열로 전환 - 재객체화(배열)
			for (var i = 0; i < jsonDoc.length; i++) {
				alert(jsonDoc[i].dept);// 배열, 속성이름으로 꺼낸다
				$("#res_list").bootstrapTable({
					data : data
				});
				$("#hp_list").bootstrapTable('hideLoading');
			}// //////end of for
		}// end of success
	});// //end of ajax
};
function reserve() {
	// 테이블 표현할 데이터 표현
	var mydata = [ {
		"reservedate" : "2020-06-01",
		"dept" : "안과",
		"pname" : "김씨",
		"number" : "123",
		"doctor" : "김의사"
	}, {
		"reservedate" : "2020-06-02",
		"dept" : "내과",
		"pname" : "박씨",
		"number" : "456",
		"doctor" : "박의사"
	}, {
		"reservedate" : "2020-06-02",
		"dept" : "내과",
		"pname" : "박씨",
		"number" : "456",
		"doctor" : "박의사"
	}, {
		"reservedate" : "2020-06-03",
		"dept" : "외과",
		"pname" : "이씨",
		"number" : "789",
		"doctor" : "김의사"
	}, {
		"reservedate" : "2020-06-04",
		"dept" : "정신과",
		"pname" : "정씨",
		"number" : "1111",
		"doctor" : "정의사"
	}, {
		"reservedate" : "2020-06-01",
		"dept" : "안과",
		"pname" : "김씨",
		"number" : "123",
		"doctor" : "김의사"
	}, {
		"reservedate" : "2020-06-02",
		"dept" : "내과",
		"pname" : "박씨",
		"number" : "456",
		"doctor" : "박의사"
	}, {
		"reservedate" : "2020-06-03",
		"dept" : "외과",
		"pname" : "이씨",
		"number" : "789",
		"doctor" : "김의사"
	}, {
		"reservedate" : "2020-06-04",
		"dept" : "정신과",
		"pname" : "정씨",
		"number" : "1111",
		"doctor" : "정의사"
	}, {
		"reservedate" : "2020-06-05",
		"dept" : "어쩌구과",
		"pname" : "송씨",
		"number" : "222",
		"doctor" : "박의사"
	} ];
	$("#res_list").bootstrapTable({
		data : mydata
	});
	$("#res_list").bootstrapTable('hideLoading');
};

function test2() {
	var requestURL = './p.json';
	var request = new XMLHttpRequest();
	request.open('GET', requestURL);
	request.responseType = 'json';
	request.send();
	request.onload = function(data) {
		var data = request.response;
		$("#res_list").bootstrapTable({
			data : data
		});
		$("#res_list").bootstrapTable('hideLoading');
	}
}
