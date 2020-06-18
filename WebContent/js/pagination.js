function page(click){
	var num = Number($(click).text());
	//alert(num);
	//alert("가져올 레코드 범위: "+(num-1)+"*페이지당 레코드 수 ~"+num+"*페이지당 레코드 수")
	res_pageGet(num);
}
function pageMove(click){
	//총 예약리스트 사이즈 가져오기
	//var totalSize;
	var imsi = $(click).children(".sr-only").text();
	if(imsi=="Previous"){
		if($("#page_1").text()=="1"){
			alert("이동불가!");
		}else{
			var fist = Number($("#page_1").text())-3;
			var sec = Number($("#page_2").text())-3;
			var third = Number($("#page_3").text())-3;
			$("#page_1").html(fist);
			$("#page_2").html(sec);
			$("#page_3").html(third);
			res_pageGet(fist);
		}
	}else if(imsi=="Next"){
		if(false){//총 예약리스트 사이즈가 마지막 숫자보다 크지 않다면!
			alert("이동불가!");
		}else{
			var fist = Number($("#page_1").text())+3;
			var sec = Number($("#page_2").text())+3;
			var third = Number($("#page_3").text())+3;
			$("#page_1").text(fist+"");
			$("#page_2").text(sec+"");
			$("#page_3").text(third+"");
			res_pageGet(fist);
		}
	}
}