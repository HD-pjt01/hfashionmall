<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>H FASHIONMALL 관리자 모드</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- favicon 적용 -->
<link rel="apple-touch-icon" sizes="57x57"
	href="favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/favicon-16x16.png">
<link rel="manifest" href="favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!-- favicon 끝 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="css/ui.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<link rel="stylesheet" type="text/css" href="css/product.css">
<!-- javascript mingyu -->
<script type="text/javascript" src="javascript/libs/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="javascript/libs/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="javascript/libs/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="javascript/libs/masonry.pkgd.min.js"></script>
<script type="text/javascript"
	src="javascript/libs/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="javascript/libs/swiper.min.js"></script>
<script type="text/javascript" src="javascript/libs/slick.min.js"></script>
<script type="text/javascript" src="javascript/libs/jquery.form.min.js"></script>
<script type="text/javascript" src="javascript/slide.js"></script>
<script type="text/javascript" src="javascript/ui.js"></script>
<script type="text/javascript" src="javascript/common.js"></script>
<!-- javascript seungha -->
<script type="text/javascript" src="javascript/index.js"></script>
<script type="text/javascript" src="javascript/join.js"></script>
<script type="text/javascript" src="javascript/product.js"></script>
<script type="text/javascript" src="javascript/mypage.js"></script>
<script type="text/javascript" src="admin/product/product.js"></script>
</head>
<link rel="stylesheet" href="admin/css/admin.css">
<%--<c:choose>
	<c:when test="${empty admin_id}">
		<script type="text/javascript">
			location.href = 'hfashionmallServlet?command=admin_login_form';
		</script>
	</c:when>
</c:choose>--%>
<body oncontextmenu="return false" ondragstart="return false"
	onload="go_ab()">
	<header id="header" class="">
		<div class="header-inner">
			<div class="header-wrap">
				<h1 class="header-logo">
					<a href="hfashionmallServlet?command=index">H FASHION MALL</a>
				</h1>
				<nav class="header-util">
					<span><a href="hfashionmallServlet?command=admin_logout">로그아웃</a></span>
				</nav>
			</div>
		</div>
	</header>