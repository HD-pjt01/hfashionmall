<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<div class="favor-item-box" id="favor-item-box">
	<div class="favor-prd-list" id="favor-prd-list">

		<c:forEach items="${productBrandList}"  var="productVO">

		<div class="favor-prd-box" id="item">

			<a href="hfashionmallServlet?command=product_detail&product_code=${productVO.product_code}"/><img src="product_images/BRAND/
			${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_01.jpg" 
			style="width:200px; height:200px;" />
			</a>

			<ul class="favor-prd-item">
				<!-- 상품이미지 -->
				<li class="prd-item-brand">${productVO.product_brand}</li>
				<!-- 제조사 -->
				<li class="prd-item-name">${productVO.product_name}</li>
				<!-- 상품명 -->
				<li class="prd-item-price"><fmt:formatNumber value="${productVO.product_price}" type="number" /></li>
				<!-- 가격 -->
				<!-- <li class="prd-item-soldCount">${product.soldCount}개구매중</li> -->
				<!-- 판매량 default = 0 -->
			</ul>
		</div>
	</c:forEach>
	</div>
</div>   
   <div class="clear"></div>
<%@ include file="../footer.jsp" %>      