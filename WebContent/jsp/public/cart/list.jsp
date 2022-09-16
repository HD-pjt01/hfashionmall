<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>

<body>
    <div id="container">
        <section class="content-wrap">
	<h3 class="page-title">장바구니</h3>

	<div id="cartContentList">
        



	<input type="hidden" id="onlneGrdCd" value="LEVEL_01">
	
	<div id="0">
            <div id="cartList" class="order-tbl type-cart"> <!-- 택배 일 경우 class="type-cart"-->

                <!-- head -->
                <div class="head">
                    <div class="cell-check">
                        <label class="check-skin only">
                            <input type="checkbox" id="chk_0" name="cartAllCheckbox" class="allChk" onclick="javascript:check.all($(this),0);event.stopImmediatePropagation();"><span>전체 선택</span>
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
                        <!-- row -->
                    <div class="row " id="0" name="tr0_0" gdturn="2" gdidx="0">

                        <input type="hidden" name="list[0].bskGodList[0].parentGodTurn" value="2">
                        <input type="hidden" name="list[0].bskGodList[0].bskNo" value="BK202209144330767">
                        <input type="hidden" name="list[0].bskGodList[0].godTurn" value="2">
                        <input type="hidden" name="list[0].bskGodList[0].pckageGodYn" value="N">
                        <input type="hidden" name="list[0].bskGodList[0].godNo" value="GM0122040738612">
                        <input type="hidden" name="list[0].bskGodList[0].itmNo" value="IT202204070494822">

                        <input type="hidden" name="list[0].bskGodList[0].ordDcGodNo" value="" readonly="readonly">
                        <input type="hidden" name="list[0].bskGodList[0].dsgnGrpNo" value="T42C6ACK04CBT1" readonly="readonly">

                        <input type="hidden" name="list[0].bskGodList[0].dlvSectCd" value="GNRL_DLV">
                            <input type="hidden" name="list[0].bskGodList[0].pkupShopId" value="">
                            <input type="hidden" name="list[0].bskGodList[0].prcType" value="GNRL">
                            <input type="hidden" name="list[0].bskGodList[0].dlvCd" value="554">
                            <input type="hidden" name="list[0].bskGodList[0].cpnMaxDcAmt" value="">
                            <input type="hidden" name="list[0].bskGodList[0].cpnDcSectCd" value="">
                            <input type="hidden" name="list[0].bskGodList[0].cpnDcAmt" value="">
                            <input type="hidden" name="list[0].bskGodList[0].cpnDcRt" value="">
                        <input type="hidden" name="list[0].bskGodList[0].cnsgnSectCd" value="MCOM">

                        <div class="inner">
                            <div class="cell-check">
                                <label class="check-skin only">
                                            <input type="checkbox" soldoutyn="N" id="0_0" name="check" value="0" onclick="javascript:check.one(0,0,$(this));event.stopImmediatePropagation();"> <span>선택</span>
                                        </label>
                                    </div>

                            <div class="cell-pd-wrap">
                                <!-- 상품 별 정보/가격 -->
                                <div class="inner-row">
                                    <div class="cell-pd">
                                        <div class="item-img">
                                            <a href="javascript:void(0);" onclick="javascript:goToEncodeUrl('/product/GM0122040738612/detail');">
                                                        <img src="https://cdn.hfashionmall.com/goods/THBR/22/04/07/GM0122040738612_1_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt="" onerror="javascript:this.src='../../resources/images/temp/pd_86x129.jpg'">
                                                    </a>
                                                <button type="button" class="btn-like-s " onclick="addBukmk(this,addBukmkCallback);" godno="GM0122040738612"><span>좋아요</span></button>
                                                </div>
                                        <div class="item-info">
                                            <div class="item-label">
                                                </div>
                                            <div class="item-brand"><a href="javascript:void(0);" onclick="javascript:goToEncodeUrl('/product/GM0122040738612/detail');">TOMMY HILFIGER KIDS
            </a></div>
                                                    <div class="item-name" catename="키즈/남아/악세서리"> <a href="javascript:void(0);" onclick="javascript:goToEncodeUrl('/product/GM0122040738612/detail');">면혼방 로고 플래그 양말 2P
            </a></div>
                                                <div class="item-opt">
                                                <span color="YELLOW">
                                                            YELLOW
            , S
            </span>
                                                        <span>수량 : 1
            개</span>
                                                    </div>

                                            <input type="hidden" name="list[0].bskGodList[0].itmQty" value="1" initvalue="1" readonly="">
                                            <button type="button" class="btn-link" onclick="javascript:option.optChange('N',0,0);"><span>옵션변경</span></button>
                                                <div class="item-etc">
                                                    </div>


                                            <div class="item-link">

                                                </div>
                                        </div>
                                    </div>
                                    <div class="cell-price">
                                        <input type="hidden" id="benefit0_0" prctype="GNRL" amt="0" crsgrp="" godamt="0" imdtldcamt="0" cpnamt="0" cpnbamt="0">
                                        <input type="hidden" id="price0_0" price="22000">
                                        <div class="price" emplmtddctyn="">
                                            <span>
                                                <span class="num" id="orderPrice0_0" cvrprc="22000" saleprc="22000" calcorderprice="22000">22,000</span> 원

                                                        </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- //상품 별 정보/가격 -->
                            </div>
                            <div class="cell-btn">
                                <!-- 품절은 아니나 매장픽업수령일자가 초과된 경우는 비활성화 처리함. -->
                                    <button type="button" class="btn-type4-sm" onclick="javascript:selectGoodsOrder(0,0);"><span>바로구매</span></button>
                                    <button type="button" class="btn-del" godno="GM0122040738612" itmqty="1" onclick="javascript:goodsDel(0,0);"><span>삭제</span></button>
                            </div>




                            </div>
                    </div>
                    <!-- //row -->

                    <!-- 배송정보 -->
                        <div class="cell-dlv">
                                <div class="inner">


                                    <span style="display:none" id="dlv554" dlvamt="0" dlvchecked="Y" startindex="0" endindex="1"></span>
                                    <p>
                                        <span class="sort">[본사배송]</span>
                                                <span id="godDlvAmt_0_0" class="txt" dmstcdlvcstplcsn="554" dlvcstlevysectcd="COND_FREE" dmstcdlvcstexmstdramt="30000" dmstcdlvcst="2500" grpindex="0" grpsoldoutyn="N">무료배송</span>

                                            <span class="sub">30,000원 미만 결제시 <br> 2,500원</span>
                                            </p>
                                </div>
                            </div>
                        <!-- //배송정보 -->

                        <!-- row -->
                    <div class="row " id="0" name="tr0_1" gdturn="1" gdidx="1">

                        <input type="hidden" name="list[0].bskGodList[1].parentGodTurn" value="1">
                        <input type="hidden" name="list[0].bskGodList[1].bskNo" value="BK202209144330767">
                        <input type="hidden" name="list[0].bskGodList[1].godTurn" value="1">
                        <input type="hidden" name="list[0].bskGodList[1].pckageGodYn" value="N">
                        <input type="hidden" name="list[0].bskGodList[1].godNo" value="GM0122040738615">
                        <input type="hidden" name="list[0].bskGodList[1].itmNo" value="IT202204070494832">

                        <input type="hidden" name="list[0].bskGodList[1].ordDcGodNo" value="" readonly="readonly">
                        <input type="hidden" name="list[0].bskGodList[1].dsgnGrpNo" value="T42C6ACK020BT1" readonly="readonly">

                        <input type="hidden" name="list[0].bskGodList[1].dlvSectCd" value="GNRL_DLV">
                            <input type="hidden" name="list[0].bskGodList[1].pkupShopId" value="">
                            <input type="hidden" name="list[0].bskGodList[1].prcType" value="GNRL">
                            <input type="hidden" name="list[0].bskGodList[1].dlvCd" value="554">
                            <input type="hidden" name="list[0].bskGodList[1].cpnMaxDcAmt" value="">
                            <input type="hidden" name="list[0].bskGodList[1].cpnDcSectCd" value="">
                            <input type="hidden" name="list[0].bskGodList[1].cpnDcAmt" value="">
                            <input type="hidden" name="list[0].bskGodList[1].cpnDcRt" value="">
                        <input type="hidden" name="list[0].bskGodList[1].cnsgnSectCd" value="MCOM">

                        <div class="inner">
                            <div class="cell-check">
                                <label class="check-skin only">
                                            <input type="checkbox" soldoutyn="N" id="0_1" name="check" value="1" onclick="javascript:check.one(0,1,$(this));event.stopImmediatePropagation();"> <span>선택</span>
                                        </label>
                                    </div>

                            <div class="cell-pd-wrap">
                                <!-- 상품 별 정보/가격 -->
                                <div class="inner-row">
                                    <div class="cell-pd">
                                        <div class="item-img">
                                            <a href="javascript:void(0);" onclick="javascript:goToEncodeUrl('/product/GM0122040738615/detail');">
                                                        <img src="https://cdn.hfashionmall.com/goods/THBR/22/04/07/GM0122040738615_1_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" alt="" onerror="javascript:this.src='../../resources/images/temp/pd_86x129.jpg'">
                                                    </a>
                                                <button type="button" class="btn-like-s " onclick="addBukmk(this,addBukmkCallback);" godno="GM0122040738615"><span>좋아요</span></button>
                                                </div>
                                        <div class="item-info">
                                            <div class="item-label">
                                                </div>
                                            <div class="item-brand"><a href="javascript:void(0);" onclick="javascript:goToEncodeUrl('/product/GM0122040738615/detail');">TOMMY HILFIGER KIDS
            </a></div>
                                                    <div class="item-name" catename="키즈/남아/악세서리"> <a href="javascript:void(0);" onclick="javascript:goToEncodeUrl('/product/GM0122040738615/detail');">면혼방 배색 패턴 크루삭스 2P
            </a></div>
                                                <div class="item-opt">
                                                <span color="BEIGE">
                                                            BEIGE
            , S
            </span>
                                                        <span>수량 : 1
            개</span>
                                                    </div>

                                            <input type="hidden" name="list[0].bskGodList[1].itmQty" value="1" initvalue="1" readonly="">
                                            <button type="button" class="btn-link" onclick="javascript:option.optChange('N',0,1);"><span>옵션변경</span></button>
                                                <div class="item-etc">
                                                    </div>


                                            <div class="item-link">

                                                </div>
                                        </div>
                                    </div>
                                    <div class="cell-price">
                                        <input type="hidden" id="benefit0_1" prctype="GNRL" amt="0" crsgrp="" godamt="0" imdtldcamt="0" cpnamt="0" cpnbamt="0">
                                        <input type="hidden" id="price0_1" price="22000">
                                        <div class="price" emplmtddctyn="">
                                            <span>
                                                <span class="num" id="orderPrice0_1" cvrprc="22000" saleprc="22000" calcorderprice="22000">22,000</span> 원

                                                        </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- //상품 별 정보/가격 -->
                            </div>
                            <div class="cell-btn">
                                <!-- 품절은 아니나 매장픽업수령일자가 초과된 경우는 비활성화 처리함. -->
                                    <button type="button" class="btn-type4-sm" onclick="javascript:selectGoodsOrder(0,1);"><span>바로구매</span></button>
                                    <button type="button" class="btn-del" godno="GM0122040738615" itmqty="1" onclick="javascript:goodsDel(0,1);"><span>삭제</span></button>
                            </div>




                            </div>
                    </div>
                    <!-- //row -->



                    <!-- 배송정보 -->
                        <!-- //배송정보 -->

                        </div>
                            <!-- //body -->
			</div>





<div class="tbl-btn">
	<button type="button" class="btn-type3-m" onclick="javascript:selectedGoodsDel(0, false);"><span>선택삭제</span></button>
	<button type="button" class="btn-type3-m" onclick="javascript:selectedGoodsDel(0, true);"><span>품절삭제</span></button>
</div>
<script>
	allChk('#cartList');
</script>

<!-- 최종금액 -->
<div class="cart-price" mbratrbcd="GNRL_MBR">



	<div class="inner">
		<span class="price">
			<span class="txt">상품금액</span>
			<span id="totalGodAmt" class="num">44,000</span> 원
		</span>
		<span class="symbol-plus">+</span>
		<span class="price">
			<span class="txt">배송비 <button type="button" class="btn-tooltip" onmouseenter="tooltip('dlvCost-info', null, '/tooltip?type=costInfo');"><span>툴팁보기</span></button></span>
			<span id="totalDlvAmt" class="num">0</span> 원
		</span>
		<span class="symbol-minus">-</span>
		<span class="price sale">
			<span class="txt">총 할인금액</span>
			<span id="totalDcAmt" class="num">0</span> 원
		</span>
		<span class="symbol-eq">=</span>
		<span class="price total">
			<span class="txt">결제금액</span>
			<span id="totalOrdAmt" class="num">44,000</span> 원
		</span>
	</div>
</div>

<div class="btn-box">
	<a href="/" class="btn-type4-lg">쇼핑 계속하기</a>
	<a href="javascript:undefined;" class="btn-type2-lg" onclick="javascript:selectGoodsOrder(0);">선택상품 주문하기</a>
</div>

<ul class="txt-list">
	<li>장바구니에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품은 자동 삭제됩니다.</li>
	<li>장바구니에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li> <!-- 200703 text -->
	<li>장바구니에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
	<li>입점 판매 상품은 장바구니에서 [입점 판매 상품]으로 표시됩니다. <button type="button" class="point-link" onclick="layer.open('layerSaleInfo')">입점 판매 상품 안내 보기</button></li>
</ul>


<script type="text/javascript">

	var isMember;
	
		isMember = true;
	

	var cartGrpIndex;
	var cartIndex;

	function selectGoodsOrder(grpIdx, idx){
		
		cartGrpIndex = grpIdx;
		cartIndex = idx;

		if(isMember){
			
			//마이타미구매대상인지 확인 AJAX로 체크후 값 셋팅			
			if(idx != undefined && idx != null)
			{
				if($("#myTmyTrgtYn").val() == "Y")
	            {
					var itmQty =$('input[name="list['+grpIdx+'].bskGodList['+ idx +'].itmQty"]').val();					
					var ret = confirm("마이타미 주문을 진행하시겠습니까?");
		            if(ret == true)
		            {            						
		    			if(itmQty == 1)
		    			{            	            	
		            		$("#myTmyYn").val("Y");
		    			}
		    			else
		    			{
		    				alert("마이타미 주문은 1개만 주문 가능합니다.");
		    				return;
		    			}
		            }
	            }
			}
			else
			{
				if($("#myTmyTrgtYn").val() == "Y")
	            {
	                var ret = confirm("마이타미 주문은 상품 바로구매만 가능합니다. 일반주문으로 주문하시겠습니까?");
	                if(ret == true)
	                {
	                	$("#myTmyYn").val("N");
	                }
	                else
	                {
	                	return false;
	                }
	            }
			}
			
			submitForm.checkValidOrd(grpIdx, idx);
		}else{
			layer.open("layerMemBenefit");
		}

	}


	/**
	 * 비회원 주문
	 */
	function orderNow(){
		$.ajax({
			type : "POST",
			url : "/public/member/nonMbrOrder.json",
			async : false,
			beforeSend: function (request)
			{
				var csrfToken = $("meta[name='_csrf']").attr("content");
				var csrfName = $("meta[name='_csrf_header']").attr("content");
				request.setRequestHeader(csrfName, csrfToken);
			},
			success : function(args) {
				submitForm.checkValidOrd(cartGrpIndex, cartIndex);
			},
			error : function(e) {
			}
		});
	}



	$('.btn-like-s').click(function(){
		addBukmk($(this));
	});

	function goToEncodeUrl(url){
		if(url){
			location.href = encodeURI(url);
		}
	}

	function dontGoUrl() {
		alert("임시판매중지 또는 판매종료된 상품입니다.");
		return false;

	}

	var orderDcGodObj = {

	}


	<!-- ace counter script -->

	function goodsDel(grpIdx, idx){

		var godNo = $(this).attr('godno');
		var itmQty = $(this).attr('itmQty');
		oneGoodsDel(godNo, itmQty, idx);

		submitForm.send('del', grpIdx, idx);

	}

	function selectedGoodsDel(idx, soldoutYn){

		// 전체 삭제인지 확인
		var allChk = $('input[name="cartAllCheckbox"]').prop("checked");
		if(allChk){
			try{
				AW_CARTDEL();
			}catch(e){
				console.log("ace counter error selectedGoodsDel", e);
			}
		}

		try {

			var product = [];

			$('input[name="check"]').each(function(i){

				var checked = $(this).prop("checked");
				if(checked){
					product.push(makeDataLayerProduct(i));
				}

			});

			makeDataLayer(product);
		}catch (e){
			console.log("dataLayer error selectGoodsDel : ", e);
		}

		<!-- 기존 장바구니 삭제 function -->
		if(soldoutYn){
			submitForm.send('soldoutdel', idx);
		}else{
			submitForm.send('del', idx);
		}
	}

	function oneGoodsDel(godNo, itmQty, idx){

		try{
			AW_DEL(godNo, itmQty);
		}catch(e){
			console.log("ace counter error oneGoodsDel", e);
		}

		try {
			//makeDataLayer(idx);
			var product = [];
			product.push(makeDataLayerProduct(idx));
			makeDataLayer(product);
		}catch (e) {
			console.log("data layer error oneGoodsDel", e);
		}

	}
	<!-- ace counter script -->

	function makeDataLayerProduct(idx){

		var $obj = $('#cartList').find('.row').eq(idx);

		var $product = {
			"id": $('input[name="list[0].bskGodList['+idx+'].godNo"]').val(),
			"name" : $obj.find('.item-name a').text().trim(),
			"price" : $obj.find('[id^="orderPrice"]').attr('saleprc'),
			"brand": $obj.find('.item-brand a').text().trim(),
			"category" : $obj.find('.item-name').attr('catename'),
			"variant": $obj.find('.item-opt').find('span').eq(0).attr('color'),
			"quantity": $('input[name="list[0].bskGodList['+idx+'].itmQty"]').val()
		}

		return $product;

	}

	function makeDataLayer(product){

		window.dataLayer = window.dataLayer || [];

		dataLayer.push({
			"event": "ecommerce-remove",
			"ecommerce": {
				"remove": {
					'products': product
				}
			}
		});

	}




	$(document).ready(function(){

		try {
			var godNos = "";

			$('[name*=".godNo"]').each(function(i){

				var godNo =$(this).val();
				if(!godNos){
					godNos = godNo;
				}else{
					godNos += ","+godNo;
				}

			});

			if(godNos != ""){
				getRecommendInfo('ORD', godNos, 'recoPickList');
			}

		}catch (e) {
			console.log("cart view error : "+e);
		}

		/* braze 스크립트 삽입 */
		try {
			
			appboy.logCustomEvent("hfashion_cart", {
				size : 'S',
				cateNo : 'HFMA03A01A10',
				brand : 'TOMMY HILFIGER KIDS',
				prdNo : 'GM0122040738612',
				price : '22000',
				color : 'YELLOW'
			});
			
			appboy.logCustomEvent("hfashion_cart", {
				size : 'S',
				cateNo : 'HFMA03A01A10',
				brand : 'TOMMY HILFIGER KIDS',
				prdNo : 'GM0122040738615',
				price : '22000',
				color : 'BEIGE'
			});
			
		}catch (e) {
			console.log("cart view error : " + e);
		}

	});


</script>


<!-- Enliple Tracker Start -->
<script type="text/javascript">
	window.ENP_VAR = { conversion: { product: [] } };

	// 주문한 각 제품들을 배열에 저장
	
	ENP_VAR.conversion.product.push(
		
			{
				productCode : 'GM0122040738612',
				productName : '면혼방 로고 플래그 양말 2P',
				price : '22000',
				dcPrice : '22000',
				qty : '1'
			}
			,
			{
				productCode : 'GM0122040738615',
				productName : '면혼방 배색 패턴 크루삭스 2P',
				price : '22000',
				dcPrice : '22000',
				qty : '1'
			}
			
	);

	ENP_VAR.conversion.totalPrice = '44000';  // 없는 경우 단일 상품의 정보를 이용해 계산
	ENP_VAR.conversion.totalQty = '2';  // 없는 경우 단일 상품의 정보를 이용해 계산

	(function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
	enp('create', 'conversion', 'hfashionmall', { device: 'W', paySys: '' });
</script>
<!-- Enliple Tracker End -->


<script language="javascript">
		var _products=(function(){
			var c={pd:'GM0122040738612', pn:'면혼방 로고 플래그 양말 2P', am:'22000', qy:'1', ct:''};
			var u=(!_products)?[]:_products; u['@'+c.pd]=c;return u;
		})();
	</script>
<script language="javascript">
		var _products=(function(){
			var c={pd:'GM0122040738615', pn:'면혼방 배색 패턴 크루삭스 2P', am:'22000', qy:'1', ct:''};
			var u=(!_products)?[]:_products; u['@'+c.pd]=c;return u;
		})();
	</script>
<!-- WIDERPLANET  SCRIPT START 2020.09.05 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
	var wptg_tagscript_vars = wptg_tagscript_vars || [];
	wptg_tagscript_vars.push(
			(function() {
				return {
					wp_hcuid:"",    /*고객넘버 등 Unique ID (ex. 로그인  ID, 고객넘버 등 )를 암호화하여 대입.
                                 *주의 : 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
					ti:"20092",
					ty:"Cart",
					device:"web"
					,items:[
						
							{i:"GM0122040738612",    t:"면혼방 로고 플래그 양말 2P"} /* 첫번째 상품  - i:상품 식별번호  (Feed로 제공되는 식별번호와 일치 ) t:상품명 */
							,
							{i:"GM0122040738615",    t:"면혼방 배색 패턴 크루삭스 2P"} /* 첫번째 상품  - i:상품 식별번호  (Feed로 제공되는 식별번호와 일치 ) t:상품명 */
							


					]
				};
			}));
</script>
<script type="text/javascript" async="" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2020.09.05 -->

<!-- criteo  SCRIPT START 2020.09.05 -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
	window.criteo_q = window.criteo_q || [];
	window.criteo_q.push(
		{ event: "setAccount", account: 18031 },
		{ event: "setEmail", email: "ZHBlQG5hdGUuY29t" },
		//사이트 Type(모바일 페이지는 "m", 태블릿 페이지는 "t", 일반 웹 사이트는 "d"로 삽입
		{ event: "setSiteType", type: "d" },
		{ event: "viewBasket", item: [
			
				{ id: "GM0122040738612", price: 22000, quantity: 1 }
				,
				{ id: "GM0122040738615", price: 22000, quantity: 1 }
				
		]}
	);
</script>
<!-- criteo  SCRIPT START 2020.09.05 -->

<!-- AceCounter Log Gathering Script V.8.0.20200913 -->
<script language="javascript">
	try {
		var _AceGID=(function(){var Inf=['gtc18.acecounter.com','8080','BS4A44285281177','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
		var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src=(location.protocol.indexOf('http')==0?location.protocol:'http:')+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
	}catch (e) {
		console.log("AceCounter ERROR {0}".format(e));
	}
</script>
<noscript><img src='http://gtc18.acecounter.com:8080/?uid=BS4A44285281177&je=n&' border='0' width='0' height='0' alt=''></noscript>
<!-- AceCounter Log Gathering Script End -->


<!-- 20200911 Facebook AddToCart Pixel Code -->
<script>
	try {

		
		fbq('track', 'AddToCart', {
			content_name: 'Shopping Cart',
			content_ids: [

				
				"GM0122040738612",
				"GM0122040738615"

			],
			content_type: 'product',
			value: 44000,
			currency: 'KRW'

		});
	}catch (e){
		console.log("fbq error : ", e);

	}

</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=811734278847433&ev=AddToCart&noscript=1" /></noscript>
<!-- 20200911 End Facebook Pixel Code -->


<!-- Appier Traking : View Shopping Cart -->
<script>
	var appierRtCartList = [];
	var appierRtPrice = "";
	
	
		appierRtCartList.push({
	    	productID : "GM0122040738612", 
	    	unit : "1",
	        price : "22000"
	    });
		
		appierRtCartList.push({
	    	productID : "GM0122040738615", 
	    	unit : "1",
	        price : "22000"
	    });
		
	
	appierRtPrice = "44000";
	
	window.appier_q = window.appier_q || [];
	window.appier_q.push(
	  {"t": "register", "content": { "id": "52bd", "site": "hfashionmall.com" }},
	  {"t": "type_cart",  "itemList": appierRtCartList, "totalvalue" : appierRtPrice, "action_id": "ViewCart_0066", "track_id": "f7acd2e2d0f37e8"}
	);
</script>
<!-- Appier Traking :View Shopping Cart -->

    </div>
			

<input type="hidden" id="venepiaYn" value="">
<input type="hidden" id="welfareMallYn" value="">
<input type="hidden" name="myTmyYn" id="myTmyYn" value="N">
<input type="hidden" name="myTmyTrgtYn" id="myTmyTrgtYn" value="N">

<form name="cartSearchDTO" id="cartSearchDTO"></form>
<script>
	var lang = 'KOR',
		dlvsect = 'GNRL_DLV',
		dlv = $.parseJSON('[{"dmstcDlvCstExmStdrAmt":30000,"dmstcDlvCst":2500,"dmstcDlvCstPlcSn":554,"dlvCstLevySectCd":"COND_FREE"}]'),
		resveSaleGodYn = "N",	
		dlvFeeImdtlCpn = $.parseJSON('[]'), 
		gIdx,
		gGrpIdx,
		grpCnt = "1";


	$(document).ready(function() {
		$("#cartBanner").show();

		
			//allChk('#cartList');
			check.grpAll();
		

		var gnrlCartCnt = 2;
		var pkupCartCnt = 0;
		$('.gnrlCartCnt').text("택배("+gnrlCartCnt+")");
		$('.pkupCartCnt').text("매장수령("+pkupCartCnt+")");
		
		var cartCnt = Number(gnrlCartCnt)+Number(pkupCartCnt);
		
		try{
			//braze Web - CartQty Attribute send
   	    	appboy.getUser().setCustomUserAttribute("cart_qty", cartCnt);
		} catch (e) {console.log(e);}
		
		
	});

</script></div>

	<p>.</p>

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
						<li>
							할인적용 제외 자사 전용 쿠폰 예시
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

	<div id="layerMemBenefit" class="layer-pop" tabindex="0">
    <div class="layer-wrap" tabindex="0">
        <div class="layer-header">
            <h2 class="layer-title">H패션몰 회원 혜택</h2>
        </div>
        <div class="layer-container">
            <div class="layer-content">
                <p class="txt-common">지금 H패션몰 회원가입하고,<br>더욱 다양한 혜택을 받아보세요 !!</p>

                <div class="join-benefit">
                    <ul class="join-benefit-list">
                        <li>
                            <div class="benefit-img">
                                <img src="/resources/images/order/img_mem_benefit_01.png" alt="">
                            </div>
                            <div class="benefit-txt">
                                <p class="txt">신규 가입 시 10~15%<br> 할인쿠폰 즉시 지급</p>
                            </div>
                        </li>
                        <li>
                            <div class="benefit-img">
                                <img src="/resources/images/order/img_mem_benefit_02.png" alt="">
                            </div>
                            <div class="benefit-txt">
                                <p class="txt">생일 및 기념일 축하 전 브랜드 20% 할인쿠폰 지급</p>
                            </div>
                        </li>
                        <li>
                            <div class="benefit-img">
                                <img src="/resources/images/order/img_mem_benefit_03.png" alt="">
                            </div>
                            <div class="benefit-txt">
                                <p class="txt">APP 첫 로그인 시<br>20% 할인쿠폰 지급</p>
                            </div>
                        </li>
                        <li>
                            <div class="benefit-img">
                                <img src="/resources/images/order/img_mem_benefit_04.png" alt="">
                            </div>
                            <div class="benefit-txt">
                                <p class="txt">APP 첫 구매 시 H.Plus<br> 5000 포인트 지급 </p>
                            </div>
                        </li>
                        <li>
                            <div class="benefit-img">
                                <img src="/resources/images/order/img_mem_benefit_05.png" alt="">
                            </div>
                            <div class="benefit-txt">
                                <p class="txt">App Push 수신 동의 시<br> 5,000원 할인쿠폰 지급</p>
                            </div>
                        </li>
                    </ul>

                    <div class="txt-join-box">
                        <p class="txt-join">지금 회원으로 가입하시겠습니까?</p>
                        <a href="javascript:void(0);" class="btn-text" onclick="orderNow('');">비회원 구매하기</a>
                    </div>

                </div>

                <div class="layer-bot-box">
                    <div class="btn-box">
                        <a href="/public/member/addMemberStep1" class="btn-type4-xlg">회원 가입하기</a>
                        <a href="/public/member/login" class="btn-type2-xlg">로그인 하기</a>
                    </div>
                </div>

            </div>
        </div>
        <button type="button" class="btn-layer-close" onclick="layer.close('layerMemBenefit');">닫기</button>
    </div>
</div><script type="text/javascript" src="/hfm_pc/resources/js/cart.js?timestamp=20220914145945"></script>
	<script>

		var cartTxt = {};
		cartTxt.crncy ='원';
		cartTxt.dlvfree ='무료배송';

		var cartTxtMsg = {};
		cartTxtMsg.notselectd = '선택된 상품이 없습니다.';
		cartTxtMsg.soldoutnotexists = '품절된 상품이 없습니다.';
		cartTxtMsg.removeMsg = '선택한 상품을 삭제하시겠습니까?';
		cartTxtMsg.soldoutremoveMsg = '품절된 상품을 전부 삭제하시겠습니까?';
		cartTxtMsg.moveMsg = '배송방법이 변경되었습니다.';
		cartTxtMsg.goToWishMsg = '상품이 위시리스트에 담겼습니다.';
		cartTxtMsg.maxqty1 = '주문 가능한 수량은 최대 [';
		cartTxtMsg.maxqty2 = ']개 입니다.';
		cartTxtMsg.systemerr = '시스템 오류입니다.';

		$(document).ready(function() {
			try{
				view('');
			}catch(e) {
				console.log("cart view error : "+e);
			}

		});
	</script>



</section></div>
</body>

<%@ include file="../footer.jsp" %>