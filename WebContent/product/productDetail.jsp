<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
int qnaNo = 1;
int reviewNo = 1;
%>
<!--  <article>
    <h1> Item </h1>
    <div id="itemdetail" >
      <form  method="post" name="formm">    
        <fieldset>
          <legend> Item detail Info</legend>  
          <a href="hfashionmallServlet?command=product_detail&product_code=${productVO.product_code}">         
            <span style="float: left;">
              <img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_01.jpg" 
              style="width:200px; height:200px;"/>
            </span>              
            <%-- <h2>${productVO.product_name}</h2>   --%>
          </a>    
          <label> 가 격 :  </label>
          <p> ${productVO.product_price} 원</p>  
          <label> 수 량 : </label>
          <input  type="text"      name="quantity"  size="2"      value="1"><br>
          <input  type="hidden"    name="product_code"       value="${productVO.product_code}"><br>
        </fieldset>
        <div class="clear"></div>
        <div id="buttons">
          <input type="button" value="장바구니에 담기"   class="submit"    onclick="go_cart()"> 
          <input type="button" value="즉시 구매"       class="submit"    onclick="go_order()"> 
          <input type="reset"  value="취소"           class="cancel">
        </div>
      </form>  
    </div>
  </article>
  -->
<div id="container">
	<br> <br> <br> <br> <br> <br>
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
										- 특정브랜드의 상품설명에 별도로 기입된 교환/반품/AS기준이 우선합니다. <br /> - 브랜드별로 배송비가
										상이할 수 있습니다.
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
										외출하신 경우) 교환 및 반품이 불가합니다. <br /> 쥬얼리와 언더웨어 상품은 착용 이후, 교환 및 반품이
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
	<%--
	<h1>${productVO.product_name}</h1>
	<div class="products-box-info" id="itemdetail">
		<form method="post" name="formm">
			<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
	<div class="products-info-image swiper-container">
		<!-- 이미지 -->
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="product_images/${productVO.product_code}_01.jpg"
					style="width: 200px; height: 200px;" />
				<!-- 동기적으로 불러오기 -->
			</div>
			<div class="swiper-slide">
				<img src="product_images/${productVO.product_code}_02.jpg"
					style="width: 200px; height: 200px;" />
				<!-- 동기적으로 불러오기 -->
			</div>
			<div class="swiper-slide">
				<img src="product_images/${productVO.product_code}_03.jpg"
					style="width: 200px; height: 200px;" />
				<!-- 동기적으로 불러오기 -->
			</div>
			<div class="swiper-slide">
				<img src="product_images/${productVO.product_code}_04.jpg"
					style="width: 200px; height: 200px;" />
				<!-- 동기적으로 불러오기 -->
			</div>
		</div>
	</div>
	<span class="products-info-desciption">※ 이미지를 좌우로 드래그하면 더 많은
		이미지를 확인하실 수 있습니다.</span>

	<div class="products-box-detail">
		<div class="products-box-detail-name">
			<!-- 상품명 -->
			<span>${productVO.product_name}</span>
		</div>
		<div class="products-box-detail-price">
			<!-- 가격 -->
			<span class="products-box-detail-price-figure">${productVO.product_price}</span>
			<span>원</span>
		</div>
		<div class="products-box-detail-allPrice">
			<span class="products-box-detail-allPrice-title">상품 금액</span> <span
				class="products-box-detail-allPrice-figure"> <fmt:formatNumber
					value="${productVO.product_price}" type="number" />원
			</span>
		</div>
		<!-- 버튼 시작 -->
		<button type="button" class="buy-btn" onclick="go_order()">바로
			구매</button>
		<!-- 장바구니 버튼 시작 -->
		<button type="button" class="cart-btn" onclick="go_cart();">
			<i class="material-icons">shopping_cart</i>
		</button>
		<!-- 장바구니 버튼 끝 -->
		<!-- 버튼 끝 -->
	</div>
	</form>
</div>

	<div class="wrap-detail-info">
		<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
		<div class="tab-detail-info">
			<ul class="tab">
				<li class="active" id="tab-img-text"><a
					href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
				<li class="active" id="tab-review"><a href="#detail-review-box"
					id="tab-review-a">리뷰</a></li>
				<li class="active" id="tab-qna"><a href="#detail-qna-box"
					id="tab-qna-a">Q&amp;A</a></li>
				<li class="active" id="tab-purchaseInfo"><a
					href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">주문정보</a></li>
			</ul>
		</div>
		<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

		<!-- 상품 상세 설명 이미지/글 시작 -->
		<!-- 우측 하단 sticky  
		<div class="detail-sticky-go-to-top-btn-box">
			<a href="#" class="detail-sticky-go-to-top-btn-a">
				<img class="detail-sticky-go-to-top-btn-img" src="/shop/images/build/arrowUp.png" />
			</a>
		</div>-->
		<!-- 우측 하단 sticky 끝 -->
		<div id="detail-img-text-box">${productVO.product_color}</div>
		<!-- 상품 상세 설명 이미지/글 끝 -->



		<!-- 주문정보 시작 -->
		<div id="detail-purchaseInfo-box">
			<div class="detail-purchaseInfo-header">
				주문정보 <span class="products-box-detail-realInfo-popover"
					onclick="addressInfoBox();"> ∨ </span>
			</div>
			<div id="addressInfo-box">
				<b>[배송 정보 ]</b><br />
				<p>
					고객센터 연락이 어려우니 게시판에 문의주시면 빠르게 답변드리도록 하겠습니다.<br />
					CJ대한통운(1588-1255)택배를 이용하며, 매일 오후 1시 전 주문까지만 당일발송합니다.<br /> 발송한날로부터
					1~3일 이내 받아보실수 있습니다.<br /> (택배사의 영업사정에 따라 배송지연이 있을 수 있습니다.)
				</p>
				<b>[ 교환/환불 정보 ]</b><br />
				<p>
					상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br /> 환불요청 가능 기간은 상품 수령
					후(배송완료 시점으로부터) 7일 이내입니다.<br /> 교환/환불이 발생하는 경우 그 원인을 제공한 자가 배송비를
					부담합니다.<br /> - 고객변심 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 고객이 부담<br />
					- 판매자귀책 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 판매자가 부담<br /> 다음의 경우는
					예외적으로 교환 및 환불이 불가능합니다.<br /> - 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우<br />
					- 소비자 과실로 인한 옷의 변색(예 : 착색, 화장품, 오염 등)<br /> - 착용으로 인한 니트류 상품의 늘어남
					발생 및 가죽 제품의 주름 발생<br /> - 기타 착용 흔적 : 택 제거 등<br /> - 구매확정된 주문의 경우<br />
					- 귀금속류의 경우는 소비자분쟁조정기준에 의거 교환만 가능합니다.<br /> (단, 함량미달의 경우에는 환불이 가능함)<br />
					구매자 단순변심은 상품수령후 7일이내(구매자 반품배송비 부담)
				</p>
			</div>
		</div>
		<!-- 주문정보 끝 -->

	</div>
</div> --%>
	<!-- 아래 박스 전체 끝 -->
	<script type="text/javascript" src="javascript/product.js"></script>
	<%@ include file="../footer.jsp"%>