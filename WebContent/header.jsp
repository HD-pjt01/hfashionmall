<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="javascript/index.js"></script>
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="mypage/mypage.js"></script>

<title>H Fashion Mall</title>

<link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
<link rel="manifest" href="favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.cdom/swiper/swiper-bundle.min.css" />
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="javascript/ui.js"></script>
<link rel="stylesheet" type="text/css" href="css/ui.min.css">
<link href="css/style.css" rel="stylesheet">
<!-- <link href="css/ui.css" rel="stylesheet">
 -->
</head>

<body>

	<!-- 헤더 시작하는 곳 -->
	<div class="wrap">
		<header id="header">
			<!--로고 들어가는 곳 시작--->
			<h1 class="header-logo">
				<a href="hfashionmallServlet?command=index"> H FASHION MALL</a>
			</h1>
			<!--로고 들어가는 곳 끝-->

			<nav class="top_memnu" id="top_menu">
				<ul>
					<!-- <li><a href="hfashionmallServlet?command=catagory&kind=1">매거진</a></li>-->
					<li><a href="#">매거진</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">아울렛</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="#">브랜드</a>
						<ul>
							<li><a href="hfashionmallServlet?command=brand&case=th">TOMMY HILFIGER</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=decke">DECKE</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=ck">Calvin Klein</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=fila">FILA</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=sjyp">SJYP</a></li>
						</ul>
					</li>

					<li><a href="#">카테고리</a>
					<ul>
						<li><a href="hfashionmallServlet?command=catagory&mtm">맨투맨</a></li>
						<li><a href="#">가디건</a></li>
						<li><a href="#">니트</a></li>
						<li><a href="#">자켓</a></li>
						<li><a href="#">팬츠</a></li>
					</ul>
					</li>
					<li><a href="#">이벤트</a></li>
				</ul>
			</nav>

			<nav class="category_menu" id="catagory_menu">
				<ul>
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<li><a href="hfashionmallServlet?command=login_form">로그인</a></li>
							<li><a href="hfashionmallServlet?command=contract">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li style="color: white">${sessionScope.loginUser.member_name}(${sessionScope.loginUser.member_id})</li>
							<li><a href="hfashionmallServlet?command=logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="hfashionmallServlet?command=mypage">마이페이지</a></li>
					<li><a href="hfashionmallServlet?command=cart_list">장바구니</a></li>
				</ul>
			</nav>

			<div class="clear"></div>
		</header>
	</div>
