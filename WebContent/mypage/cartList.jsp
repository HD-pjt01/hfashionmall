<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>

<script type="text/javascript">
function click() {
	System.out.println("delete 실행");
}
</script>
<article>
	<h2>Cart List</h2>
	<form name="formm" method="post">
		<c:choose>
			<c:when test="${cartList.size() == 0}">
				<h3 style="color: red; text-align: center;">장바구니가 비었습니다.</h3>
			</c:when>
			<c:otherwise>
				<table id="cartList">
					<tr>
						<th width=400>상품명</th>
						<th width=200>수 량</th>
						<th width=200>가 격</th>
						<th width=200>주문일</th>
						<th width=100><input type="checkbox" name="allCheck" onclick="allChk()"></th>
					</tr>

					<c:forEach items="${cartList}" var="cartVO">
						<tr>
							<td width=400>
								<!-- url 넘겨줄 때 product_code로 통일!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --> <a style="text-decoration: none" href="hfashionmallServlet?command=product_detail&product_code=${cartVO.product_product_code}">
									<h3>${cartVO.pname}</h3>
							</a>
							</td>
							<td width=200>${cartVO.product_count}</td>
							<td width=200><fmt:formatNumber value="${cartVO.product_price*cartVO.product_count}" type="currency" /></td>
							<td width=200><fmt:formatDate value="${cartVO.cart_register}" type="date" /></td>
							
							<td width=100><input type="checkbox" name="cart_id" value="${cartVO.cart_id}"></td>
						</tr>
					</c:forEach>

					<tr>
						<th colspan="2">총 액</th>
						<th colspan="2"><fmt:formatNumber value="${totalPrice}" type="currency" />
							<br></th>
						<th><a href="#" onclick="go_cart_delete()"><h3>삭제하기</h3></a></th>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>


		<div id="buttons">
			<input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='hfashionmallServlet?command=index'">

			<c:if test="${cartList.size() != 0}">
				<input type="button" value="주문하기" class="submit" onclick="go_order_insert()">
			</c:if>
		</div>
	</form>

</article>
<%@ include file="../footer.jsp"%>