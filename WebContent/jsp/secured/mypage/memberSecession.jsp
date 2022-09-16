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
                          <form method="post" action="/secured/mypage/memberSecessionMall" id="memberSecessionForm">
  
      <h3 class="page-title">회원 탈퇴</h3>
      <div class="page-info">
          <p class="txt-type2">그동안 한섬을 이용해 주셔서 대단히 감사합니다.</p>
      </div>
      
      
      <div class="btn-box">
          <button type="button" class="btn-type4-lg" onclick="goSecession();"><span>H패션몰 탈퇴</span></button>
      </div>
      
  </form>
  <script>
    // 지워도 되는건가?
      var host = "https://hsp.handsome.co.kr"; /* erp 통합멤버십 탈퇴 호스트 */
      
      function goSecession(){
          $("#memberSecessionForm").submit();
      }
  </script>
  </div>
      </section>
      </div>
  </div>
  </body>

<%@ include file="../footer.jsp" %>