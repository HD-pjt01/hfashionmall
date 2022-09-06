<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="javascript/index.js"></script>
	<script type="text/javascript" src="member/member.js"></script>
	<script type="text/javascript" src="mypage/mypage.js"></script>
    
	<title>H Fashion Mall</title>
	<head>
    <link href="css/style.css" rel="stylesheet">  
</head> 
</head>

<body>

<!-- 헤더 시작하는 곳 -->
<div class="wrap">
<header id="header">
	<!--로고 들어가는 곳 시작--->
	<h1 class="header-logo"><a href="hfashionmallServlet?command=index"> H FASHION MALL</a></h1>
	<!--로고 들어가는 곳 끝-->
	
	<nav class="top_memnu" id="top_menu">
		<ul>
			<li>
			<a href="hfashionmallServlet?command=catagory&kind=1">매거진</a>
			</li>
			<li>
			<a href="hfashionmallServlet?command=catagory&kind=2">신상품</a>
			</li>
			<li>
			<a href="hfashionmallServlet?command=catagory&kind=3">아울렛</a>
			</li>
			<li>
			<a href="hfashionmallServlet?command=catagory&kind=4">베스트</a>
			</li>
			<li>
			<a href="hfashionmallServlet?command=catagory&kind=5">브랜드</a>
			</li>
			<!-- <ul>
				<li><a href="#">TOMMY HILFIGER</a></li>
				<li><a href="#">DECKE</a></li>
				<li><a href="#">Calvin Klein</a></li>
				<li><a href="#">FILA</a></li>
				<li><a href="#">SJYP</a></li>
			</ul>-->
			<li>
			<a href="hfashionmallServlet?command=catagory&kind=6">카테고리</a>
			</li>
			<!--<ul>
				<li><a href="#">맨투맨</a></li>
				<li><a href="#">가디건</a></li>
				<li><a href="#">니트</a></li>
				<li><a href="#">자켓</a></li>
				<li><a href="#">팬츠</a></li>
			</ul>-->
			<li>
			<a href="hfashionmallServlet?command=catagory&kind=7">이벤트</a>
			</li>
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
              	<li style="color:white">
				${sessionScope.loginUser.member_name}(${sessionScope.loginUser.member_id})
				</li>
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

