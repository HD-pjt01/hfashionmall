<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu.jsp"%>

<header>


	<!-- 요약창 부분 -->
	<div id="mypage_summ">
		<ul id="mypage_summ_ul">
			<li id="summ_first">
				<div class="top">
					<span id="name" class="bold">${sessionScope.loginUser.member_name}</span> <span id="name_top" class="text">님</span>
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
					<span id="del" class="bold"><a href="#">10</a></span> <span id="del_bottom" class="text">건</span>
				</div>
			</li>
		</ul>
	</div>


</header>


<article>
	<h2>My Page(${title})</h2>

	<form name="formm" method="post">
		<table id="cartList">
			<tr>
				<th>주문일자</th>

				<th>상품명</th>
				<th>결제 금액</th>
				<th>주문 상세</th>
			</tr>
			<c:forEach items="${orderList}" var="orderVO">
				<tr>
					<td><fmt:formatDate value="${orderVO.order_register}" type="date" /></td>
		
					<td>${orderVO.pname}</td>
					<td><fmt:formatNumber value="${orderVO.price}" type="currency" /></td>
					<td><a href="hfashionmallServlet?command=order_detail&order_id=${orderVO.order_id}"> 조회 </a></td>
				</tr>
			</c:forEach>
		</table>

		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='hfashionmallServlet?command=index'">
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>
