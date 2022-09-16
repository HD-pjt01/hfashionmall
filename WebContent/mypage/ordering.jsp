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

						<input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].bskNo" value="BK202209144330767" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].godTurn" value="2" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.godNo" value="GM0122040738612" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.itmNo" value="IT202204070494822" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ordQty" value="1" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.dmstcDlvCstPlcSn" value="554"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ovseaDlvPsbYn" value="N"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ovseaDlvDmstcDlvCstPlcSn" value="">
						<input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ovseaDlvCstPlcSn" value=""> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.godTpCd" value="GNRL_GOD"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].recomendComCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].price" value="22000"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].bskNo" value="BK202209144330767"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].godTurn" value="2"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].godNo" value="GM0122040738612"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsPrmNo" value=""> <input
							type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsCouponNo" value=""
						> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsCouponAmt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsCouponDcRt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponDupl" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponDcRt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].maxDcPsbAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponNo" value="CP202209027499854"> <input
							type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponAmt" value="4400"
						> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponDupl" value="PERM"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplSectCd" value="FIXRT"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponDcRt" value="10"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplMaxDcPsbAmt" value="50000"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].bskNo" value="BK202209144330767"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].godTurn" value="2"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].godNo" value="GM0122040738612"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsPrmNo"
							value=""
						> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsCouponNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsCouponDcRt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderCouponNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderCouponDupl" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderCouponDcRt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderStdAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].maxDcPsbAmt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplCouponNo"
							value="CP202209027499854"
						> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplCouponDupl" value="PERM"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplSectCd" value="FIXRT"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplCouponDcRt" value="10"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplStdAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplMaxDcPsbAmt" value="50000"> <input type="hidden" id="godOtskrDlvPsbYn0" name="godOtskrDlvPsbYn" value="Y"> <input type="hidden" id="otskrAditDlvCstLevyYn0" name="otskrAditDlvCstLevyYn" value="Y"> <input type="hidden" id="otskrDlvCst0" name="otskrDlvCst" value="3000"> <input type="hidden" id="dlvSectCd0" name="dlvSectCd" value="GNRL_DLV">
						<!-- body -->
						<div class="body">
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
											<div class="item-brand">TOMMY HILFIGER KIDS</div>
											<div class="item-name">면혼방 로고 플래그 양말 2P</div>
											<div class="item-opt">
												<span> YELLOW, S </span>
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
							</div>
							<!-- //row -->
							<input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].bskNo" value="BK202209144330767" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].godTurn" value="1" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.godNo" value="GM0122040738615" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.itmNo" value="IT202204070494832" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ordQty" value="1" style="background-color: red;"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.dmstcDlvCstPlcSn" value="554"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ovseaDlvPsbYn" value="N"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ovseaDlvDmstcDlvCstPlcSn" value="">
							<input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ovseaDlvCstPlcSn" value=""> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.godTpCd" value="GNRL_GOD"> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].recomendComCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].price" value="22000"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].bskNo" value="BK202209144330767"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].godTurn" value="1"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].godNo" value="GM0122040738615"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsPrmNo" value=""> <input
								type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsCouponNo" value=""
							> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsCouponAmt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsCouponDcRt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponDupl" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponDcRt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].maxDcPsbAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponNo" value="CP202209027499854"> <input
								type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponAmt" value="4400"
							> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponDupl" value="PERM"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplSectCd" value="FIXRT"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponDcRt" value="10"> <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplMaxDcPsbAmt" value="50000"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].bskNo" value="BK202209144330767"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].godTurn" value="1"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderGiftNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].godNo" value="GM0122040738615"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsPrmNo"
								value=""
							> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsCouponNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsCouponDcRt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderCouponNo" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderCouponDupl" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderSectCd" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderCouponDcRt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderStdAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].maxDcPsbAmt" value="0"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplCouponNo"
								value="CP202209027499854"
							> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplCouponDupl" value="PERM"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplSectCd" value="FIXRT"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplCouponDcRt" value="10"> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplStdAmt" value=""> <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplMaxDcPsbAmt" value="50000"> <input type="hidden" id="godOtskrDlvPsbYn1" name="godOtskrDlvPsbYn" value="Y"> <input type="hidden" id="otskrAditDlvCstLevyYn1" name="otskrAditDlvCstLevyYn" value="Y"> <input type="hidden" id="otskrDlvCst1" name="otskrDlvCst" value="3000"> <input type="hidden" id="dlvSectCd1" name="dlvSectCd" value="GNRL_DLV">
							<!-- body -->
							<!-- row -->
							<div class="row">
								<!-- 패키지 명 -->
								<!-- //패키지 명 -->
								<div class="inner">
									<div class="cell-pd">
										<div class="item-img">
											<img src="https://cdn.hfashionmall.com/goods/THBR/22/04/07/GM0122040738615_1_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt="" onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'">
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
							</div>
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
						<input type="hidden" name="dlvPlcCouponList[0].dlvSeq" value="0"> <input type="hidden" name="dlvPlcCouponList[0].dlvPlcSeq" value="1"> <input type="hidden" name="dlvPlcCouponList[0].dlvPlcSn" value="554"> <input type="hidden" name="dlvPlcCouponList[0].dlvCpnNo" value=""> <input type="hidden" name="dlvPlcCouponList[0].dlvCpnNm" value=""> <input type="hidden" name="dlvPlcCouponList[0].dlvCpnDcCd" value=""> <input type="hidden" name="dlvPlcCouponList[0].dlvCpnAmt" value=""> <input type="hidden" name="dlvPlcCouponList[0].cpnSeqNo" value=""> <input type="hidden" name="dlvPlcCouponList[0].paySumAmt" value=""> <input type="hidden" name="dlvPlcCouponList[0].dlvPlcCst" value="0"> <input type="hidden" name="dlvPlcCouponList[0].otskrDlvCst" value="3000"> <input type="hidden" name="dlvPlcCouponList[0].otskrAditDlvCstLevyYn" value="Y">
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
				
					<!-- //주문상품 목록 -->
				</section>

				<section>
					<div class="order-cont">
						<!-- 결제 정보 입력 -->
						<div class="payment-input">

							<!-- 배송지 -->
							<input type="hidden" name="ord.cstmrNm" value="박소은"> <input type="hidden" name="ord.cstmrMobilNationNo" value="82"> <input type="hidden" name="ord.cstmrMobilNo" value="01053865851"> <input type="hidden" name="ord.cstmrTelNationNo" value="82"> <input type="hidden" name="ord.cstmrTelNo" value=""> <input type="hidden" name="ord.cstmrEmail" id="cstmrEmail" value="dpe@nate.com"> <input type="hidden" id="mbrAddrSectCd" value=""> <input type="hidden" name="ord.postNo" value=""> <input type="hidden" name="ord.baseAddr" value=""> <input type="hidden" name="ord.detailAddr" value=""> <input type="hidden" name="ord.ordNo" value="OD202209144350518"> <input type="hidden" name="pay.payNo" value="ST202209144557935"> <input type="hidden" id="isMember" value="1">

						</div>
						<!-- //결제 정보 입력 -->

						<!-- 최종 결제 정보 -->
						<div class="btn-box">
							<a href="javascript:undefined;" id="btnPayment" class="btn-type2-lg">결제하기</a>
						</div>

					</div>
					<!-- //최종 결제 정보 -->
	</div>
	</section>
	</section>
	</form>


	<form id="sendIniPayForm" name="sendIniPayForm" method="POST" style="display: none;">
		<input type="hidden" name="version" value="1.0"> 

	</form>
	</div>
</body>

<%@ include file="../footer.jsp"%>
