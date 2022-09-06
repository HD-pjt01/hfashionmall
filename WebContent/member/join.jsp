<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
  <article>
  	<h1>회원가입</h1>
    <h2>필수 정보</h2>
    <form id="join" action="hfashionmallServlet?command=join" method="post" name="formm">
      <fieldset>
        <label>이름</label>
        <input type="text" class="underline"     name="member_name"><br> 
        <label>생년월일</label>
        <input type="text" class="underline"     name="member_birth" placeholder="YYYYMMDD, 만 14세 이상 가입"><br>
        <label>이메일</label>
        <input type="text" class="underline"     name="member_email"><br>
        <label>휴대폰번호</label> 
        <input  type="text" class="underline"      name="phone"><br>
        <label>아이디</label>
        <input type="text" class="underline"     name="member_id"        size="12"  >
        <input type="hidden"    name="reid">
        <input type="button"    value="중복 체크"  class="dup" onclick="idcheck()"><br>
        <label>비밀번호</label> 
        <input type="password"  name="member_pw"><br> 
        <input type="password"  name="pwdCheck"><br> 
        
        <!-- <label>Zip Code</label> 
        <input type="text"       name="zipNum"   size="10" >      
        <input type="button"     value="주소 찾기" class="dup" onclick="post_zip()"><br>
        <label>Address</label> 
        <input type="text"        name="addr1"   size="50">
        <input type="text"        name="addr2"   size="25"> <br>-->
      </fieldset>
      <div class="clear"></div>
      <div id="buttons">
        <input type="button"    value="가입하기"   class="submit" onclick="go_save()"> 
        <input type="reset"      value="취소"     class="cancel">
      </div>
    </form>
  </article>
<%@ include file="../footer.jsp" %>
  