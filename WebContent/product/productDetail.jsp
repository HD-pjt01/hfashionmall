<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
int qnaNo = 1;
int reviewNo = 1;
%>
<div id="container">
	<br> <br> <br> <br> <br> <br>
	<form method="post" name="fomm">
		<input type="hidden" name="product_code"
			value="${productVO.product_code}">
		<div class="content-response">
			<div class="product-view-top">
				<div class="product-view-img">
					<div id="pdViewSlide" class="product-view-slide">
						<div class="slide-container">
							<div id="productImgSlide" class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="product_images/${productVO.product_code}_01.jpg"
										alt="[${productVO.product_brand}] ${productVO.product_name} (${productVO.product_code})" />
								</div>
								<div class="swiper-slide">
									<img src="product_images/${productVO.product_code}_02.jpg"
										alt="[${productVO.product_brand}] ${productVO.product_name} (${productVO.product_code})" />
								</div>
								<div class="swiper-slide">
									<img src="product_images/${productVO.product_code}_03.jpg"
										alt="[${productVO.product_brand}] ${productVO.product_name} (${productVO.product_code})" />
								</div>
								<div class="swiper-slide">
									<img src="product_images/${productVO.product_code}_04.jpg"
										alt="[${productVO.product_brand}] ${productVO.product_name} (${productVO.product_code})" />
								</div>
							</div>
						</div>
						<div class="slide-pagination"></div>
						<div class="slide-nav type6">
							<button type="button" class="slide-nav-prev">이전</button>
							<button type="button" class="slide-nav-next">다음</button>
						</div>
					</div>
				</div>
				<div class="product-view-info">
					<p class="item-brand">
						<a href="javascript:void(0);" onclick="goBrandMain(this);"
							ctgryNo="BDMA21A09" ctgryOutptTpCd="" outptLinkUrl="">
							${productVO.product_brand}</a>
					</p>
					<p class="item-tag">
						<span class="code">${productVO.product_code}</span> <span
							class="tag" style="color: #C2935F"> </span>
					</p>
					<p class="item-name">[${productVO.product_brand}]
						${productVO.product_name} (${productVO.product_code})</p>

					<div class="item-price">
						<p class="price">
							<span> ${productVO.product_price}</span>
						</p>
						<input type="hidden" id="maxDcOnlneGrdCd" value="ALL" /> <input
							type="hidden" id="publiQtyLmitCheck" value="PSB" /> <input
							type="hidden" id="maxPrice" value="18050" /> <input
							type="hidden" id="minPrice" value="18050" />
					</div>
					<div class="product-view-option">
						<div class="option-bot">
							<input type="hidden" class="minOrdQty" value="1"
								godno="GM0122040738612"> <input type="hidden"
								class="maxOrdQty" value="9999" godno="GM0122040738612">
							<div name="qtyDiv" class="row quantity gnrlOptQty" style=""
								godno="GM0122040738612" selectoptionyn="Y">
								<!-- 이거 어캐 좀 해봐야할듯 ,, -->
								<strong class="tit">BLACK / M</strong> <span class="item-count">
									<button type="button" class="btn-minus"
										onclick="quantityCalc('minus');">
										<span>빼기</span>
									</button> <input type="number" name="quantity" godno="GM0122040738612"
									minordqty="1" maxordqty="56" class="input-num" value="1"
									onkeyup="changeQty(this);">
									<button type="button" class="btn-plus"
										onclick="quantityCalc('plus');">
										<span>더하기</span>
									</button>
								</span> <span class="price"> <span class="num">${productVO.product_price}</span>
									<button type="button" class="btn-reset"
										onclick="resetOptionDiv(this);">
										<span>옵션초기화</span>
									</button>
								</span>
							</div>
							<div name="qtyDiv" class="row quantity aditQtyDiv"
								style="display: none;" godno="" selectoptionyn="N">
								<strong class="tit"> [추가]<span class="name">상품명</span>옵션명
								</strong> <span class="item-count">
									<button type="button" class="btn-minus"
										onclick="quantityCalc('minus');">
										<span>빼기</span>
									</button> <input type="number" name="quantity"
									class="input-num aditGodQty" value="2"
									onkeyup="changeQty(this);">
									<button type="button" class="btn-plus"
										onclick="quantityCalc('plus');">
										<span>더하기</span>
									</button>
								</span> <span class="price"> <span class="num">0</span>
									<button type="button" class="btn-reset"
										onclick="resetOptionDiv(this);">
										<span>옵션초기화</span>
									</button>
								</span>
							</div>
							<div class="total" style="">
								<strong class="tit">합계</strong> <span class="num">${productVO.product_price}</span>
							</div>
							<div name="pkupDiv" class="dlv-sel" style="display: none;">
								<label class="check-skin"> <input type="checkbox"
									onclick="checkDlvSect(this);" name="dlvSect_top"
									value="PKUP_DLV" godno="GM0122040738612"> <span>매장수령</span>
								</label>
								<button type="button" class="btn-tooltip"
									onclick="layer.open('layerShopDlv')">
									<span>매장수령 안내보기</span>
								</button>
								<div class="dlv-sel-shop" style="display: none;">
									<p class="dlvShopInfo"></p>
									<button onclick="updatePkukShop();">매장변경</button>
								</div>
							</div>
							<div id="vs-inpage" style="display: none;"></div>
							<div class="info-guide-box">
								<p id="resveOrdDlivyDateStr" style="display: none;">출고예정일 :</p>
							</div>

							<div class="btn-box">
								<button name="btnShoppingBag" type="button"
									class="btn-type4-xlg btnShoppingBag" onclick="go_cart()"
									style="margin-left: 10px">
									<span>장바구니</span>
								</button>
								<input type="hidden" id="product_code" value="N">
								<button name="btnBuynow" type="button" class="btn-type2-xlg"
									onclick="go_direct_order()">
									<span> 바로구매 </span>
								</button>
							</div>
						</div>
						<div class="dlv-couponPrice" style="display: none;">
							<h4 class="tooltip-title">회원/멤버십 쿠폰가 안내</h4>
							<p class="txt-common">
								상품 상세 페이지에 있는 쿠폰 다운로드를 받아야<br> 회원/멤버십 쿠폰가를 적용 받을 수 있습니다.
							</p>
						</div>
					</div>
					<!-- //옵션 선택 -->
					<div class="info-bot">
						<ul class="list">
							<li class="row"><span class="tit">배송비</span> <span> <input
									type="hidden" id="otskrDlvAditCost" value="Y" /> 30,000이상 구매시
									무료(도서산간추가 4000원)
									<button type="button" class="btn-tooltip"
										onclick="tooltip('dlv-hardarea'); $('.list-common.address').niceScroll(dScroll.opt);">툴팁보기</button>
							</span>

								<div class="dlv-hardarea" style="display: none;">
									<ul class="txt-list">
										<li>구매하신 상품에 따라 배송비가 부과됩니다.</li>
										<li>도서산간 지역은 배송비가 추가 될 수 있습니다.<br> 해당 지역은 FAQ를 통해
											확인하실 수 있습니다.
										</li>
										<li>H.Point, 한섬마일리지, H.Plus 등의 할인수단으로<br> 배송비 결제가
											불가합니다.
										</li>
									</ul>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //상세 상단 -->
			<div class="product-view-detail">
				<div class="product-detail-tab tab-wrap2 anchor-wrap">
					<ul class="tabs">
						<li class="on"><button type="button">
								<span>상품상세정보</span>
							</button></li>
						<li><button type="button">
								<span id="tabReviewCnt">리뷰</span>
							</button></li>
					</ul>
					<!-- 상품 상세 정보 -->

					<!-- 상품 상세 정보 -->
					<section id="tabContentReview"
						class="anchor-section product-detail-review"></section>

					<section id="tabContentReview"
						class="anchor-section product-detail-review">
						<h3 class="sec-title">리뷰 (${reviewCount}개)</h3>


						<div class="product-detail-review-list">
							<div class="head">
								<p class="txt">상품 구매 후 리뷰 작성시 H.Plus를 드립니다. (포토리뷰 1,000포인트,
									텍스트리뷰 300포인트 증정)</p>
								<div id="prdReviewFilter" class="opt">
									<div class="select">
										<button type="button" class="sel-btn"
											onclick="select.trigger();">최신순</button>
										<div id="reviewSortFilter" class="sel-list">
											<ul>
												<li><label><input type="radio" name="rvList"
														value="new"> <span>최신순</span></label></li>
												<li><label><input type="radio" name="rvList"
														value="like"> <span>공감순</span></label></li>
											</ul>
										</div>
									</div>

									<div class="select">
										<button type="button" class="sel-btn"
											onclick="select.trigger();">${productVO.product_name}</button>
										<div class="sel-list">
											<ul>
												<li><label> <input type="radio"
														name="optValCd1" value="2"> <span>S</span>
												</label></li>
												<li><label> <input type="radio"
														name="optValCd1" value="3"> <span>M</span>
												</label></li>
												<li><label> <input type="radio"
														name="optValCd1" value="4"> <span>L</span>
												</label></li>
												<li><label> <input type="radio"
														name="optValCd1" value="5"> <span>XL</span>
												</label></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div id="reviewNodata" class="nodata" style="display: none;">
								지금 첫 리뷰를 작성해주세요.<br> 포토리뷰 1,000포인트, 텍스트 리뷰 300포인트를 증정합니다.
								(상품구매시)
							</div>
							<div id="allReviewList" class="board-list board-review ui-fold"
								style="">
								<ul class="list-content">
									<c:choose>
										<c:when test="${reviewList.size() == 0}">
											<div class="nodata">
												<p class="txt-nodata">리뷰가 없습니다.</p>
											</div>
										</c:when>
										<c:otherwise>
											<c:forEach var="review" items="${reviewList}">
												<li>
													<div class="list-row fold-header">
														<div class="cell-title">
															<ul class="etc-info">
																<li><span class="point size-m"><span
																		class="ico" style="width: 60%">별점 4점</span></span></li>
																<li>
																	<button type="button" class="btn-like2"
																		onclick="addGodEvlLikeCount(this,addLikeList);"
																		godevlturn="1" reviewgodno="115369702">
																		<span class="like-count" likecnt="3"> </span>
																	</button>
																</li>
																<li><span class="date">${review.review_register}</span>
																</li>
															</ul>
															<p class="title-review">${review.review_content}</p>
															<button type="button" class="btn-fold">열기</button>
														</div>
													</div>
												</li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul>
								<div class="paging">
									<span> <strong title="현재 페이지">1</strong>
									</span>
								</div>
								<div id="layerReviewReport" class="layer-pop" tabindex="0"
									style="display: none;">
									<div class="layer-wrap" tabindex="0">
										<div class="layer-header">
											<h2 class="layer-title">신고하기</h2>
										</div>
										<div class="layer-container">
											<div class="layer-content">
												<div class="layer-reviewReport">

													<h3 class="layer-sec-title">신고하시는 사유가 무엇인가요? (필수)</h3>

													<div class="radio-item pt5">
														<ul class="radio-col-list">
															<li><label class="radio-skin"> <input
																	type="radio" name="radioReviewReport"
																	value="RP_PRD_IRRELEVANT"> <span>상품 품질과
																		관련 없는 내용</span>
															</label></li>
															<li><label class="radio-skin"> <input
																	type="radio" name="radioReviewReport"
																	value="RP_PUBLICITY"> <span>개인 및 판매자의
																		사업적 홍보</span>
															</label></li>
															<li><label class="radio-skin"> <input
																	type="radio" name="radioReviewReport"
																	value="RP_PRIVACY"> <span>개인정보 누출 위험</span>
															</label></li>
															<li><label class="radio-skin"> <input
																	type="radio" name="radioReviewReport"
																	value="RP_COPYRIGHT"> <span>저작권 불법 도용
																		(타인이 작성한 글, 사진 등)</span>
															</label></li>
															<li><label class="radio-skin"> <input
																	type="radio" name="radioReviewReport"
																	value="RP_SELLER_REVIEW"> <span>상품 리뷰가
																		아닌 판매자 리뷰 내용</span>
															</label></li>
															<li><label class="radio-skin"> <input
																	type="radio" name="radioReviewReport" value="RP_ETC">
																	<span>기타</span>
															</label></li>
														</ul>
													</div>

													<h3 class="layer-sec-title">신고하시는 이유를 알려주세요 (필수)</h3>
													<div class="textarea-group">
														<div class="txtarea-box">
															<textarea id="godEvlRepCont" cols="30" rows="10"
																maxlength="200"
																placeholder="비방, 욕설, 광고, 잘못된 정보 등 신고 사유를 구체적으로 작성해주세요."></textarea>
														</div>
													</div>

													<div class="btn-box">
														<button type="button" class="btn-type2-lg"
															onclick="saveGodEvlReport(this)">
															<span>등록</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										<button type="button" class="btn-layer-close"
											onclick="layer.close('layerReviewReport');">닫기</button>
									</div>
								</div>
							</div>
							<div id="photoReviewList" class="photo-list"
								style="display: none;"></div>
						</div>
					</section>
					<div id="tabContentQna" class="anchor-section product-detail-qna"></div>

					<div class="anchor-section product-detail-dlv">
						<h3 class="sec-title">배송/교환/반품</h3>
						<div class="product-detail-table">
							<table>
								<caption>배송/교환/반품 안내</caption>
								<colgroup>
									<col style="width: 160px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">배송기간</th>
										<td>- 상품의 배송비는 공급업체의 정책에 따라 다르오며 공휴일 및 휴일은 배송이 불가합니다.-
											상품별로 상품 특성 및 배송지에 따라 배송유형 및 소요기간이 달라집니다.- 동일 브랜드의 상품이라도 상품별
											출고일시가 달라 각각 배송될 수 있습니다.- 일부 주문상품 또는 예약상품의 경우 기본 배송일 외에 추가 배송
											소요일이 발생될 수 있습니다.- 도서 산간 지역은 별도의 배송비와 반품비가 추가될 수 있습니다.</td>
									</tr>
									<tr>
										<th scope="row">반품배송비</th>
										<td>
											<ul class="txt-list">
												<li>전체 반품 시 : 5,000원</li>
												<li>부분 반품 시 : 2,500원 (단, 부분 반품 후 결제금액이 3만원 미만인 경우
													5,000원) <br /> * 반품비는 브랜드/입점사별로 상이할 수 있습니다. <br /> * 도서산간
													지역은 추가 배송비가 부과됩니다.
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">교환배송비</th>
										<td>
											<ul class="txt-list">
												<li>5,000원 (교환상품 배송비 + 2,500원) <br>* 교환배송비는
													브랜드/입점사별로 상이할 수 있습니다.
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">교환/반품 유의사항</th>
										<td>- 상품 수령일로부터 7일 이내 반품/환불 가능합니다. <br /> - 상품하자 이외 사이즈,
											색상교환 등 단순 변심에 의한 교환/반품 택배비 고객부담으로 왕복택배비가 발생합니다. <br /> - 고객
											부주의로 상품이 훼손, 변경된 경우 반품 / 교환이 불가능 합니다. <br /> - 주문완료 후 재고 부족
											등으로 인해 주문 취소 처리가 될 수도 있는 점 양해 부탁드립니다. <br /> - 임의반품은 불가하오니
											반드시 고객센터나 MY Page&gt; 주문취소/교환/반품 신청을 통해서 신청접수를 하시기 바랍니다. <br />
											- 특정브랜드의 상품설명에 별도로 기입된 교환/반품/AS기준이 우선합니다. <br /> - 브랜드별로
											배송비가 상이할 수 있습니다.
										</td>
									</tr>
									<tr>
										<th scope="row">교환안내</th>
										<td>교환 가능 기간 <br /> 교환 신청은 배송 완료 후 7일 내 가능합니다. <br /> <br />
											교환 불가 상품 <br /> 단순 변심의 경우 최초 배송된 상품의 상태와 다를 시 (세탁 또는 착용 후
											외출하신 경우) 교환 및 반품이 불가합니다. <br /> 쥬얼리와 언더웨어 상품은 착용 이후 교환 및 반품이
											불가합니다. <br /> 맞춤제작의 경우 제작이 시작된 이후에는 취소,교환 및 반품이 불가합니다.
										</td>
									</tr>
									<tr>
										<th scope="row">반품안내</th>
										<td>반품 가능 기간 <br /> 반품 신청은 배송 완료 후 7일 내 가능합니다. <br /> <br />
											반품 불가 상품 <br /> 단순 변심의 경우 최초 배송된 상품의 상태와 다를 시 (세탁 또는 착용 후
											외출하신 경우) 교환 및 반품이 불가합니다. <br /> 쥬얼리와 언더웨어 상품은 착용 이후, 교환 및
											반품이 불가합니다. <br /> 맞춤제작의 경우 제작이 시작된 이후에는 취소,교환 및 반품이 불가합니다. <br />
											상품박스, 별도 부속물등이 정상적인 상태에서 반품진행이 원활하게 진행될 수 있습니다.
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<!-- 아래 박스 전체 끝 -->
<script type="text/javascript" src="javascript/product.js"></script>
<%@ include file="../footer.jsp"%>