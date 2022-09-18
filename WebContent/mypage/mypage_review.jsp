<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="container">
	<!-- 요약창 부분 -->
	<div id="mypage_summ">
		<ul id="mypage_summ_ul">
			<li id="summ_first">
				<div class="top">
					<span id="name" class="bold">${sessionScope.loginUser.member_name}</span>
					<span id="name_top" class="text">님</span>
				</div>
				<div class="bottom">
					<span id="name_bottom" class="text">환영합니다.</span>
				</div>
			</li>
			<li id="summ_last">
				<div class="top">
					<span id="del_top" class="text">배송중인 주문</span>
				</div>
				<div class="bottom">
					<!-- 진행중인 주문 리스트와 개수 -->
					<span id="del" class="bold"><a href="#">10</a></span> <span
						id="del_bottom" class="text">건</span>
				</div>
			</li>
		</ul>
	</div>





	<!-- <script>
	const pointer_tr = document.getElementsByClassName('pointer_tr');
	const rateField = document.getElementsByClassName('rateField');

	document.getElementsByClassName('reviewWrite_tr').addEventListener('click', function() {
		/* rateField.classList.toggle('view_hide'); */
		alert('hi');
	});
</script> -->

	<!-- <style>
.view_hide {
	display: none;
} 
</style>-->

	<article>
		<h2>My Page(${title})</h2>


		<table id="cartList">
			<tr>
				<th>주문일자</th>
				<th>상품명</th>
				<th>결제 금액</th>
			</tr>
			<c:forEach items="${orderList}" var="orderVO">
				<!-- 이 리스트를 선택하면 리뷰 창이 생성 -->
				<tr class="reviewWrite_tr" id="reviewWrite">
					<td><fmt:formatDate value="${orderVO.order_register}"
							type="date" /></td>
					<td>${orderVO.pname}</td>
					<td><fmt:formatNumber value="${orderVO.price}" type="currency" /></td>
				</tr>
				<!-- 작성칸 -->
				<tr>
					<td id="id1" class="rateField view_hide" colspan="5">
						<%-- 별점 할 때 사용					
							<div class="rate_star_wrapper">
							<%
								for (int i = 0; i < 5; i++) {
							%>
							<input type="radio" class="rate_star"
								id="rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%>" name="r_rate"
								value="<%=i + 1%>">

							<script>
											const rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%> = document.getElementById('rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%>');
							</script>

							<label for="rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%>"
								id="lable_star<%=i + 1%>_<%=o_index%>_<%=p_code%>"> <i
								class="nStar far fa-star"></i>
							</label>
							<%
								}
							%>
							<input type="hidden" name="o_index" value="<%=o_index%>">
							<input type="hidden" name="p_code" value="<%=p_code%>"> <input
								type="hidden" name="id" value="<%=id%>">
						</div> --%>

						<div class="r_content_wrapper">
							<form name="review" id="review" method="post"
								action="hfashionmallServlet?command=review_write&od_id=${orderVO.order_detail_id}">
								<textarea name="r_content" id="reviewText" style="resize: none;"></textarea>
								<input type="hidden" name="od_id"
									value="${orderVO.order_detail_id}">
								<!-- 여기서 서블렛으로 od_id값을 넘겨줌 -->
							</form>
						</div> <%-- 							<script>
										const reviewText_<%=o_index%>_<%=p_code%> = document.getElementById('reviewText_<%=o_index%>_<%=p_code%>
								');
							</script> --%>

						<button type="submit" form="review">작성</button>

					</td>

				</tr>
				<!-- 작성칸 -->

			</c:forEach>
		</table>

		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="쇼핑 계속하기" class="cancel"
				onclick="location.href='hfashionmallServlet?command=index'">
		</div>

	</article>
</div>
<%@ include file="../footer.jsp"%>