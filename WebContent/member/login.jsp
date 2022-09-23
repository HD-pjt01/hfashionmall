<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="container">
	<div class="breadcrumb-wrap">
		<ol class="breadcrumb">
			<li class="bc-home"><a href="hfashionmallServlet?command=index"><span>Home</span></a></li>
			<li class="active">로그인</li>
		</ol>
	</div>


	<input type="hidden" name="loginTarget" id="loginTarget" value="" /> <input
		type="hidden" name="drmcMbrNo" id="drmcMbrNo" value="" /> <input
		type="hidden" name="snsLinkFlag" id="snsLinkFlag" value="" /> <input
		type="hidden" name="hPointEnableYn" id="hPointEnableYn" value="Y" />

	<!-- content-wrap -->
	<section class="content-wrap">
		<h2 class="page-title">로그인</h2>

		<!-- login-wrap -->

		<div class="login-wrap">
			<div id="loginTab" class="login-tab tab-wrap2 ui-tab">
				<ul class="tabs tab-btn">
					<li class="on"><a href="javascript:;" onClick="hPointEnable()">H.Point
							통합회원</a></li>
					<li><a href="javascript:;">H패션몰 회원</a></li>
					<li><a href="javascript:;">비회원</a></li>
				</ul>

				<!-- 탭1 H.Point 통합회원 -->
				<div class="tab-cont on">
					<div class="login-group hpoint">
						<div class="login-left tab-wrap3 ui-tab">
							<ul class="tabs tab-btn">
								<li class="on"><a href="javascript:;">아이디/비밀번호 로그인</a></li>
								<li><a href="javascript:;">OTP 인증번호 로그인</a></li>
							</ul>

							<!-- 탭1-1 -->
							<div class="tab-cont on">
								<ul class="login-input">
									<li>
										<div class="input-box">
											<input type="text" title="H.Point 아이디"
												placeholder="H.Point 아이디" class="inp-reset"
												id="userIdHpoint" name="userId" value="">
											<div class="etc">
												<button type="button" class="btn-clear">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<p class="txt-invalid" id="descUserIdHpoint"></p>
									</li>
									<li>
										<div class="input-box">
											<input type="password" title="H.Point 비밀번호"
												placeholder="H.Point 비밀번호" class="inp-reset"
												id="passwordHpoint" name="password">
											<div class="etc">
												<button type="button" class="btn-masking">
													<span>마스킹</span>
												</button>
												<button type="button" class="btn-clear">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<p class="txt-invalid" id="descPasswordHpoint"></p>
									</li>
								</ul>

								<div class="login-link">
									<div class="login-check">
										<label class="check-skin"> <input type="checkbox"
											id="chkSaveIdHpoint" name="saveIdHpoint"> <span>아이디
												저장</span>
										</label>
									</div>
									<ul class="links">
										<li><a href="#" title="새창으로 열림"
											onclick="goHpointFindId();">아이디 찾기</a></li>
										<li><a href="#" title="새창으로 열림"
											onclick="goHpointFindPwd();">비밀번호 찾기</a></li>
									</ul>
								</div>

								<div class="btn-box">
									<button type="button" class="btn-type2-xlg"
										onclick="login('Hpoint');">
										<span>로그인</span>
									</button>
								</div>

								<a href="#" class="btn-link btn-hpoint-join"
									onclick="goHpointJoin();">회원가입</a>
							</div>

							<!-- 탭1-2 -->
							<div class="tab-cont">
								<ul class="login-input">
									<li>
										<div class="input-box">
											<input type="text" title="OTP 인증번호" placeholder="OTP 인증번호"
												class="inp-reset" id="otpNo" maxlength="8">
											<div class="etc">
												<button type="button" class="btn-clear">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<p class="txt-invalid" id="descOtp"></p>
									</li>
								</ul>

								<div class="btn-box">
									<button type="button" class="btn-type2-xlg"
										onclick="login('otp');">
										<span>로그인</span>
									</button>
								</div>

								<dl class="txt-group">
									<dt>OTP 인증번호 로그인 방법</dt>
									<dd>
										<ol class="txt-list number">
											<li>1. H.Point 앱 실행</li>
											<li>2. MENU &gt; 설정 &gt; OTP 인증번호 발급 클릭</li>
											<li>3. 발급된 인증번호 입력</li>
										</ol>
									</dd>
								</dl>
							</div>
						</div>

						<div class="login-guide">
							<p class="txt-login">
								H.Point 통합회원은<br> 현대백화점 그룹의 모든 서비스를<br> 이용할 수 있습니다.
							</p>
						</div>
					</div>
				</div>

				<!-- 탭2 H패션몰 회원 -->
				<div class="tab-cont">
					<div class="login-group simple">
						<div class="login-left">
							<form method="post" action="hfashionmallServlet?command=login"
								id="loginForm">
								<ul class="login-input">
									<li>
										<div class="input-box">
											<input type="text" title="H패션몰 아이디" placeholder="H패션몰 아이디"
												class="inp-reset" id="userIdMall" name="member_id"
												value="${id}" maxlength="20">
											<div class="etc">
												<button type="button" class="btn-clear">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<p class="txt-invalid" id="descUserIdMall"></p>
									</li>
									<li>
										<div class="input-box">
											<input type="password" title="H패션몰 비밀번호"
												placeholder="H패션몰 비밀번호" class="inp-reset" id="passwordMall"
												name="member_pw" maxlength="15">
											<div class="etc">
												<button type="button" class="btn-masking">
													<span>마스킹</span>
												</button>
												<button type="button" class="btn-clear">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<p class="txt-invalid" id="descPasswordMall"></p>
									</li>
								</ul>

								<div class="login-link">
									<div class="login-check">
										<label class="check-skin"> <input type="checkbox"
											id="chkSaveIdMall" name="saveIdMall"> <span>아이디
												저장</span>
										</label>
									</div>
									<ul class="links">
										<li><a href="hfashionmallServlet?command=find_id_form">아이디
												찾기</a></li>
										<li><a href="hfashionmallServlet?command=find_id_form">비밀번호
												재설정</a></li>
									</ul>
								</div>
							</form>
							<div class="btn-box">
								<button type="submit" class="btn-type2-xlg" form="loginForm">
									<span>로그인</span>
								</button>
							</div>
						</div>


						<div class="login-guide">
							<p class="txt-login">
								H패션몰 간편회원은<br> H패션몰의 모든 서비스를<br> 이용할 수 있습니다.
							</p>
							<a href="hfashionmallServlet?command=join_form"
								class="btn-link btn-join">회원가입</a>
						</div>
					</div>
				</div>
				<!-- 탭3 비회원 -->
				<div class="tab-cont">
					<div class="login-group nomem">
						<div class="login-left">
							<ul class="login-input">
								<li>
									<div class="input-box">
										<input type="text" title="이름" placeholder="이름"
											class="inp-reset" maxlength="30" id="nonMbrNm">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" id="descNonMbrNm"></p>
								</li>
								<li>
									<div class="input-box">
										<input type="text" title="휴대폰번호" placeholder="휴대폰번호"
											class="inp-reset" maxlength="11" id="nonMobilNo">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" id="descNonMobilNo"></p>
								</li>
								<li>
									<div class="input-box">
										<input type="text" title="주문번호" placeholder="주문번호"
											class="inp-reset" maxlength="17" id="nonOrdNo">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div>
									<p class="txt-invalid" id="descNonOrdNo"></p>
								</li>
							</ul>

							<div class="btn-box">
								<button type="button" class="btn-type2-xlg"
									onclick="nonMemberOrder(); return false;">
									<span>주문 조회</span>
								</button>
							</div>

							<p class="txt-login-guide">주문번호를 모르신다면, 고객센터 1800-5700로
								문의해주시기 바랍니다.</p>
						</div>

						<div class="login-guide">
							<p class="txt-login">
								비회원으로 구매 건의<br> 주문/배송 조회만 가능합니다.
							</p>
						</div>
					</div>
				</div>
			</div>
			<script>
				//tab.active('#loginTab', 0);
			</script>
		</div>
		<!-- //login-wrap -->
	</section>

	<script>
		/**
		 * CHROME 브라우저 에서 focus 이동 문제로 인하여 타임아웃 설정
		 * */
		function setTimeoutFocus(thisId) {
			setTimeout(function() {
				$('input#' + thisId).focus();
			}, 1);
		}
	</script>


</div>

<%@ include file="../footer.jsp"%>


