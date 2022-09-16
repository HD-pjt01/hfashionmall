<!-- product 객체 뿌리기  주문하기 누르면 OrderDirectionaction으로 전달
제품 코드, 명, 등록날짜, 등등 전달-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>
	<div id="container">

		<script>
			let dlvspType = "org";
			let isMem = true;
			let checkWpay = false;
			let entrNoNeedFlag = false;
			let aeStplat = false;
			let isWlfrPrtl = false;
			let dlvDisenblYn = "N";
			let orderGiftValidationYn = "Y";
			spinner.show();
		</script>

<form id="order_one" name="order_one" action="hfashionmallServlet?command=order_direct_insert">
	
		<input type="hidden" name="product_code" value="${productVO.product_code}"> 
		<input type="hidden" name="product_count" value="${product_count}">

</form>

		<!--End 실명확인팝업 요청 form ----------------------->
		<form action="hfashionmallServlet?command=order_direct_insert" name="orderDTO" id="orderDTO" method="post">
		
			<input type="hidden" name="myTmyYn" id="myTmyYn" value="N">
			<section class="content-wrap">
			
				<h2 class="page-title">주문서</h2>


				<section>
					<div class="sec-title-box">
						<h3 class="sec-title">주문상품</h3>
					</div>
					<!-- 주문상품 목록 -->
					<div class="order-tbl type-order">
						<!-- head -->
						<div class="head">
							<div class="cell-info">상품정보</div>
							<div class="cell-qt">수량</div>
							<div class="cell-price">결제금액</div>
							<div class="cell-div">배송비</div>
						</div>
						<!-- //head -->


						<!-- body -->
						<div class="body">
							<c:choose>
								<c:when test="${productVO == null}">
									<div class="nodata">
										<p class="txt-nodata">주문 상품이 없습니다.</p>
									</div>
								</c:when>

								<c:otherwise>

									<!-- row -->
									<div class="row">
										<!-- 패키지 명 -->
										<!-- //패키지 명 -->
										<div class="inner">
											<div class="cell-pd">
												<div class="item-img">
													<img src="https://cdn.hfashionmall.com/goods/THBR/22/04/07/GM0122040738612_1_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt="" onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'">
												</div>
												<div class="item-info">
													<div class="item-name">${productVO.product_name}</div>
													<div class="item-opt">
														<span> free size </span>
													</div>
												</div>
											</div>
											<div class="cell-qt">${product_count}</div>
											<div class="cell-price">
												<div class="price">
													<span><span class="num">${productVO.product_price}</span> 원</span>
												</div>
											</div>
										</div>
									</div>
									<!-- //row -->
								</c:otherwise>
							</c:choose>

							<!-- 배송정보 -->
							<div class="cell-dlv">
								<div class="inner">
									<p>
										<span class="sort"> [본사배송]</span> <span class="price" id="deliverySubgrp1-554">무료배송</span> <span class="sub"> 3만원 미만 결제시 <br> 2,500원
										</span>
									</p>
								</div>
							</div>
							<!-- //배송정보 -->

						</div>
						<!-- //body -->

					</div>
					<!-- 입점 판매 상품 안내 -->
					<div id="layerSaleInfo" class="layer-pop" tabindex="0">
						<div class="layer-wrap" tabindex="0">
							<div class="layer-header">
								<h2 class="layer-title">입점 판매 상품 안내</h2>
							</div>
							<div class="layer-container">
								<div class="layer-content sale-info">
									<p class="txt-common">
										입점 판매 상품 구매 시,
										<br>
										아래 내용을 참고해 주시기 바랍니다.
									</p>
									<!-- 2021.03.16 수정 -->
									<ul class="txt-list">
										<li>H패션몰 입점 파트너 상품들은 장바구니에서 [입점 판매 상품]으로 표시됩니다.</li>
										<li>[입점 판매 상품]은 쿠폰 이름에 <span class="pcolor">[입점 상품 전용 쿠폰]이 표기된 쿠폰</span>만 사용 가능합니다. 자사 상품과 함께 주문 시 자사 상품 전용 쿠폰 사용은 가능하나 [입점 판매 상품]은 자동으로 할인에서 제외됩니다. (일부 쿠폰 제외)
										</li>
										<li>할인 적용 제외 자사 전용 쿠폰 예시
											<ul class="txt-list2">
												<li>기간한정, 신데렐라 쿠폰, 룰렛 당첨 쿠폰, 무료배송/교환/반품 쿠폰 등 H패션몰 자사브랜드 전용 쿠폰</li>
											</ul>
										</li>
									</ul>
									<p class="contact-cs">
										입점 판매 상품 관련 궁금하신 내용은 1:1문의 또는 고객센터(1800-5700)로 문의해
										<br>
										주시기 바랍니다.
									</p>
									<!-- //2020.07.29 수정 -->
								</div>
							</div>
							<button type="button" class="btn-layer-close" onclick="layer.close('layerSaleInfo');">닫기</button>
						</div>
					</div>
					<!-- //입점 판매 상품 안내 -->
					<!-- //주문상품 목록 -->
				</section>

				<section>
					<div class="order-cont">
						<!-- 결제 정보 입력 -->

						<div class="payment-input">
							<!-- 배송지 -->
							<input type="hidden" name="ord.cstmrNm" value="박소은"> <input type="hidden" name="product_code" value="${productVO.product_code}"> <input type="hidden" name="product_count" value="${product_count}">
						</div>
						<!-- //결제 정보 입력 -->

						<!-- 최종 결제 정보 -->
						<div class="btn-box">
							<button type="submit" form="order_one" id="btnPayment" class="btn-type2-lg">결제하기</button>
						</div>



					</div>
					<!-- //최종 결제 정보 -->
	</div>
	</section>
	</section>


	<style type="text/css">
.kcpTransDiv {
	filter: alpha(opacity = 10);
	-khtml-opacity: 0.1;
	-moz-opacity: 0.1;
	opacity: 0.1;
	top: 0px;
	left: 0;
	background-color: #000000;
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: 10000;
}
</style>

	<div id="kcp_event_form">
		<form name="KCP_Auth_Hidden">
			<input name="res_cd" value="9992" type="hidden"><input name="res_msg" value="KCP DOMAIN이 아닙니다." type="hidden">
		</form>
	</div>

	</form>
	</div>
</body>
<%@ include file="../footer.jsp"%>
