<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갈피표|관리자</title>
 <!-- Jquery -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <!-- Apexcharts -->
 <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
 <!-- Charts Css -->
 <style type="text/css">
	 @import url('https://fonts.googleapis.com/css?family=Poppins');
	 * {
	 font-family: 'Poppins', sans-serif;
	 }
	 #chart {
	 max-width: 760px;
	 margin: 35px auto;
	 opacity: 0.9;
	 }

	 #timeline-chart .apexcharts-toolbar {
	 opacity: 1;
	 border: 0;
	 }
 </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
	<br>
	<br>
	<h3 data-v-3adb62c9="" style="margin-left: 15%">
		매출 및 회원통계 정보 : <select id="sk" onchange="chart(this.value)">
			<option value="age">연령별 통계</option>
			<option value="gender">성별 통계</option>
			<option value="day">일일 매출량</option>
			<option value="week">주간 매출량</option>
			<option value="month">월간 매출량</option>
			<option value="year">연간 매출량</option>
		</select>
	</h3>
	<div id="graph" ></div>
</body>
<script type="text/javascript">
	let options = {
        series: [
        {
          data: [
            
          ]
        }
		],
			legend: {
			show: false
		},
		chart: {
			type: 'treemap',
			whith : '100%',
			height : '800'
		},
		title: {
			text: $("#sk option:selected").text(),
			align: 'center'
		},
		colors: [
			'#3B93A5',
			'#F7B844',
			'#ADD8C7',
			'#EC3C65',
			'#CDD7B6',
			'#C1F666',
			'#D43F97',
			'#1E5D8C',
			'#421243',
			'#7F94B0',
			'#EF6537',
			'#C0ADDB'
		],
		plotOptions: {
			treemap: {
			distributed: true, //색깔 따로따로?
			enableShades: false //?
			}
		}
		};

		//var chart = new ApexCharts(document.querySelector("#chart"), options);
		//chart.render();
		function chart(value){
			if($("#sk option:selected").val() == "age"){
				$.ajax({
					url : "statisticsAge.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					console.log(data);
					for(let index in data.age){
						let json = { x: data.age[index].NAME , y:data.age[index].VALUE};
						console.log(json);
						options.series[0].data.push(json);
					}//for
					console.log(options)
					let chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "gender"){
				$.ajax({
					url : "statisticsGender.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					console.log(data);
					for(let index in data.genderlist){
						let json = { x: data.age[index].NAME , y:data.age[index].VALUE};
						options.series[0].data.push(json);
					}//for
					let chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "day"){
				$.ajax({
					url : "statisticsDay.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					console.log(data);
					for(let index in data.daily){
						let json = { x: data.daily[index].NAME , y:data.daily[index].VALUE};
						options.series[0].data.push(json);
					}//for
					let chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "week"){
				$.ajax({
					url : "statisticsWeek.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					console.log(data);
					for(let index in data.week){
						let json = { x: data.week[index].NAME , y:data.week[index].VALUE};
						options.series[0].data.push(json);
					}//for
					let chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "month"){
				$.ajax({
					url : "statisticsMonth.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					console.log(data);
					for(let index in data.month){
						let json = { x: data.month[index].NAME , y:data.month[index].VALUE};
						options.series[0].data.push(json);
					}//for
					let chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "year"){
				$.ajax({
					url : "statisticsYear.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					console.log(data);
					for(let index in data.year){
						let json = { x: data.year[index].NAME , y:data.year[index].VALUE};
						options.series[0].data.push(json);
					}//for
					let chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}
		}
		
</script>
</html>