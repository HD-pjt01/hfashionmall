<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>
	<div id="container">

		<!--End 실명확인팝업 요청 form ----------------------->
		<form action="approve" name="orderDTO" id="orderDTO" method="post">
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
								<c:when test="${cartList.size() == 0}">
									<div class="nodata">
										<p class="txt-nodata">장바구니에 담긴 상품이 없습니다.</p>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${cartList}" var="cartVO">
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

														<div class="item-name">${cartVO.pname}</div>
														<div class="item-opt">
															<span> free size </span>
														</div>
													</div>
												</div>
												<div class="cell-qt">${cartVO.product_count}</div>
												<div class="cell-price">
													<div class="price">
														<span><span class="num">${cartVO.product_price}</span> 원</span>
													</div>
												</div>
											</div>
										</div>
										<!-- body -->

									</c:forEach>
								</c:otherwise>
							</c:choose>

							<!--                             
                            <div class="row">
                        
                                <div class="inner">
                                    <div class="cell-pd">
                                        <div class="item-img">
                                            <img src="https://cdn.hfashionmall.com/goods/THBR/22/04/07/GM0122040738615_1_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135"
                                                alt=""
                                                onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'">
                                        </div>
                                        <div class="item-info">
                                            <div class="item-brand">TOMMY HILFIGER KIDS</div>
                                            <div class="item-name">면혼방 배색 패턴 크루삭스 2P</div>
                                            <div class="item-opt">
                                                <span> BEIGE, S </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cell-qt">1</div>
                                    <div class="cell-price">
                                        <div class="price">
                                            <span><span class="num">22,000</span> 원</span>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
							<!-- //row -->
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
						  <input type="hidden" name="dlvPlcCouponList[0].otskrAditDlvCstLevyYn" value="Y">
					</div>
					<!-- 최종 결제 정보 -->
					<div class="btn-box">
						<a href="hfashionmallServlet?command=order_insert" class="btn-type2-lg">결제하기</a>
					</div>
					<!-- //주문상품 목록 -->
				</section>
			</section>
		</form>
	</div>
</body>

<%@ include file="../footer.jsp"%>