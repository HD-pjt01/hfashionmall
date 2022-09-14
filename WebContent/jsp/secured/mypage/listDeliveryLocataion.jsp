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
                          <h3 class="page-title">배송지 관리</h3>
  
  <div class="nodata">
              <p class="txt-nodata">등록된 배송지 내역이 없습니다.</p>
          </div>
      <div class="btn-box">
      <button type="button" class="btn-type4-lg" onclick="setUserDeliveryBase(); return false;"><span>기본 배송지로 설정</span></button>
      <button type="button" class="btn-type2-lg" onclick="getLayerPopupDeliverySetting('insert'); return false;"><span>배송지 등록</span></button>
  </div>
  
  <!-- 팝업 : 배송지 등록 / 수정 -->
  <div id="layerAddress" class="layer-pop" tabindex="0">
      <div class="layer-wrap" tabindex="0">
          <div class="layer-header">
              <h2 class="layer-title" id="layerTitle">배송지 등록</h2>
          </div>
          <form id="addDlvForm" method="post">
              <input type="hidden" name="mbrDlvsp.dlvAdbukTurn"/>
              <input type="hidden" name="mbrDlvsp.addrseNm"/>
              <input type="hidden" name="mbrDlvsp.mobilNo"/>
              <input type="hidden" name="mbrDlvsp.postNo"/>
              <input type="hidden" name="mbrDlvsp.baseAddr"/>
              <input type="hidden" name="mbrDlvsp.detailAddr"/>
              <input type="hidden" name="mbrDlvsp.baseDlvspYn"/>
              <input type="hidden" name="mbrDlvsp.telNo">
              <input type="hidden" name="mbrDlvsp.dlvAddrSectCd" id="dlvAddrSectCd">
              <input type="hidden" name="audCd" id="audCd">
                  <div class="layer-container">
                      <div class="layer-content">
                          <div class="tbl-write no-line">
                              <table>
                                  <caption>배송지 등록</caption>
                                  <colgroup>
                                      <col style="width: 130px">
                                      <col>
                                  </colgroup>
                                  <tbody>
                                  <tr>
                                      <th scope="row">수신자명 <span class="required">(필수)</span></th>
                                      <td>
                                          <div class="input-box">
                                              <input type="text" title="수신자명" class="inp-reset" id="addrseNm" maxlength="30">
                                              <div class="etc">
                                                  <button type="button" class="btn-clear"><span>지우기</span></button>
                                              </div>
                                          </div>
                                      </td>
                                  </tr>
                                  <tr>
                                      <th scope="row">휴대폰번호 <span class="required">(필수)</span></th>
                                      <td>
                                          <div class="input-box">
                                              <input type="text" title="휴대폰번호" class="inp-reset" id="mobilNo" maxlength="11">
                                              <div class="etc">
                                                  <button type="button" class="btn-clear"><span>지우기</span></button>
                                              </div>
                                          </div>
                                          <p class="txt-invalid" id="descMobileNumber"></p>
                                      </td>
                                  </tr>
                                  <tr>
                                      <th scope="row">전화번호</th>
                                      <td>
                                          <div class="input-box">
                                              <input type="text" title="연락처" class="inp-reset" id="telNo" maxlength="11">
                                              <div class="etc">
                                                  <button type="button" class="btn-clear"><span>지우기</span></button>
                                              </div>
                                          </div>
                                          <p class="txt-invalid" id="descTelNo"></p>
                                      </td>
                                  </tr>
                                  <tr>
                                      <th scope="row">주소 <span class="required">(필수)</span></th>
                                      <td>
                                          <div class="address-box">
                                              <div class="form-group">
                                                  <div class="input-box">
                                                      <input type="text" title="우편번호" id="zipcode" readonly>
                                                  </div>
                                                  <button type="button" class="btn-type1-m" id="postSrchBtn"><span>우편번호</span></button>
                                              </div>
                                              <div class="input-box">
                                                  <input type="text" title="기본 주소" id="baseAddr" validate="required;xss;" readonly>
                                              </div>
                                              <div class="input-box">
                                                  <input type="text" title="나머지 주소" class="inp-reset" id="detailAddr" validate="required;xss;" maxlength="100">
                                                  <div class="etc">
                                                      <button type="button" class="btn-clear"><span>지우기</span></button>
                                                  </div>
                                              </div>
                                          </div>
                                      </td>
                                  </tr>
                                  </tbody>
                              </table>
                          </div>
                          <div class="list-btm-group">
                              <label class="check-skin">
                                  <input type="checkbox" id="baseDlvspYn">
                                  <span>기본 배송지로 설정</span>
                              </label>
                          </div>
  
                          <div class="btn-box">
                              <button type="button" class="btn-type4-lg" id="addressClose" onclick="layer.close('layerAddress');"><span>취소</span></button>
                              <button type="button" class="btn-type2-lg" onclick="ajxSetDeliveryEditing(); return false;"><span>저장</span></button>
                          </div>
                      </div>
                  </div>
              </form>
          <button type="button" class="btn-layer-close" id="layerClose" onclick="layer.close('layerAddress');">닫기</button>
      </div>
  </div>
  <!-- //팝업 : 배송지 등록 / 수정-->
  
  <div id="layerZip" class="layer-pop" tabindex="0">
      <div class="layer-wrap" tabindex="0">
          <div class="layer-header">
              <h2 class="layer-title">우편번호 찾기</h2>
          </div>
          <form id="searchAddrForm" method="post">
              <input type="hidden" name="currentPage" value="1"/>
              <input type="hidden" name="countPerPage" value="10"/>
              <input type="hidden" name="resultType" value="json"/>
              <input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE5MDQxNTE3MjkwNzEwODY1MTk="/> <!--승인키 -->
              <div class="layer-container">
                  <div class="layer-content">
                      <div class="search-zip">
                          <input type="text" title="도로명 주소, 건물명 또는 지번입력" placeholder="도로명 주소, 건물명 또는 지번입력" class="inp-search"
                                 id="keyword" name="keyword" onkeypress="if(event.keyCode==13){getAddr(); return false;}">
                          <button type="button" class="btn-search" onclick="javascript:getAddr(); return false;"><span>검색</span></button>
                      </div>
                      <p class="txt-form-cmt">검색어 예 : 도로명(도산대로 523), 건물명(독립기념관), 지번(청담동 125-23)</p>
  
                      <!-- 검색결과 -->
                      <div class="zip-result-box">
                          <div class="board-head">
                              <p class="count">검색결과 <span class="num" id="totalRow">0</span>(건)</p>
                          </div>
                          <div class="board-list board-zip">
                              <div class="list-header">
                                  <div class="list-row">
                                      <div class="cell-zip">우편번호</div>
                                      <div class="cell-address">주소</div>
                                  </div>
                              </div>
                              <ul class="list-content">
                                  <!-- 내역 있을 경우 -->
                                  <li id="result" style="display: none;">
  
                                  </li>
  
                                  <!-- 내역 없을 경우 -->
                                  <li id="noData" style="display: none;">
                                      <div class="nodata">
                                          <p class="txt-nodata">검색된 주소지가 없습니다.</p>
                                      </div>
                                  </li>
  
                              </ul>
  
                              <div class="paging" id="paging" style="display: none;">
  
                              </div>
                          </div>
                          <!-- //검색결과 -->
  
                      </div>
                  </div>
                  <button type="button" class="btn-layer-close" onclick="resetForm('close');">닫기</button>
              </div>
          </form>
      </div>
  </div>
  
  <script>
  
      var mbrDlvspList = [];
      
  
      $(document).ready(function(){
          
          $('#postSrchBtn').on('click', function () {
              layer.open('layerZip');
          });
  
          $("#addrseNm").keyup(function (e) {
              var value = $(this).val();
  
              if(value.length > $(this).attr('maxlength')){
                  $(this).val($(this).val().substr(0,$(this).attr('maxlength')));
              }
          });
  
          $("#mobilNo").keyup(function (e) {
              var code = e.keyCode || e.which;
              if (code == '9') {
                  return false;
              }
              var strReg = /^[0-9]+$/;
  
              if (!strReg.test($(this).val()) && code != '13') {
                  $(this).val("");
                  $("#descMobileNumber").css('display', 'block');
                  $("#descMobileNumber").text("숫자만 입력해주세요.");
                  return;
              } else {
                  $("#descMobileNumber").text("");
              }
          });
  
          $("#telNo").keyup(function (e) {
              var code = e.keyCode || e.which;
              if (code == '9') {
                  return false;
              }
              var strReg = /^[0-9]+$/;
  
              if (!strReg.test($(this).val()) && code != '13') {
                  $(this).val("");
                  $("#descTelNo").css('display', 'block');
                  $("#descTelNo").text("숫자만 입력해주세요.");
                  return;
              } else {
                  $("#descTelNo").text("");
              }
          });
  
          $("#addressClose").click(function(e){
              $("#descMobileNumber").text("");
              $("#descTelNo").text("");
          });
  
          $("#layerClose").click(function(e){
              $("#descMobileNumber").text("");
              $("#descTelNo").text("");
          });
  
      });
  
      // 팝업창 열기 - 배송지 등록 / 수정
      function getLayerPopupDeliverySetting(type , dlvAdbukTurn) {
  
          if(type == "insert") {
              $("#adbukNm").val("");
              $("#addrseNm").val("");
              $("#mobilNo").val("");
              $("#telNo").val("");
              $("#zipcode").val("");
              $("#baseAddr").val("");
              $("#detailAddr").val("");
              $("input:hidden[name='mbrDlvsp.dlvAdbukTurn']").val("");
  
              $('#layerTitle').text('배송지 등록');
              layer.open('layerAddress');
  
          } else if(type == "modify") {
              /* 선택된 객체 찾기 */
              for(var i = 0 ; i < mbrDlvspList.length; i++) {
                  if(mbrDlvspList[i].dlvAdbukTurn == dlvAdbukTurn) {
                      $("input:hidden[name='mbrDlvsp.dlvAdbukTurn']").val(mbrDlvspList[i].dlvAdbukTurn);
                      $("#adbukNm").val(mbrDlvspList[i].adbukNm);
                      $("#addrseNm").val(mbrDlvspList[i].addrseNm);
                      $("#mobilNo").val(mbrDlvspList[i].mobilNo);
                      $("#telNo").val(mbrDlvspList[i].telNo);
                      $("#zipcode").val(mbrDlvspList[i].postNo);
                      $("#baseAddr").val(mbrDlvspList[i].baseAddr);
                      $("#detailAddr").val(mbrDlvspList[i].detailAddr);
                      $("#dlvAddrSectCd").val(mbrDlvspList[i].dlvAddrSectCd);
                      break;
                  }
              }
  
              $('#layerTitle').text('배송지 수정');
              layer.open('layerAddress');
          }
      }
  
      // 기본배송지 설정
      function setUserDeliveryBase() {
          var dlvCnt = 0;
          if(dlvCnt == 0){
              alert("등록된 배송지가 없습니다.");
              return false;
          }
  
          if(!$('input[name=dlvAdbukTurn]').is(":checked")){
              alert("배송지를 선택해주세요.");
              return false;
          }
  
          var strParams = {"member" : "N"  ,"mbrDlvsp.dlvAdbukTurn" : $("input:radio[name='dlvAdbukTurn']:checked").val(),'_csrf' : '7b3792f8-43df-449d-9cbb-8a37d6a9d26e'};
          $.ajax({
              type : "post",
              url : "/secured/mypage/setUserDeliveryBase",
              data : strParams,
              success : function(args) {
                  location.href="/secured/mypage/listDeliveryLocation";
              },
              error : function(e) {
                  alert(e.responseText);
              }
          });
      }
  
      /**
       * 배송지 삭제
       */
      function setUserDeliveryDelete(dlvAdbukTurn, baseDlvspYn) {
  
          if (baseDlvspYn == 1) {
              alert("기본 배송지는 삭제할 수 없습니다.");
              return false;
          } else{
              if(confirm("배송지를 삭제하시겠습니까?")){
                  var strParams = { "mbrDlvsp.dlvAdbukTurn" : dlvAdbukTurn ,'_csrf' : '7b3792f8-43df-449d-9cbb-8a37d6a9d26e'};
                  $.ajax({
                      type : "post",
                      url : "/secured/mypage/setUserDeliveryDelete",
                      async: false,
                      data : strParams,
                      success : function(args) {
                          location.href="/secured/mypage/listDeliveryLocation";
                      },
                      error : function(e) {
                          alert(e.responseText);
                      }
                  });
              }
          }
      }
  
      // 주소 검색 API 호출
      function getAddr(pageNum) {
          $("#keyword").blur();
          var keyword = $("#keyword").val();
  
          if (!validateKeyword(keyword)) {
              return ;
          }
  
          if(pageNum == undefined){
              pageNum = 1;
          }
          $("input[name=currentPage]").val(pageNum);
  
          $.ajax({
              type: "POST",
              data:$("#searchAddrForm").serialize(),
              url : "https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do",
              dataType: "jsonp",
              success: function(jsonStr) {
                  $(".txt-form-cmt").hide();
                  $("#keyword").val(keyword);
  
                  $("#result").empty();
  
                  var errCode = jsonStr.results.common.errorCode;
                  var errDesc = jsonStr.results.common.errorMessage;
                  if(errCode != "0"){
                      alert(errCode+"="+errDesc);
                  }else{
                      if(jsonStr != null){
                          var total = Number(jsonStr.results.common.totalCount);
                          if(total > 0){
                          //	$("#addrList").html(htmlStr);
                              $("#noData").hide();
                              $("#totalRow").text(total);
                              $("#result").show();
                              $("#result").append(makeListJson(jsonStr));
                              setPager(jsonStr);
                          }else{
                              $("#noData").show();
                              resetForm('reset');
                          }
  
                      }
                  }
              },
              error: function(jqXHR) {
                  alert("에러발생");
              }
          });
      }
  
      // 검색어 유효성 체크
      function validateKeyword(keyword){
          if(keyword.length >0){
              //특수문자 제거
              var expText = /[%=><]/ ;
              if(expText.test(keyword) == true){
                  alert("특수문자는 입력 할수 없습니다.") ;
                  $("#keyword").val(keyword.split(expText).join(""));
                  return false;
              }
  
              //특정문자열(sql예약어의 앞뒤공백포함) 제거
              var sqlArray = new Array(
                      //sql 예약어
                      "OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
                      "UNION",  "FETCH", "DECLARE", "TRUNCATE"
              );
  
              var regex;
              for(var i=0; i<sqlArray.length; i++){
                  regex = new RegExp( sqlArray[i] ,"gi") ;
  
                  if (regex.test(keyword) ) {
                      alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
                      $("#keyword").val(keyword.replace(regex, ""));
                      return false;
                  }
              }
          }else{
              alert("검색할 지역명(도로명)을 입력해 주세요.");
              $("#keyword").focus();
              return false;
          }
          return true ;
  
      }
  
      function makeListJson(jsonStr){
          var html = "";
          $(jsonStr.results.juso).each(function(index){
              html+="	<div class='list-row' onclick='setzipcode(\"" + this.zipNo +"\",\"" + this.roadAddr +"\",\"" + this.admCd +"\")'>";
              html+="		<div class='cell-zip'>"+ this.zipNo+ "</div>";
              html+="		<div class='cell-address'>";
              html+="			<p>"+ this.roadAddr+ "</p>";
              html+="			<p>[지번] "+ this.jibunAddr+ "</p>";
              html+="		</div>";
              html+="	</div>";
          });
          return html;
      }
  
      function setPager(jsonStr){
  
          var total = Number(jsonStr.results.common.totalCount); // 총건수
          var pageNum =  Number(jsonStr.results.common.currentPage); // 현재페이지
          var html = "";
  
          $("#paging").empty();
          if (total > 0) {
              var pageBlock =  Number($("input[name=countPerPage]").val());
              var pageSize =  Number($("input[name=countPerPage]").val());
              var totalPages = Math.floor((total-1)/pageSize) + 1;
              var firstPage = Math.floor((pageNum-1)/pageBlock) * pageBlock + 1;
              if( firstPage <= 0 ) firstPage = 1;
              var lastPage = firstPage-1 + pageBlock;
              if( lastPage > totalPages ) lastPage = totalPages;
              var nextPage = lastPage+1 ;
              var prePage = firstPage-10 ;
  
              if (firstPage > pageBlock) {
                  html += '<a href="javascript:void(0);" class="prev" title="이전 페이지" onclick="javascript:getAddr('+prePage+');return false;">이전 페이지</a>';
              }
              html += '<span>';
              for (i = firstPage; i <= lastPage; i++) {
                  if (pageNum == i) {
                      html += '<strong title="현재 페이지" >' + i + '</strong>';
                  }
                  else {
                      html += '<a href="javascript:void(0);" onclick="javascript:getAddr(' +i + ');return false;">' + i + ' </a>';
                  }
              }
              html += '</span>';
              if (lastPage < totalPages) {
                  html += '<a href="javascript:void(0);" class="next" title="다음 페이지" onclick="javascript:getAddr('+nextPage+');return false;">다음 페이지</a>';
              }
  
              $("#paging").append(html);
              $("#paging").show();
          }
          else {
              $("#paging").hide();
          }
      }
  
      function resetForm(flag){
          $("#result").empty();
          $("#paging").hide();
          $("#totalRow").text(0);
          $("#keyword").val("");
          if(flag == 'close'){
              $("#noData").hide();
              layer.close('layerZip');
          }
      }
  
      function setzipcode(strZipcode, strBaseAddr, admCd) {
          $("#zipcode").val(strZipcode);
          $("#baseAddr").val(strBaseAddr);
          $("#audCd").val(admCd);
          $("#dlvAddrSectCd").val("RD_ADDR");
          resetForm('close');
      }
  
      /**
       * 배송지 수정, 저장 프로세스
       */
      function ajxSetDeliveryEditing() {
          var addrseNm =  $("input#addrseNm").val();
          var strReg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/;
  
          if(addrseNm == ""){
              alert("수신자명을 입력해주세요.");
              return;
          }
  
          if(addrseNm.length < 2){
              alert("2자 이상 30자 이하 입니다.");
              return;
          }
  
          if (!strReg.test(addrseNm)) {
              alert("한글, 영어만 입력할 수 있습니다.");
              return;
          }
  
          var mobilNo = $("#mobilNo").val();
          var mobilNoStrReg = /(01[016789])(\d{4}|\d{3})\d{4}$/g;
  
          if(mobilNo == ""){
              alert("휴대폰번호를 입력해주세요.");
              return;
          }
  
          if(mobilNo.length < 10){
              alert("10자 이상 11자 이하로 입력해주세요.");
              return;
          }
  
          if(!mobilNoStrReg.test(mobilNo)){
              alert("휴대폰번호 형식에 맞지 않습니다.");
              return;
          }
  
          if($("input#zipcode").val() == "" || $("input#baseAddr").val() == ""){
              alert("우편번호를 선택해주세요.");
              return;
          }
  
          if($("input#detailAddr").val() == ""){
              alert("상세주소를 입력해주세요.");
              return;
          }
  
          $("input:hidden[name='mbrDlvsp.addrseNm']").val($("#addrseNm").val());
          $("input:hidden[name='mbrDlvsp.mobilNo']").val($("#mobilNo").val());
          $("input:hidden[name='mbrDlvsp.postNo']").val($("#zipcode").val());
          $("input:hidden[name='mbrDlvsp.baseAddr']").val($("#baseAddr").val());
          $("input:hidden[name='mbrDlvsp.detailAddr']").val($("#detailAddr").val());
          $("input:hidden[name='mbrDlvsp.telNo']").val($("#telNo").val());
  
          if($("#baseDlvspYn").prop('checked')){
              $("input:hidden[name='mbrDlvsp.baseDlvspYn']").val("Y");
          }
  
          var param = $('#addDlvForm').serialize();
  
          $.ajax({
              type : "post",
              url : "/secured/mypage/addDeliveryLocation.json",
              async: false,
              data : param,
              success : function(args) {
                  location.href="/secured/mypage/listDeliveryLocation";
              },
              error : function(e) {
                  alert("오류가 발생했습니다.");
              }
          })
      }
  </script></div>
      </section>
      </div>
  </div>
  </body>


<%@ include file="../footer.jsp" %>