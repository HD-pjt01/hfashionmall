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
                          <h3 class="page-title">회원정보 수정</h3>
  
  <div class="page-info">
      <p class="txt-type3">회원님의 소중한 개인정보 보호를 위해<br> 비밀번호를 다시 한번 입력해주시기 바랍니다.</p>
  </div>
  
  <div class="tbl-write">
      <form method="post" action="/secured/mypage/updateMember" id="checkPwdForm">
          <input type="hidden" name="_csrf" value="7b3792f8-43df-449d-9cbb-8a37d6a9d26e"/>
          <table>
              <caption>비밀번호 확인</caption>
              <colgroup>
                  <col style="width: 190px">
                  <col>
              </colgroup>
              <tbody>
                  <tr>
                      <th scope="row">비밀번호</th>
                      <td>
                          <div class="input-box">
                              <input type="password" title="비밀번호" name="mbr.mbrPw" id="mbrPw" maxlength="15" autocomplete="off" placeholder="비밀번호를 입력해주세요." class="inp-reset">
                              <div class="etc">
                                  <button type="button" class="btn-clear"><span>지우기</span></button>
                              </div>
                          </div>
                          <!-- 유효성 검사 메시지 출력 -->
                          <p class="txt-invalid" id="descMbrPw" style="display: block;"></p>
                      </td>
                  </tr>
              </tbody>
          </table>
      </form>
  </div>
  
  <div class="btn-box">
      <button type="button" class="btn-type2-lg" onclick="javascript:checkPwd();return false;"><span>확인</span></button>
  </div>
  
  <script>
      $(document).ready(function() {
          /**
           * 비밀번호 키이벤트
           */
          $('#mbrPw').keypress(function(e) {
              if( e.keyCode == 13 ){
                  checkPwd();
                  return false;
              }
          });
      });
  
      /**
       * CHROME 이외 브라우저 에서 focus 이동 문제로 인하여 타임아웃 1초 설정
       * */
      function setTimeoutFocus(thisId){
          setTimeout(function(){
              $('input#'+thisId).focus();
          }, 1);
          $('input#'+thisId).val("");
      }
  
      /**
       * 비밀번호 확인
       */
      function checkPwd(){
          var mbrPw = $("input#mbrPw").val();
          if(mbrPw == ""){
              $("#descMbrPw").text('비밀번호를 입력해주세요.');
              setTimeoutFocus("mbrPw");
              return;
          }
  
          $.ajax({
              type : "post",
              url : "/secured/mypage/checkMemberPassword.json",
              data : $("#checkPwdForm").serialize(),
              success : function(args) {
                  callbackCheckPwd(args);
              },
              error : function(e) {
                  alert(e.responseText);
              }
          });
      }
  
      function callbackCheckPwd(args){
          if(args.isCheckPwd == true || args.isCheckPwd =='true'){
              $("#mbrPw").val("");
              $("#checkPwdForm").submit();
          }else{
              $("#descMbrPw").text("비밀번호가 일치하지 않습니다.");
              setTimeoutFocus("mbrPw");
              return;
          }
      }
  </script></div>
                      <!-- //snb-content-wrap -->
                  </section>
              </div>
  
      </section>
      </div>
  </div>
  </body>


<%@ include file="../footer.jsp" %>