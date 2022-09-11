<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<%@ include file="sub_img.html"%> 
<%@ include file="sub_menu.html" %>       
  <article>
    <section class="content-wrap" style="user-select: auto;">
      <h2 class="page-title" style="user-select: auto;">회원가입</h2>
      <div class="hfm-join-group" style="user-select: auto;">
        <dl class="join-guide" style="user-select: auto;">
          <dt style="user-select: auto;">
          <form id="join" action="hfashionmallServlet?command=join_form" method="post" name="formm">
		    <input type="button" value="H패션몰 회원 가입" class="submit"  onclick="go_next()" style="float: right;"> 
            <!-- <a href="/public/member/addMemberStep2" class="btn-join-simple" style="user-select: auto;">H패션몰 회원 가입</a> -->
          </form>
          </dt>
          <dd style="user-select: auto;">
            <p class="txt-join-guide" style="user-select: auto;">
              "본인인증 절차 없이"
              <br style="user-select: auto;">
              "H패션몰의 서비스를 이용할 수 있습니다."
            </p>
            <ul class="txt-list" style="user-select: auto;">
              <li style="user-select: auto;">H패션몰에서만 사용 가능</li>
              <li style="user-select: auto;">H.Point 통합회원 혜택은 제공되지 않음</li>
              <li style="user-select: auto;">사용중인 SNS 계정으로 간편하게 회원가입 가능</li>
            </ul>
          </dd>
        </dl>
      </div>
      <h3 class="sec-title" style="user-select: auto;">H패션몰 회원 혜택</h3>
      <div class="benefit" style="user-select: auto;">
        <ul class="member-benefit" style="user-select: auto;">
          <li style="user-select: auto;">
            <div class="benefit-img" style="user-select: auto;">
              <img src=".../.../img_mem_benefit_01.png" alt style="user-select: auto;">
            </div>
            <div class="benefit-txt" style="user-select: auto;">
              <p class="txt" style="user-select: auto;">신규 가입 최대 15% 쿠폰 지급</p>
              <p class="sub" style="user-select: auto;">단 한번, 신규 회원 가입 즉시 지급</p>
            </div></li>
          <li style="user-select: auto;">
            <div class="benefit-img" style="user-select: auto;">
              <img src=".../.../img_mem_benefit_02.png" alt style="user-select: auto;">
            </div>
            <div class="benefit-txt" style="user-select: auto;">
              <p class="txt" style="user-select: auto;">생일 축하 20% 쿠폰 지급</p>
              <p class="sub" style="user-select: auto;">1년에 한 번씩, 매월 1일 해당월 생일자 쿠폰 지급</p>
            </div></li>
          <li style="user-select: auto;">
            <div class="benefit-img" style="user-select: auto;">
              <img src=".../.../img_mem_benefit_03.png" alt style="user-select: auto;">
            </div>
            <div class="benefit-txt" style="user-select: auto;">
              <p class="txt" style="user-select: auto;">App 첫 로그인 20% 쿠폰 지급</p>
              <p class="sub" style="user-select: auto;">단 한번! 앱 첫 로그인 시 즉시 지급</p>
            </div></li>
          <li style="user-select: auto;">
            <div class="benefit-img" style="user-select: auto;">
              <img src=".../.../img_mem_benefit_04.png" alt style="user-select: auto;">
            </div>
            <div class="benefit-txt" style="user-select: auto;">
              <p class="txt" style="user-select: auto;">App Push 수신 동의 5천원 쿠폰 지급</p>
              <p class="sub" style="user-select: auto;">매월 1일, App Push 수신 동의 쿠폰 지급</p>
            </div></li>
          <li style="user-select: auto;">
            <div class="benefit-img" style="user-select: auto;">
              <img src=".../.../img_mem_benefit_05.png" alt style="user-select: auto;">
            </div>
            <div class="benefit-txt" style="user-select: auto;">
              <p class="txt" style="user-select: auto;">멤버십 혜택</p>
              <p class="sub" style="user-select: auto;">매월 1일, 멤버십 등급에 따라 혜택 지급</p>
            </div></li>
          <li style="user-select: auto;">
            <div class="benefit-img" style="user-select: auto;">
              <img src=".../.../img_mem_benefit_06.png" alt style="user-select: auto;">
            </div>
            <div class="benefit-txt" style="user-select: auto;">
              <p class="txt" style="user-select: auto;">구매 포인트 혜택</p>
              <p class="sub" style="user-select: auto;">구매 상품의 할인율에 따라 최대 5% 포인트 적립</p>
            </div></li>
          <li style="user-select: auto;">
            <div class="benefit-img" style="user-select: auto;">
              <img src=".../.../img_mem_benefit_07.png" alt style="user-select: auto;">
            </div>
            <div class="benefit-txt" style="user-select: auto;">
              <p class="txt" style="user-select: auto;">리뷰 포인트 혜택</p>
              <p class="sub" style="user-select: auto;">
                "구매 상품의 리뷰를 나의 사이즈와"
                <br style="user-select: auto;">
                " 함께 남기면 최대 1,500 포인트 적립"
              </p>
            </div></li>
        </ul>
      </div>
    
    
    </section>




  </article>
<%@ include file="../footer.jsp" %>      
