<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosa.dto.Calendar"%>
<%@page import="kr.or.kosa.dao.CalendarDao"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- fullcalendar css -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<!-- fullcalendar 언어 설정관련 script -->
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	<style type="text/css">
		.hide{
			display:none;
		}
		.calendarPopup{
			position: relative;
			width:180px;
			height:150px;
			background-color:#d5caff;
			position: absolute;
			z-index: 1;
			border: solid 3px black;
			border-radius: 12px;
		}
		#calendar{
			width: 100%;
			height:100%;
		}
		.calendarPopup .closebtn{
			position: absolute;
			top: 5px;
			left:87%;
		}
		.calendarPopup button{
			margin-left:3px;
		}
		.calendarPopup input{
			background-color:white;
		}
		.calendarPopup p{
			margin-top: 5px;
			margin-bottom: 5px;
		}
	</style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
	<div id='calendar'></div>
	<div class='hide calendarPopup' id="test">
		<div style="padding:5px">
			<button class="closebtn" id="addclosebtn"><i class="fa fa-close"></i></button>
			<p>Content:<input type="text" id="title"></p>
			<p>start:<input type="date" id="startdate" value=""></p>
			<p>end:<input type="date" id="enddate"></p>
			<p><button id="popupbutton" class="btn btn-light">추가하기</button></p>
		</div>
	</div>
	<div class='hide calendarPopup' id="updatetest">
		<div style="padding:5px">
			<button class="closebtn" id="updateclosebtn"><i class="fa fa-close"></i></button>
			<input type="hidden" id="updateid">
			<p><span>title:</span><input type="text" id="updatetitle"></p>
			<p>start:<input type="date" id="updatestartdate"></p>
			<p>end:<input type="date" id="updateenddate"></p>
			<p><button id="updatepopupbutton" class="btn btn-light">수정하기</button>
			<button id="deletepopupbutton"class="btn btn-light">삭제하기</button></p>
		</div>
	</div>
	<hr>

	
</body>
<!-- 페이지로드 , 일정추가 , 창닫기 , Date Format 함수 있는 스크립트 -->
<script type="text/javascript">
//페이지로드 - FullCalendar 생성 area
	//document.addEventListener('DOMContentLoaded', function() {
		// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
		let calendarEl = document.getElementById('calendar');
		let calendarOption = {
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				headerToolbar : { // 헤더에 표시할 툴 바
					start : 'prev next today',
					center : 'title',
					end : 'dayGridMonth,dayGridWeek,dayGridDay'
				},
				titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
				},
				initialDate: new Date(), // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				events:[
		            <c:forEach var="items" items="${requestScope.calendarList}" varStatus="status">
	                {
	                	id:'${items.calendar_no}',
	                    title: '${items.calendar_content}',
	                    start: new Date(dateFormat(new Date('${items.calendar_start}'))),
	                    end: new Date(dateFormat(new Date('${items.calendar_end}'))),
	                    color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
	                },
	            </c:forEach>

				],
				dateClick:function(event){
					$('#test #startdate').val(event.dateStr);
					$('#test #enddate').val();
					$('#test').toggleClass('hide');
					$('#test').css('top',event.jsEvent.y);
					$('#test').css('left',event.jsEvent.x);
				},
				eventClick:function(event){ //일정 클릭할 때 생기는 이벤트
					$('#updatetest').toggleClass('hide');
					$('#updatetest').css('top',event.jsEvent.y);
					$('#updatetest').css('left',event.jsEvent.x);

					$('#updateid').val(event.event._def.publicId);
					$('#updatetitle').val(event.event.title);
					$('#updatestartdate').val(dateFormat(new Date(event.event.start)));
					$('#updateenddate').val(dateFormat(new Date(event.event.end)));
				},
				nowIndicator: true, // 현재 시간 마크
				locale: 'ko' // 한국어 설정
			}; //option end
		var calendar = new FullCalendar.Calendar(calendarEl, calendarOption);
		console.log(calendarOption.events);
		calendar.render();
//페이지로드 - FullCalendar 생성 area end
	//}) //onload end

	//FullCalendar 재시작 함수
	function reload(type){
		//success ajax start
		$.ajax({
			"url":"calendarall.do?qlehdrl=qlehdrl",
			type:"post",
			dataType:"json",
			success:function(result){
				console.log(result);
				calendarOption.events.length = 0;
				for(let c of result.calendar){//for start
					let calendarobj = {
							"id":c.no,
							"title":c.content,
							"start":new Date(dateFormat(new Date(c.start))),
							"end":new Date(dateFormat(new Date(c.end))),
							color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
					};
					calendarOption.events.push(calendarobj); //캘린더 일정들 설정
					if(type == 'add'){
						calendarOption.initialDate = new Date(dateFormat(new Date($('#startdate').val()))); //캘린더 시작 화면 설정
					} else {
						calendarOption.initialDate = new Date(dateFormat(new Date($('#updatestartdate').val()))); //캘린더 시작 화면 설정
					}
					var calendar = new FullCalendar.Calendar(calendarEl, calendarOption); //캘린더 객체 생성
					calendar.render(); //다시 랜더하기
				}//for end
			},//success end
			error:function(error){
				alert("일정 추가 처리 에러");
			}
		});
	//ajax end
	}
//	일정 추가 함수 start
	$('#popupbutton').on({
		click:()=>{
			if($('#title').val() == "" || $('#title').val() == null){
				swal('일정내용을 입력하세요');
				return;
			}
			if($('#enddate').val() == null || $('#enddate').val() ==""){
				swal("끝 날짜를 입력하세요");
				return;
			}
			//ajax start
			$.ajax({
				"url":"calendarAdd.do",
				type:"post",
				dataType:"text",
				data :{
					"calendar_start" : $('#startdate').val(),
					"calendar_end" : $('#enddate').val(),
					"calendar_content" : $('#title').val()
				},
				success : function(result){
					console.log(result);
					if(result == 1){ // 일정 추가 성공
						swal("SUCCESS", "일정 추가 성공!", "success");
						reload('add');
						$('#test').toggleClass('hide');
					} else { //일정 추가 실패
						swal("FAIL...", "일정 추가 실패...", "warning");
					}
				},
				error:function(result){
					swal("FAIL...", "일정 추가 오류...", "error");
				}
			}); 
			//ajax end
		}
	});//	일정 추가 함수 end
// Date Format 함수 start
	function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day;
}
// Date Format 함수 end
// 일정 추가, 수정, 삭제 창 닫기 함수
$('#updateclosebtn').click(function(){
	$('#updatetest').toggleClass('hide');
})
$('#addclosebtn').click(function(){
	$('#test').toggleClass('hide');
})
//<!-- 수정, 업데이트 비동기 함수 만들 곳 -->
// = = = 수정하기 버튼 = = =
	$('#updatepopupbutton').on({
		click:function(){
			$.ajax({
				url:"calendarEdit.do",
				type:"post",
				data:{
					"calendar_no":$('#updateid').val(),
					"calendar_start":$('#updatestartdate').val(),
					"calendar_end":$('#updateenddate').val(),
					"calendar_content":$('#updatetitle').val(),
					"calendar_status":"0"
				},
				dataType:"text",
				success:function(event){
					console.log(event);
					if(event == "0"){ //일정번호가 잘못 되었을 겅유
						console.log("일정번호를 입력해주세요");
						swal("FAIL...", "일정번호를 입력해주세요...", "warning");
					} else if (event == "1"){ //수정하려는 캘린더가 없을 경우
						console.log("없는 일정 입니다.");
						swal("FAIL...", "없는 일정 입니다...", "warning");
					} else if (event == "2"){ //수정 성공
						console.log("일정 수정 성공");
						swal("SUCCESS!", "일정 수정 성공!", "success");
						reload('update');
					} else if (event == "3"){ //수정 실패
						console.log("일정 수정 실패");
						swal("FAIL...", "일정 수정 실패...", "error");
					} else if (event == "4"){ //에러 ( 실패 )
						console.log("일정 수정 에러");
						swal("ERROR...", "일정 수정 에러...", "error");
					}
					$('#updatetest').toggleClass('hide');
				},
				error:function(error){
					console.log("일정 수정 에러");
					swal("ERROR...", "일정 수정 에러...", "error");
				}
			});
		}
	});
// = = = 삭제하기 버튼 = = = 
$('#deletepopupbutton').on({
			click:function(){
				$.ajax({
					url:"calendarDelete.do",
					type:"post",
					data:{
						"calendar_no":$('#updateid').val()
					},
					dataType:"text",
					success:function(event){
						console.log(event);
						if(event == "0"){ //일정번호가 잘못 되었을 겅유
							console.log("일정번호를 입력해주세요");
							swal("FAIL...", "일정번호를 입력해주세요...", "warning");
						} else if (event == "1"){ //삭제 성공
							console.log("일정 삭제 성공");
							swal("SUCCESS!", "일정 삭제 성공!", "success");
							reload('update');
						} else if (event == "2"){ //삭제 실패
							console.log("일정 삭제 실패");
							swal("FAIL...", "일정 삭제 실패...", "error");
						} else if (event == "3"){ //삭제 실패
							console.log("일정 삭제 오류");
							swal("FAIL...", "일정 삭제 실패...", "error");
						} //if - else if end
						$('#updatetest').toggleClass('hide');
					}, //success end
					error:function(error){
						console.log("일정 삭제 에러");
						swal("ERROR...", "일정 삭제 에러...", "error");
					} //error end
				});//ajax end
			} //click function end
		}); //on end
	
</script>

</html>