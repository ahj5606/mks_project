<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object parameter = session.getAttribute("mks_id");
	String mks_id = null;
	if(parameter!=null){
		mks_id = (String)parameter;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>내 정보</title>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
	.container{
		padding:5px;
	}
	footer {
		left: 0;
		bottom: 0;
		width: 100%;
		overflow-x:hidden;
		text-align: center;
		font-family:'Do Hyeon';
		margin-top:30px;
	}
	body{
	  	font-family: 'Do Hyeon', sans-serif;
	}
	a.page-link{
		color:#4C4C4C;
	}
</style>
<script type="text/javascript">
	var mks_id = '<%=mks_id%>'
	var checkNum1 =0;
	var checkNum2 =0;
	var doc_name = "";
	function res_pageGet(num){
		$('#t_myReList').bootstrapTable('refreshOptions', {
	          url: "/mypage/mypageList.crm?num="+num+"&mks_id="+mks_id+"&doc_name="+doc_name+"&now="+checkNum1+"&pre="+checkNum2
		});
		$("div.fixed-table-loading").remove();
	}
	function pageMove(click){
		var imsi = $(click).children(".sr-only").text();
		if(imsi=="Previous"){
			previous();
		}else if(imsi=="Next"){
			$.ajax({
				url: "/mypage/mypageList.crm?num=0&mks_id="+mks_id+"&doc_name="+doc_name+"&now="+checkNum1+"&pre="+checkNum2
				,dataType: "text"
				,success: function(data){
					next(data, 5);
				}
			});
		}
	}
	function page_btn(){
		$.ajax({
			url: "/mypage/mypageList.crm?num=0&mks_id="+mks_id+"&doc_name="+doc_name+"&now="+checkNum1+"&pre="+checkNum2
			,dataType: "text"
			,success: function(data){
				var totalSize = Number(data.trim()); 
				var mok = Math.ceil(totalSize/5);
				alert("page_btn*mok: "+mok);
				$("#p_1").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a>');
				$("#p_2").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_2" onClick="page(this)" >2</a>');
				$("#p_3").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_3" onClick="page(this)" >3</a>');
				if(mok<3){
					$("#page_3").remove();
					if(mok<2){
						$("#page_2").remove();
						if(mok<1){
							$("#page_1").remove();
						}
					}
				}
			}
		});
		$("#page_1").focus();
	}
	function search_doc_name(){
		doc_name = $("#doc_name").val();
		 $('#t_myReList').bootstrapTable('refreshOptions', {
			 url: "/mypage/mypageList.crm?num=1&mks_id="+mks_id+"&doc_name="+doc_name+"&now="+checkNum1+"&pre="+checkNum2
    	 });
     	page_btn();
     	$("div.fixed-table-loading").remove(); 
	}
	 function qr_popup(sch_code){//예약 정보 qr코드 생성 **************************************************
	      var qrcode = new QRCode(document.getElementById("qr_img"), {
	         text: sch_code+""
	         width: 128,
	         height: 128,
	         colorDark : "#000000",
	         colorLight : "#ffffff",
	         correctLevel : QRCode.CorrectLevel.H
	      });
	      $('#modal_qr').modal('show')
	   }
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
	  	<div class="row pt-4">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">내 정보</label>
					</div>
				</div>
				<hr>
				<!-- 메뉴 버튼 -->
				<div class="row mb-0 mt-3  ml-2">
					<button class="btn btn-md" 
							style="font-size:large;color:#F6F6F6;background-color:#007bff;" 
									onClick="location.href='./myReservationList.jsp'">예약목록</button>
					<button class="btn btn-md" 
							style="font-size:large;color:#353535;background-color:#EAEAEA;" 
									onClick="location.href='./pwInput.jsp'">개인정보</button>
				</div>
				<!-- 내용 -->
				<div class="border mb-0 mt-0">
					<div class="row mt-3 pl-4 pb-2">
		            	<div class="col">
			           		<small id="loginFail" class="text-primary">※ 해당 예약 목록을 클릭하면 qr코드를 확인할 수 있습니다.</small>
		            	</div>
		            </div>
					<!-- 의사 이름 검색 -->
		            <div class="row pt-2 px-4 mt-0 pb-0 mb-2">
		                <div class="col-md pr-2 mr-2">
		                   <div class="form-group row">
		                      <div class="col-md">
		                           <div class="input-group">
		                               <input type="text" class="form-control" id="doc_name" name="doc_name" type="search" placeholder="Ex) 고길동">
		                               <div class="input-group-prepend">
		                                  <button class="btn btn-dark btn-block" onClick="search_doc_name()">이름검색</button>
		                               </div>
		                           </div>
		                      </div>
		                      <div class="col-md-7"></div>
		                    </div>
		                  </div>
		            </div>
					<!-- 지난 현재 예약 선택 -->
		            <div class="row pl-4 py-0">
		               <label class="form-check-label ml-4" for="exampleCheck1">기준선택 &nbsp;&nbsp;&nbsp;&nbsp;:</label>
		               <div class="form-check ml-4">
		                   <input class="form-check-input" type="checkbox" value="now" id="check1">
		                   <label class="form-check-label" for="timeCheck1">현재 예약</label>
		               </div>
		               <div class="form-check ml-4">
		                   <input class="form-check-input" type="checkbox" value="pre" id="check2">
		                   <label class="form-check-label" for="timeCheck2">지난 예약</label>
		               </div>
		            </div> 
					<!-- 예약 목록 -->
					<div class="row mx-2">
						<div class="col">
							<div class="container mb-0 my-4">
								<div class="table-responsive-md">
									<table class="table" id="t_myReList" data-toggle="table">
										<thead class="thead-light">
											<tr>
												<th data-field="HP_NAME">병원이름</th>
												<th data-field="DEPT_NAME">진료과</th>
												<th data-field="DOC_NAME">담당의</th>
												<th data-field="SCH_DATE">날짜</th>
												<th data-field="RES_TIME">시간</th>
												<th data-field="SCH_CODE">예약코드</th>
												<th class="d-none" data-field="SCH_CODE">예약코드</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<!-- 페이지네이션 -->
							<div class="row mb-4">
								<div class="col-md">
									<ul class="pagination pagination-small justify-content-center mb-0">
										<li class="page-item">
											<a class="page-link py-1 px-2 my-1 mr-1" href="#" onClick="pageMove(this)" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
											</a>
										</li>
										<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a></li>
										<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_2"  onClick="page(this)" >2</a></li>
										<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_3"  onClick="page(this)" >3</a></li>
										<li class="page-item mr-1">
											<a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
												<span class="sr-only">Next</span>
											</a>
										</li>
									</ul>
								</div>
							</div><!-- 페이지네이션 끝 -->
						</div>
					</div><!-- 예약 목록 -->
				</div><!-- 내용 끝 -->
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
	
	<!-- qr 모달 -->
   <div class="modal fade bd-example-modal-sm" id="modal_qr" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <!-- head -->
               <div class="modal-header">
                 <h5 class="modal-title">예약 qr코드</h5>
               </div>
               <!-- body -->
               <div class="modal-body">
                  <div class="row" style="justify-content: center">
                     <div class="row" id="qr_img"></div>
                 </div>
              </div>
              <!-- footer -->
              <div class="modal-footer">
                 <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="self.close();">닫기</button>
               </div>
          </div>
        </div>
   </div>
	
	<!-- 돔 구성이 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#t_myReList').bootstrapTable('refreshOptions', {
		          url: "/mypage/mypageList.crm?num=1&mks_id="+mks_id
		         ,onClickRow : function(row,element,field){
		        	 qr_popup(row.SCH_CODE);
		         }
			});
			page_btn();
			$("div.fixed-table-loading").remove();
			$("#check1").on('click', function(){
				checkNum1 ++;
	     		search_doc_name();
     		})
     		$("#check2").on('click', function(){
	     		checkNum2 ++;
	     		search_doc_name()
     		})
		});
	</script>
</body>
</html>