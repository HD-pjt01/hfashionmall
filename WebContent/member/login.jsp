<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<section class="content-wrap">
	<h2 class="page-title">로그인</h2>
	<div class="login-wrap">
		<div id="loginTab" class="login-tab tab-wrap2 ui-tab initialized">
			<ul class="tabs tab-btn">
				<li><a href="#" onclick="hPointEnable()">H.Point 통합회원</a></li>
				<li><a href="#" onclick="hPointEnable()">H패션몰 회원</a></li>
				<li><a href="#" onclick="hPointEnable()">비회원</a></li>
			</ul>
			<div class="tab-cont">
				<!-- 로그인 왼쪽 -->
				<div class="login-group hpoint">
					<div class="login-group simple" >
						<form method="post" action="hfashionmallServlet?command=login">
							<ul class="login-input">
								<li>
					                <div class="input-box">
					                    <input type="text" title="H패션몰 아이디" placeholder="H패션몰 아이디" class="inp-reset" id="userIdMall" name="member_id" value="${id}" maxlength="20">
					                    <div class="etc">
					                        <button type="button" class="btn-clear"><span>지우기</span></button>
					                    </div>
					                </div>
					                <p class="txt-invalid" id="descUserIdMall"></p>
					            </li>
					            <li>
					                <div class="input-box">
					                    <input type="password" title="H패션몰 비밀번호" placeholder="H패션몰 비밀번호" class="inp-reset" id="passwordMall" name="member_pw" maxlength="15">
					                    <div class="etc">
					                        <button type="button" class="btn-masking"><span>마스킹</span></button>
					                        <button type="button" class="btn-clear"><span>지우기</span></button>
					                    </div>
					                </div>
					                <p class="txt-invalid" id="descPasswordMall"></p>
					            </li>
					        </ul>
					        <div class="login-link">
				                <div class="login-check">
				                    <label class="check-skin">
				                        <input type="checkbox" id="chkSaveIdMall" name="saveIdMall">
				                        <span>아이디 저장</span>
				                    </label>
				                </div>
				                <input type="button" value="아이디 비밀번호 찾기" class="submit"
				                 onclick="location='hfashionmallServlet?command=find_id_form'">
				            </div>
				            <div class="btn-box">
				            	<input type="submit" value="로그인" class="submit">
				            </div>
				        </form>
					</div>
				</div>
				<ul class="login-sns type2">
		            <li><a href="javascript:;" onclick="kakaoLogin();" class="btn-sns kakao"><span>카카오</span></a></li>
		            <li><a href="javascript:;" onclick="naverLogin();" class="btn-sns naver"><span>네이버</span></a></li>
		            <li><a href="javascript:;" onclick="facebookLogin();" class="btn-sns facebook"><span>페이스북</span></a></li>
		            <li><a href="#apple" class="btn-sns apple"><span>애플</span></a></li>
		        </ul>
		        <!-- 로그인 오른쪽 -->
				<div class="login-guide" >
					<p class="txt-login">H패션몰 간편회원은<br> H패션몰의 모든 서비스를<br> 이용할 수 있습니다.</p>
					 <input type="button" value="회원가입" class="cancel"
		                 onclick="location='hfashionmallServlet?command=join_form'">
					<p>이미지</p>
				</div>
			</div>
		</div>
	</div>
</section> 



<%@ include file="../footer.jsp" %>      


