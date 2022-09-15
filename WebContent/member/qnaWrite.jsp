<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="container">

	<article>
		<h2>1:1 고객 게시판</h2>
		<h3>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
		<form name="formm" method="post"
			action="hfashionmallServlet?command=qna_write">
			<fieldset>
				<legend>Board Info</legend>
				<label>Title</label> <input type="text" name="qna_subject" size="77"><br>
				<label>Content</label>
				<textarea rows="8" cols="65" name="qna_content"></textarea>

				<div class="select" style="width: 100%;">
					<button type="button" class="sel-btn" onclick="select.trigger();">접수분류를
						선택하세요.</button>
					<div class="sel-list">
						<ul>
							<li><label><input type="radio" name="qna_classification"
									value="" checked=""> <span>접수분류를 선택하세요.</span></label></li>
							<li><label><input type="radio" name="qna_classification"
									value="불만"> <span>불만</span></label></li>
							<li><label><input type="radio" name="qna_classification"
									value="제안"> <span>제안</span></label></li>
							<li><label><input type="radio" name="qna_classification"
									value="문의"> <span>문의</span></label></li>
						</ul>
					</div>
				</div>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons" style="float: right">
				<input type="submit" value="글쓰기" class="submit" onclick="location.href='hfashionmallServlet?command=index'"> 
				<input type="reset" value="취소" class="cancel">
				<input type="button" value="쇼핑 계속하기" class="submit"
					onclick="location.href='hfashionmallServlet?command=index'">
			</div>
		</form>
	</article>
</div>
<%@ include file="../footer.jsp"%>