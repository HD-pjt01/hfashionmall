<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
	function go_search() {
		document.frm.action = "Servlet?command=admin_member_list";
		document.frm.submit();
	}
</script>

<article>
	<h1>회원리스트</h1>
	<form name="frm" method="post">
		<table style="float: right;">
			<tr>
				<td>회원 이름 <input type="text" name="key"> <input
					class="btn" type="button" value="검색" onclick="go_search()">
				</td>
			</tr>
		</table>
		<br>
		<table id="orderList">
			<tr>
				<th>아디디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화</th>
				<th>가입일</th>
			</tr>
			<c:forEach items="${memberList}" var="memberVO">
				<tr>
					<td>${memberVO.member_id}
						<%-- <c:choose>
							<c:when test='${memberVO.member_id !=""}'>
								<input type="checkbox" name="member_id" disabled="disabled">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="member_id" checked="checked"
									disabled="disabled">
							</c:otherwise>
						</c:choose>
						--%>
					</td>
					<td>${memberVO.member_name}</td>
					<td>${memberVO.member_email}</td>
					<td>${memberVO.member_phone}</td>
					<td><fmt:formatDate value="${memberVO.member_register}" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</article>
<%@ include file="../../footer.jsp"%>
</body>
</html>