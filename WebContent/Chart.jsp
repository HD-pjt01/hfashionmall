<%@ include file="./header.jsp"%>

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>

<body>
<div id = "container">
	<canvas id="myChart" width="400" height="400"></canvas>
	<script>
	
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ '~100000', '~200000', '~300000', '~400000', '~500000',
								'500000~' ],
						datasets : [ {
							label : 'Price range',
							data : [ 15, 12, 5, 11, 2, 5 ],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
	</script>
</div>
</body>
<%@ include file="./footer.jsp" %>