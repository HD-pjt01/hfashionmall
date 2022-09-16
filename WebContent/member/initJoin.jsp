<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- body -->
<div id="container">
	<div class="breadcrumb-wrap">
		<ol class="breadcrumb">
			<li class="bc-home"><a href="hfashionmallServlet?command=index"><span>Home</span></a></li>
			<li class="active">회원가입</li>
		</ol>
	</div>
	
	

	<input type="hidden" name="hPointEnableYn" id="hPointEnableYn"
		value="Y" />
	<script type="text/javascript"
		src="/hfm_pc/resources/js/mypage/mypagecommon.js"></script>

	<!-- content-wrap -->
	<section class="content-wrap">
		<h2 class="page-title">회원가입</h2>

		<!-- join-wrap -->
		<input type="hidden" name="accessToken" id="accessToken" value="" />
		<div class="join-wrap">
			<input type="hidden" id="allowed" name="allowed" /> <input
				type="hidden" id="snsCd" name="snsCd" />
			<div class="hfm-join-group" style = "text-align : center">
				<dl class="join-guide">
					<dt>
						<form id="join" action="hfashionmallServlet?command=join_form" method="post" name="formm"></form>
							<a href="hfashionmallServlet?command=join_form" class="btn-join-simple">H패션몰 회원 가입</a>
						</form>
					</dt>
					<dd>
						<p class="txt-join-guide">
							본인인증 절차 없이<br> H패션몰의 서비스를 이용할 수 있습니다.
						</p>
						<ul class="txt-list" >
							<li>H패션몰에서만 사용 가능</li>
							<li>H.Point 통합회원 혜택은 제공되지 않음</li>
							<li>사용중인 SNS 계정으로 간편하게 회원가입 가능</li>
						</ul>
						
					</dd>
				</dl>
			</div>
			<h3 class="sec-title">H패션몰 회원 혜택</h3>
			<div class="benefit">
				<ul class="member-benefit">
					<li>
						<div class="benefit-img">
							<img src="images/member/img_mem_benefit_01.png" alt="">
						</div>
						<div class="benefit-txt">
							<p class="txt">신규 가입 최대 15% 쿠폰 지급</p>
							<p class="sub">단 한번, 신규 회원 가입 즉시 지급</p>
						</div>
					</li>
					<li>
						<div class="benefit-img">
							<img src="images/member/img_mem_benefit_02.png" alt="">
						</div>
						<div class="benefit-txt">
							<p class="txt">생일 축하 20% 쿠폰 지급</p>
							<p class="sub">1년에 한 번씩, 매월 1일 해당월 생일자 쿠폰 지급</p>
						</div>
					</li>
					<li>
						<div class="benefit-img">
							<img src="images/member/img_mem_benefit_03.png" alt="">
						</div>
						<div class="benefit-txt">
							<p class="txt">App 첫 로그인 20% 쿠폰 지급</p>
							<p class="sub">단 한번! 앱 첫 로그인 시 즉시 지급</p>
						</div>
					</li>
					<li>
						<div class="benefit-img">
							<img src="images/member/img_mem_benefit_04.png" alt="">
						</div>
						<div class="benefit-txt">
							<p class="txt">App Push 수신 동의 5천원 쿠폰 지급</p>
							<p class="sub">매월 1일, App Push 수신 동의 쿠폰 지급</p>
						</div>
					</li>
					<li>
						<div class="benefit-img">
							<img src="images/member/img_mem_benefit_05.png" alt="">
						</div>
						<div class="benefit-txt">
							<p class="txt">멤버십 혜택</p>
							<p class="sub">매월 1일, 멤버십 등급에 따라 혜택 지급</p>
						</div>
					</li>
					<li>
						<div class="benefit-img">
							<img src="images/member/img_mem_benefit_06.png" alt="">
						</div>
						<div class="benefit-txt">
							<p class="txt">구매 포인트 혜택</p>
							<p class="sub">구매 상품의 할인율에 따라 최대 5% 포인트 적립</p>
						</div>
					</li>
					<li>
						<div class="benefit-img">
							<img src="images/member/img_mem_benefit_06.png" alt="">
						</div>
						<div class="benefit-txt">
							<p class="txt">리뷰 포인트 혜택</p>
							<p class="sub">
								구매 상품의 리뷰를 나의 사이즈와<br> 함께 남기면 최대 1,500 포인트 적립
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<!-- //join-wrap -->
	</section>
</div>
<%@ include file="../footer.jsp"%>
