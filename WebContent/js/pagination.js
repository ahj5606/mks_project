/****************************************************************************
	* 페이지 네이션**
	*/
	function page(click){
		var num = Number($(click).text());
		//alert("가져올 레코드 범위: "+(num-1)+"*페이지당 레코드 수 ~"+num+"*페이지당 레코드 수")
		res_pageGet(num);
	}
	
	function previous(){
		if($("#page_1").text()=="1"){
			alert("이동불가!");
			res_pageGet(Number($("#page_1").text()));//
			$("#page_1").focus();//
		}else{
			alert("이동가능!");
			var fist = Number($("#page_1").text())-3;
			var sec = 0;
			var third = 0;
			if($("#page_2").length){
				sec = Number($("#page_2").text())-3;
			}else{
				sec = fist+1;
			}
			if($("#page_3").length){
				third = Number($("#page_3").text())-3;
			}else{
				third = fist+2;
			}
			$("#p_1").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a>');
			$("#p_2").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_2" onClick="page(this)" >2</a>');
			$("#p_3").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_3" onClick="page(this)" >3</a>');
			$("#page_1").html(fist);
			$("#page_2").html(sec);
			$("#page_3").html(third);
			res_pageGet(third);
			$("#page_3").focus();
		}
	}
	
	function next(data, num){
		var totalSize = Number(data.trim()); 
		var lastNum =0;//가장 마지막 숫자
		if($("#page_3").length){
			lastNum = Number($("#page_3").text());
		}else if($("#page_2").length){
			lastNum = Number($("#page_2").text())
		}else if($("#page_1").length){
			lastNum = Number($("#page_1").text())
		}
		var totalNum = lastNum*num;//현재까지의 갯수가
		alert("totalSize: "+totalSize);
		alert("totalNum: "+totalNum);
		if(totalSize<=totalNum){//총 예약리스트 사이즈보다 크거나 같다면
			alert("이동불가!");
			if($("#page_3").length){
				res_pageGet(Number($("#page_3").text()));
				$("#page_3").focus();
			}else if($("#page_2").length){
				res_pageGet(Number($("#page_2").text()));
				$("#page_2").focus();
			}else if($("#page_1").length){
				res_pageGet(Number($("#page_1").text()));
				$("#page_1").focus();
			}
		}else{
			var mok = Math.ceil(totalSize/num);
			var fist = Number($("#page_1").text())+3;
			var sec = Number($("#page_2").text())+3;
			var third = Number($("#page_3").text())+3;
			$("#p_1").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a>');
			$("#p_2").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_2" onClick="page(this)" >2</a>');
			$("#p_3").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_3" onClick="page(this)" >3</a>');
			$("#page_1").text(fist+"");
			$("#page_2").text(sec+"");
			$("#page_3").text(third+"");
			if(mok<third){
				$("#page_3").remove();
				if(mok<sec){
					$("#page_2").remove();
					if(mok<fist){
						$("#page_1").remove();
					}
				}
			}
			res_pageGet(fist);
			$("#page_1").focus();
		} 
	}