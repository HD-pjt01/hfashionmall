<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div id="container">
	<div class="content-response">
		<div class="product-view-top">
			<div class="product-view-img">
				<div id="pdViewSlide" class="product-view-slide">
					<div class="slide-container">
						<div id="productImgSlide" class="swiper-wrapper">
							<div class="swiper-slide">
								<img
									src="https://cdn.hfashionmall.com/goods/HFBR/22/06/08/GP4V22060861069_0_ORGINL.jpg?RS=960x960&AR=0&CS=640x960"
									alt="[FILA] 사이클 조각모 (FS3CPE5123X_OWH)"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" />
							</div>
							<div class="swiper-slide">
								<img
									src="https://cdn.hfashionmall.com/goods/HFBR/22/06/08/GP4V22060861069_1_ORGINL.jpg?RS=960x960&AR=0&CS=640x960"
									alt="[FILA] 사이클 조각모 (FS3CPE5123X_OWH)"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" />
							</div>
							<div class="swiper-slide">
								<img
									src="https://cdn.hfashionmall.com/goods/HFBR/22/06/08/GP4V22060861069_2_ORGINL.jpg?RS=960x960&AR=0&CS=640x960"
									alt="[FILA] 사이클 조각모 (FS3CPE5123X_OWH)"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" />
							</div>
							<div class="swiper-slide">
								<img
									src="https://cdn.hfashionmall.com/goods/HFBR/22/06/08/GP4V22060861069_3_ORGINL.jpg?RS=960x960&AR=0&CS=640x960"
									alt="[FILA] 사이클 조각모 (FS3CPE5123X_OWH)"
									onerror="this.src='/hfm_pc/resources/images/product/noimage_640x960.jpg'" />
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
						ctgryNo="BDMA21A09" ctgryOutptTpCd="" outptLinkUrl=""> FILA</a>
				</p>

				<p class="item-tag">
					<span class="code">P4V1100FS3CPE5123XOWH55</span> <span class="tag"
						style="color: #C2935F"> </span>
				</p>
				<p class="item-name">[FILA] 사이클 조각모 (FS3CPE5123X_OWH)</p>

				<div class="item-price">
					<p class="price">
						<span> 19,000</span>
					</p>
					<input type="hidden" id="maxDcOnlneGrdCd" value="ALL" /> <input
						type="hidden" id="publiQtyLmitCheck" value="PSB" /> <input
						type="hidden" id="maxPrice" value="18050" /> <input type="hidden"
						id="minPrice" value="18050" />
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
								</button> <input type="number" name="qtySpinner" godno="GM0122040738612"
								minordqty="1" maxordqty="56" class="input-num" value="1"
								onkeyup="changeQty(this);">
								<button type="button" class="btn-plus"
									onclick="quantityCalc('plus');">
									<span>더하기</span>
								</button>
							</span> <span class="price"> <span class="num">22,000</span>
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
								</button> <input type="number" name="qtySpinner"
								class="input-num aditGodQty" value="1"
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
							<strong class="tit">합계</strong> <span class="num">22,000</span>
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
								class="btn-type4-xlg btnShoppingBag">
								<span>장바구니</span>
							</button>
							<button name="btnBuynow" type="button" class="btn-type2-xlg">
								<span> <input type="hidden" id="godSaleSectCd" value="N">
									바로구매
								</span>
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
					<p class="review">
						<span class="point size-s"><span
							id="reviewTotalScoreSummary" class="ico" style="width: 0%;">0점</span></span>
						<span class="num">0</span> Reviews
					</p>

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

						<li><span class="tit">한섬마일리지</span> <span>최대 1% 적립
								<button type="button" class="btn-tooltip"
									onclick="tooltip('mileage-info2');">
									<span>툴팁보기</span>
								</button>
								<div class="mileage-info2" style="display: none;">
									<h4 class="tooltip-title">한섬마일리지 안내</h4>
									<p class="txt-common">
										한섬마일리지는 오프라인 매장의 구매내역과 통합 <br> 운영되지 않는 H패션몰 구매 고객 혜택으로
										H패션몰내 <br> 구매시 결제수단으로 사용됩니다.
									</p>
									<ul class="list-common num-list">
										<li><span class="left">Friend </span> <span class="right">1%</span>
										</li>
										<li><span class="left">Friend+ </span> <span
											class="right">1%</span></li>
										<li><span class="left">Family </span> <span class="right">1%</span>
										</li>
										<li><span class="left">Family+ </span> <span
											class="right">1%</span></li>
										<li><span class="left">Mania </span> <span class="right">1%</span>
										</li>
										<li><span class="left">Mania+ </span> <span class="right">1%</span>
										</li>
										<li><span class="left">VIP </span> <span class="right">1%</span>
										</li>
										<li><span class="left">VVIP </span> <span class="right">1%</span>
										</li>
									</ul>
									<ul class="txt-list2">
										<li>한섬마일리지는 배송완료 10일 후 자동 적립되며, 1000M 적립 이후 10M(10원) 단위로
											사용 가능합니다.</li>
										<li>한섬마일리지는 모든 쿠폰(상품/장바구니/중복) 적용 후 각 상품당 실 결제금액 3만원 초과 시
											사용 가능합니다.</li>
										<li>한섬마일리지는 전 브랜드의 양말 및 입점 브랜드 전 상품에는 사용 제한됩니다.</li>
									</ul>
								</div>
						</span></li>
						<li><span class="tit">H포인트</span> <span>0.1% 적립
								<button type="button" class="btn-tooltip"
									onclick="tooltip('hpoint-info2', null, null,null,null);">
									<span>툴팁보기</span>
								</button>
						</span></li>
						<li><span class="tit">카드혜택</span>
							<button type="button" onclick="tooltip('credit-card-info');">
								<span>09월 신용카드 혜택 안내</span>
							</button></li>
					</ul>
					<div class="credit-card-info" style="display: none;">
						<h4 class="tooltip-title">9월 무이자 행사 안내 (9.1 ~ 9.30)</h4>
						<!-- S: 220819 | 신용카드 무이자 할부 안내 팝업 추가 -->
						<div id="dialogCardBenefits" class="ui-dialog-contents"
							title="무이자 할부" data-container="#prodGridDetailWrap"
							data-class="dialog-card-benefits dialog-has-tab">
							<div class="dialog-contents-flex">
								<div class="tab-wrap line-tab js-tab">
									<ul class="tabs">
										<li class="tab-item"><a href="#tabNoInterestInstallment"
											class="tab-link" target="_blank">무이자 할부</a></li>
										<li class="tab-item"><a
											href="#partialNoInterestInstallment" class="tab-link"
											target="_blank">부분 무이자</a></li>
									</ul>
									<!-- s :tab_content -->
									<div id="tabNoInterestInstallment" class="tab-content">
										<div class="credit-card-event-list">
											<!-- S: 무이자 할부 -->
											<table class="table left installment-plan">
												<caption>무이자 할부</caption>
												<colgroup>
													<col />
													<col />
												</colgroup>
												<thead>
													<tr>
														<th colspan="2" scope="col">무이자 할부</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">롯데카드</p>
														</th>
														<td>
															<p class="benefit">2~4개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">하나카드</p>
														</th>
														<td>
															<p class="benefit">2~8개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">현대카드</p>
														</th>
														<td>
															<p class="benefit">2~7개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">국민카드</p>
														</th>
														<td>
															<p class="benefit">2~7개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">신한카드</p>
														</th>
														<td>
															<p class="benefit">2~7개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">삼성카드</p>
														</th>
														<td>
															<p class="benefit">2~6개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">BC카드</p>
														</th>
														<td>
															<p class="benefit">2~7개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">NH카드</p>
														</th>
														<td>
															<p class="benefit">2~8개월(5만원↑)</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">광주카드</p>
														</th>
														<td>
															<p class="benefit">2~7개월(5만원↑)</p>
														</td>
													</tr>
												</tbody>
											</table>
											<!-- E: 무이자 할부 -->
											<!-- #38886 연하게 표현되는 라인에 .weak 클래스 추가' -->
											<div class="credit-card-event-desc">
												<!-- 리뉴얼 텍스트 수정 start -->
												<dl class="text-list sm squre">
													<!-- .sm, .squre 삭제 요망 -->
													<dt></dt>
													<dd class="line-text">
														<!-- .line-text 추가 -->
														본 행사는 카드사 사정에 따라 변경 또는 중단될 수 있습니다.
													</dd>
													<!-- SR85153 -->
												</dl>
												<!-- 리뉴얼 텍스트 수정 end -->
											</div>
											<!-- end : #38886 테이블 형태로 변경 -->
										</div>
									</div>
									<!-- e :tab_content -->
									<!-- s :tab_content -->
									<div id="partialNoInterestInstallment" class="tab-content">
										<div class="credit-card-event-list">
											<!-- S: 무이자 할부 -->
											<table class="table left installment-plan">
												<caption>부분 무이자</caption>
												<colgroup>
													<col />
													<col />
												</colgroup>
												<thead>
													<tr>
														<th colspan="2" scope="col">부분 무이자</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">삼성카드</p>
														</th>
														<td>
															<p class="benefit">
																10개월(1~4회차 고객부담), <br />12개월(1~5회차 고객부담), <br />18개월(1~7회차
																고객부담), <br />24개월(1~9회차 고객부담)
															</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">신한카드</p>
														</th>
														<td>
															<p class="benefit">
																10개월(1~4회차 고객부담), <br />12개월(1~5회차 고객부담)
															</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">국민카드</p>
														</th>
														<td>
															<p class="benefit">
																10개월(1~4회차 고객부담), <br />12개월(1~5회차 고객부담)
															</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">하나카드</p>
														</th>
														<td>
															<p class="benefit">
																10개월(1~3회차 고객부담), <br />12개월(1~4회차 고객부담)
															</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">BC카드</p>
														</th>
														<td>
															<p class="benefit">
																10개월(1~3회차 고객부담), <br />12개월(1~4회차 고객부담)
															</p>
														</td>
													</tr>
													<tr>
														<th class="td" scope="row">
															<p class="credit-card">NH카드</p>
														</th>
														<td>
															<p class="benefit">
																10개월(1~3회차 고객부담), <br />12개월(1~4회차 고객부담)
															</p>
														</td>
													</tr>
												</tbody>
											</table>
											<!-- E: 무이자 할부 -->
											<!-- #38886 연하게 표현되는 라인에 .weak 클래스 추가' -->
											<div class="credit-card-event-desc">
												<!-- 리뉴얼 텍스트 수정 start -->
												<dl class="text-list sm squre">
													<!-- .sm, .squre 삭제 요망 -->
													<dt></dt>
													<dd class="line-text">
														<!-- .line-text 추가 -->
														본 행사는 카드사 사정에 따라 변경 또는 중단될 수 있습니다.
													</dd>
													<!-- SR85153 -->
												</dl>
												<!-- 리뉴얼 텍스트 수정 end -->
											</div>
											<!-- end : #38886 테이블 형태로 변경 -->
										</div>
									</div>
									<!-- e :tab_content -->
								</div>
							</div>
						</div>
						<!-- E: 220819 | 신용카드 무이자 할부 안내 팝업 추가 -->
					</div>
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
				<section class="anchor-section product-detail-info">
					<h3 class="hidden">상품상세정보</h3>
					<div class="info-wrap">
						<div class="html-wrap">
							<br />
							<br />
							<div>
								<div>
									<div class="detail_img">
										<p class="d_it_txt" style="margin-top: 0px">
											헬멧 아래 레이어링하여 착용하는 사이클 조각모<br />
											<br />강한 햇살이나 비 등으로부터 눈을 보호할 수 있음<br />
											<br />머리에 밀착되는 형태로 착용감이 뛰어남<br />
											<br />재귀반사 디테일을 적용하여 안전성 확보<br />
											<br />
										</p>
										<br />
									</div>
									<div class="detail_table">
										<table>
											<caption class="acc-hidden">상품상세정보 테이블</caption>
											<tbody>
												<tr>
													<th>상품명</th>
													<td>사이클 조각모</td>
												</tr>
												<tr>
													<th>상품코드</th>
													<td>FS3CPE5123X</td>
												</tr>
												<tr>
													<th>상품종류</th>
													<td>ACC</td>
												</tr>
												<tr>
													<th>제품소재</th>
													<td>겉감 : 면 97%, 폴리우레탄 3%배색 : 폴리에스터 65%, 면 35%</td>
												</tr>
												<tr>
													<th>색상</th>
													<td>OWH(오프화이트)</td>
												</tr>
												<tr>
													<th>사이즈</th>
													<td>057</td>
												</tr>
												<tr>
													<th>제조국</th>
													<td>한국</td>
												</tr>
												<tr>
													<th>제조년월</th>
													<td>2022.02</td>
												</tr>
												<tr>
													<th>제조사</th>
													<td>휠라코리아㈜</td>
												</tr>
												<tr>
													<th>세탁방법 및 취급시 주의사항</th>
													<td>상세 취급방법 제품라벨 참조</td>
												</tr>
												<tr>
													<th>품질보증기준</th>
													<td>관련법 및 소비자 분쟁해결기준에 따름</td>
												</tr>
												<tr>
													<th>A/S 책임자와 전화번호</th>
													<td>휠라코리아㈜ 온라인 고객센터 1577-3472</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<br />
							<br />
							<br />
							<br />
							<br />
						</div>
					</div>
					<h4 class="sec-title">상품고시정보</h4>
					<div class="product-detail-table">
						<table>
							<caption>상품고시정보</caption>
							<colgroup>
								<col style="width: 180px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">종류</th>
									<td>패션잡화 (모자/벨트/액세서리)</td>
								</tr>
								<tr>
									<th scope="row">제품 주소재</th>
									<td>겉감 : 면 97%, 폴리우레탄 3%</td>
								</tr>
								<tr>
									<th scope="row">치수</th>
									<td>057</td>
								</tr>
								<tr>
									<th scope="row">제조자</th>
									<td>휠라코리아㈜</td>
								</tr>
								<tr>
									<th scope="row">수입자/병행수입</th>
									<td>휠라코리아㈜</td>
								</tr>
								<tr>
									<th scope="row">제조국</th>
									<td>한국</td>
								</tr>
								<tr>
									<th scope="row">취급시 주의사항</th>
									<td>상세 취급방법 제품라벨 참조</td>
								</tr>
								<tr>
									<th scope="row">품질보증기준</th>
									<td>관련법 및 소비자 분쟁해결기준에 따름</td>
								</tr>
								<tr>
									<th scope="row">A/S 책임자,전화번호</th>
									<td>FILA코리아 C/S 센터,15773472</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
				<!-- 상품 상세 정보 -->
				<section id="tabContentReview"
					class="anchor-section product-detail-review"></section>

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
											<li>5,000원 (교환상품 배송비 + 2,500원) </br>* 교환배송비는 브랜드/입점사별로 상이할 수
												있습니다.
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">교환/반품 유의사항</th>
									<td>- 상품 수령일로부터 7일 이내 반품/환불 가능합니다. <br /> - 상품하자 이외 사이즈,
										색상교환 등 단순 변심에 의한 교환/반품 택배비 고객부담으로 왕복택배비가 발생합니다. <br /> - 고객
										부주의로 상품이 훼손, 변경된 경우 반품 / 교환이 불가능 합니다. <br /> - 주문완료 후 재고 부족
										등으로 인해 주문 취소 처리가 될 수도 있는 점 양해 부탁드립니다. <br /> - 임의반품은 불가하오니 반드시
										고객센터나 MY Page&gt; 주문취소/교환/반품 신청을 통해서 신청접수를 하시기 바랍니다. <br /> -
										특정브랜드의 상품설명에 별도로 기입된 교환/반품/AS기준이 우선합니다. <br /> - 브랜드별로 배송비가
										상이할 수 있습니다.
									</td>
								</tr>
								<tr>
									<th scope="row">교환안내</th>
									<td>교환 가능 기간 <br /> 교환 신청은 배송 완료 후 7일 내 가능합니다. <br /> <br />
										교환 불가 상품 <br /> 단순 변심의 경우 최초 배송된 상품의 상태와 다를 시 (세탁 또는 착용 후 외출하신
										경우) 교환 및 반품이 불가합니다. <br /> 쥬얼리와 언더웨어 상품은 착용 이후 교환 및 반품이 불가합니다.
										<br /> 맞춤제작의 경우 제작이 시작된 이후에는 취소,교환 및 반품이 불가합니다.
									</td>
								</tr>
								<tr>
									<th scope="row">반품안내</th>
									<td>반품 가능 기간 <br /> 반품 신청은 배송 완료 후 7일 내 가능합니다. <br /> <br />
										반품 불가 상품 <br /> 단순 변심의 경우 최초 배송된 상품의 상태와 다를 시 (세탁 또는 착용 후 외출하신
										경우) 교환 및 반품이 불가합니다. <br /> 쥬얼리와 언더웨어 상품은 착용 이후, 교환 및 반품이
										불가합니다. <br /> 맞춤제작의 경우 제작이 시작된 이후에는 취소,교환 및 반품이 불가합니다. <br />
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
</div>

<%@ include file="../footer.jsp"%>