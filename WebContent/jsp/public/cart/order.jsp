<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>

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

        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].bskNo" value="BK202209144330767" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].godTurn" value="2" style="background-color: red;">

        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.godNo" value="GM0122040738612" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.itmNo" value="IT202204070494822" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ordQty" value="1" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.dmstcDlvCstPlcSn" value="554">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ovseaDlvPsbYn" value="N">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ovseaDlvDmstcDlvCstPlcSn" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.ovseaDlvCstPlcSn" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.godTpCd" value="GNRL_GOD">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].recomendComCd" value="">

        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[0].price" value="22000">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].bskNo" value="BK202209144330767">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].godTurn" value="2">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].godNo" value="GM0122040738612">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsPrmNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsCouponAmt" value="0">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].goodsCouponDcRt" value="0">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponAmt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponDupl" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].orderCouponDcRt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].maxDcPsbAmt" value="">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponNo" value="CP202209027499854">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponAmt" value="4400">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponDupl" value="PERM">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplSectCd" value="FIXRT">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplCouponDcRt" value="10">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[0].duplMaxDcPsbAmt" value="50000">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].bskNo" value="BK202209144330767">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].godTurn" value="2">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].godNo" value="GM0122040738612">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsPrmNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].goodsCouponDcRt" value="0">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderCouponDupl" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderCouponDcRt" value="0">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].orderStdAmt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].maxDcPsbAmt" value="0">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplCouponNo" value="CP202209027499854">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplCouponDupl" value="PERM">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplSectCd" value="FIXRT">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplCouponDcRt" value="10">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplStdAmt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[0].duplMaxDcPsbAmt" value="50000">

        <input type="hidden" id="godOtskrDlvPsbYn0" name="godOtskrDlvPsbYn" value="Y">
        <input type="hidden" id="otskrAditDlvCstLevyYn0" name="otskrAditDlvCstLevyYn" value="Y">
        <input type="hidden" id="otskrDlvCst0" name="otskrDlvCst" value="3000">
        <input type="hidden" id="dlvSectCd0" name="dlvSectCd" value="GNRL_DLV">
<!-- body -->
    <div class="body">
    <!-- row -->
        <div class="row">
            <!-- 패키지 명 -->
            <!-- //패키지 명 -->
            <div class="inner">
                <div class="cell-pd">
                    <div class="item-img"><img src="https://cdn.hfashionmall.com/goods/THBR/22/04/07/GM0122040738612_1_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt="" onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'"></div>
                    <div class="item-info">
                        <div class="item-brand">TOMMY HILFIGER KIDS</div>
                        <div class="item-name">면혼방 로고 플래그 양말 2P</div>
                        <div class="item-opt">
                            <span>
                                YELLOW, S
                            </span>
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
    <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].bskNo" value="BK202209144330767" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].godTurn" value="1" style="background-color: red;">

        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.godNo" value="GM0122040738615" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.itmNo" value="IT202204070494832" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ordQty" value="1" style="background-color: red;">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.dmstcDlvCstPlcSn" value="554">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ovseaDlvPsbYn" value="N">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ovseaDlvDmstcDlvCstPlcSn" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.ovseaDlvCstPlcSn" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].ordGod.godTpCd" value="GNRL_GOD">
        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].recomendComCd" value="">

        <input type="hidden" name="lgsDlvspDTOList[0].ordGodDTOList[1].price" value="22000">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].bskNo" value="BK202209144330767">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].godTurn" value="1">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].godNo" value="GM0122040738615">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsPrmNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsCouponAmt" value="0">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].goodsCouponDcRt" value="0">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponAmt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponDupl" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].orderCouponDcRt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].maxDcPsbAmt" value="">

        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponNo" value="CP202209027499854">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponAmt" value="4400">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponDupl" value="PERM">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplSectCd" value="FIXRT">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplCouponDcRt" value="10">
        <input type="hidden" name="lgsDlvspDTOList[0].couponDTOList[1].duplMaxDcPsbAmt" value="50000">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].bskNo" value="BK202209144330767">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].godTurn" value="1">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderGiftNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].godNo" value="GM0122040738615">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsPrmNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].goodsCouponDcRt" value="0">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderCouponNo" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderCouponDupl" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderSectCd" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderCouponDcRt" value="0">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].orderStdAmt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].maxDcPsbAmt" value="0">

        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplCouponNo" value="CP202209027499854">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplCouponDupl" value="PERM">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplSectCd" value="FIXRT">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplCouponDcRt" value="10">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplStdAmt" value="">
        <input type="hidden" name="lgsDlvspDTOList[0].calcCouponDTOList[1].duplMaxDcPsbAmt" value="50000">

        <input type="hidden" id="godOtskrDlvPsbYn1" name="godOtskrDlvPsbYn" value="Y">
        <input type="hidden" id="otskrAditDlvCstLevyYn1" name="otskrAditDlvCstLevyYn" value="Y">
        <input type="hidden" id="otskrDlvCst1" name="otskrDlvCst" value="3000">
        <input type="hidden" id="dlvSectCd1" name="dlvSectCd" value="GNRL_DLV">
<!-- body -->
    <!-- row -->
        <div class="row">
            <!-- 패키지 명 -->
<!-- //패키지 명 -->
            <div class="inner">
                <div class="cell-pd">
                    <div class="item-img"><img src="https://cdn.hfashionmall.com/goods/THBR/22/04/07/GM0122040738615_1_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt="" onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'"></div>
                    <div class="item-info">
                        <div class="item-brand">TOMMY HILFIGER KIDS</div>
                        <div class="item-name">면혼방 배색 패턴 크루삭스 2P</div>
                        <div class="item-opt">
                            <span>
                                BEIGE, S
</span>
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
                    <span class="sort">
                        [본사배송]</span>
                        <span class="price" id="deliverySubgrp1-554">무료배송</span>
                                    <span class="sub">
                        3만원 미만 결제시
                            <br>
                        2,500원
                    </span>
                        </p>
                </div>
            </div>
            <!-- //배송정보 -->
        </div>
        <!-- //body -->
        <input type="hidden" name="dlvPlcCouponList[0].dlvSeq" value="0">
        <input type="hidden" name="dlvPlcCouponList[0].dlvPlcSeq" value="1">
        <input type="hidden" name="dlvPlcCouponList[0].dlvPlcSn" value="554">
        <input type="hidden" name="dlvPlcCouponList[0].dlvCpnNo" value="">
        <input type="hidden" name="dlvPlcCouponList[0].dlvCpnNm" value="">
        <input type="hidden" name="dlvPlcCouponList[0].dlvCpnDcCd" value="">
        <input type="hidden" name="dlvPlcCouponList[0].dlvCpnAmt" value="">
        <input type="hidden" name="dlvPlcCouponList[0].cpnSeqNo" value="">
        <input type="hidden" name="dlvPlcCouponList[0].paySumAmt" value="">
        <input type="hidden" name="dlvPlcCouponList[0].dlvPlcCst" value="0">
        <input type="hidden" name="dlvPlcCouponList[0].otskrDlvCst" value="3000">
        <input type="hidden" name="dlvPlcCouponList[0].otskrAditDlvCstLevyYn" value="Y">
    </div>
<!-- 입점 판매 상품 안내 -->
<div id="layerSaleInfo" class="layer-pop" tabindex="0">
    <div class="layer-wrap" tabindex="0">
        <div class="layer-header">
            <h2 class="layer-title">입점 판매 상품 안내</h2>
        </div>
        <div class="layer-container">
            <div class="layer-content sale-info">
                <p class="txt-common">입점 판매 상품 구매 시, <br>아래 내용을 참고해 주시기 바랍니다.</p>
                <!-- 2021.03.16 수정 -->
				<ul class="txt-list">
					<li>H패션몰 입점 파트너 상품들은 장바구니에서 [입점 판매 상품]으로 표시됩니다.</li>
					<li>[입점 판매 상품]은 쿠폰 이름에 <span class="pcolor">[입점 상품 전용 쿠폰]이 표기된 쿠폰</span>만 사용 가능합니다. 자사 상품과 함께 주문 시 자사 상품 전용 쿠폰 사용은 가능하나 [입점 판매 상품]은 자동으로 할인에서 제외됩니다. (일부 쿠폰 제외)</li>
					<li>할인 적용 제외 자사 전용 쿠폰 예시
						<ul class="txt-list2">
							<li>기간한정, 신데렐라 쿠폰, 룰렛 당첨 쿠폰, 무료배송/교환/반품 쿠폰 등 H패션몰 자사브랜드 전용 쿠폰</li>
						</ul>
					</li>
				</ul>
                <p class="contact-cs">
                    입점 판매 상품 관련 궁금하신 내용은 1:1문의 또는 고객센터(1800-5700)로 문의해<br> 주시기 바랍니다.
                </p>
                <!-- //2020.07.29 수정 -->
            </div>
        </div>
        <button type="button" class="btn-layer-close" onclick="layer.close('layerSaleInfo');">닫기</button>
    </div>
</div>
<!-- //입점 판매 상품 안내 -->
<script>
    $(document).ready(function() {
        coupon.deliveryPlaceList = [];

        
        let delv = {
            delvSeq: 0
            , delvCpnNo: ''
            , delvCpnNm: ''
            , delvCpnAmt: 0
        }
        coupon.deliveryPlaceList.push(delv);

        $(".btnListDlvCoupon").on("click", function () {
            let addrsePostNo = $("#{0}AddrsePostNo".format(dlvspType)).val();
            let addrseBaseAddr = $("#{0}AddrseBaseAddr".format(dlvspType)).val();
            let addrseDetailAddr = $("#{0}AddrseDetailAddr".format(dlvspType)).val();
            if (!(addrsePostNo && addrseBaseAddr && addrseDetailAddr)) {
                orderAlert("배송비 쿠폰은 '배송지 정보'를 먼저 입력하셔야 사용할 수 있습니다.");
                return;
            }

            let data = $('#orderDTO').serialize();
            data += "\&selDlvPlcSn={0}".format($(this).data("plcsn"));

            orderView.coupon.openDlvPopup(data);
        });

        $(".btnCancelDlvCoupon").on("click", function () {
            let seq = $(this).data("seq");
            let dlvPlcSn = $(this).data("plcsn");

            coupon.resetDeliveryCoupon(seq, dlvPlcSn);
        });
    });
</script><!-- //주문상품 목록 -->                
    </section>

    <section>
        <div class="order-cont">
            <!-- 결제 정보 입력 -->
            <div class="payment-input">

                <!-- 배송지 -->
                <input type="hidden" name="ord.cstmrNm" value="박소은">
<input type="hidden" name="ord.cstmrMobilNationNo" value="82">
<input type="hidden" name="ord.cstmrMobilNo" value="01053865851">
<input type="hidden" name="ord.cstmrTelNationNo" value="82">
<input type="hidden" name="ord.cstmrTelNo" value="">
<input type="hidden" name="ord.cstmrEmail" id="cstmrEmail" value="dpe@nate.com">

<input type="hidden" id="mbrAddrSectCd" value="">
<input type="hidden" name="ord.postNo" value="">
<input type="hidden" name="ord.baseAddr" value="">
<input type="hidden" name="ord.detailAddr" value="">

<input type="hidden" name="ord.ordNo" value="OD202209144350518">
<input type="hidden" name="pay.payNo" value="ST202209144557935">

<input type="hidden" id="isMember" value="1">


     


            
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

<script type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://pg.cnspay.co.kr/dlp/scripts/smilepay.js" charset="EUC-KR"></script>
<script type="text/javascript" src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script type="text/javascript" src="https://pay.kcp.co.kr/plugin/payplus_web.jsp" id="kcpUrl"></script><style type="text/css">                                                                                      .kcpTransDiv{                                                                                                filter:alpha(opacity=10); -khtml-opacity: 0.1; -moz-opacity: 0.1; opacity: 0.1; top:0px; left:0;         background-color:#000000; width:100%; height:100%; position:absolute; z-index:10000;                 }                                                                                                    </style>                                                                                                 <div id="kcp_content" style="background-color: white;"></div>                                           <div id="kcp_mask" class="kcpTransDiv" style="display:none"></div>                                       <div id="kcp_progress" class="spin_container"></div>                                                     <script type="text/javascript" src="https://pay.kcp.co.kr/plugin/js/ajax.js?LYY8EMTUUYS69QV0MS8L6BEHN6S48GUN" charset="EUC-KR"></script><script type="text/javascript" src="https://pay.kcp.co.kr/plugin/cross_service/extends/util.js?LYY8EMTUUYS69QV0MS8L6BEHN6S48GUN" charset="EUC-KR"></script><script type="text/javascript" src="https://pay.kcp.co.kr/plugin/cross_service/extends/spin.min.js?LYY8EMTUUYS69QV0MS8L6BEHN6S48GUN"></script><script type="text/javascript" src="https://pay.kcp.co.kr/plugin/js/payplus_webExe.js?LYY8EMTUUYS69QV0MS8L6BEHN6S48GUN" charset="EUC-KR"></script><script type="text/javascript" src="https://npay.kcp.co.kr/plugin/web_cross_hub.js?LYY8EMTUUYS69QV0MS8L6BEHN6S48GUN" charset="EUC-KR"></script><script type="text/javascript" src="https://npay.kcp.co.kr/js/kcp_jquery-1.8.0.js?ver=SW685HEZHBN34X0CQ5NQ212EIO6MD0AH" charset="EUC-KR"></script><script type="text/javascript" src="https://npay.kcp.co.kr/js/kcp_jquery.blockUI.js" charset="EUC-KR"></script><script type="text/javascript" src="https://npay.kcp.co.kr/js/ClientDataHandler.js?ver=SW685HEZHBN34X0CQ5NQ212EIO6MD0AH" charset="EUC-KR"></script><script type="text/javascript" src="https://npay.kcp.co.kr/js/json2.js" charset="EUC-KR"></script><div id="kcp_event_form"><form name="KCP_Auth_Hidden"><input name="res_cd" value="9992" type="hidden"><input name="res_msg" value="KCP DOMAIN이 아닙니다." type="hidden"></form></div><script type="text/javascript" src="https://npay.kcp.co.kr/js/npayUtils.js?ver=SW685HEZHBN34X0CQ5NQ212EIO6MD0AH" charset="EUC-KR"></script>
<script src="https://pay-auth.sk-pay.co.kr/pages/js/v3/lib/crypto/encryptedUserAgent.js"></script>
<script src="https://pay-auth.sk-pay.co.kr/pages/skpay/SKpaySDK.js"></script>

<script src="/hfm_pc/resources/js/order/validator_payment.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/basic.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/jquery.mailtip.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/parameter.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/auth.js?timestamp=20220914145945"></script>

<script src="/hfm_pc/resources/js/order/orderView.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/page.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/delivery.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/coupon.js?timestamp=20220914145945"></script>

<script src="/hfm_pc/resources/js/juso.js?timestamp=20220914145945"></script>
<script src="/hfm_pc/resources/js/order/ad.js?timestamp=20220914145945"></script>

<script type="text/javascript">
    orderSum.goodsSumAmount = parseFloat(44000);			// 상품금액 합계
    orderSum.discountSumAmount = parseFloat(0);	// 할인금액 합계
    orderSum.deliverySumAmount = parseFloat(0);		// 배송비 합계

    pointInfo.holdingPoint = parseFloat(0);			// 보유포인트
    pointInfo.holdingMileage = parseFloat(0);		// 보유마일리지
    pointInfo.holdingWebpnt = parseFloat(0);			    // 보유 H.Plus
    pointInfo.holdingHyundaiPoint = parseFloat(0);	// 보유 현대포인트

    if (pointInfo.holdingPoint < 0) {
        pointInfo.holdingPoint = 0;
    }

    if (pointInfo.holdingMileage < 0) {
        pointInfo.holdingMileage = 0;
    }

    if (pointInfo.holdingWebpnt < 0) {
        pointInfo.holdingWebpnt = 0;
    }

    if (pointInfo.holdingHyundaiPoint < 0) {
        pointInfo.holdingHyundaiPoint = 0;
    }

    
    let orderItem0 = {
        seq : '0'
        , prcType : 'GNRL'
        , godNm : '면혼방 로고 플래그 양말 2P'
        , godNo : 'GM0122040738612'
        , itmNo : 'IT202204070494822'
        , skuNo : 'T42C6ACK04CBT1758S'
        , bskNo : 'BK202209144330767'
        , godTurn : '2'
        , freeTswrGodSectCd : 'GNRL'

        , categoryNo : 'HFMA03^HFMA03A01^HFMA03A01A10'
        , categoryNm : '키즈/남아/악세서리'

        , brndNm : 'TOMMY HILFIGER KIDS'
        , colorNm : 'YELLOW'
        , itmQty : 1
        , pntUseYn : 'Y'
        , pntAccmlYn : 'Y'
        , pntAccmlRt : '0.1'

        , pntAddAccmlPrmNo : ''
        , pntAddAccmlSectCd : ''
        , pntAddAccmlPrc : 0
        , pntAddAccmlRt : 0
        , mileUseYn : 'Y'
        , mileAccmlYn : 'Y'
        , mileAccmlRt : 1

        , preMileUsePsbYn : 'N'

        , mileAddAccmlPrmNo : ''
        , mileAddAccmlSectCd : ''
        , mileAddAccmlPrc : 0
        , mileAddAccmlRt : 0
        , webpntUseYn : 'Y'

        
        , godPrc : 22000
        , itemQty : 1
        , godAmt : 22000
        , bskCpnAplYn : 'Y'
        , imdtlDcCpnPrc: 0
        , imdtlDcCpnAmt: 0
        , godPrmDcPrc : 0
        , godPrmDcAmt : 0
        , bskPrmNo : ''
        , bskPrmNm : ''
        , bskPrmDcPrc : 0
        , bskPrmDcAmt : 0

        , godCpnDcAmt : 0
        , bskCpnDcAmt : 0
        , dupCpnDcAmt : 0

        , getTotalDcAmt : function() { 
            return this.godCpnDcAmt + this.bskCpnDcAmt + this.dupCpnDcAmt;
        }

        , mileUseAmt : 0
        , pntUseAmt : 0
        , webpntUseAmt : 0
        , wlfrmallPntUseAmt : 0
        , hyundaiPntUseAmt : 0
        , imdtlAmt : 0

        , getPayAmt : function() { 
            return this.godAmt - this.godPrmDcAmt - this.imdtlDcCpnAmt - this.bskPrmDcAmt - this.getTotalDcAmt();
        }

        , getOnlyPrdAmt : function() { 
            return this.godAmt - this.godPrmDcAmt - this.imdtlDcCpnAmt;
        }

        , getPayment : function() { 
            return this.getPayAmt() - this.mileUseAmt - this.pntUseAmt - this.webpntUseAmt - this.imdtlAmt;
        }

        
        , coupon : {
            godCpnNo : ""
            , godCpnPrmNo : ""
            , godCpnDcPrc : 0
            , godCpnDcRt : 0
            , godCpnSectCd : ""

            , ordCpnNo : ""
            , ordCpnTotalAmt : 0
            , ordCpnAmt : 0
            , ordCpnDcRt : 0
            , ordCpnMaxPsbAmt : 0
            , ordCpnStdAmt : 0
            , ordCpnDupl : ""
            , ordCpnSectCd : ""

            , dupCpnNo : ""
            , dupCpnTotalAmt : 0
            , dupCpnAmt : 0
            , dupCpnDcRt : 0
            , dupCpnMaxPsbAmt : 0
            , dupCpnStdAmt : 0
            , dupCpnDupl : ""
            , dupCpnSectCd : ""
        }

        
        , dlvCst : 2500
        , dlvCstExrnStdrAmt : 30000
        , dlvCstLevySectCd : 'COND_FREE'
        
        , goodsDlvCstPlcSn : 554
        , subGrpSeq : 1
        , resetCpnNo : ''
        , resetCpnAplyDcAmt : 0
        , resetCpnAplybalancedDcAmt : 0
        , resetCpnDcSectCd : ''
        , resetCpnDcRt : 0

    };

    

    orderItems.push(orderItem0);
    
    let orderItem1 = {
        seq : '1'
        , prcType : 'GNRL'
        , godNm : '면혼방 배색 패턴 크루삭스 2P'
        , godNo : 'GM0122040738615'
        , itmNo : 'IT202204070494832'
        , skuNo : 'T42C6ACK020BT1010S'
        , bskNo : 'BK202209144330767'
        , godTurn : '1'
        , freeTswrGodSectCd : 'GNRL'

        , categoryNo : 'HFMA03^HFMA03A01^HFMA03A01A10'
        , categoryNm : '키즈/남아/악세서리'

        , brndNm : 'TOMMY HILFIGER KIDS'
        , colorNm : 'BEIGE'
        , itmQty : 1
        , pntUseYn : 'Y'
        , pntAccmlYn : 'Y'
        , pntAccmlRt : '0.1'

        , pntAddAccmlPrmNo : ''
        , pntAddAccmlSectCd : ''
        , pntAddAccmlPrc : 0
        , pntAddAccmlRt : 0
        , mileUseYn : 'Y'
        , mileAccmlYn : 'Y'
        , mileAccmlRt : 1

        , preMileUsePsbYn : 'N'

        , mileAddAccmlPrmNo : ''
        , mileAddAccmlSectCd : ''
        , mileAddAccmlPrc : 0
        , mileAddAccmlRt : 0
        , webpntUseYn : 'Y'

        
        , godPrc : 22000
        , itemQty : 1
        , godAmt : 22000
        , bskCpnAplYn : 'Y'
        , imdtlDcCpnPrc: 0
        , imdtlDcCpnAmt: 0
        , godPrmDcPrc : 0
        , godPrmDcAmt : 0
        , bskPrmNo : ''
        , bskPrmNm : ''
        , bskPrmDcPrc : 0
        , bskPrmDcAmt : 0

        , godCpnDcAmt : 0
        , bskCpnDcAmt : 0
        , dupCpnDcAmt : 0

        , getTotalDcAmt : function() { 
            return this.godCpnDcAmt + this.bskCpnDcAmt + this.dupCpnDcAmt;
        }

        , mileUseAmt : 0
        , pntUseAmt : 0
        , webpntUseAmt : 0
        , wlfrmallPntUseAmt : 0
        , hyundaiPntUseAmt : 0
        , imdtlAmt : 0

        , getPayAmt : function() { 
            return this.godAmt - this.godPrmDcAmt - this.imdtlDcCpnAmt - this.bskPrmDcAmt - this.getTotalDcAmt();
        }

        , getOnlyPrdAmt : function() { 
            return this.godAmt - this.godPrmDcAmt - this.imdtlDcCpnAmt;
        }

        , getPayment : function() { 
            return this.getPayAmt() - this.mileUseAmt - this.pntUseAmt - this.webpntUseAmt - this.imdtlAmt;
        }

        
        , coupon : {
            godCpnNo : ""
            , godCpnPrmNo : ""
            , godCpnDcPrc : 0
            , godCpnDcRt : 0
            , godCpnSectCd : ""

            , ordCpnNo : ""
            , ordCpnTotalAmt : 0
            , ordCpnAmt : 0
            , ordCpnDcRt : 0
            , ordCpnMaxPsbAmt : 0
            , ordCpnStdAmt : 0
            , ordCpnDupl : ""
            , ordCpnSectCd : ""

            , dupCpnNo : ""
            , dupCpnTotalAmt : 0
            , dupCpnAmt : 0
            , dupCpnDcRt : 0
            , dupCpnMaxPsbAmt : 0
            , dupCpnStdAmt : 0
            , dupCpnDupl : ""
            , dupCpnSectCd : ""
        }

        
        , dlvCst : 2500
        , dlvCstExrnStdrAmt : 30000
        , dlvCstLevySectCd : 'COND_FREE'
        
        , goodsDlvCstPlcSn : 554
        , subGrpSeq : 1
        , resetCpnNo : ''
        , resetCpnAplyDcAmt : 0
        , resetCpnAplybalancedDcAmt : 0
        , resetCpnDcSectCd : ''
        , resetCpnDcRt : 0

    };

    

    orderItems.push(orderItem1);
    

    coupon.dlvPlcCouponList = [];
    
    let dlvPlc0 = {
        dlvSeq : 0
        , dlvPlcSeq : '1'
        , dlvPlcSn : '554'
        , dlvCpnNo : ''
        , dlvCpnNm : ''
        , dlvCpnAmt : 0
        , cpnSeqNo : ''
        , paySumAmt : 0
        , dlvPlcCst : 0
        , otskrDlvCst : 3000
        , otskrAditDlvCstLevyYn : 'Y'
        , dlvCpnDcCd : 	''
    }

    coupon.dlvPlcCouponList.push(dlvPlc0);
    

    /*point arrange*/
    
    order.setPointUseSumAmount(0);
    order.setMileageUseSumAmount(0);
    order.setWebpntUseSumAmount(0);

    
    deliveryInfo.isFirst = true;
    deliveryInfo.searchDelv = 'member';
    deliveryInfo.dlvPcupspSectCd = 'ORD_DLVSP';
    deliveryInfo.dlvSectCd = 'GNRL_DLV';
    //deliveryInfo.dlvMnCd = 'APPN_HDRY';
    deliveryInfo.dlvMemo = "";
    deliveryInfo.cstmrNm = '박소은';
    deliveryInfo.cstmrEmail = 'dpe@nate.com';
    deliveryInfo.cstmrMobilNo = '01053865851';
    deliveryInfo.cstmrMobilNationNo = '82';
    deliveryInfo.cstmrTelNo = '';
    deliveryInfo.cstmrTelNationNo = '';
    deliveryInfo.cstmrAddrNationCd = '';
    deliveryInfo.cstmrAddrSectCd = '';
    deliveryInfo.cstmrPostNo = '';    
    deliveryInfo.cstmrBaseAddr = '';
    deliveryInfo.cstmrDetailAddr = '';

    /* 최근배송지 */
    deliveryInfo.addrSectCd = '';
    deliveryInfo.addrseNm = '';
    deliveryInfo.addrseNationCd = '';
    deliveryInfo.addrsePostNo = '';
    deliveryInfo.addrseBaseAddr = '';    
    deliveryInfo.addrseDetailAddr = '';
    deliveryInfo.addrseMobilNationNo = '';
    deliveryInfo.addrseMobilNo = '';
    deliveryInfo.addrseTelNationNo = '';
    //deliveryInfo.addrseTelNo = '';

    /* 기본 배송지 */
    deliveryInfo.baseAddrseNm = '';
    deliveryInfo.baseAddrseNationCd = '';
    deliveryInfo.baseAddrSectCd = '';
    deliveryInfo.baseAddrsePostNo = '';
    deliveryInfo.baseAddrseBaseAddr = '';
    deliveryInfo.baseAddrseDetailAddr = '';
    deliveryInfo.baseAddrseMobilNationNo = '';
    deliveryInfo.baseAddrseMobilNo = '';
    deliveryInfo.baseAddrseTelNationNo = '';
    //deliveryInfo.baseAddrseTelNo = '';

    deliveryInfo.pkupShopId = '';
    deliveryInfo.pickupDelvPostNo = '';
    deliveryInfo.pickupDelvBaseAddr = '';
    deliveryInfo.pickupDelvDetailAddr = '';

    
    var delv = {
        delvSeq : 0
        , delvCpnNo : ''
        , delvCpnNm : ''
        , delvCpnAmt : 0
    }
    coupon.deliveryPlaceList.push(delv);
</script>

<script type="text/javascript">
    $(document).ready(function(){
        spinner.hide();

        
            if(isMem) {
                $("input[name='method'][value='CARD_EASN_PAY']").trigger("click");
            } else {
                $("input[name='method'][value='OTHER_PAY']").trigger("click");
            }
            

        // 배송유형이 ‘택배’ 인 경우
        // 상품에 설정되어 있는 배송정책에 [업체 기본정보> 배송정책> 도서산간 추가 배송비> ‘추가 배송비 부과’ 로 설정]한 상품이 하나라도 포함
        // 배송지에서 도서산간에 해당하는 우편번호가 선택되어 있는 경우
        // '도서산간 추가 배송비 발생 지역입니다.' 문구 노출
        let otskrAditDlvCstLevyCnt = 0;
        if (deliveryInfo.dlvSectCd == 'GNRL_DLV') {
            $("input[name=otskrAditDlvCstLevyYn]").each(function (index) {
                var otskrAditDlvCstLevyYn = $("input[name=otskrAditDlvCstLevyYn]").eq(index).val();
                var otskrZipCodeYn = $("input[name=otskrZipCodeYn]").eq(index).val();
                if (otskrAditDlvCstLevyYn == "Y" && otskrZipCodeYn == "Y") {
                    otskrAditDlvCstLevyCnt++;
                }
            });
        }

        coupon.arrangePoint(); // 가용 포인트 및 주문서 금액 계산
        coupon.calcDlvAmtByPolicy('dlv');

        coupon.loadCouponList(true);
        coupon.confirmCoupon(true);

        AD_SCRIPT.GA_ORDER_LOAD(orderItems);
    });

    let chkint = 0;
    let bskTpCd = 'BSK';
    let chkPaymethod = '';

    $("#btnPayment").click(function () {
    	btnPaymentF();
    }).dblclick(function(e) {
        console.log("double-clicked but did nothing");
        e.stopPropagation();
        e.preventDefault();
        return false;
    });
    
    function btnPaymentF()
    {
    	if (chkint++ > 0) {
            return;
        }
        
      //택배사 배송제한 우편번호 체크
		var dlvPostNo = $('#{0}AddrsePostNo'.format(dlvspType)).val();
		dlvDisenblYn = "N";
    	  
    	
        spinner.show();

        let otskrDlv = 0;
        // 도서산간 배송불가로 설정되어 있는 상품을 주문하면서 배송지를 도서산간 지역으로 선택했을 경우
        let otskrZipCodeYn = $("#otskrZipCodeYn").val();
        $("input[name=godOtskrDlvPsbYn]").each(function(index){
            let godOtskrDlvPsbYn = $("input[name=godOtskrDlvPsbYn]").eq(index).val();
            if(godOtskrDlvPsbYn == "N" && otskrZipCodeYn == "Y"){
                otskrDlv++;
            }
        });

        if (otskrDlv > 0) {
            return order.initOrder("도서산간 지역 배송 불가 상품이 포함되어 있습니다.\n주문상품을 다시 선택해 주세요.");
        }

        chkPaymethod = $('input[name="pay.payMnCd"]').val();
        let godTpCd = $('input[name="lgsDlvspDTOList[0].ordGodDTOList[0].ordGod.godTpCd"]').val();
        let frmObj = document.forms['orderDTO'];
        parameter.ordTpCd = 'GNRL_ORD';
        parameter.reservationGoods = '';
        parameter.resveOrdPaySectCd = '';
        parameter.resveOrdPartPayAmt = '';
        parameter.resveOrdPayClosDt = '';
        parameter.resveOrdDlivyPrearngeDate = '';
        parameter.resveOrdDlivyAprvCd = 'APRV_WAIT';

        order.ordering(frmObj, godTpCd);
    }
</script>

<script type="text/javascript">
    function setWpay(flg) {
        checkWpay = flg;
    }

    $(".payMnCd").on('click', function () {
        let payMnCd = $(this).find('input[type="radio"]').val();
        if (payMnCd != 'OTHER_PAY') {
            $("#payMnCd").val(payMnCd);
        } else {
            $("#payMnCd").val($("input[name='method2']:checked").val());
        }
    });
</script>

<form id="sendIniPayForm" name="sendIniPayForm" method="POST" style="display:none;">
    <input type="hidden" name="version" value="1.0">
    <input type="hidden" name="mid" value="">
    <input type="hidden" name="goodname" value="">
    <input type="hidden" name="oid" value="">
    <input type="hidden" name="price" value="">
    <input type="hidden" name="currency" value="WON">
    <input type="hidden" name="buyername" value="">
    <input type="hidden" name="buyertel" value="">
    <input type="hidden" name="buyeremail" value="">
    <input type="hidden" name="timestamp" value="">
    <input type="hidden" name="signature" value="">
    <input type="hidden" name="returnUrl" value="">
    <input type="hidden" name="mKey" value="">

<input type="hidden" name="gopaymethod" value="">
    <input type="hidden" name="quotabase" value="">

    <input type="hidden" name="nointerest" value="">

<input type="hidden" name="acceptmethod" value="">

    <input type="hidden" name="languageView" value="ko">

<input type="hidden" name="charset" value="UTF-8">
    <input type="hidden" name="closeUrl" value="">
    <input type="hidden" name="popupUrl" value="">

<input type="hidden" name="ini_onlycardcode" value="">

<input type="hidden" name="ini_cardcode" value="">

<input type="hidden" name="ansim_quota" value="">

<input type="hidden" name="vbankRegNo" value="">

<input type="hidden" name="merchantData" value="">

</form></div>
</body>

<%@ include file="../footer.jsp" %>
