<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<head>
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


<title>H Fashion Mall</title>
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

<style>
#divposition {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>

</head>


<body oncontextmenu="return false" ondragstart="return false">
	<div class="skip-nav">
		<a href="#gnb">메뉴 바로가기</a> <a href="#container">본문 바로가기</a>
	</div>

	<!-- Header -->


	<header id="header" class="">
		<div class="header-inner">
			<div class="header-wrap">
				<h1 class="header-logo">
					<a href="hfashionmallServlet?command=index">H FASHION MALL</a>
				</h1>
				<!-- 9월 13일 화요일 수정사항 -->

				<nav class="header-util">
					<button type="button" class="btn-search" id="btnSearchLayer"
						onclick="location.href='hfashionmallServlet?command=search'">
						<span>검색열기</span>
					</button>
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<!-- 로그인 전 -->
							<span><a href="hfashionmallServlet?command=login_form">로그인</a></span>
							<span><a href="hfashionmallServlet?command=contract">회원가입</a></span>
						</c:when>
						<c:otherwise>
							<span style="color: white">${sessionScope.loginUser.member_name}(${sessionScope.loginUser.member_id})</span>
							<span><a href="hfashionmallServlet?command=logout">로그아웃</a></span>
							<!-- <span><a href="hfashionmallServlet?command=qna_list">QnA</a></span> -->
							<span><a href="hfashionmallServlet?command=qna">QNA</a></span>
						</c:otherwise>
					</c:choose>
					<span><a href="hfashionmallServlet?command=mypage">마이페이지</a></span>
					<span><a href="hfashionmallServlet?command=cart_list">장바구니</a></span>
				</nav>


				<!-- 브랜드, 테마관, 아울렛 -->
				<div class="dp-header">

					<div class="dp-header-btns">
						<a href="/main">홈</a>
						<button type="button" class="btn-menu">
							<span>전체메뉴</span>
						</button>
					</div>

					<h2 class="dp-header-logo"></h2>


				</div>
				<!-- //브랜드, 테마관, 아울렛 -->
			</div>

			<!-- 검색 -->
			<div id="headerSearch" class="header-search">
				<div class="inner">
					<fieldset>
						<legend>검색</legend>
						<div class="search-field" id="searchField">
							<div class="input-box">
								<input type="text" title="검색어 입력" class="inp-reset"
									id="reKeyword" name="reKeyword" autocomplete="off"
									escapexml="false">
								<div class="etc">
									<button type="button" class="btn-clear">
										<span>지우기</span>
									</button>
								</div>
							</div>
							<button type="button" class="btn-search" id="btnSearch">
								<span>검색</span>
							</button>
						</div>
					</fieldset>
					<div class="keyword-wrap">
						<div class="keyword-related" id="autoKeywordList"></div>
						<div class="keyword-list-wrap">
							<!-- 최근검색어 -->
							<section class="keyword-recent" id="resentKeywordList">
							</section>
							<!-- hot keyword -->
							<section class="keyword-hot">
								<h2 class="title">인기검색어</h2>
								<ul class="list" id="hotKeywordList">
								</ul>
							</section>
						</div>
					</div>
				</div>
				<button type="button" class="btn-close">닫기</button>
			</div>

			<nav id="gnb">

				<div class="header-wrap">
					<div class="gnb-menu">
						<div class="gnb-category home" id="">
							<a href="hfashionmallServlet?command=index"> <span> 홈</span>
							</a>
						</div>

						<div class="gnb-category " id="">
							<a href="/display/newItem"> <span> 신상품</span>
							</a>
						</div>

						<div class="gnb-category " id="">
							<a href="/display/best"> <span> 베스트</span>
							</a>
						</div>
						<div class="gnb-category " id="gnbBrnd">
							<a href="#"> <span> 브랜드</span>
							</a>
							<div class="depth2">
								<div class="depth2-inner">
									<ul class="depth2-menu">
										<!-- 카테고리 depth : 1, 자사 브랜드 여부 : Y -->
										<li><a
											href="hfashionmallServlet?command=brand&case=Tommy%20Hilfiger"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA08"">TOMMY HILFIGER</a></li>
										<li><a href="hfashionmallServlet?command=brand&case=DKNY"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA09">DKNY</a></li>
										<li><a href="hfashionmallServlet?command=brand&case=Calvin%20Klein"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA07">ck Calvin Klein</a></li>
										<!-- 카테고리 depth : 2, 자사 브랜드 여부 : Y -->
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A04">DECKE</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A01">rouge＆lounge</a>
											<ul>
											</ul></li>
										<li><a href="hfashionmallServlet?command=brand&case=SJYP"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A02">SJYP</a>
											<ul>
											</ul></li>
										<!-- 카테고리 depth : 1, 자사 브랜드 여부 : N -->
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA43">BENSIMON</a></li>
										<li><a href="hfashionmallServlet?command=brand&case=ck"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA24">Calvin Klein</a></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA33">athe vanessabruno</a></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA30">JILL STUART NEW YORK</a></li>
										<!-- 카테고리 depth : 2, 자사 브랜드 여부 : N -->
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A21">allegri</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A34">American Needle</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A19">ARENA</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A32">BOSS</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A18">DESCENTE</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A31">Ferraro Milano</a>
											<ul>
											</ul></li>
										<li><a href="hfashionmallServlet?command=brand&case=FILA"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A09">FILA</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A12">GUESS</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A23">Havaianas</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A25">HUGO</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A26">Kipling</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A29">Laulhere</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A27">Le Minor</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A33">LORNA MURRAY</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A28">MARTINE GOLF</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A30">SKECHERS</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A22">Taylormade</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A20">Timberland</a>
											<ul>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="BRND_MAIN"
											brndctgryno="BDMA21A24">vanessabruno</a>
											<ul>
											</ul></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="gnb-category " id="gnbCtgry">
							<a href="#"> <span> 카테고리</span>
							</a>
							<div class="depth2">
								<div class="depth2-inner">
									<ul class="depth2-menu">
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="CTGRY"
											dspctgryno="HFMA01">남성</a>
											<ul>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A18">EXCLUSIVE</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A01">티셔츠</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A02">셔츠</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A03">니트/스웨터</a></li>
												<li><a
													href="hfashionmallServlet?command=catagory&case=아우터"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A04">아우터</a></li>
												<li><a
													href="hfashionmallServlet?command=catagory&case=팬츠"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A05">팬츠</a></li>
												<li><a
													href="hfashionmallServlet?command=catagory&case=맨투맨"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A06">맨투맨</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A07">수트정장</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A08">언더웨어</a></li>
												<li><a
													href="hfashionmallServlet?command=catagory&case=가방"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A09">가방</a></li>
												<li><a
													href="hfashionmallServlet?command=catagory&case=모자"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A10">모자</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A12">수영복</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A13">악세서리</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA01A14">스포츠웨어</a></li>
											</ul></li>
										<li><a href="javascript:void(0);"
											onclick="goCategoryLink(this);" tp="CTGRY"
											dspctgryno="HFMA02">여성</a>
											<ul>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A17">EXCLUSIVE</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A03">니트/스웨터</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A01">티셔츠</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A02">셔츠/블라우스</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A04">아우터</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A05">팬츠</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A06">데님</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A07">수트정장</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A08">언더웨어</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A09">원피스</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A10">스커트</a></li>
												<li><a
													href="hfashionmallServlet?command=catagory&case=bag"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A11">가방</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A12">신발</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A14">수영복</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A15">악세서리</a></li>
												<li><a href="javascript:void(0);"
													onclick="goCategoryLink(this);" tp="CTGRY"
													dspctgryno="HFMA02A16">스포츠웨어</a></li>
											</ul></li>
									</ul>
								</div>
							</div>
						</div>


					</div>


				</div>

			</nav>
		</div>

	</header>