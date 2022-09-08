<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
<h1 class="page-title" style="text-align : center;">회원가입</h1>
<form id="join" action="hfashionmallServlet?command=join" method="post" name="formm">
	<table>
		<colgroup>
		<col style="width: 160px">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><h3 class="sec-title mt0">필수 정보</h3></th>
				<td>
					<h3 class="sec-title mt0">&nbsp;</h3>
				</td>
			</tr>
			
			<tr>
				<th scope="row">이름</th>
				<td>
			    	<div class="input-box" id="divMbrNm"> <!-- [D]정상일 경우 class(valid) 추가 -->
						<input type="text" title="이름" name="member_name" id="mbrNm" maxlength="30" onblur="mbrNameCheckResult();" placeholder="" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrNm">이름을 입력해주세요.</p>
				</td>
			</tr>
			
			<tr>
		    	<th scope="row">생년월일</th>
		    	<td>
			        <div class="input-box" id="divMbrBrthdy"> <!-- [D]오류일 경우 class(invalid) 추가 -->
						<input type="text" title="생년월일" name="member_birth" id="mbrBrthdy" maxlength="8" onblur="checkBirthDay();" placeholder="YYYYMMDD, 만 14세 이상 가입" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrBrthdy">생년월일을 숫자 8자리로 입력해주세요.</p>
		    	</td>
			</tr>
			
			<tr>
		    	<th scope="row">이메일</th>
		    	<td>
		        	<div class="input-box" id="divMbrEmail">
		            	<input type="text" title="이메일" name="member_email" id="mbrEmail" maxlength="100" placeholder="" class="inp-reset" value="">
		        	</div>
		        	<p class="txt-invalid" style="display: block;" id="descMbrEmail">&nbsp;</p>
		    	</td>
			</tr>
			
			<tr>
		    <th scope="row">휴대폰번호</th>
		    	<td>
		        	<div class="form-group">
		            <div class="input-box" id="divMobileNumber">
		                <input type="text" title="휴대폰번호" name="member_phone" id="mobileNumber" maxlength="11" onblur="mobileNumberCheckResult();" placeholder="" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMobileNumber">&nbsp;</p>
		    	</td>
			</tr>
			
			<tr>
		    <th scope="row">아이디</th>
			    <td>
			        <div class="input-box" id="divMbrId">
			            <input type="text" title="아이디" name="member_id" id="mbrId" maxlength="20" placeholder="" onblur="idCheckResult();" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrId">6-20자의 영문, 숫자 또는 영문 + 숫자 조합으로 입력 가능</p>
			    </td>
			</tr>
			
			<tr>
		    <th scope="row">비밀번호</th>
			    <td>
			        <div class="input-box" id="divMbrPw">
			            <input type="password" title="비밀번호" name="member_pw" id="mbrPw" maxlength="15" onblur="passwordResult();" placeholder="" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrPw">영문, 숫자, 특수문자 3가지 종류 8-15자 또는 2종류 이상 조합 10-15자로 사용 가능</p>
				</td>
			</tr>
			<tr>
			<th scope="row">&nbsp;</th>
				<td>
			        <div class="input-box" id="divMbrCheckPw">
			    		<input type="password" title="비밀번호 확인" name="pwdCheck" id="mbrCheckPw" maxlength="15" onblur="passwordCheckResult();" placeholder="비밀번호 확인" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrCheckPw">&nbsp;</p>
				</td>
			</tr>
		</tbody>
	</table>
	<div id="buttons">
		<input type="button"    value="가입하기"   class="submit" onclick="go_save()">
		<input type="hidden"    name="reid">
		<input type="button"    value="중복 체크"  class="dup" onclick="idcheck()"><br> 
	</div>
</form>
<h3 class="sec-title" style="text-align : center;">약관 동의</h3>
<div class="agree-option-wrap">
    <dl class="agree-option">
        <dt>
            <label class="check-skin">
                <input type="checkbox" class="allChk" id="allAgrChk" onchange="allAgrCheckResult();" data-gtm-form-interact-field-id="0">
                <span>전체 동의</span>
            </label>
        </dt>
        <dd>
            <div class="agree-item">
                <ul class="agree-list">
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" id="usefStplat" onchange="agrCheckResult();" data-gtm-form-interact-field-id="1">
                            <span>이용약관, 멤버십 약관 동의 <em class="required">(필수)</em></span>
                        </label>
                        <button type="button" class="btn-type1-sm" onclick="layer.open('layerMemTerms');"><span>내용 보기</span></button>
                    </li>
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" id="consignmentStplat" onchange="agrCheckResult();">
                            <span>개인정보 취급 위탁 동의 <em class="required">(필수)</em></span>
                        </label>
                        <button type="button" class="btn-type1-sm" onclick="layer.open('layerPrivacy');"><span>내용 보기</span></button>
                    </li>
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" id="privacyRequired" onchange="agrCheckResult();">
                            <span>개인정보 수집/이용 동의 <em class="required">(필수)</em></span>
                        </label>
                        <button type="button" class="btn-type1-sm" onclick="layer.open('layerPrivacy2');"><span>내용 보기</span></button>
                    </li>
                </ul>
            </div>

            <div class="agree-item">
                <ul class="agree-list">
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" class="allChk" id="privacyChoise" name="psnlInfoColctUsefAgrChoiseYn" value="Y" onchange="agrCheckResult();">
                            <span>개인정보 선택 수집/이용 <em>(선택)</em></span>
                        </label>
                        <button type="button" class="btn-type1-sm" onclick="layer.open('layerPrivacy3');"><span>내용 보기</span></button>
                    </li>
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" class="allChk" id="mktAgree" onchange="agrCheckResult();">
                            <span>마케팅 정보 수신 모두 동의 <em>(선택)</em></span>
                        </label>
                    </li>
                </ul>
                <ul class="check-list">
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" name="mbr.smsRecptnAgrYn" id="smsRecptnAgrYn" value="Y" onchange="mktCheckResult();">
                            <span>문자(SMS)</span>
                        </label>
                    </li>
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" name="mbr.emailRecptnAgrYn" id="emailRecptnAgrYn" value="Y" onchange="mktCheckResult();">
                            <span>이메일</span>
                        </label>
                    </li>
                </ul>
                <ul class="txt-list">
                    <li>개인정보 선택 수집 및 이용에 대해 동의하지 않아도 서비스를 이용하실 수 있습니다. 단, 동의하지 않은 경우<br> H패션몰의 고객 맞춤 혜택을 제공 받으실 수 없습니다.</li>
                    <li>마케팅 정보 수신 모두 동의 시, 15% 신규 가입 쿠폰이 발급되며, 모두 동의가 아닌 경우 10% 신규 가입 쿠폰이 발급됩니다.</li>
                </ul>
            </div>

            <div class="agree-item lifetime">
                <ul class="agree-list">
                    <li>
                        <label class="check-skin">
                            <input type="checkbox" name="mbr.drmcSecsnStdrCd" id="drmcSecsnStdrCd" value="Y">
                            <span>평생회원 동의 <em>(선택)</em></span>
                        </label>
                    </li>
                </ul>
                <ul class="txt-list">
                    <li><strong class="pcolor">평생회원 동의 후 가입 시, 장바구니쿠폰 20%, H.Plus 5,000 포인트를 바로 드립니다.</strong></li><li>평생 회원은 1년 이상 방문하지 않아도 소중한 개인 정보와 혜택을 탈퇴 시까지 보호 해드립니다.</li>
                    <li>동의하지 않은 경우, 개인정보 유효기간은 1년으로 설정됩니다.</li>
                </ul>
            </div>
        </dd>
    </dl>
</div>
<div class="join-agree">
    <p>H패션몰 이용약관, 멤버십 약관 및 개인정보 수집/이용 동의 내용을 확인하였으며,<br> 위 내용에 동의합니다. 만 14세 미만 아동은 회원가입이 제한 됩니다.</p>
</div>
<div class="btn-box">
	<button type="button" class="btn-type2-lg" onclick="go_save()"><span>가입하기</span></button>
</div>
<%@ include file="../footer.jsp" %>
  