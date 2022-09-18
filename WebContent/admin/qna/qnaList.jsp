<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
	function go_view(qna_sequence) {
		var theForm = document.frm;
		theForm.qna_sequence.value = qna_sequence;
		theForm.action = "hfashionmallServlet?command=admin_qna_detail";
		theForm.submit();
	}
</script>

<article>
	<h1>QnA 게시글 리스트</h1>
	<form name="frm" method="post">
		<input type="hidden" name="qna_sequence">
		<table id="orderList">
			<tr>
				<th>번호(답변여부)</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${qnaList}" var="qnaVO">
				<tr>
					<td>${qnaVO.qna_sequence} <c:choose>
							<c:when test='${qnaVO.qna_answer=="no"}'>(미처리)</c:when>
							<c:otherwise>(답변처리완료)</c:otherwise>
						</c:choose>
					</td>
					<td><a href="#"
						onClick="javascript:go_view('${qnaVO.qna_sequence}')">
							${qnaVO.qna_subject} </a></td>
					<td>${qnaVO.member_member_id}</td>
					<td><fmt:formatDate value="${qnaVO.qna_register}" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</article>
<%@ include file="../../footer.jsp"%>
