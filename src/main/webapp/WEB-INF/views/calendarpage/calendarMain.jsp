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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
			width:200px;
			height:200px;
			background-color:#a389ff;
			position: absolute;
			z-index: 1;
		}
	</style>
</head>
<body>
	<div id='calendar'></div>
	<div class='hide calendarPopup' id="test">
		<div style="padding:5px">
			<p>title:<input type="text" id="title"></p>
			<p>start:<input type="date" id="startdate"></p>
			<p>end:<input type="date" id="enddate"></p>
			<p><button id="popupbutton">추가하기</button></p>
		</div>
	</div>
	<hr>

	
</body>
<script type="text/javascript">
	console.log("썅놈아~");
	document.addEventListener('DOMContentLoaded', function() {
		
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
				//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				events:[
					//TODO:ajax로 db내용을 불러올시 textcolor등은 존재하지않음 .. 이걸 어떻게 처리할까?
					 <%List<Calendar> calendarList = (List<Calendar>) request.getAttribute("calendarList");%>
			            <%if (calendarList != null) {%>
			            <%for (Calendar vo : calendarList) {%>
			            {
			            	title : '<%=vo.getCalendar_content()%>',
			                start : '<%=vo.getCalendar_start()%>',
			                end : '<%=vo.getCalendar_end()%>',
			                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
			             },
				<%}
			}%>
				],
				dateClick:function(event){
					$('#test').toggleClass('hide');
					$('#test').css('top',event.jsEvent.y);
					$('#test').css('left',event.jsEvent.x);
					console.log(event);
					console.log(event.jsEvent.pageY);
					console.log(event.jsEvent.pageX);
				},
				eventClick:function(event){
					console.log(event);
				},
				nowIndicator: true, // 현재 시간 마크
				locale: 'ko' // 한국어 설정
			};
		var calendar = new FullCalendar.Calendar(calendarEl, calendarOption);
		console.log(calendarOption.events);
		calendar.render();
		$('#popupbutton').on({
			click:()=>{
				calendarOption.events.push({title:$('#title').val(),
																	start:$('#startdate').val(),
																	end:$('#enddate').val(),
																	backgroundColor:'#333'
																});
			}
		});
	})
</script>
</html>