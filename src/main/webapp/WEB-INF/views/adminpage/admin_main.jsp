<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갈피표|관리자</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
				[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);
		var options = {
			title : '일일 매출량'
		};
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
	<br>
	<br>
	<h3 data-v-3adb62c9="" style="margin-left: 15%">
		매출 및 회원통계 정보 : <select id="sk" onchange="a(this.value)">
			<option value="age">나이별 통계</option>
			<option value="gender">성별 통계</option>
			<option value="day">일일 매출량</option>
			<option value="week">주간 매출량</option>
			<option value="month">월간 매출량</option>
			<option value="month">월간 매출량</option>
		</select>
	</h3>

	<div id="piechart" style="width: 100%; height: 800px; margin: auto"></div>
</body>
</html>