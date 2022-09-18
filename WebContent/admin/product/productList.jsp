<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>

<article>
	<h1>상품리스트</h1>
	<form name="frm" method="post">
		<table>
			<tr>
				<td width="642">상품명 <input type="text" name="key"> <input
					class="btn" type="button" name="btn_search" value="검색"
					onClick="go_search()"> <input class="btn" type="button"
					name="btn_total" value="전체보기 " onClick="go_total()"> <input
					class="btn" type="button" name="btn_write" value="상품등록"
					onClick="go_wrt()">
				</td>
			</tr>
		</table>
		<table id="productList">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>상품브랜드</th>
				<th>상품카테고리</th>
				<th>상품재고량</th>
				<th>상품등록일</th>
			</tr>
			<c:choose>
				<c:when test="${productListSize<=0}">
					<tr>
						<td width="100%" colspan="7" align="center" height="23">등록된
							상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${productList}" var="productVO">
						<tr>
							<td height="23" align="center">${productVO.product_code}</td>
							<td
								style="text-align: left; padding-left: 50px; padding-right: 0px;">
								<a href="#" onClick="go_detail('${tpage}', '${productVO.product_code}')">
									${productVO.product_name} </a>
							</td>
							<td><fmt:formatNumber value="${productVO.product_price}" /></td>
							<td height="23" align="center">${productVO.product_brand}</td>
							<td height="23" align="center">${productVO.product_category}</td>
							<td height="23" align="center">${productVO.product_quantity}</td>
							<td><fmt:formatDate value="${productVO.product_register}" /></td>
							<%-- <td><c:choose>
									<c:when test='${productVO.useyn=="1"}'>미사용</c:when>
									<c:otherwise>사용</c:otherwise>
								</c:choose></td>
							--%>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6" style="text-align: center;">${paging}</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
</article>
<%@ include file="../../footer.jsp"%>
</body>
</html>