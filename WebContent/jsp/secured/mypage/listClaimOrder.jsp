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
                          <script type="text/javascript" src="/resources/js/moment.js"></script>
  <script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
  <script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220907151706" ></script>
  
      <input type="hidden" name="_csrf" value="dea9467a-fa41-4336-8be0-7f8427dd643d"/>	
      <input type="hidden" id="srchMonth" name="srchMonth" value="">
      <input type="hidden" name="srchType" id="srchType" value ="">
  
  
  
  
          <h3 class="page-title">취소/교환/반품</h3>
  
          <div class="page-info">
              <p class="txt-type3">취소/교환/반품 신청내역 및 진행상태를 확인하실 수 있습니다.</p>
          </div>
  
          
          
          <div id="claimTab" class="tab-wrap2 ui-tab">
              <ul class="tabs tab-btn">
                  <li class="on"><a href="javascript:;" onclick="setSearchValue('D','','1','');" >취소 <span class="num" id="cnclCount">(0)</span></a></li>
                  <li ><a href="javascript:;" onclick="setSearchValue('B','','1','');" >교환 <span class="num" id="exchgCount">(0)</span></a></li>
                  <li ><a href="javascript:;" onclick="setSearchValue('C','','1','');" >반품 <span class="num" id="rtnCount">(0)</span></a></li>
              </ul>
              
              <!--  취소  -->
              <div class="tab-cont on">
                  <!-- period-search-group -->
                  <div class="period-search-group">
                      <dl class="period-btns-box">
                          <dt>기간</dt>
                          <dd>
                              <div class="period-btns">
                                  <label>
                                      <input type="radio" name="period" checked onClick="setDay('-15', 'D');" >
                                      <span>15일</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period" onClick="setMonth('oMouth', 'D');">
                                      <span>1개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period" onClick="setMonth('tMouth', 'D');">
                                      <span>3개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period" onClick="setMonth('sMouth', 'D');">
                                      <span>6개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period" onClick="setMonth('yMouth', 'D');">
                                      <span>12개월</span>
                                  </label>
                              </div>
                          </dd>
                      </dl>
      
                      <div class="period-calendar">
                          <div class="period-input">
                              <input type="text" name="dateStartD" id="dateStartD" class="inp-datepicker datepicker" title="시작일" value="" readonly>
                          </div>
                          <div class="period-input">
                              <input type="text" name="dateEndD" id="dateEndD" class="inp-datepicker datepicker" title="종료일" value="" readonly>
                          </div>
                          <button type="button" class="btn-type4-sm btn-period" onclick="goSearch('', '');" ><span>조회</span></button>
                      </div>
                  </div>
                  <script>
                      $('.datepicker').datepicker({
                          showOn: 'button',
                          buttonImage: '/resources/images/btn_calendar.png',
                          buttonImageOnly: false,
                          buttonText: '날짜 선택',
                      });
                  </script>
                  <!-- //period-search-group -->
      
                  <div class="order-list-wrap" id="includeCancelOrderList"></div>
                  
                  <dl class="txt-group">
                      <dt>취소 안내</dt>
                      <dd>
                          <ul class="txt-list">
                              <li>주문 시 무료배송으로 받았다 할지라도 주문취소 또는 반품 시 최초 배송비가 부과될 수 있습니다.</li>
                              <li>
                                  환불 시 최초 배송비를 제외한 상품에 대한 금액만 환불이 되므로 실제 환불 금액과 일부 상이할 수 있습니다.<br>
                                  또한 쿠폰이나 포인트 사용으로 인해 금액의 차이가 발생 할 수 있으니 확인 바랍니다.
                              </li>
                              <li>결제수단별 환불방법과 환불소요기간에 차이가 있습니다.</li>
                              <li>부분취소 또는 부분반품 시 포인트는 결제금액 비율로 일부가 복원되거나 유효기간에 따라 소멸될 수 있습니다.</li>
                          </ul>
                      </dd>
                  </dl>			
                  
              </div>
              
              <!--  교환  -->
              <div class="tab-cont ">
                  <!-- period-search-group -->
                  <div class="period-search-group">
                      <dl class="period-btns-box">
                          <dt>기간</dt>
                          <dd>
                              <div class="period-btns">
                                  <label>
                                      <input type="radio" name="period2" onClick="setDay('-15', 'B');" checked>
                                      <span>15일</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period2" onClick="setMonth('oMouth', 'B');">
                                      <span>1개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period2" onClick="setMonth('tMouth', 'B');">
                                      <span>3개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period2" onClick="setMonth('sMouth', 'B');">
                                      <span>6개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period2" onClick="setMonth('yMouth', 'B');">
                                      <span>12개월</span>
                                  </label>
                              </div>
                          </dd>
                      </dl>
      
                      <div class="period-calendar">
                          <div class="period-input">
                              <input type="text" name="dateStartB" id="dateStartB" class="inp-datepicker datepicker" title="시작일" value="" readonly>
                          </div>
                          <div class="period-input">
                              <input type="text" name="dateEndB" id="dateEndB" class="inp-datepicker datepicker" title="종료일" value="" readonly>
                          </div>
                          <button type="button" class="btn-type4-sm btn-period" onclick="goSearch('', '');" ><span>조회</span></button>
                      </div>
                  </div>
                  <script>
                      $('.datepicker').datepicker({
                          showOn: 'button',
                          buttonImage: '/resources/images/btn_calendar.png',
                          buttonImageOnly: false,
                          buttonText: '날짜 선택',
                      });
                  </script>
                  <!-- //period-search-group -->
      
                  <div class="order-list-wrap" id="includeExchangeOrderList"></div>
                  
                  <dl class="txt-group">
                      <dt>교환 안내</dt>
                      <dd>
                          <ul class="txt-list">
                              <li>교환신청은 배송완료일부터 7일 이내까지 가능합니다.</li>
                              <li>교환은 동일한 상품/가격의 색상, 사이즈 변경만 가능하며, 재고가 부족한 경우 교환이 불가합니다.</li>
                              <li>상품과 주문내역확인서를 함께 동봉하여 택배 준비하신 후 방문하신 택배기사에게 전달해 주세요.</li>
                              <li>상품이 물류에 반품되어 검수한 후, 교환 절차가 진행됩니다.</li>
                              <li>빠른 교환을 위해 현재 교환이 가능한 옵션으로만 변경이 가능합니다.</li>
                          </ul>
                      </dd>
                  </dl>			
              </div>
      
              <!--  반품  -->
              <div class="tab-cont">
                  <!-- period-search-group -->
                  <div class="period-search-group">
                      <dl class="period-btns-box">
                          <dt>기간</dt>
                          <dd>
                              <div class="period-btns">
                                  <label>
                                      <input type="radio" name="period3" onClick="setDay('-15', 'C');" checked>
                                      <span>15일</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period3" onClick="setMonth('oMouth', 'C');">
                                      <span>1개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period3" onClick="setMonth('tMouth', 'C');">
                                      <span>3개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period3" onClick="setMonth('sMouth', 'C');">
                                      <span>6개월</span>
                                  </label>
                                  <label>
                                      <input type="radio" name="period3" onClick="setMonth('yMouth', 'C');">
                                      <span>12개월</span>
                                  </label>
                              </div>
                          </dd>
                      </dl>
      
                      <div class="period-calendar">
                          <div class="period-input">
                              <input type="text" name="dateStartC" id="dateStartC" class="inp-datepicker datepicker" title="시작일" value="" readonly>
                          </div>
                          <div class="period-input">
                              <input type="text" name="dateEndC" id="dateEndC" class="inp-datepicker datepicker" title="종료일" value="" readonly>
                          </div>
                          <button type="button" class="btn-type4-sm btn-period" onclick="goSearch('', '');" ><span>조회</span></button>
                      </div>
                  </div>
                  <script>
                      $('.datepicker').datepicker({
                          showOn: 'button',
                          buttonImage: '/resources/images/btn_calendar.png',
                          buttonImageOnly: false,
                          buttonText: '날짜 선택',
                      });
                  </script>
                  <!-- //period-search-group -->
      
                  <div class="order-list-wrap" id="includeClaimOrderList"></div>
                  
                  <dl class="txt-group">
                      <dt>반품 안내</dt>
                      <dd>
                          <ul class="txt-list">
                              <li>반품신청은 배송완료일부터 7일 이내까지 가능합니다.</li>
                              <li>주문 시 무료배송으로 받았다 할지라도 주문취소 또는 반품 시 최초 배송비가 부과될 수 있습니다.</li>
                              <li>환불 시 최초 배송비를 제외한 상품에 대한 금액만 환불이 되므로 실제 환불 금액과 일부 상이할 수 있습니다.<br>
                                  또한 쿠폰이나 포인트 사용으로 인해 금액의 차이가 발생 할 수 있으니 확인 바랍니다.</li>
                              <li>결제수단별 환불방법과 환불소요기간에 차이가 있습니다.</li>
                              <li>부분취소 또는 부분반품 시 포인트는 결제금액 비율로 일부가 복원되거나 유효기간에 따라 소멸될 수 있습니다.</li>
                              <li>상품과 주문내역확인서를 함께 동봉하여 택배 준비하신 후 방문하신 택배기사에게 전달해 주세요.</li>
                              <li>상품이 물류에 반품되어 검수한 후, 환불 절차가 진행됩니다.</li>
                              <li>결제수단이 무통장입금/실시간 계좌이체일 경우 반품완료 후 영업일 기준 3일 안으로 환불됩니다.</li>
                          </ul>
                      </dd>
                  </dl>
              </div>
      
              
              
          </div>
  
  
  
  <!-- s : 리뷰 작성 / 수정 레이어 팝업-->
  <div id="__dialogReview__"></div>
  <!-- s: popup - 배송 조회 -->
  
  <div id="layerTracking" class="layer-pop" tabindex="0"></div>
  <div id="includePayMethod" style="display: none"></div>
  
  <div id="deliveryInfoPopup" class="ui-dialog-contents" title="배송 조회">
      <div class="dialog-contents-flex">
          <div class="delivery-info-box">
              <div class="tbl-wrap tbl-row">
                  <table id="dlvTabUser">
                  </table>
              </div>
  
              <div class="tbl-wrap tbl-col">
                  <table id="dlvTabInfo">
                  </table>
              </div>
          </div>
      </div>
  </div>
  
  
      <script type="text/javascript">
      
  
      $(document).ready(function() {
          var strValue = $("#srchType").val();
          if(strValue != '') {
              setSearchValue(strValue,'tab','1','');
          }else {
              setDay(-15, 'D');
              setDay(-15, 'C');
              setDay(-15, 'B');
              setSearchValue('D','tab','1','');
          }
      });
      
      function setSearchValue(strValue,strType,page,statCd){		
          var fromDate = $("#dateStart" + strValue).val();
          var today = $("#dateEnd" + strValue).val();
  
          var strParams = {'_csrf' : 'dea9467a-fa41-4336-8be0-7f8427dd643d' , 
                          'srchType' : strValue , 
                          'dateStart' : fromDate , 
                          'dateEnd' : today ,
                          'page' : page ,
                          'pageSize' : '10',
                          'statCd' : ''
          };
          
          $("#srchType").val(strValue);
          var strValue = $("#srchType").val();
  
          if("B" == strValue){
              $("#includeExchangeOrderList").load("/secured/mypage/listClaimInclude", strParams);
              $("#includeClaimOrderList").empty();
              $("#includeCancelOrderList").empty();
              tab.active('#claimTab', 1);
          }else if("C" == strValue){
              $("#includeClaimOrderList").load("/secured/mypage/listClaimInclude", strParams);
              $("#includeExchangeOrderList").empty();
              $("#includeCancelOrderList").empty();
              tab.active('#claimTab', 2);
          }else if("D" == strValue){
              $("#includeCancelOrderList").load("/secured/mypage/listClaimInclude", strParams);
              $("#includeExchangeOrderList").empty();
              $("#includeClaimOrderList").empty();
              tab.active('#claimTab', 0);
          }
      }
      
      function goSearch(statCd, dayType){
          var srchType = $("#srchType").val();
  
          if(dayType == "oMouth" || dayType == "tMouth" || dayType == "sMouth"){
              setMonth(dayType, srchType);
          }else if(dayType == "oWeek"){
              setWeek(srchType);
          }else if(dayType == "15d"){
              setDay(-15, srchType);
          }
          
  
          var startDay = parseInt($('#dateStart' + srchType).val().replace(/-/g, ''),10);
          var endDay = parseInt($('#dateEnd' + srchType).val().replace(/-/g, ''),10);
          var toDay = parseInt(moment().format('YYYY-MM-DD').replace(/-/g, ''),10);
  
          if(startDay > endDay){
              alert("종료일이 시작일보다 앞일 수 없습니다.");
              return;
          }
          if (!checkDateTerm($('#dateStart' + srchType).val().replace(/-/g, '') , $('#dateEnd' + srchType).val().replace(/-/g, ''))) {
              alert("시작일로부터 최대 1년까지 조회 가능합니다.");
              return;
          }
          
          setSearchValue(srchType, '' ,1, statCd);
      }
  
  
      function setMonth(type, srchType){
          var val = 0;
          var addMonth = 0;
          
          //var today = "";
          //var fromDate = "";
  
          if (type == "ready") {
              addMonth = -3;
          }
          
          if(type == "ready"){
              val = Number($("#srchMonth").val())+3;
              
              addMonth = val*-1;
              today = moment().format('YYYY-MM-DD');
              fromDate = moment().add(addMonth, 'months').format('YYYY-MM-DD');
          }
          
          if(type == "oMouth"){
              addMonth = -1;
              
              today = moment().format('YYYY-MM-DD');
              fromDate = moment().add(addMonth, 'months').format('YYYY-MM-DD');
          }
          if(type == "tMouth"){
              addMonth = -3;
              
              today = moment().format('YYYY-MM-DD');
              fromDate = moment().add(addMonth, 'months').format('YYYY-MM-DD');
          }
          if(type == "sMouth"){
              addMonth = -6;
              
              today = moment().format('YYYY-MM-DD');
              fromDate = moment().add(addMonth, 'months').format('YYYY-MM-DD');
          }
          if(type == "yMouth"){
              addMonth = -12;
              
              today = moment().format('YYYY-MM-DD');
              fromDate = moment().add(addMonth, 'months').format('YYYY-MM-DD');
          }		
          
          if(type == "action"){
              today = $("#dateEnd" + srchType).val();
              fromDate = $("#dateStart" + srchType).val();
          }
          
          $("#dateStart" + srchType).val(fromDate);
          $("#dateEnd" + srchType).val(today);
          $("#srchMonth" + srchType).val(val);		
          
      }
      
      function setWeek(srchType){
          var addWeek = -7;
          
          today = moment().format('YYYY-MM-DD');
          fromDate = moment().add(addWeek, 'd').format('YYYY-MM-DD');
  
          $("#dateStart" + srchType).val(fromDate);
          $("#dateEnd" + srchType).val(today);
      }
      
      function setDay(dayCnt, srchType){
          var addWeek = dayCnt;
          
          today = moment().format('YYYY-MM-DD');
          fromDate = moment().add(addWeek, 'd').format('YYYY-MM-DD');
  
          $("#dateStart" + srchType).val(fromDate);
          $("#dateEnd" + srchType).val(today);
      }	
      
      function fnSearchMore(page,statCd){
          $("#page").val(page);
          
          var srchType = $("#srchType").val();
          
          var srchMonth = $("#srchMonth").val();
  
  
          setMonth('action');
          setSearchValue(srchType, '' ,page, statCd);
          
      }
  
      function closeShortage() {
          $("#dialogShortageText").dialog('close');
      }
  
      function checkDateTerm( fromDate, endDate){
          var startDt = new Date(Number(fromDate.substring(0,4)), Number(fromDate.substring(4,6)) -1, Number(fromDate.substring(6,8)));
          var endDt = new Date(Number(endDate.substring(0,4)), Number(endDate.substring(4,6)) -1, Number(endDate.substring(6,8)));
          var year = startDt.getFullYear();
  
          var dif = endDt-startDt;
          var day = 1000*60*60*24;
          var d = parseInt((dif/day),10);
  
          if(367 <= d){
              return false;
          }else{
              return true;
          }
      }
      </script>
      
      </div>        
    </section>
    </div>
      </div>
  </body>


<%@ include file="../footer.jsp" %>