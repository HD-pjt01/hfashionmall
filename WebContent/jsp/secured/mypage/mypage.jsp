<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>

<body>
    <div class="wrap">
      <div id="container">
        <section class="content-wrap">
          <div class="snb-wrap">
            <h2 class="lnb-title"><a href="/secured/mypage/myPage">MYPAGE</a></h2>
              <nav id="lnb" class="lnb">
                <ul>
                  <li>
                    <div class="menu-depth1">쇼핑정보</div>
                    <ul class="menu-depth2">
                      <li ><a href="/secured/mypage/listOrder">주문/배송</a></li>
                      <li ><a href="/secured/mypage/listClaimOrder">취소/교환/반품</a></li>
                    </ul>
                  </li>
                  <li>
                    <div class="menu-depth1">참여 &amp; 문의</div>
                    <ul class="menu-depth2">
                      <li ><a href="/secured/mypage/myQnaList">상품 Q&A</a></li>
                      <li ><a href="/secured/mypage/getMyGodGodEvlList">나의 상품리뷰</a></li>
                    </ul>
                  </li>
                  <li>
                    <div class="menu-depth1">회원정보</div>
                    <ul class="menu-depth2">
                      <li ><a href="/secured/mypage/updateMember">회원정보 수정</a></li>
                      <li ><a href="/secured/mypage/listDeliveryLocation">배송지 관리</a></li>
                      <li ><a href="/secured/mypage/memberSecession">회원 탈퇴</a></li>
                    </ul>
                  </li>
                  </ul>
              </nav>
            </div>
            <div class="snb-content-wrap">
              <input type="hidden" name="_csrf" value="60d516a6-cc06-4ae0-8ed6-77d9a6564fbb">
          <input type="hidden" name="hPointEnableYn" id="hPointEnableYn" value="">
          
          <!-- 200713 수정 -->
          <script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220907151706"></script>
          
          <!-- 다이나믹 컨피그 설정 HFM_EQL_CONN_YN ERP 연동 유무 -->
          <!-- includeOrderList -->
          
          
          <h3 class="sec-title">최근 주문상품 <span class="sub2">(최근 1개월 기준)</span></h3>
          
          <div class="order-list-wrap order-slide-section">
          <!-- 2020.09.15 주문내역이 없을 경우 -->
          <div class="nodata">
          <p class="txt-nodata">최근 주문 상품이 없습니다.</p>
          </div>
          <!-- //2020.09.15 주문내역이 없을 경우 -->
          
          <div class="order-links">
          <ul>
          <li><a href="/secured/mypage/listOrder">주문/배송 조회</a></li>
          <li><a href="/secured/mypage/listClaimOrder">취소/교환/반품 <span class="num">0</span>건</a></li>
          </ul>
          </div>
          </div>
          <!-- //200713 수정 -->
          <!-- 리뷰 작성 팝업 -->
          <div id="getGoodsReviewPopup">
          </div>
          <div id="layerTracking" class="layer-pop" tabindex="0"></div>
          
          <script type="text/javascript">
          
          function dlvStatusInfo(th){
          
          var dlvComCd = $(th).data("comcd");
          var dmstcwayBilNo =  $(th).data("dmstcwaybilno");
          var dlvComNm = $(th).data("comnm");
          var cstmrNm = $(th).data("cstmrnm");
          var addrseNm = $(th).data("addrsenm");
          var baseAddr = $(th).data("baseaddr");
          var detailAddr = $(th).data("detailaddr");
          
          var strParams ="";
          strParams  = {
          'dlvComCd' : dlvComCd
          , 'dmstcWaybilNo' :  dmstcwayBilNo
          , 'dlvComNm' :  dlvComNm
          , 'cstmrNm' :  cstmrNm
          , 'addrseNm' :  addrseNm
          , 'baseAddr' :  baseAddr
          , 'detailAddr' :  detailAddr
          , '_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb'
          };
          
          $.ajax({
          type: 'POST',
          data: strParams,
          url: '/secured/mypage/order/dlvStatusInfoList',
          dataType: "html",
          success: function (data) {
          $("#layerTracking").html(data);
          
          layer.init('layerTracking');
          layer.open('layerTracking');
          },
          error: function () {
          //openAlert('Loading Error');
          }
          });
          }
          
          //주문취소
          function jsUnitCancel(ordNo, cnclPsblYn, lstClmPrgsYn) {
          if ( cnclPsblYn == 'Y') {
          jsLinkUrlPost('/secured/mypage/claimAccept', {'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb' , 'ordNo' : ordNo } );
          }
          else if ( lstClmPrgsYn == 'Y') {
          alert("추가 결제가 필요한 클레임이 존재합니다.\n 추가 결제완료 후 접수가 가능합니다.");
          }		
          else {
          alert("주문상품(패키지 또는 주문할인)과 일부 할인수단 및 결제수단을 사용한 주문은 전체취소만 가능합니다.\n 주문취소에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
          }
          return false;
          }
          
          //반품신청
          function jsRequestForReturn(ordNo, rtnPsblYn, lstClmPrgsYn) {
          console.log("jsRequestForReturn");
          if ( rtnPsblYn == 'Y') {
          jsLinkUrlPost('/secured/mypage/requestForReturn', {'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb' , 'ordNo' : ordNo });
          }
          else if ( lstClmPrgsYn == 'Y') {
          alert("추가 결제가 필요한 클레임이 존재합니다.\n 추가 결제완료 후 접수가 가능합니다.");
          }		
          else {
          alert("주문상품(패키지 또는 주문할인)과 일부 할인수단 및 결제수단을 사용한 주문은 전체반품만 가능합니다.\n 반품에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
          }
          return false;
          }
          
          //교환신청
          function jsExchangeClaim(ordNo, exchPsblYn, lstClmPrgsYn) {
          if ( exchPsblYn == 'Y') {
          jsLinkUrlPost('/secured/mypage/exchangeClaim', {'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb' , 'ordNo' : ordNo } );
          }
          else {
          alert("고객센터를 통해서 교환 신청이 가능합니다.\n 교환에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
          }
          return false;
          }
          
          
          /*상품리뷰 등록/수정  팝업 가져오기*/
          function getLayerPopupInsertGoodsReview(ordNo,ordGodTurn,godNo,godEvlTurn,type) {
          var strParams ="";
          if(type=='insert'){
          strParams  = {'ordGod.ordNo' : ordNo , 'ordGod.ordGodTurn' :  ordGodTurn, 'ordGod.godNo' :  godNo ,'type' : type , '_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb'};
          }else{
          strParams = {'ordGod.ordNo' : ordNo , 'ordGod.ordGodTurn' :  ordGodTurn, 'ordGod.godNo' :  godNo, 'godGodEvl.godEvlTurn' : godEvlTurn, 'type' : type,'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb'};
          }
          $("#getGoodsReviewPopup").load("/secured/mypage/getGoodsReview.popup", strParams, function(){ layer.open('reviewEdit'); });
          }
          
          
          
          function fnNull(){
          }
          
          function goGoodDetail(strGodNo, godLinkPsblYn, godSaleSectCd, dispYn){
          
          if ( godSaleSectCd == 'SALE_PROGRS' || godSaleSectCd == 'SLDOUT' || godSaleSectCd == 'TMPR_SLDOUT' ) {
          if (dispYn == 'N' ) {
          alert('현재 판매중인 상품이 아닙니다.');
          return false;
          }
          }
          
          if ( godSaleSectCd == 'TMPR_SALE_STPGE' || godSaleSectCd == 'SALE_END') {
          alert('현재 판매중인 상품이 아닙니다.');
          return false;
          }
          
          if ( godLinkPsblYn == 'Y') {
          location.href="/product/"+strGodNo+"/detail";
          }
          }
          
          </script>
          
          <!-- //200713 수정 -->
          
          
          <script>
          /**
          * 상품 찜하기
          *
          * @param obj
          */
          function likeGod(obj) {
          addBukmk(obj, null);
          }
          var recGodNo = '';
          if($(".order-tbl").length > 0) {
          if($(".order-tbl").find(".item-img").length > 0) {
          recGodNo = $(".order-tbl").find(".item-img").eq(0).attr("godno");
          }
          }
          getRecommendInfo('MY',recGodNo, 'recomList');
          </script>
          <!-- //추천 아이템 리스트 -->
          <!-- //snb-content-wrap --></div>
      </section>
      </div>
  </div>
  </body>

<%@ include file="../footer.jsp" %>