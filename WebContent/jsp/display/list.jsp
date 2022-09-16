<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>

<body>
    <div id="container">
    <style type="text/css">
  .dp-concept .concept-inner{background: #333;}
  </style>
  
  <form name="searchForm" id="searchForm" method="GET">
  <input type="hidden" name="dspCtgryNo" value="HFMA02A04">
  <input type="hidden" name="cateCd" value="HFMA02A04">
  <input type="hidden" name="currentPage" id="currentPage" value="1">
  <input type="hidden" name="sortColumn" id="sortColumn" value="NEW_GOD_SEQ">
  
  <input type="hidden" name="cateNos" value="">
  <input type="hidden" name="lCateFilter" value="">
  <input type="hidden" name="mCateFilter" value="">
  <input type="hidden" name="sCateFilter" value="">
  <input type="hidden" name="dCateFilter" value="">
  <input type="hidden" name="brandId" value="">
      <input type="hidden" name="brndId" value="">
  <input type="hidden" name="price" value="">
  <input type="hidden" name="rate" value="">
  <input type="hidden" name="size" value="">
  <input type="hidden" name="color" value="">
  <input type="hidden" name="matr" value="">
  <input type="hidden" name="modelCut" value="">
  <input type="hidden" name="exceptSoldout" value="">
      
  <input type="hidden" name="mallGubun" value="CTGRY">
  <input type="hidden" name="otltYn" value="">
  </form>
  <section class="content-response">
  <h2 class="page-title" style="font-weight: bold;">
      아우터</h2>
  
  <div class="related-keyword cate-group" id="selCtgList">
      </div>
  <div class="wrap-product-list">
  
      <div class="list-head">
          <div class="list-filter open">
              <div class="selected-filter">
              </div>
              <div class="filter-layer" id="filterLayer">
              <div class="filter-menu category">
              </div> 
  
  </div>
          </div>
          <div class="cell">
              <div class="select">
                  <button type="button" class="sel-btn" onclick="select.trigger();">신상품순</button>
                  <div class="sel-list">
                      <ul id="sortGodColum">
                          <li><label><input type="radio" name="pdSort" value="NEW_GOD_SEQ" checked=""> <span>신상품순</span></label></li>
                              <li><label><input type="radio" name="pdSort" value="SALE_QTY_SEQ"> <span>인기상품순</span></label></li>
                              <li><label><input type="radio" name="pdSort" value="LWET_PRC_SEQ"> <span>낮은가격순</span></label></li>
                              <li><label><input type="radio" name="pdSort" value="BEST_PRC_SEQ"> <span>높은가격순</span></label></li>
                              <li><label><input type="radio" name="pdSort" value="BEST_DC_SEQ"> <span>할인율순</span></label></li>
                              <li><label><input type="radio" name="pdSort" value="BEST_CHOISE_SEQ"> <span>마이클로젯순</span></label></li>
                              </ul>
                  </div>
              </div>
          </div>
      </div>
      <ul class="product-list" id="productsList">
          <li godno="GM0122090888702"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888702" data-ga-name="스웨터 집업 핸드메이드 자켓" data-ga-brand="DKNY WOMEN" data-ga-price="995000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888702')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888702_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스웨터 집업 핸드메이드 자켓" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  <div class="img"><img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888702_2_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스웨터 집업 핸드메이드 자켓" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'"></div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888702"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888702');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888702')">
              <div class="item-brand">DKNY WOMEN</div>
              <div class="item-name">스웨터 집업 핸드메이드 자켓</div>
              <div class="item-price">
                                  <span class="price">995,000</span>
                              </div>
                  </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122090888703"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888703" data-ga-name="스웨터 집업 핸드메이드 자켓" data-ga-brand="DKNY WOMEN" data-ga-price="995000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888703')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888703_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="스웨터 집업 핸드메이드 자켓" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888703"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888703');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888703')">
              <div class="item-brand">DKNY WOMEN</div>
              <div class="item-name">스웨터 집업 핸드메이드 자켓</div>
              <div class="item-price">
                                  <span class="price">995,000</span>
                              </div>
                  </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122090888697"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888697" data-ga-name="라운드넥 쇼트 자켓" data-ga-brand="DKNY WOMEN" data-ga-price="795000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888697')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888697_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="라운드넥 쇼트 자켓" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888697"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888697');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888697')">
              <div class="item-brand">DKNY WOMEN</div>
              <div class="item-name">라운드넥 쇼트 자켓</div>
              <div class="item-price">
                                  <span class="price">795,000</span>
                              </div>
                  </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122090888698"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888698" data-ga-name="라운드넥 쇼트 자켓" data-ga-brand="DKNY WOMEN" data-ga-price="795000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888698')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888698_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="라운드넥 쇼트 자켓" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888698"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888698');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888698')">
              <div class="item-brand">DKNY WOMEN</div>
              <div class="item-name">라운드넥 쇼트 자켓</div>
              <div class="item-price">
                                  <span class="price">795,000</span>
                              </div>
                           </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122090888699"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888699" data-ga-name="라운드넥 쇼트 자켓" data-ga-brand="DKNY WOMEN" data-ga-price="795000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888699')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888699_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="라운드넥 쇼트 자켓" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888699"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888699');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888699')">
              <div class="item-brand">DKNY WOMEN</div>
              <div class="item-name">라운드넥 쇼트 자켓</div>
              <div class="item-price">
                                  <span class="price">795,000</span>
                              </div>
                           </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122090888708"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888708" data-ga-name="샤인 나일론 푸퍼" data-ga-brand="DKNY WOMEN" data-ga-price="495000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888708')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888708_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="샤인 나일론 푸퍼" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888708"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888708');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888708')">
              <div class="item-brand">DKNY WOMEN</div>
              <div class="item-name">샤인 나일론 푸퍼</div>
              <div class="item-price">
                                  <span class="price">495,000</span>
                              </div>
                          </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122090888714"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888714" data-ga-name="노벨티 라인 푸퍼" data-ga-brand="DKNY WOMEN" data-ga-price="455000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888714')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/DKBR/22/09/08/GM0122090888714_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="노벨티 라인 푸퍼" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888714"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888714');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888714')">
              <div class="item-brand">DKNY WOMEN</div>
              <div class="item-name">노벨티 라인 푸퍼</div>
              <div class="item-price">
                                  <span class="price">455,000</span>
                              </div>
                          </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122090888723"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122090888723" data-ga-name="피치 나일론 다운 푸퍼" data-ga-brand="ck Calvin Klein WOMEN" data-ga-price="958000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888723')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/CKBR/22/09/08/GM0122090888723_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="피치 나일론 다운 푸퍼" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  <div class="img"><img src="https://cdn.hfashionmall.com/goods/CKBR/22/09/08/GM0122090888723_2_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="피치 나일론 다운 푸퍼" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'"></div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122090888723"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122090888723');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122090888723')">
              <div class="item-brand">ck Calvin Klein WOMEN</div>
              <div class="item-name">피치 나일론 다운 푸퍼</div>
              <div class="item-price">
                                  <span class="price">958,000</span>
                              </div>
                           </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122052555886"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122052555886" data-ga-name="슬림핏 퀼팅 롱 자켓" data-ga-brand="TOMMY HILFIGER WOMEN" data-ga-price="445000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122052555886')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/THBR/22/05/25/GM0122052555886_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="슬림핏 퀼팅 롱 자켓" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122052555886"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122052555886');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122052555886')">
              <div class="item-brand">TOMMY HILFIGER WOMEN</div>
              <div class="item-name">슬림핏 퀼팅 롱 자켓</div>
              <div class="item-price">
                                  <span class="price">445,000</span>
                              </div>
                            </a>
          </figcaption>
  </figure>
  </li><li godno="GM0122052555876"> <!-- 대형 이미지 클래스 product-sp-->
  <figure class="item-box" data-ga-id="GM0122052555876" data-ga-name="슬림핏 퀼팅 롱 베스트" data-ga-brand="TOMMY HILFIGER WOMEN" data-ga-price="415000">
      <div class="item-img">
          <div class="img-box">
              <a href="javascript:void(0);" onclick="goGodDetail('GM0122052555876')">
                  <div class="img">
                      <img src="https://cdn.hfashionmall.com/goods/THBR/22/05/25/GM0122052555876_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600" alt="슬림핏 퀼팅 롱 베스트" onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
                          </div>
                  </a>
          </div>
          <button type="button" class="btn-like" onclick="likeGod(this);" godno="GM0122052555876"><span>좋아요</span></button>
          <button type="button" class="btn-quick" onclick="showProductQuickView('GM0122052555876');"><span>상품 퀵뷰</span></button>
          </div>
      <figcaption class="item-info">
          <a href="javascript:void(0);" onclick="goGodDetail('GM0122052555876')">
              <div class="item-brand">TOMMY HILFIGER WOMEN</div>
              <div class="item-name">슬림핏 퀼팅 롱 베스트</div>
              <div class="item-price">
                                  <span class="price">415,000</span>
                              </div>
                         </a>
          </figcaption>
  </figure>
  </li></ul>
  
  
      <div class="paging" id="pagingArea">
          <span>
              <strong title="현재 페이지">1</strong>
                  <a href="javascript:void(0)" id="page_2" onclick="movePage('2')">2</a>
                  <a href="javascript:void(0)" id="page_3" onclick="movePage('3')">3</a>
                  <a href="javascript:void(0)" id="page_4" onclick="movePage('4')">4</a>
                  <a href="javascript:void(0)" id="page_5" onclick="movePage('5')">5</a>
                  <a href="javascript:void(0)" id="page_6" onclick="movePage('6')">6</a>
                  <a href="javascript:void(0)" id="page_7" onclick="movePage('7')">7</a>
                  <a href="javascript:void(0)" id="page_8" onclick="movePage('8')">8</a>
                  <a href="javascript:void(0)" id="page_9" onclick="movePage('9')">9</a>
                  <a href="javascript:void(0)" id="page_10" onclick="movePage('10')">10</a>
                  </span>
          <a class="next" href="javascript:void(0)" title="다음 페이지" onclick="movePage('11')">다음 페이지</a>
          </div>
  </div>
  </section>
  <script type="text/javascript" src="/hfm_pc/resources/js/filter.js?timestamp=20220907151706"></script>
  <script type="text/javascript" src="/hfm_pc/resources/js/libs/nouislider.min.js?timestamp=20220907151706"></script>
  
  
  <script type="text/javascript" src="/hfm_pc/resources/js/display/display.js?timestamp=20220907151706"></script>
  <script>
  var grdCd = 'GNRL';
  $(document).ready(function(){
  
      if($("#newPdBanner").length > 0){
          slide.create('newPdBanner');
      }
      if($("#newPdSlide").length > 0){
          slide.create('newPdSlide');
      }
      if($("#visualSlide5").length > 0){
          slide.create('visualSlide5');
      }
      if($("#banner1").length > 0){
          slide.create('banner1');
      }
      if($("#visualSlide10-1").length > 0){
          var obj = $("#visualSlide10-1").find(".product-list").find("ul:first  > li");
          if(obj != null && obj != 'undefined' && obj.length > 5){
              slide.bind('#visualSlide10-1', 'opt4 nav auto');
              $("#btnKwdCnrGod").show();
          }
      }
      if($("#visualSlide13").length > 0){
          var obj = $("#visualSlide13").find(".slide-container").find("ul:first  > li");
          if(obj != null && obj != 'undefined' && obj.length > 1){
              slide.create('visualSlide13');
              $("#btnCnrConttMoviCampaing").show();
          }
      }
      var dspCtgryNo = 'HFMA02A04';
      if($("#visualSlide10").length > 0 && dspCtgryNo != ""){
          $.ajax({
              type : "GET",
              async : true,
              url : "/ui2/display/getBestGod",
              data : {"dspCtgryNo" : dspCtgryNo, "otltYn" : "", "brndId" : "", "bestPageYn" : "", "godListSize" : 20},
              beforeSend: function (request){
                  var csrfToken = $("meta[name='_csrf']").attr("content");
                  var csrfName = $("meta[name='_csrf_header']").attr("content");
                  request.setRequestHeader(csrfName, csrfToken);
              },
              success: function(data) {
                  if($("#ctgryCnrBestSellerGod").length > 0){
                      $("#ctgryCnrBestSellerGod").html(data);
                  }
                  var obj = $("#visualSlide10").find(".product-list").find("ul:first  > li");
                  if(obj != null && obj != 'undefined' && obj.length > 5){
                      slide.create('visualSlide10');
                      $("#ctgryCnrBestSellerSlideBtn").show();
                  }
              },
              error: function(pa_data, status, err) {
              },
              complete: function () {
              }
          });
      }
  
      
  
      getSearchFilterLayer();
      getGodIconList(grdCd, "#productsList");
      $(".sel-btn").text($("#sortGodColum").find("[name='pdSort']:checked").parent().find("span").text());
      
      
      var dspCtgryName= '아우터';
      //braze - category event 
      try {
          
          appboy.logCustomEvent("hfashion_category", {
              cateNo :  dspCtgryNo,
              cateName : dspCtgryName
          });
          
      } catch (e){
          console.log(e);
      } 
      
      
  });
  
  /**
   * 상품 찜하기
   *
   * @param obj
   */
  function likeGod(obj) {
      
          alert("로그인 후 이용가능합니다.");
          location.href="/public/member/login";
      
  }
  
  function fnc_kwdCnrGodChange(obj, idx){
      if($(obj) != null && $(obj) != 'undefined' && !$(obj).hasClass("on")){
          $(obj).siblings().removeClass("on");
          $(obj).addClass("on");
  
          var elGodList = $("#ulKwdCnrGodList");
          var elGodListWrap = elGodList.parent();
          var elNewGodList = $("#ulKwdCnrGodList_"+idx);
          var elBtnKwdCnrGod = $("#btnKwdCnrGod");
  
          if(elNewGodList != null && elNewGodList != 'undefined' && elGodList != null && elGodList != 'undefined'){
              elGodListWrap.children().remove();
              elGodListWrap.html(elNewGodList[0].outerHTML);
              elGodListWrap.find('ul').attr('id', "ulKwdCnrGodList");
              elGodListWrap.find('ul').show();
              elBtnKwdCnrGod.hide();
              if(elGodListWrap.find('ul li').length > 5){
                  slide.bind('#visualSlide10-1', 'opt4 nav auto');
                  elBtnKwdCnrGod.show();
              }
          }
      }
  }
  
  $(window).on('popstate', function(){
      setFilterHistory();
      selectProductList(false);
  });
  
  function getSearchFilterLayer() {
      var thisDspCtgryNo = 'HFMA02A04';
      var brndId = '';
  
      var params = {};
      params['mallGubun'] = "CTGRY";
      params['otltYn'] = '';
  
      if(''=='Y') {
          if((thisDspCtgryNo == '' || thisDspCtgryNo == 'HFM') && brndId != '') {
              params['cateCd'] = 'HFM';
              if('' == 'Y') {
                  params['upperBrandId'] = '';
              }
              else {
                  params['brandId'] = '';
              }
          }
          else {
              params['dspCtgryNo'] = thisDspCtgryNo;
              params['cateCd'] = thisDspCtgryNo;
          }
      }
      else {
          params['dspCtgryNo'] = thisDspCtgryNo;
          params['cateCd'] = thisDspCtgryNo;
      }
      getFilterLayer(params);
  }
  var paramObj = {"dspCtgryNo":"HFMA02A04"};
  if(paramObj.otltYn == 'Y'){
      paramObj.exceptSoldout = 'Y';
      paramObj.sortColumn = 'SALE_QTY_SEQ';		
      $("input[name='exceptSoldout']").val('Y');
      $("input[name='sortColumn']").val('SALE_QTY_SEQ');
  }
  
  /* CRITEO SCRIPT START  */
  // 만약 DOM 이 로딩된 후 매개변수가 적용된다면, 아래 예제와 같이 requireDOM을 추가합니다
  // ex. {event: "viewItem", item: "#Your item id#", requiresDOM: "yes"}
  var godNo1 = null;
  var godNo2 = null;
  var godNo3 = null;
  if($("#productsList").length > 0){
      if($("#productsList").find("li").length > 0){
          godNo1 = $("#productsList").find("li:eq(0)").find("figure").attr("data-ga-id");
      }
      if($("#productsList").find("li").length > 1){
          godNo2 = $("#productsList").find("li:eq(1)").find("figure").attr("data-ga-id");
      }
      if($("#productsList").find("li").length > 2){
          godNo3 = $("#productsList").find("li:eq(2)").find("figure").attr("data-ga-id");
      }
  }
  if(godNo1 != null || godNo2 != null || godNo3 != null){
      // 만약 DOM 이 로딩된 후 매개변수가 적용된다면, 아래 예제와 같이 requireDOM을 추가합니다 ex. {event: "viewItem", item: "#Your item id#", requiresDOM: "yes"}
      window.criteo_q = window.criteo_q || [];
      window.criteo_q.push(
          { event: "setAccount", account: 18031 },
          { event: "setSiteType", type: "d" }, // 일반 웹사이트 "d", 모바일 "m", 태블릿 "t" 세팅.
          { event: "viewList", item: [godNo1, godNo2, godNo3] } // 리스트의 여러 상품들 중 첫 3개 상품 아이디 삽입
      );
  }
  /* CRITEO SCRIPT END */
  
  
  
   //Appier Traking : View Product Category
   try {
       
       var appierRtCategory = ["HFMA02A04","아우터"];
       var appierRtProductIDList = [godNo1,godNo2, godNo3];
          
       window.appier_q = window.appier_q || [];
       window.appier_q.push(
         {"t": "register", "content": { "id": "52bd", "site": "hfashionmall.com" }},
         {"t": "type_listpage","categoryIDs": appierRtCategory, "productIDList": appierRtProductIDList}
       );
  
   } catch (e){
       console.log(e);
   } 
  </script></div>
  </body>

<%@ include file="../footer.jsp" %>