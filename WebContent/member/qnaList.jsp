<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="container">
	<article>
		<h2>나의 QnA 조회</h2>
		<form name="formm" method="post">
			<table id="cartList">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>답변 여부</th>
				</tr>
				<c:forEach items="${qnaList}" var="qnaVO">
					<tr>
						<td>${qnaVO.qna_sequence}</td>
						<td><a
							href="hfashionmallServlet?command=qna_view&qna_sequence=${qnaVO.qna_sequence}">
								${qnaVO.qna_subject}</a></td>
						<td><fmt:formatDate value="${qnaVO.qna_register}" type="date" /></td>
						<td><c:choose>
								<c:when test="${qnaVO.qna_answer eq 'no'}"> no </c:when>
								<c:when test="${qnaVO.qna_answer eq 'yes'}"> yes </c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>
			<div class="clear"></div>
			<div id="buttons" style="float: right">
				<input type="button" value="1:1 질문하기" class="submit"
					onclick="location.href='hfashionmallServlet?command=qna_write_form'">
				<input type="button" value="쇼핑 계속하기" class="cancel"
					onclick="location.href='hfashionmallServlet?command=index'">
			</div>
		</form>
	</article>
</div>
<%@ include file="../footer.jsp"%>