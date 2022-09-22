<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>
	<div class="wrap">
		<div id="container">
			<section class="content-wrap">
				<div class="snb-wrap">
					<h2 class="lnb-title">
						<a href="/secured/mypage/myPage">MYPAGE</a>
					</h2>
					<nav id="lnb" class="lnb">
						<ul>
							<li>
								<div class="menu-depth1">주문 조회</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=mypage">주문 완료 주문 조회</a></li>
									<li><a href="hfashionmallServlet?command=order_all">배송 완료 주문 조회</a></li>
									<li><a href="hfashionmallServlet?command=cart_list">장바구니 내역</a></li>
								</ul>
							</li>
							<li>
								<div class="menu-depth1">리뷰 관리</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=mypage_review">리뷰 쓰기</a></li>
									<li><a href="hfashionmallServlet?command=review_list">나의 상품리뷰</a></li>
								</ul>
							</li>
							<li>
								<div class="menu-depth1">QnA 조회</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=qna_view">1:1 문의 내역</a></li>
								</ul>
							</li>
							<li>
								<div class="menu-depth1">회원정보</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=mypage_edit">회원정보 수정</a></li>
									<li><a href="hfashionmallServlet?command=mypage_out">회원 탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				<div class="snb-content-wrap">
					<script type="text/javascript" src="/resources/js/moment.js"></script>
					<script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220914145945"></script>

					<input type="hidden" name="_csrf" value="c0a1f299-9cc0-47ee-a547-1ac477b0abb0" /> <input type="hidden" id="srchMonth" name="srchMonth" value="" /> <input type="hidden" name="srchType" id="srchType" value="A" />

					<h3 class="page-title">주문/배송</h3>

					<div class="page-info">
						<p class="txt-type3">주문내역 및 배송상태를 조회하실 수 있습니다.</p>
					</div>

					<!-- period-search-group -->
					<div class="period-search-group">
						<dl class="period-btns-box">
							<dt>기간</dt>
							<dd>
								<div class="period-btns">
									<label> <input type="radio" name="period" onclick="setDay('-15');" checked="" /> <span>15일</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('oMouth');" /> <span>1개월</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('tMouth');" /> <span>3개월</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('sMouth');" /> <span>6개월</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('yMouth');" /> <span>12개월</span>
									</label>
								</div>
							</dd>
						</dl>


					</div>
					<script>
						$(".datepicker").datepicker({
							showOn : "button",
							buttonImage : "/resources/images/btn_calendar.png",
							buttonImageOnly : false,
							buttonText : "날짜 선택",
						});
					</script>
					<!-- //period-search-group -->

					<div id="includeOrderList" class="order-list-wrap">
						<!-- 다이나믹 컨피그 설정 HFM_EQL_CONN_YN ERP 연동 유무 -->
						<script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220914145945"></script>

						<input type="hidden" id="viewType" name="viewType" value="" /> <input type="hidden" id="page" name="page" value="1" /> <input type="hidden" id="pageSize" name="pageSize" value="10" /> <input type="hidden" id="total_page" name="total_page" value="" /> <input type="hidden" id="totalCount" name="totalCount" value="" /> <input type="hidden" id="statCd" name="statCd" value="" /> <input type="hidden" id="srchFlag" name="srchFlag" value="ORD" />
						<!-- includeOrderList -->


						<c:choose>
							<c:when test="${orderList.size() == 0}">
								<div class="nodata">
									<p class="txt-nodata">최근 주문 상품이 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${orderList}" var="orderVO">
									<div class="order-tbl order-history">
										<div class="head">
											<div class="cell-order-id">
												<span class="order-date">${orderDetail.order_register} </span>
											</div>
										</div>
										<!-- //head -->

										<!-- body -->
										<div class="body">
											<div class="row plural">
												<div class="inner">
													<div class="cell-pd-wrap">
														<!-- inner-row -->
														<div class="inner-row">
															<!-- 상품한개씩 -->
															<!-- info-row -->
															<div class="info-row">
																<div class="cell-pd">
																	<div class="item-img">
																		<a href="javascript:void(0);" onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');"> 
																		<img src="product_images/${orderVO.product_code}_01.jpg" /></a>
																	</div>

																	<div class="item-info">
																		<div class="item-name clear-ellipsis">
																			<a href="javascript:void(0);" onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');">${orderVO.pname} </a>
																		</div>
																		<div class="item-opt">
																			<span> BLACK , F </span> <span>수량 : ${orderVO.product_count}</span>
																		</div>
																	</div>
																</div>
																<div class="cell-price">
																	<div class="cell-inner">
																		<div class="price">
																			<span><span class="num">${orderVO.price*orderVO.product_count}</span> 원</span>
																		</div>
																	</div>
																</div>

																<div class="cell-status">
																	<!-- 셀이 합쳐질 경우 class="rowspan" -->
																	<div class="cell-inner">
																		<div class="status"></div>
																	</div>
																</div>
																<div class="cell-btn">
																	<!-- 셀이 합쳐질 경우 class="rowspan" -->
																	<div class="cell-inner">
																		<div class="btns"></div>
																	</div>
																</div>
															</div>
															<!-- //info-row  구성상품 단위 -->
														</div>
														<!-- inner-row 그룹단위(패키지, 단품, 주문할인) -->

														<!-- 전체취소되었거나 전체취소 가능시에 하나로 묵어서 표시 -->
														<div class="cell-status rowspan2">
															<!-- 셀이 합쳐질 경우 class="rowspan" -->
															<div class="cell-inner">
																<div class="status">
																	<span class="txt-cmt pcolor"> <span class="num"> ${orderVO.order_detail_result} </span>
																	</span>
																</div>
															</div>
														</div>
														<div class="cell-btn rowspan2">
															<!-- 셀이 합쳐질 경우 class="rowspan" -->
															<div class="cell-inner">
																<div class="btns">
																	<button type="button" class="btn-type3-sm" onclick="jsUnitCancel('OD202209154384813', 'Y', 'N');">
																		<span>주문취소</span>
																	</button>
																</div>
															</div>
														</div>
														<!--  그룹단위 -->
													</div>
													<!--  cell-pd-wrap -->
												</div>
												<!--  inner -->
											</div>
											<!-- //row -->
										</div>
										<!--  body  단위 -->
									</div>
									<!-- 주문번호 order-tbl -->
								</c:forEach>
							</c:otherwise>
						</c:choose>

						<!-- head -->



						<!--  주문번호  -->
						<div class="paging">
							<span> <strong title="현재 페이지" class="btn-page selected">1 </strong>
							</span>
						</div>
						<!-- includeOrderList 생성 페이지 이동 끝 -->

						<h4 class="sec-title">주문/배송 단계 안내</h4>
						<div class="process-img-guide">
							<ol class="order-process">
								<li>입금대기</li>
								<li>결제완료</li>
								<li>상품준비중</li>
								<li>배송중</li>
								<li>배송완료</li>
							</ol>
						</div>

						<div class="process-txt-guide">
							<ol>
								<li><strong class="title">1. 입금대기</strong>
									<div class="txt">
										주문이 정상적으로 접수 되었습니다.
										<br />
										결제 방법을 현금 입금으로 선택하신 경우, 정해진 기간내에 입금이 완료 되어야
										<br />
										결제완료 단계로 진행됩니다. 정해진 기간 경과시, 주문은 자동 취소 됩니다.
									</div></li>
								<li><strong class="title">2. 결제완료</strong>
									<div class="txt">주문, 결제/입금이 최종 완료 되었습니다. 배송정보 수정 및 주문최소가 가능합니다.</div></li>
								<li><strong class="title">3. 상품준비중</strong>
									<div class="txt">
										상품의 재고를 확인하고, 상품의 택배 배송을 위해 준비하는 단계 입니다.
										<br />
										(배송 준비중인 경우, 주문취소가 불가할 수 있습니다. 자세한 사항은
										<br />
										고객센터(1800-5700) 또는 1:1게시판으로 문의 부탁 드립니다.)
									</div></li>
								<li><strong class="title">4. 배송중</strong>
									<div class="txt">
										택배사에 상품이 인계되어 고객님께 배송중입니다. 도서/산간 지역을 제외한 지역의경우,
										<br />
										통상적으로 2~3일 정도 소요됩니다. 배송 추적이 가능합니다.
									</div></li>
								<li><strong class="title">5. 배송완료</strong>
									<div class="txt">
										해당 물품을 고객님께서 수령하여 배송이 완료된 상태입니다. 포인트 적립 및 상품평
										<br />
										작성이 가능합니다. 배송 완료 7일 이내에만 반품 및 교환 신청이 가능 합니다.
									</div></li>
							</ol>
						</div>

						<!-- 리뷰 작성 팝업 -->
						<div id="getGoodsReviewPopup"></div>
						<div id="layerTracking" class="layer-pop" tabindex="0"></div>
					</div>

					<!-- s : 리뷰 작성 / 수정 레이어 팝업-->
					<div id="__dialogReview__"></div>
					<!-- s: popup - 배송 조회 -->

					<div id="deliveryInfoPopup" class="ui-dialog-contents" title="배송 조회">
						<div class="dialog-contents-flex">
							<div class="delivery-info-box">
								<div class="tbl-wrap tbl-row">
									<table id="dlvTabUser"></table>
								</div>

								<div class="tbl-wrap tbl-col">
									<table id="dlvTabInfo"></table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>

<%@ include file="../footer.jsp"%>