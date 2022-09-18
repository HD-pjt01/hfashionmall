<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var good = $('#good').val();
		var bad = $('#bad').val();
		var proposal = $('#proposal').val();
		var etc = $('#etc').val();
		var context = document.getElementById('qna_chart').getContext('2d');
		var myChart = new Chart(context, {
			type : 'pie', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : [
				//x 축
				'칭찬', '불만', '제안', '기타' ],
				datasets : [ { //데이터
					label : 'QNA 종류 별 통계', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ good, bad, proposal, etc //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상
					'rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)',
							'rgba(255, 206, 86, 0.8)' ],
					borderColor : [
					//경계선 색상
					'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)' ],
					borderWidth : 1
				//경계선 굵기
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>
	<div class="chart">
		<!--차트가 그려질 부분-->
		<canvas id="qna_chart">
                  <c:forEach var="chartVO" items="${chartList}">
                     <c:if test="${chartVO.qna_type == 0}">
                        <input type="hidden" name="good" id="good"
						value="${chartVO.cnt}" />
                     </c:if>
                     <c:if test="${chartVO.qna_type == 1}">
                        <input name="bad" id="bad"
						value="${chartVO.cnt}" />
                     </c:if>
                     <c:if test="${chartVO.qna_type == 2}">
                        <input type="hidden" name="proposal"
						id="proposal" value="${chartVO.cnt}" />
                     </c:if>
                     <c:if test="${chartVO.qna_type == 3}">
                        <input type="hidden" name="etc" id="etc"
						value="${chartVO.cnt}" />
                     </c:if>
                  </c:forEach>
                  </canvas>
	</div>
</body>
</html>