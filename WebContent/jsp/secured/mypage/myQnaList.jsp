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
                          <script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220907151706" ></script>
  
      <h3 class="page-title">상품 Q&amp;A</h3>
  
      <!-- summary-box -->
      <div class="summary-box">
          <ul>
              <li>
                  <span class="title">전체문의</span>
                  <span class="value"><a href="javascript:void(0);" onclick="goList(1,'')" id="ansStatCdAll">0</a></span>
              </li>
              <li>
                  <span class="title">답변완료</span>
                  <span class="value"><a href="javascript:void(0);" onclick="goList(1,'ANS_COMPT')" id="ansStatCdCompt">0</a></span>
              </li>
              <li>
                  <span class="title">답변대기</span>
                  <span class="value"><a href="javascript:void(0);" onclick="goList(1,'ANS_WAIT')" id="ansStatCdWait">0</a></span>
              </li>
          </ul>
      </div>
      <!-- //summary-box -->
      <input type="hidden" id="ansStatCd" value="" >
      <div id="qnaFold" class="board-list board-qna myqna ui-fold">
          <div class="nodata">
          <p class="txt-nodata">현재 문의하신 내용이 없습니다.</p>
  </div>
  <script>
      $(document).ready(function() {
          setTimeout(function () { $("#qnaFold").removeClass("initialized"); fold.init();}, 100);
      });
  
      $("#ansStatCdAll").html(0);
      $("#ansStatCdCompt").html(0);
      $("#ansStatCdWait").html(0);
  </script>
  </div>
  
  
  <script type="text/javascript">
      $(document).ready(function() {
      });
  
      function goList(pageNo, ansStatCd) {
          if(checkHasRoleAjax()) {
              if (pageNo > 0) {
              } else {
                  pageNo = 1;
              }
              if(ansStatCd != undefined) $("#ansStatCd").val(ansStatCd);
  
              var params = {
                  "pageNo": pageNo
                  ,"ansStatCd": $("#ansStatCd").val()
              };
  
              $("#qnaFold").load("/secured/mypage/myQnaListAjax", params );
          }
      }
  
      /**
       * 상품 Q&A 등록 레이어
       * @param godInqSn  ( 상품문의 일련번호, 신규등록은 공백)
       * @param godNo     ( 상품번호 )
       */
      function goQnaEdit(godInqSn, godNo){
          if(checkHasRoleAjax()) {
              var params = {
                  "godInqSn": godInqSn
                  , "csoGodInq.godNo": godNo
              };
  
              if ($("#layerProductQnA").length > 0) {
                  $("#layerProductQnA").remove();
              }
  
              $.ajax({
                  type: "GET",
                  async: true,
                  dataType: "html",
                  url: "/secured/mypage/myQnaLayerAjax",
                  data: params,
                  beforeSend: function (request) {
                      var csrfToken = $("meta[name='_csrf']").attr("content");
                      var csrfName = $("meta[name='_csrf_header']").attr("content");
                      request.setRequestHeader(csrfName, csrfToken);
                  },
                  success: function (data) {
                      $("body").append(data);
                      layer.open('layerProductQnA');
                  },
                  error: function (pa_data, status, err) {
                      alert("올바르지 않은 데이터입니다.");
                  }
              });
          }
      }
  
      /**
       * Q&A 삭제
       * @param mtmInqSn
       */
      function deleteQna(godInqSn){
          if (confirm("삭제하시겠습니까?")) {
              if(checkHasRoleAjax()) {
                  var data = {
                      "searchGodInqSn": godInqSn
                  }
                  $.ajax({
                      type: "POST",
                      data: data,
                      url: "/secured/mypage/deleteQnaHfm",
                      dataType: 'json',
                      success: function (data) {
                          goList();
                          alert("삭제 되었습니다");
                      },
                      error: function (jqXHR) {
                          alert(jqXHR.responseText);
                      }
                  });
              }
          }
      }
  
  </script>
  </div>
      </section>
      </div>
  </div>
  </body>

<%@ include file="../footer.jsp" %>