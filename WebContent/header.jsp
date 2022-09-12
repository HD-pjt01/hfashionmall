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
<script type="text/javascript" src="javascript/join.js"></script>


<title>H Fashion Mall</title>

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script type="text/javascript" src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<link href="css/style.css" rel="stylesheet">
<link href="css/join.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
 

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
							<li><a href="hfashionmallServlet?command=brand&case=tommy">TOMMY HILFIGER</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=dkny">DKNY</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=ck">Calvin Klein</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=fila">FILA</a></li>
							<li><a href="hfashionmallServlet?command=brand&case=sjyp">SJYP</a></li>
						</ul>
					</li>

					<li><a href="#">카테고리</a>
					<ul>
						<li><a href="hfashionmallServlet?command=catagory&case=outer">아우터</a></li>
						<li><a href="hfashionmallServlet?command=catagory&case=pants">팬츠</a></li>
						<li><a href="hfashionmallServlet?command=catagory&case=mtm">맨투맨</a></li>
						<li><a href="hfashionmallServlet?command=catagory&case=hat">모자</a></li>
						<li><a href="hfashionmallServlet?command=catagory&case=bag">가방</a></li>
					</ul>
					</li>
					<li><a href="hfashionmallServlet?command=event">이벤트</a></li>
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
