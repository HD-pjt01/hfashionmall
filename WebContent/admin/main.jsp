<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/admin/header.jsp"%>
<div id="container">
	<script type="text/javascript">
		function admin_check() {
			if (document.frm.admin_id.value == "") {
				alert("아이디를 입력하세요.");
				return false;
			} else if (document.frm.admin_pw.value == "") {
				alert("비밀번호를 입력하세요.");
				return false;
			}
			return true;
		}
	</script>
		
			<div id="divposition">
				<form name="frm" method="post"
					action="hfashionmallServlet?command=admin_login">
					<table>
						<tr>
							<td width = "50" align = "center">아 이 디</td>
							<td width = "100"><input type="text" name="admin_id" size="10"
								value="admin"></td>
						</tr>
						<tr>
							<td width = "50" align = "center">비밀번호</td>
							<td><input type="password" name="admin_pw" size="10"
								value="admin"></td>
						</tr>
						<tr align="center">
							<td colspan="2"><input class="btn" type="submit"
								value="관리자 로그인" onclick="return admin_check()"><br>
								<br>
								<h4 style="color: red">${message}</h4></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
</body>
</html>