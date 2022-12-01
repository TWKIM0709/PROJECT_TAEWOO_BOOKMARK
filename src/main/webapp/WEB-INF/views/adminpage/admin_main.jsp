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
	<jsp:include page="/WEB-INF/views/utils/include/admintopbackup.jsp"></jsp:include>
	<br>
	<br>
	<h3 data-v-3adb62c9="" style="margin-left: 15%">
		매출 및 회원통계 정보 : <select id="sk" onchange="chartLive(this.value)">
			<option value="age">연령별 통계</option>
			<option value="gender" >성별 통계</option>
			<option value="day">일일 매출량</option>
			<option value="week">주간 매출량</option>
			<option value="month">월간 매출량</option>
			<option value="year">연간 매출량</option>
		</select>
	</h3>
	<div id="graph" style="margin-left : 10%" ></div>
	<div id="graph2" style="margin-left : 10%" ></div>
</body>
<script type="text/javascript">
let chart;
	let options = {
        series: [
        {
       	  name: "명",
          data: []
        }
		],
			legend: {
			show: false
		},
		chart: {
			type: 'bar',
			width : '90%',
			height : '750'
		},
		title: {
			text: $("#sk option:checked").text(),
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
			bar: {
			distributed: true, //색깔 따로따로?
			enableShades: false //?
			}
		}
		};
	
	let options2 = {
			series : [{
				
			}],
			chart : {
				type: 'pie',
				width : '90%',
				height : '750'
			},
			labels : [],
			responsive : [{
				breakpoint : 480,
				options : {
					chart : {
						width : 200
					},
					legend : {
						position : 'bottom'
					}
				}
			}]
	}

		//var chart = new ApexCharts(document.querySelector("#chart"), options);
		//chart.render();
		function chartLive(value){
			$("#graph").empty();
			chart.destroy();
			if($("#sk option:selected").val() == "age"){
				chart.destroy();
				$.ajax({
					url : "statisticsAge.do",
					dataType:"json",
					success:function(data){
					options2.series.length = 0;
					options2.labels.length = 0;
					for(let index in data.age){
						options2.series.push(data.age[index].VALUE);
						options2.labels.push(data.age[index].NAME);
					}
					chart = new ApexCharts(document.querySelector("#graph"), options2);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "gender"){
				chart.destroy();
				$.ajax({
					url : "statisticsGender.do",
					dataType:"json",
					success:function(data){
						options2.series.length = 0;
						options2.labels.length = 0;
						for(let index in data.STATISTICS){
							options2.series.push(data.STATISTICS[index].VALUE);
							options2.labels.push(data.STATISTICS[index].NAME);
						}//for
						chart = new ApexCharts(document.querySelector("#graph"), options2);
						chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "day"){
				chart.destroy();
				options.title.text = $("#sk option:selected").text();
				options.series[0].name = "원";
				$.ajax({
					url : "statisticsDay.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					for(let index in data.STATISTICS){
						let json = { x: data.STATISTICS[index].NAME , y:data.STATISTICS[index].VALUE};
						options.series[0].data.push(json);
					}//for
					chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "week"){
				chart.destroy();
				options.title.text = $("#sk option:selected").text();
				options.series[0].name = "원";
				$.ajax({
					url : "statisticsWeek.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					for(let index in data.STATISTICS){
						let json = { x: data.STATISTICS[index].NAME , y:data.STATISTICS[index].VALUE};
						options.series[0].data.push(json);
					}//for
					chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "month"){
				chart.destroy();
				options.title.text = $("#sk option:selected").text();
				options.series[0].name = "원";
				$.ajax({
					url : "statisticsMonth.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					for(let index in data.STATISTICS){
						let json = { x: data.STATISTICS[index].NAME , y:data.STATISTICS[index].VALUE};
						options.series[0].data.push(json);
					}//for
					chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}else if($("#sk option:selected").val() == "year"){
				chart.destroy();
				options.title.text = $("#sk option:selected").text();
				options.series[0].name = "원";
				$.ajax({
					url : "statisticsYear.do",
					dataType:"json",
					success:function(data){
					options.series[0].data.length = 0;
					for(let index in data.STATISTICS){
						let json = { x: data.STATISTICS[index].NAME , y:data.STATISTICS[index].VALUE};
						options.series[0].data.push(json);
					}//for
					chart = new ApexCharts(document.querySelector("#graph"), options);
					chart.render();
					} //success
				});
			}
		}
		
		 $(function(){
			 $.ajax({
					url : "statisticsAge.do",
					dataType:"json",
					success:function(data){
					options2.series.length = 0;
					options2.labels.length = 0;
					for(let index in data.age){
						/* let json = { x: data.age[index].NAME + '대' , y:data.age[index].VALUE};
						options.series[0].data.push(json); */
						options2.series.push(data.age[index].VALUE);
						options2.labels.push(data.age[index].NAME);
					}//for
					/* let chart = new ApexCharts(document.querySelector("#graph"), options); */
					chart = new ApexCharts(document.querySelector("#graph"), options2);
					chart.render();
					} //success
				});
		})
</script>
</html>