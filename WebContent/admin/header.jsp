<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H FASHIONMALL 관리자 모드</title>
<link rel="stylesheet" href="admin/css/admin.css">
<script type="text/javascript" src="admin/product/product.js"></script>
<c:choose>
	<c:when test="${empty admin_id}">
		<script type="text/javascript">
			location.href = 'hfashionmallServlet?command=admin_login_form';
		</script>
	</c:when>
</c:choose>
</head>

<body onload="go_ab()">
	<div id="wrap">
		<header>
			<input class="btn" type="button" value="logout" style="float: right;"
				onClick="location.href='hfashionmallServlet?command=admin_logout'">
		</header>
		<div class="clear"></div>
		
