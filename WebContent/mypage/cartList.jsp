<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
function go_direct_order2() {
	document.fomm.action = "hfashionmallServlet?command=ordering_one";
		document.fomm.submit();
	}
</script>

<body>
	<div id="container">
		<form name="formm" method="post">

			<section class="content-wrap">
				<h3 class="page-title">장바구니</h3>

				<div id="cartContentList">
					<input type="hidden" id="onlneGrdCd" value="LEVEL_01">

					<div id="0">
						<div id="cartList" class="order-tbl type-cart">

							<!-- head -->
							<div class="head">
								<input type="checkbox" name="allCheck" onclick="allChk()">
								</th>
								<div class="cell-check">
									<label class="check-skin only"> <input type="checkbox" id="chk_0" name="cartAllCheckbox" class="allChk"> 
									<input type="checkbox" id="chk_0" name="cartAllCheckbox" class="allChk" onclick="javascript:check.all($(this),0);event.stopImmediatePropagation();"> <span>전체 선택</span>
									</label>
								</div>
								<div class="cell-info">상품정보</div>
								<div class="cell-price">상품금액</div>
								<div class="cell-btn">선택</div>
								<div class="cell-dlv">배송정보</div>
							</div>
							<!-- //head -->

							<!-- body -->
							<div class="body">

							<!-- action 에서 전달 받은 cartlist를 가지고 화면에 출력 -->
								<c:choose>
									<c:when test="${cartList.size() == 0}">
										<div class="nodata">
											<p class="txt-nodata">장바구니에 담긴 상품이 없습니다.</p>
										</div>
									</c:when>

									<c:otherwise>
										<c:forEach items="${cartList}" var="cartVO">
											<input type="hidden" name="product_code" value="${cartVO.product_product_code}">
											
											<!-- row -->
											<div class="row " id="0" gdturn="2" gdidx="0">
												<div class="inner">
													<div class="cell-check">
														<label class="check-skin only"> <input type="checkbox" soldoutyn="N" id="0_0" name="cart_id" value="${cartVO.cart_id}"> <span>선택</span>
														</label>
													</div>
													<div class="cell-pd-wrap">
														<div class="inner-row">
															<div class="cell-pd">
																<div class="item-img">
																	<a href="javascript:void(0);" > <img src="product_images/${cartVO.product_product_code}_01.jpg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-label"></div>
																	<div class="item-name" >
																		<a href="hfashionmallServlet?command=product_detail&product_code=${cartVO.product_product_code}">
																			<h3>${cartVO.pname}</h3>
																		</a>
																	</div>
																	<div class="item-opt">
																		<span> black , free </span> <span>수량 : ${cartVO.product_count} 개</span>
																	</div>
																	<div class="item-etc"></div>
																	<div class="item-link"></div>
																</div>
															</div>
															<div class="cell-price">
																<div class="price">
																	<span> <span class="num" id="orderPrice0_0">${cartVO.product_price}</span> 원
																	</span>
																</div>
															</div>
														</div>
														<!-- //상품 별 정보/가격 -->
													</div>
													<div class=" cell-btn">
														<button type="button" class="btn-type4-sm" onclick="go_direct_order2()">
															<span>바로구매</span>
														</button>
													</div>
												</div>
											</div>
											<!-- //row -->
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- //body -->
						</div>
						<div class="tbl-btn">
							<button type="button" class="btn-type3-m" onclick="go_cart_delete()">
								<span>선택삭제</span>
							</button>
						</div>
						<script>
                            allChk('#cartList');
                        </script>

						<!-- 최종금액 -->
						<div class="cart-price" mbratrbcd="GNRL_MBR">
							<div class="inner">
								<span class="price"> <span class="txt">상품금액</span> <span id="totalGodAmt" class="num">${totalPrice}</span> 원
								</span> <span class="symbol-plus">+</span> <span class="price"> <span class="txt">배송비
										<button type="button" class="btn-tooltip" onmouseenter="tooltip('dlvCost-info', null, '/tooltip?type=costInfo');">
											<span>툴팁보기</span>
										</button>
								</span> <span id="totalDlvAmt" class="num">0</span> 원
								</span> <span class="symbol-minus">-</span> <span class="price sale"> <span class="txt">총 할인금액</span> <span id="totalDcAmt" class="num">0</span> 원
								</span> <span class="symbol-eq">=</span> <span class="price total"> <span class="txt">결제금액</span> <span id="totalOrdAmt" class="num">${totalPrice}</span> 원
								</span>
							</div>
						</div>

						<div class="btn-box">
							<a href="hfashionmallServlet?command=index" class="btn-type4-lg">쇼핑 계속하기</a> 
							<a href="javascript:undefined;" class="btn-type2-lg" onclick="go_ordering()">선택상품 주문하기</a>
						</div>



						<ul class="txt-list">
							<li>장바구니에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품은 자동 삭제됩니다.</li>
							<li>장바구니에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>
							<!-- 200703 text -->
							<li>장바구니에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
						</ul>


						<script type="text/javascript">
                            function selectedGoodsDel(idx, soldoutYn) {
                                // 전체 삭제인지 확인
                                var allChk = $('input[name="cartAllCheckbox"]').prop("checked");
                                if (allChk) {
                                    try {
                                        AW_CARTDEL();
                                    } catch (e) {
                                        console.log("ace counter error selectedGoodsDel", e);
                                    }
                                }
                                try {
                                    var product = [];
                                    $('input[name="check"]').each(function (i) {
                                        var checked = $(this).prop("checked");
                                        if (checked) {
                                            product.push(makeDataLayerProduct(i));
                                        }
                                    });
                                    makeDataLayer(product);
                                } catch (e) {
                                    console.log("dataLayer error selectGoodsDel : ", e);
                                } <
                                !--기존 장바구니 삭제
                                function -- >
                                if (soldoutYn) {
                                    submitForm.send('soldoutdel', idx);
                                } else {
                                    submitForm.send('del', idx);
                                }
                            }
                        </script>
						<div id="wp_tg_cts" style="display: none;"></div>
						<script type="text/javascript" async="" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js">
                        </script>
						<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
					</div>
				</div>
			</section>
		</form>
	</div>
</body>

<%@ include file="../footer.jsp"%>