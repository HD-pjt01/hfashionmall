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
                          <script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
  <script>
      $(document).ready(function() {
          Apple.init();
      });
  
      var Apple = (function() {
          var _target = $('a[href="#apple"]'); // 애플 로그인버튼
          var _MSG_IE = 'Edge 및 Chrome 브라우저로 이용해 주세요.';
  
          /**
           * ios 여부 확인
           */
          var _isIos = function() {
              var userAgent = navigator.userAgent.toLowerCase();
              return userAgent.match('.*iphone.*') || userAgent.match('.*ipad.*');
          };
  
          /**
           * ie 여부 확인
           */
          var _isIE = function() {
              return /msie|trident/i.test(navigator.userAgent.toLowerCase());
          }
  
          /**
           * 초기화
           * @param pDom 애플로그인 버튼 dom
           */
          var _init = function(pDom) {
              if( _isIE() ) {
                  return;
              }
              _target = pDom || $('a[href="#apple"]');
  
              $.ajax({
                  url : '/public/apple/getAppleLoginUrl.json'
                  , type : 'get'
                  , dataType : 'json'
                  , async: false
                  , success : function(d) {
                      // Apple ID 로그인 정보 있으면 초기화
                      // Apple.isIos() &&
                      if( null != d.appleidLoginData ) {
                          AppleID.auth.init({
                              clientId : d.appleidLoginData.clientId
                              , scope : 'email name'
                              , redirectURI : d.appleidLoginData.redirectUrl
                              , state : d.appleidLoginData.state
                              , usePopup : true //or false defaults to false
                          });
                      }
                  }
                  , error : function(e) {
                      console.log(e);
                  }
              });
          }
  
          var _getParam = function(data) {
              var params = {};
              if (data.authorization) {
                  $.extend(params, {
                      code : data.authorization.code || ''
                      , idToken : data.authorization.id_token || ''
                      , state : data.authorization.state || ''
                  });
              }
  
              if (data.user) {
                  $.extend(params, {
                      email : data.user.email || ''
                  });
                  if( data.user.name ) {
                      $.extend(params, data.user.name);
                  }
              }
              return params;
          }
  
          var _signin = function(url, callback) {
              if( _isIE() ) {
                  alert(_MSG_IE);
                  return;
              }
  
              AppleID.auth.signIn()
                  .then(function(data) {
                      console.log(data);
                      console.log(_getParam(data));
                      $.post(url, _getParam(data))
                          .done(function(d){
                              callback(d);
                          })
                          .fail(function(xhr,textStatus, errorThrown){
                              console.log(xhr.responseText);
                              console.log(textStatus);
                              console.log(errorThrown);
                              alert("애플 연동 에러가 발생했습니다.");
                          });
                  })
                  .catch(function(err) {
                      console.log(err);
                      if (err.message && !err.error) {
                          // err.error가 있으면 apple id에서 발생한 오류인데,
                          // apple ID 가이드로는 현재는 사용자의 취소 액션에 대해서만 실패한다고 하므로
                          // err.error이 있으면 alert 표시하지 않는다.
                          alert(err);
                      }
                  });
          }
  
          /**
           * 가입 callback
           */
          var _callbackJoin = function(d) {
              $("#snsCd").val('APPLE');
              if(d.result == "NO_JOIN"){
                  //연동 ID가 이미 존재하는 경우
                  $("#snsNm").html("애플");
                  // 아이디 설정을 안했을 경우 미노출
                  if(d.mbrId == ''){
                      $("#ulSnsId").hide();
                  }else{
                      $("#snsConnectedId").html(d.mbrId);
                  }
                  layer.open('layerSnsGuide');
              }
              else if (d.result == "APPLE_JOIN"){
                  var url = "/public/member/addMemberStep2";
                  jsLinkUrlPost(url, d);
              }
              else if (d.result == "NO_EMAIL"){
                  $("#allowed").val("N");
                  $("#layerHtml").html("애플");
                  layer.open('layerRequired');
              }
              else {
                  alert("애플 연동 에러가 발생했습니다.");
              }
          }
  
          /**
           * 로그인 callback
           */
          var _callbackLogin = function(d) {
              $("#snsCd").val('APPLE');
              if(d.result == "APPLE_LOGIN"){
                  simpleLogin();
              }
              else if (d.result == "NO_JOIN"){
                  if(confirm('H패션몰 회원정보를 찾을수 없어 회원가입이 필요합니다.\n'+
                      '만약 H패션몰 회원이시면 로그인후(최초 1회) 이용이 가능합니다.\n'+
                      '회원가입하시겠습니까?')){
                      var url = "/public/member/addMemberStep2";
                      if('' == 'SKMEM'){
                          url += '?regPath=';
                      }
                      jsLinkUrlPost(url, d);
                  }else{
                      $('#snsLinkFlag').val('APPLE');
                  }
              }
              else if (d.result == 'NO_EMAIL') {
                  console.log('noemail', d);
              }
              else{
                  alert("애플 연동 에러가 발생했습니다.");
              }
          }
  
          /**
           * 연결 callback
           */
          var _callbackLink = function(d) {
              $("#snsCd").val('APPLE');
              var _o = $('#snsApple');
              _o.prop('checked', false);
  
              if(d.result == "NO_JOIN"){
                  //연동 ID가 이미 존재하는 경우
                  $("#snsNm").html("애플");
                  // 아이디 설정을 안했을 경우 미노출
                  if(d.mbrId == ''){
                      $("#ulSnsId").hide();
                  }else{
                      $("#snsConnectedId").html(d.mbrId);
                  }
                  layer.open('layerSnsGuide');
              }
              else if (d.result == "APPLE_JOIN"){
                  _o.prop('checked', true);
                  _o.val(d['mbrIdCntc.loginId']);
                  $('#snsAppleLoginId').text(d['mbrIdCntc.loginId']);
                  if($('#snsLinkFlag').val() == 'APPLE'){
                      if('' == '' || '' == 'null'){
                          window.document.location.href=$("#loginTarget").val();
                      }else{
                          window.document.location.href = '/main?regPath=';
                      }
                  }else{
                      alert("애플 계정 연결되었습니다.");
                  }
              }
              else if (d.result == "NO_EMAIL"){
                  $("#allowed").val("N");
                  $("#layerHtml").html("애플");
                  layer.open('layerRequired');
              }
              else {
                  alert("애플 연동 에러가 발생했습니다.");
              }
          }
  
          /**
           * 연결해제
           * @param id loginId
           */
          var _unlink = function(id) {
              var _o = $('#snsApple');
  
              $.ajax({
                  type: 'post',
                  cache: false,
                  data: { loginId : id },
                  url: "/public/apple/unlink.json",
                  success: function(d){
                      console.log(d)
                      _o.prop('checked', false);
                      _o.val('');
                      $('#snsAppleLoginId').text('');
  
                      alert('애플 계정 연결이 해제되었습니다.');
                  }
                  , error : function(e) {
                      _o.prop('checked', true);
  
                      alert("처리 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                  }
              });
          }
  
          return {
              init : function() {
                  _init();
              }
              , isIos : function() {
                  return _isIos();
              }
              , join : function() {
                  _signin('/public/apple/joinProcess.json', _callbackJoin);
              }
              , login : function() {
                  _signin('/public/apple/loginProcess.json', _callbackLogin);
              }
              , link : function() {
                  _signin('/public/apple/link.json', _callbackLink);
              }
              , unlink : function(id) {
                  _unlink(id);
              }
          }
      }());
  </script><script type="text/javascript" src="/hfm_pc/resources/js/libs/kakao.js?timestamp=20220907151706"></script>
  <script>
  
      $(document).ready(function() {
          kakao.init();
      });
  
      var kakao = (function(){
          var _target = $('a[href="#kakao"]'); // 카카오 로그인버튼
  
          var _init = function(){
              Kakao.init("7ff9b3975a248741826b114f95ef7cff");
          }
  
          var _signin = function(url, callback, state) {
              let access_token;
              Kakao.Auth.login({
                  success: function(response) {
  
                      if(response.access_token){
                          access_token = response.access_token;
                      }
                      Kakao.API.request({
                          url: '/v2/user/me',
                          success: function(response) {
                              $.ajax({
                                  type : "POST",
                                  data : _getParam(response, state, access_token),
                                  url : url,
                                  dataType : 'json',
                                  beforeSend: function (request)
                                  {
                                      var csrfToken = $("meta[name='_csrf']").attr("content");
                                      var csrfName = $("meta[name='_csrf_header']").attr("content");
                                      request.setRequestHeader(csrfName, csrfToken);
                                  },
                                  success : function(data) {
                                      callback(data);
                                  },
                                  error : function(e) {
                                      // alert("카카오 연동 에러가 발생했습니다.");
                                  }
                              });
                          },
                          fail: function(error) {
                              // alert("카카오 연동 에러가 발생했습니다.");
                              console.log("me error", response);
                          }
                      });
  
                  },
                  fail: function(error) {
                      alert("카카오 연동 에러가 발생했습니다.");
                      console.log("kakao login error", error);
                  },
              });
          }
  
          var _getParam = function(data, state, access_token) {
              var params = {};
              if (data.kakao_account) {
                  $.extend(params, {
                      email : data.kakao_account.email || ''
                      , access_token : access_token
                      , state: state
                      , idToken : data.id || ''
                  });
              }
              return params;
          }
  
          var _callbackJoin = function(d){
              $("#snsCd").val("KAKAO");
              if(d.result == "KAKAO_LOGIN"){
                  //연동 ID가 이미 존재하는 경우
                  $("#snsNm").html("카카오");
                  // 아이디 설정을 안했을 경우 미노출
                  if(d.mbrId == ''){
                      $("#ulSnsId").hide();
                  }else{
                      $("#ulSnsId").show();
                      $("#snsConnectedId").html(d.mbrId);
                  }
                  layer.open('layerSnsGuide');
              }else if (d.result == "KAKAO_JOIN"){
                  var kakaoObj = {
                      "result": d.result
                      ,"mbrIdCntc.idCntcTpCd": "KKO"
                      ,"mbrIdCntc.loginId": d.kakaoEmail
                      ,"mbr.mbrEmail": d.kakaoEmail
                      ,"mbrIdCntc.toknId": d.kakaoId
                  };
  
                  var url = "/public/member/addMemberStep2";
                  jsLinkUrlPost(url, kakaoObj);
              }else if (d.result == "NO_EMAIL"){
                  _unlink();
              }else if (d.result == "NO_TOKEN"){
                  alert("카카오톡 연동 에러가 발생했습니다. 토큰 발급 에러");
              }else{
                  alert("카카오톡 연동 에러가 발생했습니다.");
              }
          }
  
          var _unlink = function(){
              Kakao.API.request({
                  url: '/v1/user/unlink',
                  success: function(response) {
                      $("#layerHtml").html("카카오");
                      layer.open('layerRequired');
                  },
                  fail: function(error) {
                      console.log("kakao unlink", error);
                  },
              });
          }
  
          var _callbackLogin = function(d){
              $("#snsCd").val("KAKAO");
              if(d.result == "KAKAO_LOGIN"){
                  //정상 로그인
                  simpleLogin();
              }else if (d.result == "KAKAO_JOIN"){
                  // alert("카카오톡과 연결된 계정이 없습니다.");
                  if(confirm('H패션몰 회원정보를 찾을수 없어 회원가입이 필요합니다.\n'+
                      '만약 H패션몰 회원이시면 로그인후(최초 1회) 이용이 가능합니다.\n'+
                      '회원가입하시겠습니까?')){
                      var url = "/public/member/addMemberStep2";
                      if('' == 'SKMEM'){
                          url += '?regPath=';
                      }
                      var kakaoObj = {
                          "result": d.result
                          ,"mbrIdCntc.idCntcTpCd": "KKO"
                          ,"mbrIdCntc.loginId": d.kakaoEmail
                          ,"mbr.mbrEmail": d.kakaoEmail
                          ,"mbrIdCntc.toknId": d.kakaoId
                      };
                      jsLinkUrlPost(url, kakaoObj);
                  }else{
                      $('#snsLinkFlag').val('KAKAO');
                  }
              }else if (d.result == "NO_EMAIL"){
                  $("#allowed").val("N");
                  $("#layerHtml").html("카카오");
                  layer.open('layerRequired');
                  _unlink();
              }else if (d.result == "NO_TOKEN"){
                  alert("카카오톡 연동 에러가 발생했습니다. 토큰 발급 에러");
              }else{
                  alert("카카오톡 연동 에러가 발생했습니다.");
              }
          }
  
          var _callbackConnect = function(obj){
              window.focus();
              $("#snsCd").val("KAKAO");
              var _o = $('#snsKakao');
              // console.log('callbackKakao', obj);
              _o.prop('checked', false);
              if(obj.result == "KAKAO_LOGIN"){
                  //연동 ID가 이미 존재하는 경우
                  $("#snsNm").text("카카오");
                  $("#snsConnectedId").text(obj['mbrId']);
                  layer.open('layerSnsGuide');
              }else if (obj.result == "KAKAO_JOIN"){
                  _o.prop('checked', true);
                  _o.val(obj.kakaoEmail);
                  $('#snsKakaoLoginId').text(obj.kakaoEmail);
                  if($('#snsLinkFlag').val() == 'KAKAO'){
                      if('' == '' || '' == 'null'){
                          window.document.location.href=$("#loginTarget").val();
                      }else{
                          window.document.location.href = '/main?regPath=';
                      }
                  }else{
                      alert("카카오 계정 연결되었습니다.");
                  }
              } else if (obj.result == "NO_EMAIL") {
                  _unlink();
                  $("#layerHtml").text("카카오");
                  layer.open('layerRequired');
              }else if (obj.result == "NO_TOKEN"){
                  alert("카카오톡 연동 에러가 발생했습니다. 토큰 발급 에러");
              }else{
                  alert("카카오톡 연동 에러가 발생했습니다.");
              }
          }
  
          var _disconnect = function(loginId){
              var _o = $('#snsKakao');
  
              $.ajax({
                  type: 'post',
                  cache: false,
                  data: { loginId : loginId },
                  url: "/public/kakao/unlink",
                  success: function(d){
                      Kakao.API.request({
                          url: '/v1/user/unlink',
                          success: function(response) {
                              _o.prop('checked', false);
                              _o.val('');
                              $('#snsKakaoLoginId').text('');
  
                              alert('카카오 계정 연결이 해제되었습니다.');
                          },
                          fail: function(error) {
                              console.log("kakao unlink", error);
                          },
                      });
                  }
                  , error : function(e) {
                      _o.prop('checked', true);
                      alert("처리 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                  }
              });
          }
  
          return {
              init : function() {
                  _init();
              }
              , join : function() {
                  _signin('/public/kakao/loginProcessKakao', _callbackJoin, "join");
              }
              , login : function() {
                  _signin('/public/kakao/loginProcessKakao', _callbackLogin, "login");
              }
              , connect: function(){
                  _signin('/public/kakao/loginProcessKakao', _callbackConnect, "connect");
              }
              , disconnect: function(loginId){
                  _disconnect(loginId);
              }
              , unlink : function(){
                  _unlink();
              }
          }
      }());
  
  </script><script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220907151706" ></script>
  <script type="text/javascript" src="/resources/js/validator.member.js?timestamp=20220907151706"></script>
  
  <h3 class="page-title">회원정보 수정</h3>
  
  <!-- write-wrap -->
  <div class="write-wrap">
      <h4 class="sec-title mt0">회원정보</h4>
  
      <form action="/secured/mypage/updateMemberAction" method="post" id="updateForm">
          <input type="hidden" name="refererUrlType" value=""/>
          <input type="hidden" name="_csrf" value="7b3792f8-43df-449d-9cbb-8a37d6a9d26e"/>
          <input type="hidden" id="pwdCheck">
          <input type="hidden" id="snsCd" name="snsCd"/>
          <div class="tbl-write">
              <ul class="etc-edit-info">
                  <li id="showInfoArea">
                      <p>가려진 정보는 인증 후 확인하실 수 있습니다.</p>
                      <div class="btn-area">
                          <button type="button" class="btn-link" onclick="layer.open('layerShowinfo'); $('#layerShowinfo').trigger('open'); "><span>가려진 정보 보기</span></button>
                      </div>
                  </li>
              </ul>
              <table>
                  <caption>회원정보 수정</caption>
                  <colgroup>
                      <col style="width: 190px">
                      <col>
                  </colgroup>
                  <tbody>
                  <tr class="tr-txt">
                      <th scope="row">아이디</th>
                      <td id="mbrId">bba****</td>
                  </tr>
                  <tr class="tr-txt">
                      <th scope="row">이름</th>
                      <td id="mbrNm">박*은</td>
                  </tr>
                  <tr>
                      <th scope="row">비밀번호</th>
                      <td class="w-full">
                          <button type="button" class="btn-type1-m" id="showChangePw"><span>비밀번호 변경</span></button>
  
                          <div id="pwEditArea" class="toggle-box">
                              <div class="edit-info-wrap">
                                  <div class="input-box" id="divMbrPw">
                                      <input type="password" id="mbrPw" title="새 비밀번호" placeholder="새 비밀번호" class="inp-reset" maxlength="15">
                                      <div class="etc">
                                          <!-- [D]비밀번호 안전도 : 안전 -->
                                          <span class="txt-pw-level" id="pwdHigh">안전</span>
                                          <!-- [D]비밀번호 안전도 : 보통 -->
                                          <span class="txt-pw-level" id="pwdNormal">보통</span>
  
                                          <button type="button" class="btn-masking" tabindex="-1"><span>마스킹</span></button>
                                          <button type="button" class="btn-clear" tabindex="-1"><span>지우기</span></button>
                                      </div>
                                  </div>
                                  <div class="input-box" id="divMbrCheckPw">
                                      <input type="password" id="mbrPwRe" title="새 비밀번호 확인" placeholder="새 비밀번호 확인" class="inp-reset" maxlength="15">
                                      <div class="etc">
                                          <!-- [D]비밀번호 안전도 : 안전-->
                                          <span class="txt-pw-level" id="checkPwdHigh">안전</span>
                                          <!-- [D]비밀번호 안전도 : 보통 -->
                                          <span class="txt-pw-level" id="checkPwdNormal">보통</span>
  
                                          <button type="button" class="btn-masking" tabindex="-1"><span>마스킹</span></button>
                                          <button type="button" class="btn-clear" tabindex="-1"><span>지우기</span></button>
                                      </div>
                                  </div>
                                  <p class="txt-invalid" style="display: block;" id="descMbrPw"><!--유효성 검사 메시지 출력--></p>
                                  <p class="txt-form-cmt">영문, 숫자, 특수문자 3가지 종류 8-15자 또는 2종류 이상 조합 10-15자로 사용 가능</p>
  
                                  <div class="btn-box align-left">
                                      <button type="button" class="btn-type4-m" onclick="javascript:document.querySelector('#pwEditArea').classList.remove('open');"><span>취소</span></button>
                                      <button type="button" class="btn-type2-m" id="modifyPassword"><span>비밀번호 변경</span></button>
                                  </div>
                              </div>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <th scope="row">휴대폰번호</th>
                      <td class="w-full">
                          <input type="hidden" name="mbr.mobilNo" value="" disabled />
                          <span class="txt-tbl-phone" id="lbMobileNo">010-****-5851</span>
  
                          <button type="button" class="btn-type1-m" id="showChangeMobileNo"><span>휴대폰번호 변경</span></button>
  
                              <div id="layerPhone" class="toggle-box">
                                  <div class="edit-info-wrap">
                                      <div class="form-group">
                                          <div class="input-box">
                                              <input type="text" title="휴대폰번호" placeholder="휴대폰번호" class="inp-reset mobileNo" maxlength="11">
                                              <div class="etc">
                                                  <button type="button" class="btn-clear"><span>지우기</span></button>
                                              </div>
                                          </div>
                                          <button type="button" class="btn-type1-m sendAuthNo" disabled><span>인증번호 전송</span></button>
                                      </div>
                                      <p class="txt-invalid"><!--유효성 검사 메시지 출력--></p>
  
                                      <div class="input-box afterSendAuthNo" style="display:none;">
                                          <input type="text" title="인증번호 (숫자 6자리)" placeholder="인증번호 (숫자 6자리)" maxlength="6" class="inp-reset authNo" />
                                          <div class="etc">
                                              <button type="button" class="btn-clear"><span>지우기</span></button>
                                              <span class="txt-countdown remainingTime" style="display: block;"></span>
                                          </div>
                                      </div>
                                      <p class="txt-invalid msgMobileNo" style="display: block;"><!--유효성 검사 메시지 출력--></p>
  
                                      <div class="btn-box align-left">
                                          <button type="button" class="btn-type4-m" onclick="javscript:document.querySelector('#layerPhone').classList.remove('open');"><span>취소</span></button>
                                          <button type="button" class="btn-type2-m afterSendAuthNo checkAuthNo" style="display:none;" disabled><span>인증번호 확인</span></button>
                                      </div>
                                  </div>
                              </div>
                          </td>
                  </tr>
                  <tr>
                      <th scope="row">이메일</th>
                      <td>
                          <div class="email-box">
                              <div class="input-box invalid">
                                  <input type="text" title="이메일" id="mbrEmail" name="mbr.mbrEmail" placeholder="이메일을 입력해주세요." class="inp-reset" value="dpe@****.***"  disabled />
                                  <div class="etc">
                                      <button type="button" class="btn-clear"><span>지우기</span></button>
                                  </div>
                              </div>
                          </div>
                          <p class="txt-invalid" style="display: block;" id="msgMbrEmail"></p>
                      </td>
                  </tr>
                  
                  </tbody>
              </table>
          </div>
  
          <h4 class="sec-title">부가정보</h4>
          <div class="tbl-write">
              <table>
                  <caption>부가정보</caption>
                  <colgroup>
                      <col style="width: 190px">
                      <col>
                  </colgroup>
                  <tbody>
                  <tr>
                      <th scope="row">생일</th>
                      <td>
                          <div class="period-input">
                              <input type="text" class="inp-datepicker datepicker datepicker-select" id="birthday" name="mbr.mbrBrthdy" title="생일" value="1995-03-24" readonly />
                          </div>
                          <p class="txt-form-cmt">매년 1회 생일 축하 쿠폰을 드립니다. (D-7일 자동 지급)</p>
                      </td>
                  </tr>
                  
                  </tbody>
              </table>
          </div>
      </form>
      <script>
          // 2020.11.25
          $('.datepicker-select').datepicker({
              showOn: 'button',
              buttonImage: '/resources/images/btn_calendar.png',
              buttonImageOnly: false,
              buttonText: '날짜 선택',
              yearSuffix: ' ',
              monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
              changeYear: true,
              changeMonth: true,
              yearRange: '1920:+10',
          });
      </script>
  
      <!-- 해외 접속 시 간편 로그인 설정 영역 미노출 -->
      </div>
  <!-- //write-wrap -->
  
  <div class="btn-box">
      <button type="button" class="btn-type2-lg" onclick="formSubmit();" style="width: 250px;"><span>회원정보 수정</span></button>
      <div class="right">
          <a href="/secured/mypage/memberSecession" class="btn-link">회원탈퇴</a>
      </div>
  </div>
  
  <!-- 팝업 : 가려진 정보 보기 -->
  <div id="layerShowinfo" class="layer-pop" tabindex="0">
      <div class="layer-wrap" tabindex="0">
          <div class="layer-header">
              <h2 class="layer-title">가려진 정보 보기</h2>
          </div>
          <div class="layer-container">
              <div class="layer-content">
                  <p class="txt-common">회원님의 휴대폰번호로 인증하시면 <br/> 가려진 정보를 확인하실 수 있습니다.</p>
                  <div class="form-wrap">
                      <div class="form-group">
                          <div class="input-box">
                              <input type="text" title="휴대폰 번호 입력" placeholder="휴대폰번호" class="inp-reset mobileNo" value="" maxlength="11" />
                              <div class="etc">
                                  <button type="button" class="btn-clear"><span>지우기</span></button>
                              </div>
                          </div>
                          <button type="button" class="btn-type1-m sendAuthNo" disabled><span>인증번호 전송</span></button>
                      </div>
                      <div class="form-group afterSendAuthNo">
                          <div class="input-box">
                              <input type="text" title="인증번호 입력" placeholder="인증번호(숫자6자리)" class="inp-reset authNo" maxlength="6">
                              <div class="etc">
                                  <button type="button" class="btn-clear"><span>지우기</span></button>
                                  <span class="txt-countdown remainingTime" style="display: block;"></span>
                              </div>
                          </div>
                          <button type="button" class="btn-type1-m checkAuthNo"><span>인증번호 확인</span></button>
                      </div>
                      <p class="txt-invalid msgMobileNo" style="display: block;"><!--유효성 검사 메시지 출력--></p>
                  </div>
              </div>
          </div>
          <button type="button" class="btn-layer-close" onclick="layer.close('layerShowinfo');">닫기</button>
      </div>
  </div>
  <!-- //팝업 : 가려진 정보 보기 -->
  
  <!-- 팝업 : 개인정보 선택 수집/이용  동의 -->
  <div id="layerPrivacy3" class="layer-pop" tabindex="0">
      <div class="layer-wrap" tabindex="0">
          <div class="layer-header">
              <h2 class="layer-title">개인정보 선택 수집/이용</h2>
          </div>
          <div class="layer-container">
              <div class="layer-content">
                  <div class="terms-wrap">
                      <div class="terms_box">
                          <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">&nbsp;<o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><b><span lang="EN-US" style="font-size: 9pt">1.&nbsp;</span></b><b>개인정보의 수집항목과 이용목적</b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">H</span><span style="font-size: 9pt">패션몰은 별도의 회원가입절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다<span lang="EN-US">. H</span>패션몰의 서비스를 이용하시는 경우 다음의정보를 고객의 동의를 받아 수집할 수 있으며 선택항목을 입력하지 않으셔도 해당 항목을 활용한 서비스를 제외한 다른 서비스 이용에는 제한이 없습니다<span lang="EN-US">.<o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">&nbsp;<o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span style="font-size: 9pt">①<span lang="EN-US">&nbsp;&nbsp;</span>회원가입 및 주문 등 필요시점에 수집하는개인정보의 범위<span lang="EN-US"><o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span><span style="font-size: 9pt">수집방법<span lang="EN-US">:&nbsp;</span>홈페이지<span lang="EN-US">,&nbsp;</span>서면양식<span lang="EN-US">,&nbsp;</span>이메일<span lang="EN-US">,&nbsp;</span>협력회사로부터의 제공<span lang="EN-US">,&nbsp;</span>생성정보 수집 툴을 통한 수집<span lang="EN-US"><o:p></o:p></span></span></p>
  <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" align="left" width="100%" style="width: 938.889px; margin-left: 4.85pt; margin-right: 4.85pt">
  <tbody>
  <tr style="height: 24.8pt">
  <td colspan="2" style="border-width: 1pt; border-style: solid; border-color: windowtext; background: #d9d9d9; padding: 0cm; height: 24.8pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">구분<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: 1pt solid windowtext; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; background: #d9d9d9; padding: 0cm; height: 24.8pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">수집항목<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: 1pt solid windowtext; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; background: #d9d9d9; padding: 0cm; height: 24.8pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">이용목적<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: 1pt solid windowtext; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; background: #d9d9d9; padding: 2.85pt; height: 24.8pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">보유기간<span lang="EN-US"><o:p></o:p></span></span></p></td></tr>
  <tr style="height: 25.85pt">
  <td rowspan="7" style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 25.85pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">선택<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 25.85pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">가입<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 25.85pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><span style="font-size: 9pt">전화번호<span lang="EN-US">,&nbsp;</span>주소<span lang="EN-US">,&nbsp;</span>우편번호<span lang="EN-US">,&nbsp;</span>기념일<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 25.85pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span></u></b><b><u><span style="font-size: 9pt">전화번호<span lang="EN-US">(</span>유선<span lang="EN-US">) :&nbsp;</span>기본 연락처 외 보조 연락처 정보</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span></u></b><b><u><span style="font-size: 9pt">주소<span lang="EN-US">,&nbsp;</span>우편번호<span lang="EN-US">&nbsp;:&nbsp;</span>물품 구입 시 배송을 위한 정보<span lang="EN-US"><br />-&nbsp;</span>기념일<span lang="EN-US">&nbsp;:&nbsp;</span>기념일 쿠폰 증정</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">※ 기념일 정보는<span lang="EN-US">&nbsp;H</span>패션몰<span lang="EN-US">&nbsp;MY PAGE&nbsp;</span>에서 입력 가능</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td>
  <td rowspan="4" style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 2.85pt; height: 25.85pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">회원탈퇴시 또는 동의철회시</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 29.1pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 29.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">통합회원가입<span lang="EN-US">&nbsp;<o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 29.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><span style="font-size: 9pt">주소<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 29.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">주소<span lang="EN-US">:&nbsp;</span>물품 구입 시 배송을 위한 정보</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 29.1pt">
  <td rowspan="2" style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 29.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">구매<span lang="EN-US">/</span>배송<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 29.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><span style="font-size: 9pt">배송정보<span lang="EN-US">&nbsp;(</span>추가 전화번호<span lang="EN-US">)<o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 29.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span></u></b><b><u><span style="font-size: 9pt">배송정보<span lang="EN-US">:&nbsp;</span>물품배송<span lang="EN-US"><br />-&nbsp;</span>추가 전화번호<span lang="EN-US">&nbsp;:&nbsp;</span>물품 배송 시 기본 연락처 외 보조 연락처 정보</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 28.85pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 28.85pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><span style="font-size: 9pt">환불계좌 정보<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 28.85pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">환불계좌<span lang="EN-US">:&nbsp;</span>주문취소<span lang="EN-US">/</span>환불<span lang="EN-US"><br /></span>※<span lang="EN-US">&nbsp;MY PAGE</span>에서 등록 가능</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 21pt">
  <td rowspan="3" style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 21pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal; word-break: keep-all"><span style="font-size: 9pt">기타<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><span style="font-size: 9pt">휴대폰번호<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">현금영수증발급</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 2.85pt; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">회원탈퇴시 또는 법정 보유기간</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 21pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><span style="font-size: 9pt">휴대폰번호<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">앱설치<span lang="EN-US">&nbsp;URL&nbsp;</span>전송</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 2.85pt; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">목적달성시</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 21pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><span style="font-size: 9pt">신체 정보<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">키<span lang="EN-US">,&nbsp;</span>체형<span lang="EN-US">(</span>날씬한편<span lang="EN-US">,&nbsp;</span>보통체형<span lang="EN-US">,&nbsp;</span>통통한편<span lang="EN-US">)<o:p></o:p></span></span></u></b></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 2.85pt; height: 21pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">사이즈 참고 정보<span lang="EN-US"><o:p></o:p></span></span></u></b></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">회원탈퇴시 또는<span lang="EN-US"><o:p></o:p></span></span></u></b></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal"><b><u><span style="font-size: 9pt">동의철회시<span lang="EN-US"><o:p></o:p></span></span></u></b></p></td></tr></tbody></table>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt"><br /></span><span style="font-size: 9pt">②<span lang="EN-US">&nbsp;&nbsp;</span>마케팅 수신동의 수집 범위<span lang="EN-US"><o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span><span style="font-size: 9pt">수집방법<span lang="EN-US">:&nbsp;</span>가입화면에 수신동의 체크를 통해 수집<span lang="EN-US"><o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span><span style="font-size: 9pt">카카오톡 광고성 메시지의경우 카카오 플러스친구를 추가한 고객에게만 서비스를 제공함<span lang="EN-US"><o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 12pt; font-family: 굴림">&nbsp;</span></p>
  <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="100%" style="width: 938.889px">
  <tbody>
  <tr style="height: 18.05pt">
  <td style="border-width: 1pt; border-style: solid; border-color: windowtext; background: #d9d9d9; padding: 2.85pt; height: 18.05pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">구분<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: 1pt solid windowtext; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; background: #d9d9d9; padding: 0cm; height: 18.05pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">선택항목<span lang="EN-US"><o:p></o:p></span></span></p></td></tr>
  <tr style="height: 22.7pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 22.7pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">수집항목<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 22.7pt">
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><span style="font-size: 9pt">이메일 수신동의<span lang="EN-US">,&nbsp;</span>모바일문자 수신동의<span lang="EN-US"><o:p></o:p></span></span></p></td></tr>
  <tr style="height: 8.05pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 8.05pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">이용목적<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 8.05pt">
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; text-indent: 9pt; line-height: normal; word-break: keep-all"><b><u><span style="font-size: 9pt">이메일 주소<span lang="EN-US">,&nbsp;</span>휴대폰번호<span lang="EN-US">(</span>모바일문자<span lang="EN-US">):&nbsp;</span>마케팅 메시지 제공</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><b><u><span style="font-size: 9pt">카카오톡 광고성 메시지 발송<span lang="EN-US">(</span>카카오플러스 친구 추가한 고객에게만 제공<span lang="EN-US">)</span>카카오톡 광고성 메시지 발송<span lang="EN-US">(</span>카카오플러스 친구 추가한 고객에게만 제공<span lang="EN-US">)</span></span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 25.5pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 25.5pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">보유기간<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 25.5pt">
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><b><u><span style="font-size: 9pt">회원 탈퇴 시 또는 동의 철회 시</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr></tbody></table>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">&nbsp;<o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span style="font-size: 9pt">③ 제<span lang="EN-US">3</span>자 계정을 통한 간편 로그인<span lang="EN-US">/</span>가입 시 수집하는 개인정보의 범위<span lang="EN-US"><o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span><span style="font-size: 9pt">수집방법<span lang="EN-US">: PC,&nbsp;</span>모바일 웹<span lang="EN-US">/</span>앱 사이트에서 계정연동<span lang="EN-US"><o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span><span style="font-size: 9pt">네이버<span lang="EN-US">, H</span>포인트 화면에서 고객이 선택한 개인정보들 중 아래 항목만을 수집<span lang="EN-US">/</span>저장함<span lang="EN-US"><o:p></o:p></span></span></p>
  <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="100%" style="width: 938.889px">
  <tbody>
  <tr style="height: 12.7pt">
  <td style="border-width: 1pt; border-style: solid; border-color: windowtext; background: #d9d9d9; padding: 2.85pt; height: 12.7pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">구분<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: 1pt solid windowtext; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; background: #d9d9d9; padding: 0cm; height: 12.7pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">선택항목<span lang="EN-US"><o:p></o:p></span></span></p></td></tr>
  <tr style="height: 32.3pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 32.3pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">수집방법<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 32.3pt">
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><span lang="EN-US" style="font-size: 9pt">PC,&nbsp;</span><span style="font-size: 9pt">모바일 웹<span lang="EN-US">/</span>앱 사이트에서 계정연동<span lang="EN-US"><o:p></o:p></span></span></p></td></tr>
  <tr style="height: 22.7pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 22.7pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">수집항목<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 22.7pt">
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span><span style="font-size: 9pt">네이버<span lang="EN-US">:&nbsp;</span>별명<span lang="EN-US">,&nbsp;</span>성별<span lang="EN-US">,&nbsp;</span>연령대<span lang="EN-US">,&nbsp;</span>생일<span lang="EN-US">, CI,&nbsp;</span>프로필 사진<span lang="EN-US"><o:p></o:p></span></span></p>
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><span lang="EN-US" style="font-size: 9pt">- H</span><span style="font-size: 9pt">포인트<span lang="EN-US">:&nbsp;</span>주소<span lang="EN-US"><o:p></o:p></span></span></p></td></tr>
  <tr style="height: 27.4pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 27.4pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">이용목적<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 27.4pt">
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><b><u><span lang="EN-US" style="font-size: 9pt">-&nbsp;</span></u></b><b><u><span style="font-size: 9pt">별명<span lang="EN-US">,&nbsp;</span>성별<span lang="EN-US">,&nbsp;</span>연령대<span lang="EN-US">,&nbsp;</span>생일<span lang="EN-US">, CI,&nbsp;</span>프로필 사진<span lang="EN-US">:&nbsp;</span>회원 식별 및 서비스 제공을 위한 추가 정보<span lang="EN-US"><br />-&nbsp;</span>주소<span lang="EN-US">:&nbsp;</span>제<span lang="EN-US">3</span>자 계정을 통한 간편 가입<span lang="EN-US">/</span>로그인 서비스 제공</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr>
  <tr style="height: 29.3pt">
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: 1pt solid windowtext; padding: 2.85pt; height: 29.3pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0.0001pt; text-align: center; line-height: normal"><span style="font-size: 9pt">보유기간<span lang="EN-US"><o:p></o:p></span></span></p></td>
  <td style="border-top: none; border-right: 1pt solid windowtext; border-bottom: 1pt solid windowtext; border-left: none; padding: 0cm; height: 29.3pt">
  <p class="MsoNormal" align="left" style="margin: 0cm 0cm 0.0001pt 10pt; line-height: normal"><b><u><span style="font-size: 9pt">계정연동해제<span lang="EN-US">/</span>회원탈퇴시 또는 법정보유기간</span></u></b><span lang="EN-US" style="font-size: 9pt"><o:p></o:p></span></p></td></tr></tbody></table>
  <p class="MsoNormal" align="left" style="margin-bottom: 0.0001pt; line-height: normal; word-break: keep-all"><span lang="EN-US" style="font-size: 9pt">&nbsp;<o:p></o:p></span></p>
  <p class="MsoNormal"><span lang="EN-US">&nbsp;※ 1-2 버전 변경 내용 : 1조 개</span>인정보의 수집항목과 이용목적 중 1항&nbsp;기타 신체 정보 수집 추가</p>
  <p><br /></p></div>
                  </div>
              </div>
          </div>
          <button type="button" class="btn-layer-close" onclick="layer.close('layerPrivacy3');">닫기</button>
      </div>
  </div>
  <!-- //팝업 : 개인정보 선택 수집/이용  동의 -->
  
  <script>
      var isSubmitDisabled = false; //수정버튼 여러번 클릭시 이벤트 막음
  
      /**
       * 비밀번호변경 관련 이벤트
       */
      var _bindChangePassword = function() {
          var _LAYER = $('#pwEditArea');
  
          /**
           * 비밀번호 변경 레이어 노출
           */
          $('#showChangePw').on('click', function(e) {
              e.preventDefault();
  
              if( !Cert.get() ) {
                  alert("가려진 정보 보기 인증 후 정보 수정이 가능합니다.");
                  return;
              }
  
              _init(); // 초기화
  
              _LAYER.addClass('open');
  
              _LAYER.find('#mbrPw').focus();
          });
  
          /**
           * 새비밀번호/새비밀번호 확인 키이벤트
           */
          _LAYER.find('#mbrPw, #mbrPwRe').on('keyup', function(e) {
              if( e.keyCode === 13 ) {
                  _changePassword();
              }
          });
  
          _LAYER.find('#mbrPw, #mbrPwRe').on('blur', function(e) {
              if( this.id === 'mbrPw' ) {
                  _validatePw(false);
              }
              else {
                  _validatePwRe(false);
              }
          });
  
          /**
           * 비밀번호 변경 이벤트
           */
          _LAYER.find('#modifyPassword').on('click', function(e) {
              e.preventDefault();
  
              _changePassword();
          });
  
          /**
           * 비밀번호 변경 초기화
           */
          var _init = function() {
              _LAYER.find('#mbrPw').attr('type', 'password').val('');
              _LAYER.find('#mbrPwRe').attr('type', 'password').val('');
              _LAYER.find('#descMbrPw').text(''); // 유효성 메세지
              _LAYER.find('.btn-masking').removeClass('text'); // 마스킹 버튼
          }
  
          /**
           * 비밀번호 변경 처리
           */
          var _changePassword = function() {
              if( !_validate() ){
                  return false;
              }
  
              $.ajax({
                  type : "post",
                  url : "/secured/mypage/modifyMemberPassword.json",
                  data : { mbrPw : _LAYER.find('#mbrPw').val() },
                  dataType : 'json',
                  success : function(args) {
                      alert('비밀번호가 변경되었습니다.');
                      // 비밀번호 변경 레이어 닫기
                      document.querySelector('#pwEditArea').classList.remove('open');
                  },
                  error : function(e) {
                      alert(e.responseText);
                  }
              });
          }
  
          /**
           * 비밀번호 변경 유효성검사
           */
          var _validate = function() {
              if( !_validatePw(true) ) {
                  return false;
              }
              if( !_validatePwRe(true) ) {
                  return false;
              }
              return true;
          }
  
          /**
           * 새 비밀번호 유효성검사
           *
           * @param focus 포커스 사용여부
           */
          var _validatePw = function(focus) {
              var _pw = _LAYER.find('#mbrPw');
              var _msg = _LAYER.find('#descMbrPw');
  
              _LAYER.find('#pwdHigh, #pwdNormal').hide();
              _msg.text('');
              $("#pwdCheck").val('');
  
              if( _pw.val().replace(/\s+/g, '').length < 1 ){
                  _msg.text('새 비밀번호를 입력해주세요.');
                  if(focus) {
                      _pw.focus();
                  }
                  return false;
              }
              if( /\s+/g.test(_pw.val()) ){
                  _msg.text('공백 없이 입력해주세요.');
                  if(focus) {
                      _pw.focus();
                  }
                  return false;
              }
  
              if( !validatePassword(_pw.val(), $('[name="mbr.mobilNo"]').val(), '19950324')) {
                  if(focus) {
                      _pw.focus();
                  }
                  return false;
              }
              return true;
          }
  
          /**
           * 새 비밀번호 확인 유효성검사
           *
           * @param focus 포커스 사용여부
           */
          var _validatePwRe = function(focus) {
              var _pwr = _LAYER.find('#mbrPwRe');
              var _msg = _LAYER.find('#descMbrPw');
  
              _LAYER.find('#checkPwdHigh, #checkPwdNormal').hide();
              $("#pwdCheck").val('');
              _msg.text('');
              if( _pwr.val().replace(/\s+/g, '').length < 1 ){
                  _msg.text('새 비밀번호 확인을 입력해주세요.');
                  if(focus) {
                      _pwr.focus();
                  }
                  return false;
              }
  
              if( _LAYER.find('#mbrPw').val() !== _pwr.val() ){
                  _msg.text('새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.');
                  if(focus) {
                      _pwr.focus();
                  }
                  return false;
              }
              var pwdCheck = $("#pwdCheck").val();
              if(pwdCheck != ''){
                  if(pwdCheck == 'high'){
                      _LAYER.find("#checkPwdHigh").show();
                      _msg.text("");
                  } else {
                      _LAYER.find("#checkPwdNormal").show();
                      _msg.text("");
                  }
              }
              return true;
          }
      } // _bindChangePassword() -e
  
      /**
       * 가려진 정보 보기 관련 이벤트
       */
      var _bindShowInfo = function(){
          var _LAYER = $('#layerShowinfo');
          var countContinue = false; // 인증완료시에 카운트 종료처리 플래그.
  
          /**
           * 가려진 정보 보기 > 확인 오픈 이벤트
           */
          _LAYER.on('open', function(e) {
              // 초기화
              countContinue = false;
              _LAYER.find('.afterSendAuthNo').hide(); // 인증번호 전송 후 노출영역 숨김
              _LAYER.find('.mobileNo, .authNo').val('');
              _LAYER.find('.msgMobileNo, .remainingTime').text('');
              _LAYER.find('.sendAuthNo').attr('disabled', true).find('span').text('인증번호 전송'); // 인증번호 전송
              _LAYER.find('button.btn-clear').hide();
              _LAYER.find('.checkAuthNo').attr('disabled', true); // 인증번호 확인
              _LAYER.find('.mobileNo').attr('disabled', false); // 휴대폰번호
          });
  
          /**
           * 가려진 정보 보기 > 휴대폰번호 키이벤트
           */
          _LAYER.find('.mobileNo').on('keyup', function(e) {
              // 숫자만 입력
              this.value = this.value.replace(/[^0-9]/g, '');
              // 10자 이상 입력한 경우 인증번호 전송버튼 활성화
              _LAYER.find('.sendAuthNo').attr('disabled', !(this.value.length > 9));
  
              if( e.keyCode === 13 ) {
                  _sendAuthNo();
              }
          });
  
          /**
           * 가려진 정보 보기 > 인증번호 전송 이벤트
           */
          _LAYER.find('.sendAuthNo').on('click', function(e) {
              e.preventDefault();
  
              _sendAuthNo();
          });
  
          /**
           * 가려진 정보 보기 > 인증번호 확인
           */
          _LAYER.find('.checkAuthNo').on('click', function(e) {
              e.preventDefault();
  
              _checkAuthNo();
          });
  
          /**
           * 가려진 정보 보기 > 인증번호 키 이벤트
           */
          _LAYER.find('.authNo').on('keyup', function(e) {
              // 숫자만 입력
              this.value = this.value.replace(/[^0-9]/g, '');
  
              if( e.keyCode === 13 ) {
                  _checkAuthNo();
              }
          });
  
          /**
           * 가려진 정보 보기 > 인증번호 전송
           */
          var _sendAuthNo = function() {
              // 인증번호 초기화
              _LAYER.find('.authNo').val('');
  
              if( !_validateSendAuthNo() ) {
                  return;
              }
  
              var _d = sendAuthNo(_LAYER.find('.mobileNo').val());
              if( _d.result ) {
                  countContinue = true;
  
                  _LAYER.find('.afterSendAuthNo').show(); // 인증번호 전송 후 노출영역 노출
                  _LAYER.find('.authNo').focus();
  
                  // 인증시간 카운트
                  countDown();
  
                  // 인증번호 전송 시 재전송버튼 비활성화 후 인증시간이 만료된 경우 활성화 한다.
                  _LAYER.find('.sendAuthNo').find('span').text('인증번호 재전송');
                  _LAYER.find('.sendAuthNo').attr('disabled', true);
                  _LAYER.find('.mobileNo').attr('disabled', true); // 휴대폰번호
              }
              alert( _d.message);
          }
  
          /**
           * 가려진 정보 보기 > 인증번호 확인
           */
          var _checkAuthNo = function() {
              if( !_validate() ){
                  return false;
              }
  
              var _d = checkAuthNo(_LAYER.find(".authNo").val(), _LAYER.find(".mobileNo").val());
              if( _d.result === 'SUCCESS' ) {
                  countContinue = false;
  
                  // 마스킹 해제
                  _unmaskingInfo();
                  alert(_d.message);
              }
              else {
                  if( _d.result === 'TIME' ) {
                      countContinue = false;
                  }
                  _LAYER.find(".msgMobileNo").text(_d.message);
              }
          }
  
          /**
           * 마스킹 해제
           */
          var _unmaskingInfo = function() {
              $.ajax({
                  type : "post",
                  url : "/secured/mypage/getMemberInfo.json",
                  dataType : 'json',
                  success : function(d) {
                      // 마스킹해제
                      $('#mbrId').text(d.mbr.mbrId);
                      $("#mbrNm").text(d.mbr.mbrNm);
                      $('#lbMobileNo').text(formatMobileNo(d.mbr.mobilNo));
                      $('[name="mbr.mobilNo"]').val(d.mbr.mobilNo);
                      var _o = $('#mbrEmail');
                      _o.val(d.mbr.mbrEmail);
                      
                          _o.attr('disabled', false);
                      
                      layer.close('layerShowinfo');
  
                      Cert.set(); // 회원정보 수정 가능처리
  
                      $('#showInfoArea').remove(); // 가려진정보보기 버튼 삭제
                  },
                  error : function(e) {
                      alert(e.responseText);
                  }
              });
          }
  
          /**
           * 가려진 정보 보기 > 휴대폰변경 유효성 검사
           */
          var _validate = function() {
              if( !_validateSendAuthNo() ) {
                  return false;
              }
  
              var _msg = _LAYER.find('.msgMobileNo');
              var _authNo = _LAYER.find('.authNo');
              _authNo.val(_authNo.val().replace(/\s+/g, '')); // 공백제거
              if( _authNo.val().length < 1 ){
                  _msg.text('인증번호를 입력해주세요.');
                  _authNo.focus();
                  return false;
              }
  
              if( _authNo.val().length !== 6 ){
                  _msg.text('인증번호 숫자 6자리를 입력해주세요.');
                  _authNo.focus();
                  return false;
              }
  
              if( !countContinue ) {
                  _msg.text('인증 유효 시간이 만료되었습니다. 인증번호 재전송 버튼을 클릭해주세요.');
                  return false;
              }
              return true;
          }
  
          /**
           * 가려진 정보 보기 > 인증번호 발송 시 유효성검사
           */
          var _validateSendAuthNo = function() {
              var _mb = _LAYER.find('.mobileNo');
              var _msg = _LAYER.find('.msgMobileNo');
  
              // 초기화
              _msg.text('');
  
              if( _mb.val().length < 1 ){
                  _msg.text('휴대폰번호를 입력해주세요.');
                  _mb.focus();
                  return false;
              }
  
              if( _mb.val().length < 10 || _mb.val().length > 11 ) {
                  _msg.text('10자 이상 11자 이하로 입력해주세요.');
                  _mb.focus();
                  return false;
              }
  
              if( !/(01[016789])(\d{3,4})(\d{4})$/g.test(_mb.val()) ) {
                  _msg.text('휴대폰번호 형식에 맞지 않습니다.');
                  _mb.focus();
                  return false;
              }
  
              if( !checkOwnMobileNo(_mb.val()) ) {
                  _msg.text('입력정보와 일치하는 회원 정보가 없습니다.');
                  _mb.focus();
                  return false;
              }
  
              return true;
          }
  
          /**
           * 본인 휴대폰번호 일치여부 확인
           */
          var checkOwnMobileNo = function(mobileNo) {
              var _result = false;
              $.ajax({
                  type : "post",
                  url : "/secured/mypage/checkOwnMobileNo.json",
                  dataType : 'json',
                  data: { mobileNo : mobileNo },
                  async : false,
                  success : function(d) {
                      _result = d.result;
                  },
                  error : function(e) {
                      alert(e.responseText);
                  }
              });
              return _result;
          }
  
          /**
           * 휴대폰인증시간 카운트다운
           */
          function countDown() {
              _LAYER.find('.checkAuthNo').attr('disabled', false); // 인증번호 확인 활성화
  
              _LAYER.find('.remainingTime').text('');
              var countDownDate = new Date().getTime() + 182000;
  
              var x = setInterval(function() {
                  var now = new Date().getTime();
                  var distance = countDownDate - now;
                  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  
                  if(seconds < 10){
                      seconds = "0"+seconds;
                  }
  
                  _LAYER.find('.remainingTime').text('0' + minutes + ':' + seconds);
  
                  if (distance < 0) {
                      clearInterval(x);
                      countContinue = false;
                      _LAYER.find('.remainingTime').text('00:00');
                      _LAYER.find(".msgMobileNo").text("인증 유효 시간이 만료되었습니다. 인증번호 재전송 버튼을 클릭해주세요.");
                      _LAYER.find(".mobileNo").attr('disabled', false);
                      _LAYER.find(".sendAuthNo").attr('disabled', false); // 인증번호 재전송 활성화
                      _LAYER.find(".checkAuthNo").attr('disabled', true); // 인증번호 확인 비활성화
                  }
  
                  if ( !countContinue ) {
                      clearInterval(x);
                  }
              }, 1000);
          }
  
      } // _bindShowInfo() -e
  
      /**
       * 휴대폰번호 변경 관련 이벤트
       */
      var _bindChangeMobileNo = function() {
          var _LAYER = $('#layerPhone');
          var countContinue = false; // 인증완료시에 카운트 종료처리 플래그.
  
          /**
           * 휴대폰번호 변경 레이어 노출
           */
          $('#showChangeMobileNo').on('click', function(e) {
              e.preventDefault();
  
              alert('휴대폰 번호 변경은 1:1게시판 혹은 고객센터로 문의해주세요.(1800-5700)');
              
          });
  
          /**
           * 휴대폰번호 키이벤트
           */
          _LAYER.find('.mobileNo').on('keyup', function(e){
              // 숫자만 입력
              this.value = this.value.replace(/[^0-9]/g, '');
              // 10자 이상 입력한 경우 인증번호 전송버튼 활성화
              _LAYER.find('.sendAuthNo').attr('disabled', !(this.value.length > 9));
  
              if( e.keyCode === 13 ) {
                  _sendAuthNo();
              }
          });
  
          /**
           * 휴대폰번호 > 인증번호 전송 이벤트
           */
          _LAYER.find('.sendAuthNo').on('click', function(e) {
              e.preventDefault();
  
              _sendAuthNo();
          });
  
          /**
           * 인증번호 확인 이벤트
           */
          _LAYER.find('.checkAuthNo').on('click', function(e) {
              e.preventDefault();
  
              _checkAuthNo();
          });
  
          /**
           * 인증번호 키 이벤트
           */
          _LAYER.find('.authNo').on('keyup', function(e) {
              // 숫자만 입력
              this.value = this.value.replace(/[^0-9]/g, '');
  
              if( e.keyCode === 13 ) {
                  _checkAuthNo();
              }
          });
  
          /**
           * 휴대폰번호 변경 초기화
           */
          var _init = function() {
              countContinue = false;
              _LAYER.find('.afterSendAuthNo').hide(); // 인증번호 전송 후 노출영역 숨김
              _LAYER.find('.mobileNo, .authNo').val('');
              _LAYER.find('.msgMobileNo, .remainingTime').text('');
              _LAYER.find('.sendAuthNo').attr('disabled', true).find('span').text('인증번호 전송'); // 인증번호 전송
              _LAYER.find('.checkAuthNo').attr('disabled', true); // 인증번호 확인
              _LAYER.find('.mobileNo').attr('disabled', false); // 휴대폰번호
              _LAYER.find('button.btn-clear').hide();
          }
  
          /**
           * 인증번호 전송
           */
          var _sendAuthNo = function() {
              // 인증번호 초기화
              _LAYER.find('.authNo').val('');
  
              if( !_validateSendAuthNo() ) {
                  return;
              }
  
              var _d = sendAuthNo(_LAYER.find('.mobileNo').val());
              if( _d.result ) {
                  countContinue = true;
                  _LAYER.find('.afterSendAuthNo').show(); // 인증번호 전송 후 노출영역 노출
                  _LAYER.find('.authNo').focus();
  
                  // 인증시간 카운트
                  countDown();
  
                  // 인증번호 전송 시 재전송버튼 비활성화 후 인증시간이 만료된 경우 활성화 한다.
                  _LAYER.find('.sendAuthNo').find('span').text('인증번호 재전송');
                  _LAYER.find('.sendAuthNo').attr('disabled', true);
                  _LAYER.find('.mobileNo').attr('disabled', true); // 휴대폰번호
              }
              alert(_d.message);
          }
  
          /**
           * 휴대폰번호 변경 > 인증번호 확인
           */
          var _checkAuthNo = function() {
              if( !_validate() ){
                  return false;
              }
  
              var _modileNo = _LAYER.find(".mobileNo").val();
              var _d = checkAuthNo(_LAYER.find(".authNo").val(), _modileNo);
              if( _d.result === 'SUCCESS' ) {
                  countContinue = false;
                  // 인증한 휴대폰번호로 회원정보 수정
                  $.ajax({
                      type: "post",
                      url: "/secured/mypage/modifyMemberMobileNo.json",
                      async: false,
                      data: {
                          '_csrf': '7b3792f8-43df-449d-9cbb-8a37d6a9d26e'
                          , 'mobileNo': _LAYER.find(".mobileNo").val()
                      },
                      success: function (args) {
                          $(':hidden[name="mbr.mobilNo"]').val(_modileNo); // 인증된 휴대폰번호
                          $('#lbMobileNo').text(formatMobileNo(_modileNo));
  
                          document.querySelector('#layerPhone').classList.remove('open');
  
                          alert('휴대폰번호가 변경되었습니다.'); // _d.message
                      },
                      error: function (e) {
                          alert(e.responseText);
                      }
                  });
              }
              else {
                  if( _d.result === 'TIME' ) {
                      countContinue = false;
                  }
                  _LAYER.find(".msgMobileNo").text(_d.message);
              }
          }
  
          /**
           * 휴대폰변경 유효성 검사
           */
          var _validate = function() {
              if( !_validateSendAuthNo() ) {
                  return false;
              }
  
              var _msg = _LAYER.find('.msgMobileNo');
              var _authNo = _LAYER.find('.authNo');
              _authNo.val(_authNo.val().replace(/\s+/g, '')); // 공백제거
              if( _authNo.val().length < 1 ){
                  _msg.text('인증번호를 입력해주세요.');
                  _authNo.focus();
                  return false;
              }
  
              if( _authNo.val().length !== 6 ){
                  _msg.text('인증번호 숫자 6자리를 입력해주세요.');
                  _authNo.focus();
                  return false;
              }
  
              if( !countContinue ) {
                  _msg.text('인증 유효 시간이 만료되었습니다. 인증번호 재전송 버튼을 클릭해주세요.');
                  return false;
              }
              return true;
          }
  
          /**
           * 인증번호 발송 시 유효성검사
           */
          var _validateSendAuthNo = function() {
              var _mb = _LAYER.find('.mobileNo');
              var _msg = _LAYER.find('.msgMobileNo');
  
              // 초기화
              _msg.text('');
  
              if( _mb.val().length < 1 ){
                  _msg.text('휴대폰번호를 입력해주세요.');
                  _mb.focus();
                  return false;
              }
  
              if( _mb.val().length < 10 || _mb.val().length > 11 ) {
                  _msg.text('10자 이상 11자 이하로 입력해주세요.');
                  _mb.focus();
                  return false;
              }
  
              if( !/(01[016789])(\d{3,4})(\d{4})$/g.test(_mb.val()) ) {
                  _msg.text('휴대폰번호 형식에 맞지 않습니다.');
                  _mb.focus();
                  return false;
              }
  
              if( !isCheckMobileNo(_mb.val()) ) {
                  _msg.text("이미 등록된 휴대폰번호입니다.");
                  _mb.focus();
                  return false;
              }
              return true;
          }
  
          /**
           * 휴대폰번호 확인
           */
          var isCheckMobileNo = function(mobileNo) {
              var mbrCheck = false;
              $.ajax({
                  type: "post",
                  url: "/public/member/isCheckMobileNo.json",
                  async: false,
                  data: {'_csrf': '7b3792f8-43df-449d-9cbb-8a37d6a9d26e',
                      'mbr.mobilNo': mobileNo
                  },
                  success: function (args) {
                      if(args.isCheckMobile == true || args.isCheckMobile == "true"){
                          mbrCheck = false;
                      }
                      else {
                          mbrCheck = true;
                      }
                  },
                  error: function (e) {
                      alert(e.responseText);
                      mbrCheck = false;
                  }
              });
              return mbrCheck;
          }
  
          /**
           * 휴대폰인증시간 카운트다운
           */
          function countDown() {
              _LAYER.find('.checkAuthNo').attr('disabled', false); // 인증번호 확인 활성화
  
              _LAYER.find('.remainingTime').text('');
              var countDownDate = new Date().getTime() + 182000;
  
              var x = setInterval(function() {
                  var now = new Date().getTime();
                  var distance = countDownDate - now;
                  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  
                  if(seconds < 10){
                      seconds = "0"+seconds;
                  }
                  _LAYER.find('.remainingTime').text('0' + minutes + ':' + seconds);
  
                  if (distance < 0) {
                      clearInterval(x);
                      countContinue = false;
                      _LAYER.find('.remainingTime').text('00:00');
                      _LAYER.find(".msgMobileNo").text("인증 유효 시간이 만료되었습니다. 인증번호 재전송 버튼을 클릭해주세요.");
                      _LAYER.find(".mobileNo").attr('disabled', false);
                      _LAYER.find(".sendAuthNo").attr('disabled', false); // 인증번호 재전송 활성화
                      _LAYER.find(".checkAuthNo").attr('disabled', true); // 인증번호 확인 비활성화
                  }
  
                  if ( !countContinue ) {
                      clearInterval(x);
                  }
              }, 1000);
          }
      } // _bindChangeMobileNo() -e
  
      /**
       * 휴대폰번호 노출형식
       */
      function formatMobileNo(mobileNo) {
          // 02, 10, 01x로 시작하는 국내 번호면
          if(mobileNo.substring(0,1) == '0' || mobileNo.substring(0,2) == '10'){
              return mobileNo.replace(/^(02|10|0\d{2})(?:(?:(\d{0,3})(\d{0,4}))|(?:(\d{0,4})(\d{0,4})))$/, function(r0, r1, r2, r3, r4, r5){
                  var rs = '';
                  if(r1) rs = r1;
                  if(r2) rs += rs ? '-' + r2 : r2;
                  if(r3) rs += rs ? '-' + r3 : r3;
                  if(r4) rs += rs ? '-' + r4 : r4;
                  if(r5) rs += rs ? '-' + r5 : r5;
                  return rs;
              });
          }
          // 국내번호가 아니면서 11자리 이하면
          return mobileNo.replace(/^(?:(\d{1,4})(\d{4})$)|(?:(\d{0,3})(\d{1,4})(\d{4})$)/, function(r0, r1, r2, r3, r4, r5){
              var rs = '';
              if(r1) rs = r1;
              if(r2) rs += rs ? '-' + r2 : r2;
              if(r3) rs += rs ? '-' + r3 : r3;
              if(r4) rs += rs ? '-' + r4 : r4;
              if(r5) rs += rs ? '-' + r5 : r5;
              return rs;
          });
          return mobileNo;
      }
  
      /**
       * 회원정보 수정 처리
       */
      function formSubmit(){
          if( isSubmitDisabled ) { return; }
  
          var _email = $('#mbrEmail');
          var _msgEmail = $("#msgMbrEmail");
          var _msgMarktAgreeYn = $("#msgMarktAgreeYn");
          var _marktAgreeYn = $('#marktAgreeYn');
  
          // [as-is] 마케팅 정보 수신동의-이메일 체크한 경우 이메일 필수값
          if( $('#emailRecptnAgrYn').is(':checked') ) {
              if( _email.val().replace(/\s+/g, '').length < 1 ){
                  _msgEmail.text('이메일을 입력해주세요.');
                  _email.focus();
                  return;
              }
          }
  
          // 비밀번호, 휴대폰, 이메일만 추가인증 필요하도록 수정 (2020.08.27)
          if( !_email.prop('disabled') && _email.val().replace(/\s+/g, '').length > 0 ) {
              var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
              if( !regEmail.test(_email.val()) ) {
                  _msgEmail.text('이메일 형식에 맞지 않습니다.');
                  _email.focus();
                  return;
              }
  
              if( !isCheckEmail($("input#mbrEmail").val()) ) {
                  _msgEmail.text('이미 사용중인 이메일입니다.');
                  _email.focus();
                  return;
              }
          }
          
          //생일 만14세 제한
          var _brthdy = $(':text[name="mbr.mbrBrthdy"]');
          var brthdy_pass = "Y";
          $.ajax({
              type: "POST",
              data:{birth:_brthdy.val().replace("-","").replace("-","")},
              url: "/public/member/calMemberAge.json",
              async: false,
              success: function(result) {
                  if(result.ageLimit == 'F'){
                      alert('생일은 만 14세 이하로 입력할수 없습니다.');
                      brthdy_pass = "N";
                      return;
                  }else{
                      
                  }
              }
          });
          if(brthdy_pass == "N")
             {
              _brthdy.focus();    
              return;        	
             }
          // 기념일
          var _annrTp = $(':radio[name="mbrAnnvrsry.annvrsryTpCd"]:checked').val();
          var _annrDt = $(':text[name="annvrsryDt"]');
          if( _annrDt.val().replace(/\s+/g, '').length < 1 && _annrTp.length > 0 ) {
              alert('기념일은 두 항목 모두 입력 후 저장 가능합니다.');
              _annrDt.focus();
              return;
          }      
          // 사이즈 입력 시 신장/체형 모두 입력
          var _height = $('#height');
          var _body = $(':radio[name="mbrSize.body"]:checked').val();
          if( _height.val().replace(/\s+/g, '').length < 1 && _body.length > 0 ){
              alert('나의 사이즈는 키/체형 정보 모두 입력 후 등록 가능합니다.');
              _height.focus();
              return;
          }
          if( _height.val().replace(/\s+/g, '').length > 0 && _body.length < 1 ){
              alert('나의 사이즈는 키/체형 정보 모두 입력 후 등록 가능합니다.');
              return;
          }
          
          if( (_annrDt.val().replace(/\s+/g, '').length > 0 && _annrTp.length > 0) 
                 ||	_height.val().replace(/\s+/g, '').length > 0
                 || _body.length > 0) {
                 if( !$('#marktAgreeYn').is(':checked') ) {	            
                     _msgMarktAgreeYn.text('기념일, 나의사이즈 입력시 개인정보 선택 수집/이용 동의는 필수 입니다.');	            
                     _marktAgreeYn.focus();
                     return;	            
                 }
          }
  
          isSubmitDisabled = true;
  
          $.ajax({
              type : 'post'
              , url : '/secured/mypage/updateMemberAction.json'
              , data : $("#updateForm").serialize()
              , success : function(d) {
                  alert('회원 정보가 수정되었습니다.');
                  location.href = '/secured/mypage/myPage';
              }
              , error : function(e) {
                  alert(e.responseText);
              }
              , complete : function() {
                  isSubmitDisabled = false;
              }
          });
      }
  
      /**
       * 이메일 중복 확인
       * @param email
       * @returns {false : 중복, true : 중복아님}
       */
      function isCheckEmail(email) {
          var _result = false;
          // 이메일 중복 체크
          $.ajax({
              type: "post",
              url: "/public/member/isCheckEmail.json",
              async: false,
              data: {'_csrf': '7b3792f8-43df-449d-9cbb-8a37d6a9d26e',
                  'mbr.mbrEmail': email
              },
              success: function (args) {
                  if (args.isCheckEmail == true || args.isCheckEmail == "true") {
                      _result = false;
                  }
                  else {
                      _result = true;
                  }
              },
              error: function (e) {
                  alert(e.responseText);
              }
          });
          return _result;
      }
  
      var Cert = (function() {
          var _isCert = false;
  
          var _get = function() {
              if( $('#mbrId').text().match(/\*/g) ) {
                  return false;
              }
              if( $("#mbrNm").text().match(/\*/g) ) {
                  return false;
              }
              if( $('#lbMobileNo').text().match(/\*/g) ){
                  return false;
              }
              if( $('#mbrEmail').val().match(/@\*/g)
                  
                  || document.getElementById('mbrEmail').disabled
                  
              ){
                  return false;
              }
              if( !_isCert ) {
                  return false;
              }
              return true;
          }
  
          return {
              get : function() { return _get(); }
              , set : function() { _isCert = true; }
          }
      }());
  
      /**
       * 인증번호 확인
       *
       * @param authNo    인증번호
       * @param mobileNo  휴대폰번호
       * @returns { result: 결과코드, message: 결과메세지 }
       */
      var checkAuthNo = function(authNo, mobileNo) {
          var _d = {};
          $.ajax({
              type : 'post'
              , url : '/public/member/ajaxCellAuth.json'
              , async : false
              , data : {
                  certi_str : authNo
                  , cellNo : mobileNo
              }
              , success : function(d) {
                  if( d.resultVal === 'SUCCESS' ) {
                      // 인증 성공
                      $.extend(_d, {
                          result : d.resultVal
                          , message : '인증이 완료되었습니다.'
                      });
                  }
                  else {
                      // 인증 실패
                      var msg = (d.resultVal === 'FAIL') ? '인증번호가 일치하지 않습니다.'
                          : (d.resultVal === 'TIME') ? '인증 유효 시간이 만료되었습니다. 인증번호 재전송 버튼을 클릭해주세요.'
                              : '인증에 실패했습니다. 잠시 후 다시 시도해 주세요.'
                      $.extend(_d, {
                          result : d.resultVal
                          , message : msg
                      });
                  }
              }
              , error : function(e) {
                  $.extend(_d, {
                      result : 'E'
                      , message : '인증에 실패했습니다. 잠시 후 다시 시도해 주세요.'
                  });
              }
          });
          return _d;
      }
  
      /**
       * 인증번호 발송
       *
       * @param mobileNo  휴대폰번호
       * @returns { result : 결과, message : 결과메세지 }
       */
      var sendAuthNo = function(mobileNo) {
          var _d = {};
          $.ajax({
              type: 'post'
              , url : '/public/member/sendSms.json'
              , async : false
              , data : { mobileNo : mobileNo }
              , success : function(d) {
                  $.extend(_d, {
                      result : ( d.resultVal === 'SUCCESS')
                      , message : ( d.resultVal === 'SUCCESS') ? '인증번호가 전송되었습니다.'
                          : '인증번호 전송에 실패했습니다. 잠시 후 다시 시도해주세요.'
                  });
              }
              , error : function(e) {
                  $.extend(_d, {
                      result : false
                      , message : '인증번호 전송에 실패했습니다. 잠시 후 다시 시도해주세요.'
                  });
              }
          });
          return _d;
      }
       
      function agrCheckResult() {
          if($("#marktAgreeYn").is(':checked')==false){ //선택동의 해제시 항목 초기화 처리
          
              $('input[name="mbrAnnvrsry.annvrsryTpCd"]').removeAttr('checked');
              $('input[name="mbrAnnvrsry.annvrsryTpCd"]')[0].checked =true;
              $('div.anniversary-box').find('[type=button].sel-btn')[0].textContent = '기념일 선택';
              $('div.anniversary-box').find('[type=button].sel-btn').removeClass('on');
              
              $('input[name="mbrSize.body"]').removeAttr('checked');
              $('input[name="mbrSize.body"]')[0].checked =true;
              $('div.size-box').find('[type=button].sel-btn')[0].textContent = '체형 선택';
              $('div.size-box').find('[type=button].sel-btn').removeClass('on');
  
              $('#annvrsryDt').val('');
              $('#height').val('');
          }
      }   
  
      $(document).ready(function() {
          // 비밀번호변경 관련 이벤트
          _bindChangePassword();
          // 가려진정보 보기 관련 이벤트
          _bindShowInfo();
          // 휴대번번호 변경 관련 이벤트
          _bindChangeMobileNo();
  
          /**
           * 나의사이즈 > 신장 키이벤트
           */
          $('#height').on('keyup', function(e) {
              // 숫자만 입력
              this.value = this.value.replace(/[^0-9]/g, '');
          });
  
          /**
           * 간편로그인 설정 > 카카오
           */
          $('#snsKakao').on('click', function(e) {
              e.stopPropagation();
              e.preventDefault();
  
              if( this.checked ) {
                  kakao.connect();
              }
              else {
                  kakao.disconnect(this.value);
              }
          });
  
          /**
           * 간편로그인 설정 > 네이버
           */
          $('#snsNaver').on('click', function(e) {
              e.stopPropagation();
              e.preventDefault();
  
              if( this.checked ) {
                  naverLogin();
              }
              else {
                  unlinkNaver(this.value);
              }
          });
  
          /**
           * 간편로그인 설정 > 애플
           */
          $('#snsApple').on('click', function(e) {
              e.stopPropagation();
              e.preventDefault();
  
              if( this.checked ) {
                  Apple.link();
              }
              else {
                  Apple.unlink(this.value);
              }
          });
  
          /**
           * 간편로그인 설정 > 페이스북
           */
          $('#snsFacebook').on('click', function(e) {
              e.stopPropagation();
              e.preventDefault();
  
              if( this.checked ) {
                  facebookLink();
              }
              else {
                  unlinkFacebook(this.value);
              }
          });
      });
  </script>
  
  <script>
      // 네이버 로그인
      function naverLogin(){
          var state = '';
          var naverLoginApiUrl = "https://nid.naver.com/oauth2.0/authorize";
          naverLoginApiUrl += "?response_type=code&client_id="+"6jrNz5sr78JVcb5BZoGT";
          naverLoginApiUrl += "&redirect_uri="+"http://www.hfashionmall.com/public/member/linkNaver"
          naverLoginApiUrl += "&state="+state;
  
          if($("#allowed").val() == "N"){
              naverLoginApiUrl = naverLoginApiUrl+"&auth_type=reprompt";
          }
  
          var w = 450;
          var h = 550;
          // Fixes dual-screen position                         Most browsers      Firefox
          var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
          var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
  
          var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
          var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
  
          var left = ((width / 2) - (w / 2)) + dualScreenLeft;
          var top = ((height / 2) - (h / 2)) + dualScreenTop;
          var newWindow = window.open(naverLoginApiUrl, 'naverLogin', 'scrollbars=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
  
          // Puts focus on the newWindow
          if (window.focus) {
              newWindow.focus();
          }
      }
  
      function callbackNaver(obj) {
          $("#snsCd").val("NAVER");
          var _o = $('#snsNaver');
          _o.prop('checked', false);
          window.focus();
  
          if(obj.result == "NO_JOIN"){
              //연동 ID가 이미 존재하는 경우
              $("#snsNm").html("네이버");
              // 아이디 설정을 안했을 경우 미노출
              if(obj.mbrId == ''){
                  $("#ulSnsId").hide();
              }else{
                  $("#snsConnectedId").html(obj.mbrId);
              }
              layer.open('layerSnsGuide');
          }else if (obj.result == "NAVER_JOIN"){
              _o.prop('checked', true);
              _o.val(obj['mbrIdCntc.loginId']);
              $('#snsNaverLoginId').text(obj['mbrIdCntc.loginId']);
              alert("네이버 계정 연결되었습니다.");
          }else if (obj.result == "NO_EMAIL"){
              $("#allowed").val("N");
              $("#layerHtml").html("네이버");
              layer.open('layerRequired');
          }else if (obj.result == "FAIL"){
              alert("네이버 연동 에러가 발생했습니다.");
          }else{
              alert("네이버 연동 에러가 발생했습니다.");
          }
      }
  
      // 네이버 연결 해제
      function unlinkNaver(loginId){
          var _o = $('#snsNaver');
  
          $.ajax({
              type: 'post',
              cache: false,
              data: { loginId : loginId },
              url: "/public/member/unlinkNaver",
              success: function(d){
                  _o.prop('checked', false);
                  _o.val('');
                  $('#snsNaverLoginId').text('');
  
                  alert('네이버 계정 연결이 해제되었습니다.');
              }
              , error : function(e) {
                  _o.prop('checked', true);
  
                  alert("처리 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
              }
          });
      }
  
      // 필수 항목 다시 선택
      function reAgree(){
          layer.close('layerRequired');
          var snsCd = $("#snsCd").val();
  
          if(snsCd == 'KAKAO'){
              kakao.connect();
          }else if(snsCd == 'NAVER'){
              naverLogin();
          }else if(snsCd == 'FACEBUK'){
              rerequest();
          }else if(snsCd == 'APPLE'){
  
          }
      }
  </script>
  
  
  <div id="layerRequired" class="layer-pop" tabindex="0" >
      <div class="layer-wrap" tabindex="0">
          <div class="layer-header">
              <h2 class="layer-title">필수 항목 안내</h2>
          </div>
          <div class="layer-container">
              <div class="layer-content">
                  <div class="page-info">
                      <p class="txt-type2">H패션몰을 이용하시려면,<br><span id="layerHtml"></span> 이메일 정보가 필수입니다.</p>
                      <p class="txt-type1">‘필수 항목 다시 선택’을 눌러 제공할 항목을 다시 선택해주시기 바랍니다.</p>
                  </div>
  
                  <div class="btn-box">
                      <button type="button" class="btn-type4-lg" onclick="layer.close('layerRequired');"><span>취소</span></button>
                      <button type="button" class="btn-type2-lg" onclick="reAgree();"><span>필수 항목 다시 선택</span></button>
                  </div>
              </div>
          </div>
          <button type="button" class="btn-layer-close" onclick="layer.close('layerRequired');">닫기</button>
      </div>
  </div>
  <div id="layerSnsGuide" class="layer-pop" tabindex="0" style="display: none;">
      <div class="layer-wrap" tabindex="0">
          <div class="layer-header">
              <h2 class="layer-title">연결 계정 안내</h2>
          </div>
          <div class="layer-container">
              <div class="layer-content">
                  <div class="page-info">
                      <p class="txt-type2">이미 다른 H패션몰 아이디와 연결된<br> <strong><span id="snsNm"></span> 계정입니다.</strong></p>
                  </div>
                  <ul class="txt-info-group" id="ulSnsId">
                      <li>
                          <span class="txt-label">아이디</span>
                          <span class="txt-value" id="snsConnectedId"></span>
                      </li>
                  </ul>
                  <p class="txt-guide">로그인 후 [마이페이지 &gt; 회원정보 수정]에서 기존 연결 해제 후<br> 새로 연결하시기 바랍니다.</p>
  
                  <div class="btn-box">
                      <button type="button" class="btn-type2-lg" onclick="layer.close('layerSnsGuide');"><span>확인</span></button>
                  </div>
              </div>
          </div>
          <button type="button" class="btn-layer-close" onclick="layer.close('layerSnsGuide');">닫기</button>
      </div>
  </div><script>
      window.fbAsyncInit = function() {
          FB.init({
              appId      : '2751487128402917',
              cookie     : true,
              xfbml      : true,
              version    : 'v8.0'
          });
  
          FB.AppEvents.logPageView();
      };
  
      (function(d, s, id){
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) {return;}
          js = d.createElement(s); js.id = id;
          js.src = "https://connect.facebook.net/en_US/sdk.js";
          fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
  
      // 페이스북 로그인 체크
      function facebookLink() {
  
          FB.getLoginStatus(function(response) {
              if(response.status == 'connected') {
                  facebookLoginCallback(response);
              }else{
                  FB.login(function(response){
  
                      if(response.status != 'connected') {
                          return false;
                      }
  
                      facebookLoginCallback(response);
  
                  }, {scope: 'public_profile,email'});
              }
          });
      }
  
      // 페이스북 로그인 후 프로필 조회
      function facebookLoginCallback(response){
          $("#snsCd").val("FACEBUK");
          var userID = response.authResponse.userID;
          var email = "";
  
          FB.api('/me?fields=id,email,name', function(result) {
              if(undefined == result.email){
                  $("#layerHtml").html("페이스북");
                  layer.open('layerRequired');
                  return false;
              }
  
              email = result.email;
  
              $.ajax({
                  type : "POST",
                  url : '/public/member/linkFacebook.json',
                  async: false,
                  data: {'_csrf': '7b3792f8-43df-449d-9cbb-8a37d6a9d26e', 'userID': userID, 'email':email},
                  success : function(args) {
                      callbackFacebook(args);
                  },
                  error : function(e) {
                      alert('시스템 오류 입니다.');
                  }
              });
          });
      }
  
      // 이메일 권한 재요청
      function rerequest(){
          FB.login(function(response){
  
              if(response.status != 'connected') {
                  return false;
              }
              permissionCheck(response);
  
          }, {scope: 'public_profile, email', auth_type: 'rerequest'});
      }
  
      function permissionCheck(response){
          FB.api('/me/permissions', function(result){
              var declined = [];
              for(i=0; i<result.data.length; i++){
                  if('email' == result.data[i].permission){
                      if('granted' == result.data[i].status){
                          facebookLoginCallback(response);
                      }
                  }
              }
          });
      }
  
      function callbackFacebook(obj) {
          $("#snsCd").val("FACEBUK");
          var _o = $('#snsFacebook');
          _o.prop('checked', false);
          window.focus();
  
          if(obj.result == "NO_JOIN"){
              //연동 ID가 이미 존재하는 경우
              $("#snsNm").html("페이스북");
              // 아이디 설정을 안했을 경우 미노출
              if(obj.mbrId == ''){
                  $("#ulSnsId").hide();
              }else{
                  $("#snsConnectedId").html(obj.mbrId);
              }
              layer.open('layerSnsGuide');
          }else if (obj.result == "FACEBOOK_JOIN"){
              _o.prop('checked', true);
              _o.val(obj.facebookEmail);
              $('#snsFacebookLoginId').text(obj.facebookEmail);
              alert("페이스북 계정 연결되었습니다.");
          }else if (obj.result == "FAIL"){
              alert("페이스북 연동 에러가 발생했습니다.");
          }else{
              alert("페이스북 연동 에러가 발생했습니다.");
          }
      }
  
      // 페이스북 연결 해제
      function unlinkFacebook(loginId){
          var _o = $('#snsFacebook');
  
          $.ajax({
              type: 'post',
              cache: false,
              data: { loginId : loginId },
              url: "/public/member/unlinkFacebook",
              success: function(d){
                  _o.prop('checked', false);
                  _o.val('');
                  $('#snsFacebookLoginId').text('');
  
                  alert('페이스북 계정 연결이 해제되었습니다.');
              }
              , error : function(e) {
                  _o.prop('checked', true);
  
                  alert("처리 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
              }
          });
      }
  
  </script></div>
                      <!-- //snb-content-wrap -->
                  </section>
              </div>
  </div>
  </body>

<%@ include file="../footer.jsp" %>