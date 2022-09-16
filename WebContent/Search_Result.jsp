<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<body>
	<div id="container">
	<section class="content-response">
		<!-- type2 저거를 뺐음 기존 클래스 명은 page-title type2 임 -->
		<!-- <h2 class="page-title type2"> -->
		<c:forEach items="${productSearchList}" var="productVO"
			varStatus="status" begin="1" end="1">
			<h2 class="page-title">검색 결과</h2>
		</c:forEach>
		<div class="wrap-product-list">
			<div class="list-head">
				<div class="list-filter open">
					<div class="filter-layer" id="filterLayer">
						<div class="filter-menu category"></div>
						<div class="cell">
							<div class="select">
								
								<div class="sel-list">
									
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<ul class="product-list" id="productsList">
			<c:forEach items="${productSearchList}" var="productVO">
				<li godno="${productVO.product_code}">
					<!-- 대형 이미지 클래스 product-sp-->
					<figure class="item-box" data-ga-id="${productVO.product_code}"
						data-ga-name="[${productVO.product_brand}] ${productVO.product_name} (${productVO.product_code})"
						data-ga-brand="${productVO.product_brand}"
						data-ga-price="${productVO.product_price}">
						<div class="item-img">
							<div class="img-box">
								<a
									href="hfashionmallServlet?command=product_detail&product_code=${productVO.product_code}">
									<div class="img">
										<img src="product_images/${productVO.product_code}_01.jpg"
											alt="[${productVO.product_code}] ${productVO.product_name} (${productVO.product_code})">
									</div> 
								</a>
							</div>
						</div>
						<figcaption class="item-info">
							<a href="javascript:void(0);"
								onclick="goGodDetail('${productVO.product_code}')">
								<div class="item-brand">${productVO.product_brand}</div>
								<div class="item-name">[${productVO.product_brand}]
									${productVO.product_name} (${productVO.product_code})</div>
								<div class="item-price">
									<span class="price">${productVO.product_price}</span>
									<!-- <del class="regular">${productVO.product_code}</del>
									<span class="percent">41%</span>-->
								</div>
								<div class="item-color">
									<span class="pdColor-" value="">${productVO.product_color}</span>
								</div>
								<div class="item-label">
									<span class="label2">할인</span> <span class="label3">쿠폰</span>
								</div>
							</a>
						</figcaption>
					</figure>
				</li>
			</c:forEach>
		</ul>
		<div class="paging" id="pagingArea">
			<span> <strong title="현재 페이지">1</strong> <a
				href="javascript:void(0)" id="page_2" onclick="movePage('2')">2</a>
				<a href="javascript:void(0)" id="page_3" onclick="movePage('3')">3</a>
				<a href="javascript:void(0)" id="page_4" onclick="movePage('4')">4</a>
				<a href="javascript:void(0)" id="page_5" onclick="movePage('5')">5</a>
				<a href="javascript:void(0)" id="page_6" onclick="movePage('6')">6</a>
			</span>
		</div>
	</section>
	
</div>
</body>
<%@ include file="./footer.jsp"%>