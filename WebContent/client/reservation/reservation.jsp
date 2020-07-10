<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.text.ParseException"    %>
<%@ page import ="java.text.SimpleDateFormat"  %>
<%@ page import ="java.util.ArrayList"        %>
<%@ page import ="java.util.Calendar"          %>
<%@ page import ="java.util.Date"              %>
<%@ page import ="java.util.HashMap"           %>
<%@ page import ="java.util.List"              %>
<%@ page import ="java.util.Map"               %>
<%
   String hp_name = null;// 페이지 이동하면서 파라미터로 넘어온 **** 병원이름 
   if( request.getParameter("hp_name")!=null){
      hp_name =  request.getParameter("hp_name");
   }
   
   String dept_code = null;// 페이지 이동하면서 파라미터로 넘어온 **** 부서코드
   if( request.getParameter("dept_code")!=null){
	   dept_code =  request.getParameter("dept_code");
   }
   
   String doc_code = null;//  페이지 이동하면서 파라미터로 넘어온 **** 선택된 의사코드
   if( request.getParameter("doc_code")!=null){
	   doc_code =  request.getParameter("doc_code");
   }
   
   String mem_name = null;// 세션에 저장되어있는 **** 회원이름
   if(session.getAttribute("mem_name")!=null){
      mem_name = (String)session.getAttribute("mem_name");

   }
   String mks_id = null;// 세션에 저장되어있는 **** 회원이름
   if(session.getAttribute("mks_id")!=null){
      mks_id = (String)session.getAttribute("mks_id");

   }
   
   String hp_code = null;// 파라미터로 넘어온 hp_code
   if(request.getParameter("hp_code")!=null){
	   hp_code = request.getParameter("hp_code");

   }
   
   String sch_code = null;// 파라미터로 넘어온 hp_code
   if(request.getParameter("sch_code")!=null){
	   sch_code = request.getParameter("sch_code");
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
<title>예약상세 화면</title>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
	<%@ include file="/common/bootStrap4UI.jsp"%>
	<style type="text/css">
		.container{
		    padding:5px;
		}
		a.navbar-brand{/*네비바 글자 가운데 정렬*/
		    margin: auto;
		}
		.navbar .navbar-brand {
		    color: #F6F6F6;
		    font-family: 'Do Hyeon', sans-serif;
		    font-size: xx-large;
		}
		.navbar .navbar-brand:hover,
		.navbar .navbar-brand:focus {
		    color: #FFFFFF;
		    font-family: 'Do Hyeon', sans-serif;
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
	</style>
	<script type="text/javascript">
	    var total_doc=new Array();
	    var doc_name="";
	    var dept_name ="";
	    var hp_name = '<%=hp_name%>';
	    var hp_code = '<%=hp_code%>';
	    var dept_code ='<%=dept_code%>';
	    var doc_code = '<%=doc_code%>';
	    var sch_time="";
	    var sch_date="";
	    var imsi3="";
	    var imsi3code="";
	    var res_memo="";
	    var sch_code = '<%=sch_code%>';
	   
		function modal_doc_time(va,doc_code2) {
			doc_name=va;
			doc_code=doc_code2;
			$("#doc_name").html(doc_name);
			$("#doc_name").css('color','red');
			time();
			$("#sel_doc").modal('hide');
			$("#calendar").remove();
			$("#cal_space").html("<div id=calendar></div>");
			cal_paint();
			$('select[name=s_doc]').val(doc_code);
			$('.selectpicker').selectpicker('refresh')
		}
		
		function make_reservation() {
			var imsi = document.getElementById("dept_name").innerHTML;
			imsi += "/ "+document.getElementById("doc_name").innerHTML;
			imsi += "/ "+document.getElementById("res_date").innerHTML;
			imsi += "/ "+document.getElementById("sch_time").innerHTML;
			$.ajax({
				url:'/reservation/pro_reservation.crm'
				,method:'post'
				,data:'res_memo='+$("#res_memo").val()+'&sch_code='+sch_code+'&res_time='+$("#sch_time").html()
				,success:function(data) {
					var res = data.trim();
					if(res==0) {
						alert("실패");
					}
					else {
						qr_modal(res);
					}
				}//succseefunction
			});//ajax	
		}
	   
		function qr_modal(qr_code) {
			$("#qr_img").remove();
			$("#qr_space").html("<div class='row' id='qr_img'></div>");
			var qrcode = new QRCode(document.getElementById("qr_img"), {
				text: qr_code+"",
				width: 128,
				height: 128,
				colorDark : "#000000",
				colorLight : "#ffffff",
				correctLevel : QRCode.CorrectLevel.H
			});
			share(qr_code);
			$('#modal_qr').modal('show')
		}
	   
		function share(qr_code) {
			var url = 'http://192.168.0.245:5000/client/qrCodeCreation.jsp?qr_code='+qr_code;
			Kakao.Link.createDefaultButton({
				container: '#kakao-link-btn',
				objectType: 'feed',
				content: {
					title: "mks 코스모 병원",
					description: "예약 qr 코드",
					imageUrl: './health_96630.png',
					link: {
						mobileWebUrl: url,
						androidExecParams: 'test'
					}
				},
				buttons: [
					{
						title: '웹으로 이동',
						link: {
							webUrl: url
						},
					},
					{
						title: '앱으로 이동',
						link: {
							mobileWebUrl: url
						},
					}, 
				],
				success: function(response) {
					console.log(response);
				},
				fail: function(error) {
					console.log(error);
				}
			});
		}
	   
		function time(){
			$('#t_reservationlList').bootstrapTable('refreshOptions', {
				url: '/reservation/calender.crm?hp_code='+'<%=hp_code%>'+'&dept_code='+dept_code+'&sch_date='+sch_date+'&doc_code='+doc_code+'&sch_date='+sch_date 
				,onClickRow : function(row,element,field){
					var jo = JSON.stringify(row);
					var d = JSON.parse(jo);
					sch_time = d.SCH_TIME;
					sch_code=d.SCH_CODE;
					$("#sch_time").html(sch_time);
					$("#sch_time").css('color','red');
				}
			});
			$("div.fixed-table-loading").remove();    
		}
		
		function modal_doc() {
			$.ajax({
				url:'/reservation/calender.crm?hp_code='+'<%=hp_code%>'+'&dept_code='+dept_code+'&doc_code='+doc_code+'&sch_date='+sch_date               
				,success: function (data){
					var res = JSON.parse(data);
					var cnt=0;
					imsi =new Array();
					imsicode =new Array();
					for(var i=0; i<res.length; i++) {       
						total_doc[i]=res[i].DOC_NAME; 	
						if(total_doc[i]==total_doc[i-1]) {
						}
						else {
							doc_name=res[i].DOC_NAME;
							cnt++;			
							imsi +=total_doc[i]+","
							imsicode+=res[i].DOC_CODE+",";
						} 
					}
					var imsi2 = imsi.replace(/,\s*$/, "");
					var imsi2code = imsicode.replace(/,\s*$/, "");
					imsi3=imsi2.split(',');
					imsi3code=imsi2code.split(',');
					if(cnt>1) {
						var data = "";
						for(var i= 0; i<imsi3.length; i++) {
							data += "<tr>";
							data += '<td value="i" onClick="modal_doc_time('+"'"+imsi3[i]+"'"+","+"'"+imsi3code[i]+"'"+')" >'+imsi3[i];
							data += "</td>";
							data += "</tr>";
						};
					$("#data").html(data);	
					$("#sel_doc").modal('show'); 						
					}
					else {
						$("#doc_name").html(doc_name);
						$("#doc_name").css('color','red');
					time();
					}
				}
			});
		}
	 
		function cal_paint() {
			sch_date=null;       	   
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins: [ 'interaction', 'dayGrid' ]
				,defaultView: 'dayGridMonth'
				,selectable: true
				,dateClick: function(info) {
					var day = info.dateStr;
					var imsi = "";
					$.ajax({
						url:'/reservation/calender.crm?hp_code='+'<%=hp_code%>'+'&dept_code='+dept_code+'&doc_code='+doc_code          
						,success: function (data){
							var res = JSON.parse(data);
							for(var i=0; i<res.length; i++){
								sch_date = day;
								if(sch_date==res[i].SCH_DATE){
									$("#res_date").html(sch_date);
									$("#res_date").css('color','red');
								}
							}
							modal_doc();
						}
					});              
				} 
				,dragOpacity: 1
				,events: '/reservation/calender.crm?hp_code='+'<%=hp_code%>'+'&dept_code='+dept_code+'&doc_code='+doc_code+"&mode=1"+'&sch_date='+sch_date 
			});
			calendar.render();
			$("div.fixed-table-loading").remove();
		}
	 
	</script>
</head>
<body>
   <!-- 네이게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#007bff;">
		<a class="navbar-brand" href="#"><%=hp_name%></a>
	</nav>
   <!-- 본문 -->
   <div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:10px;">
        <div class="row mb-3 mt-2">
         <!-- 우측 -->
           <div class="col-md mt-2">
              <!-- 검색 -->
            <div class="row">
               <div class="col-md">
                  <select class="form-control" id="s_doc" name="s_doc">
                  </select>
               </div>
               <div class="col-md-7"></div>
            </div>
              <!-- 날짜테이블 -->
            <div class="row pt-2">
               <div class="col-md" id="cal_space">
                  <div id='calendar'></div>
               </div>
            </div>
              <!-- 예약확인 -->
            <div class="row pt-2">
               <div class="col-md">
                  <div class="card">
                       <h6 class="card-header"><%=mem_name %> 님 예약정보</h6>
                       <div class="card-body py-2">
                        <div class="row my-1">
                           <div class="col-md px-3">
                              <table id="t_my_resevation">
                                 <tr><th style='padding:2px;'>진료과목</th><td id="dept_name" style='padding:2px;'></td></tr>
                                 <tr><th style='padding:2px;'>담당의사</th><td  id="doc_name" style='padding:2px;'></td></tr>
                                 <tr><th style='padding:2px;'>예약날짜</th><td id="res_date" style='padding:2px;'></td></tr>
                                 <tr><th style='padding:2px;'>예약시간</th><td id="sch_time" style='padding:2px;'></td></tr>
                              </table>
                           </div>
                        </div>
                        <div class="row mb-2">
                           <div class="col-md">
                                 <input type="text" class="form-control" id="res_memo" name="res_memo" type="search" placeholder="(선택) 증상을 입력해주세요.">
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-md" style="text-align:right">
                                 <button class="btn btn-dark btn-inline" onClick="make_reservation()">예약하기</button>
                           </div>
                        </div>
                       </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- 좌측 -->
           <div class="col-md mt-2">
              <!-- 예약시간 테이블 -->
            <div class="row">
               <div class="col-md">
                  <div class="table-responsive-md" style="overflow-y: scroll;height:515px;">
                     <table class="table table-hover" id="t_reservationlList" style="text-align:center;" data-toggle="table">
                        <thead class="thead-light">
                           <tr>
                              <th data-field="SCH_TIME">예약가능시간</th>
                           </tr>
                        </thead>
                     </table>
                  </div>   
               </div>
            </div>
            <!-- 안내문구 -->
            <div class="row pt-2 mt-4" style="height:250px;">
               <div class="col-md">
				※ 예약후 미내원시/ 예약시간에서 9분이상 경과시(기존동일)/ 예약시간에서 최소 1시간전까지 취소 안할시 <span style="color:red">자동불이행처리</span>됩니다.<br>
				※ 실제 진료 받을 분으로안하면 <span style="color:red">예약 불이행처리</span>됩니다. 이름이 없으면 개인정보수정에서 등록하시면 됩니다.<br>
				※ 보이지않는 시간은 예약완료입니다. 현재 선택가능한 시간이 예약 할수있는 시간입니다.<br>
				※ 개인정보가 변경된 경우 병원에 연락바랍니다.<br>
				※ <span style="color:red">주의!!! </span>반드시 아래쪽에 예약하기 버튼을 클릭하셔야 예약이 됩니다. 클릭후 예약 정보가 담기 QR코드가 발급됩니다.<br>
				※ <span style="color:red">마스크</span> 착용하고 내원해주세요~<br>
               </div>
            </div>
           </div>
      </div>
   </div>  
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
                  <div class="row" style="justify-content: center" id="qr_space">
                     <div class="row" id="qr_img"></div>
                 </div>
              </div>
              <!-- footer -->
              <div class="modal-footer">
                 <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="self.close();">닫기</button>
                 <button type="button" id="kakao-link-btn" class="btn btn-warning">공유하기</button>
               </div>
          </div>
        </div>
   </div>
   <!-- 전체일경우 의사선택 모달 생성 -->
	<div class="modal fade bd-example-modal-sm" id="sel_doc" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
			<!-- head -->
				<div class="modal-header">
					<h5 class="modal-title">의사 선택하기</h5>
				</div>
			<!-- body -->
				<div class="row" style="justify-content: center">
					<table class="modal-body" id="doc" data-toggle="table">
						<thead class="thead-light">
							<tr>
								<th data-field="doc_sel">의사선택</th>
							</tr>
						</thead>
						<tbody id="data">
						</tbody>
					</table>	
				</div>
			<!-- footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
   
   <!-- 돔 구성이 완료되었을 때 -->
   <script type="text/javascript">
		var doc_code;
		
		$(document).ready(function() {
			$.ajax({
				url:'/reservation/docCategory.crm?hp_code='+'<%=hp_code%>'+"&dept_code="+'<%=dept_code%>'+"&doc_code="+'<%=doc_code%>'+'&sch_date='+sch_date 
				,dataType: 'json'
				,success:function(data){
					var res = JSON.stringify(data);
					var res2 = JSON.parse(res);
					var imsi="";
					in_doc_code="";
					var out_doc_code= "";
					out_doc_code ='<%=doc_code%>';
					dept_name = res2[0].DEPT_NAME;
					dept_code = res2[0].DEPT_CODE;
					<%
						if(doc_code==null){
					%>
							imsi += '<option value="'+dept_code+'">전체</option>';
							for(var i=0; i<res2.length; i++){
								imsi += '<option value="'+res2[i].DOC_CODE+'">'+res2[i].DOC_NAME+'</option>'; 
							}
					<%
						} else {
					%>
							var cnt= 0;
					
							for(var i=0; i<res2.length; i++) {	
								if(out_doc_code==res2[i].DOC_CODE) {
									imsi += '<option value="'+res2[i].DOC_CODE+'">'+res2[i].DOC_NAME+'</option>';  
									imsi += '<option value="'+dept_code+'">전체</option>';
									$("#doc_name").html(res2[i].DOC_NAME);
									$("#doc_name").css('color','red');
								} 
								else {
									cnt++;
								}
							}
							if(cnt==res2.length) {
								imsi += '<option value="'+dept_code+'">전체</option>';
							}    	          
							for(var i=0; i<res2.length; i++) {	
								if(out_doc_code!=res2[i].DOC_CODE) {
									imsi += '<option value="'+res2[i].DOC_CODE+'">'+res2[i].DOC_NAME+'</option>'; 
								}	     	       			  
							}
					<%
						}
					%>
					$("#s_doc").html(imsi);
					$("#dept_name").html(dept_name);
					$("#dept_name").css('color','red');   
					$("#calendar").remove();
					$("#cal_space").html("<div id=calendar></div>");
					cal_paint();
				}
			});
			$("#s_doc").change(function(){
			var val = $("#s_doc option:selected").text();
			if("전체"==val){
				doc_code="";
			}
			else {
				doc_code = this.value;
				doc_name = val;
				$("#doc_name").html(doc_name);
				$("#doc_name").css('color','red');
			}
			$("#calendar").remove();
			$("#cal_space").html("<div id=calendar></div>");
			cal_paint();
			});
		});     
		document.addEventListener('DOMContentLoaded', cal_paint); 
		Kakao.init("265447647e1cb17951a10eb622ba9fbc");
   </script>
</body>
</html>