<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
<form id="join" action="hfashionmallServlet?command=join" method="post" name="formm">
	<h2 class="page-title">회원가입</h2>
	<table>
		<colgroup>
		<col style="width: 160px">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><h3 class="sec-title mt0">필수 정보</h3></th>
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
		        	<p class="txt-invalid" style="display: block;" id="descMbrEmail"></p>
		    	</td>
			</tr>
			
			<tr>
		    <th scope="row">휴대폰번호</th>
		    	<td>
		        	<div class="form-group">
		            <div class="input-box" id="divMobileNumber">
		                <input type="text" title="휴대폰번호" name="member_phone" id="mobileNumber" maxlength="11" onblur="mobileNumberCheckResult();" placeholder="" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMobileNumber"></p>
					<p class="txt-invalid" style="display: block;" id="descCerti_str"></p>
		    	</td>
			</tr>
			
			<tr>
		    <th scope="row">아이디</th>
			    <td>
			        <div class="input-box" id="divMbrId">
			            <input type="text" title="아이디" name="member_id" id="mbrId" maxlength="20" placeholder="" onblur="idCheckResult();" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrId"></p>
					<p class="txt-form-cmt">6-20자의 영문, 숫자 또는 영문 + 숫자 조합으로 입력 가능</p>
					<input type="hidden"    name="reid">
					<input type="button"    value="중복 체크"  class="dup" onclick="idcheck()"><br> 
			    </td>
			</tr>
			
			<tr>
		    <th scope="row">비밀번호</th>
			    <td>
			        <div class="input-box" id="divMbrPw">
			            <input type="password" title="비밀번호" name="member_pw" id="mbrPw" maxlength="15" onblur="passwordResult();" placeholder="" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrPw"></p>
					<p class="txt-form-cmt">영문, 숫자, 특수문자 3가지 종류 8-15자 또는 2종류 이상 조합 10-15자로 사용 가능</p>
					<div class="input-box" id="divMbrCheckPw">
			    		<input type="password" title="비밀번호 확인" name="pwdCheck" id="mbrCheckPw" maxlength="15" onblur="passwordCheckResult();" placeholder="비밀번호 확인" class="inp-reset">
					</div>
					<p class="txt-invalid" style="display: block;" id="descMbrCheckPw"></p>
				</td>
			</tr>
			
		</tbody>
	</table>
	<div id="buttons">
		<input type="button"    value="가입하기"   class="submit" onclick="go_save()">
	</div>
</form>
<%@ include file="../footer.jsp" %>
  