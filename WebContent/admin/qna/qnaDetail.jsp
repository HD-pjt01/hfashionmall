<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
	function go_list() {
		var theForm = document.frm;
		theForm.action = "hfashionmallServlet?command=admin_qna_list";
		theForm.submit();
	}

	function go_answer(qna_sequence) {
		var theForm = document.frm;
		theForm.qna_sequence.value = qna_sequence;
		theForm.action = "hfashionmallServlet?command=admin_qna_repsave";
		theForm.submit();
	}
</script>
<article>
	<h1>QnA 게시판</h1>
	<form name="frm" method="post">
		<input type="hidden" name="qna_sequence">
		<table id="orderList">
			<tr>
				<th width="20%">제목</th>
				<td>${qnaVO.qna_subject}${qnaVO.qna_subject}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${qnaVO.qna_register}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${qnaVO.qna_content}</td>
			</tr>
		</table>
		<c:choose>
			<c:when test='${qnaVO.qna_answer=="no"}'>
				<table id="orderList">
					<tr>
						<td colspan="2"><img src="admin/images/opinionimg01.gif">
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="qna_answer" rows="10" id="accpCntn"
								cols="30"></textarea> 
								<input type="button" class="btn"
							value="저장" onClick="go_answer('${qnaVO.qna_sequence}')"></td>
					</tr>
				</table>
				<br>
			</c:when>
			<c:otherwise>
				<table id="orderList">
					<tr>
						<th>댓글</th>
						<td style="text-align: left;">${qnaVO.qna_answer}</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
		<input type="button" class="btn" value="목록" onClick="go_list()">
	</form>
</article>
<%@ include file="../../footer.jsp"%>
</body>
</html>