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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	<title>H Fashion Mall</title>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="css/ui.min.css">
	<!-- javascript mingyu -->
	<script type="text/javascript" src="javascript/libs/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="javascript/libs/jquery-ui.min.js"></script>
	<script type="text/javascript" src="javascript/libs/jquery.nicescroll.min.js"></script>
	<script type="text/javascript" src="javascript/libs/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="javascript/libs/imagesloaded.pkgd.min.js"></script>
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
	
	<style>

            #divposition{
                position : absolute;
                top : 50%;
                left :50%;
                transform:translate(-50%,-50%);
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
							<button type="button" class="btn-search" id="btnSearchLayer" onclick="location.href='hfashionmallServlet?command=search'">
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
									<span><a href="hfashionmallServlet?command=qna_list">QnA</a></span>
								</c:otherwise>
							</c:choose>
						<span><a href="hfashionmallServlet?command=qna">QNA test</a></span>
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

				<!-- gnb -->
				<nav id="gnb">

					<div class="header-wrap">
						<div class="gnb-menu">
							<div class="gnb-category home" id="">
								<a href="hfashionmallServlet?command=index"> <span> 홈</span>
								</a>
							</div>
							<div class="gnb-category " id="gnbContt">
								<a href="/article/list"> <span> 매거진</span>
								</a>
								<div class="depth2">
									<div class="depth2-inner menu-type3">
										<ul class="depth2-menu">
											<li><a href="/article/list"> ALL<span
													class="menu-sub">한눈에 확인하는 <br>매거진 소식
												</span>
											</a></li>
											<li><a href="/article/list?contType=hstyle"> STYLE<span
													class="menu-sub">H패션몰이 제안하는 <br>트렌디한 스타일가이드
												</span>
											</a></li>
											<li><a href="/article/list?contType=htv"> H-TV<span
													class="menu-sub">영상으로 확인하는 <br>브랜드 스토리
												</span>
											</a></li>
											<li><a href="/article/list?contType=lookbook">
													LOOKBOOK<span class="menu-sub">브랜드 NEW 시즌 <br>디자인
														테마
												</span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="gnb-category " id="">
								<a href="/display/newItem"> <span> 신상품</span>
								</a>
							</div>
							<div class="gnb-category " id="gnbOtlt">
								<a href="/display/otltMain"> <span> 아울렛</span>
								</a>
								<div class="depth2">
									<ul class="depth2-tab">
										<li class="active"><button type="button">
												<span>브랜드별 보기</span>
											</button></li>
										<li><button type="button">
												<span>카테고리별 보기</span>
											</button></li>
									</ul>
									<div class="depth2-inner active">
										<ul class="depth2-menu">
											<li class="depth2-menu-main"><a
												href="javascript:void(0);" onclick="goCategoryLink(this);"
												tp="OTLT_MAIN">MAIN</a></li>
											<li><a href="hfashionmallServlet?command=brand&case=tommy"
												onclick="goCategoryLink(this);" tp="OTLT_LIST" brndid="THBR">TOMMY
													HILFIGER</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="T1HGR">MEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="T2HGR">WOMEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="T3HGR">TOMMY JEANS</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="T4HGR">KIDS</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="T5HGR">SHOES</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="T6HGR">GOLF</a></li>
												</ul></li>
											<li><a href="hfashionmallServlet?command=brand&case=dkny"
												onclick="goCategoryLink(this);" tp="OTLT_LIST" brndid="DKBR">DKNY</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="DWHGR">WOMEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="DMHGR">MEN</a></li>
												</ul></li>
											<li><a href="hfashionmallServlet?command=brand&case=ck"
												onclick="goCategoryLink(this);" tp="OTLT_LIST" brndid="CKBR">ck
													Calvin Klein</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="VWHGR">WOMEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="VMHGR">MEN</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												brndid="DEHGR">DECKE</a></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												brndid="RAHGR">rouge＆lounge</a></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST" brndid="PVBR">Calvin
													Klein</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														brndid="VAHGR">Accessories</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												brndid="PWHGR">SJYP</a></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												brndid="KPHGR">Kipling</a></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												brndid="TMHGR">Taylormade</a></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												brndid="TBHGR">Timberland</a></li>
										</ul>
									</div>
									<div class="depth2-inner">
										<ul class="depth2-menu">
											<li class="depth2-menu-main"><a
												href="javascript:void(0);" onclick="goCategoryLink(this);"
												tp="OTLT_MAIN">MAIN</a></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												dspctgryno="HFMA01">남성</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A18">EXCLUSIVE</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A01">티셔츠</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A02">셔츠</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A03">니트/스웨터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A04">아우터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A05">팬츠</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A06">데님</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A07">수트정장</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A08">언더웨어</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A09">가방</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A10">신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A12">수영복</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A13">악세서리</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA01A14">스포츠웨어</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												dspctgryno="HFMA02">여성</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A17">EXCLUSIVE</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A03">니트/스웨터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A01">티셔츠</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A02">셔츠/블라우스</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A04">아우터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A05">팬츠</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A06">데님</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A07">수트정장</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A09">원피스</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A10">스커트</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A11">가방</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A12">신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A14">수영복</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A15">악세서리</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA02A16">스포츠웨어</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												dspctgryno="HFMA03">키즈</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA03A03">EXCLUSIVE</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA03A01">남아</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA03A02">여아</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												dspctgryno="HFMA04">가방/액세서리</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A10">EXCLUSIVE</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A08">모자</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A01">여성신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A02">여성가방</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A03">여성패션잡화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A04">남성신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A05">남성가방</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A06">남성패션잡화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA04A07">키즈패션잡화</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												dspctgryno="HFMA05">#골프</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A01">남성 아우터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A02">남성 상의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A03">남성 하의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A04">남성 골프화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A05">여성 아우터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A06">여성 상의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A07">여성 하의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A08">여성 골프화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A09">골프 악세서리</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA05A10">골프 가방</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="OTLT_LIST"
												dspctgryno="HFMA06">#TOMMY EXCLUSIVE</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA06A03">상의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA06A04">하의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA06A07">신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA06A05">액세서리/언더웨어</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="OTLT_LIST"
														dspctgryno="HFMA06A06">플러스 사이즈</a></li>
												</ul></li>
										</ul>
									</div>
								</div>
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
											<li><a href="hfashionmallServlet?command=brand&case=tommy"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA08">TOMMY HILFIGER</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA08A01">MEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA08A02">WOMEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA08A03">TOMMY JEANS</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA08A04">KIDS</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA08A05">SHOES</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA08A09">GOLF</a></li>
												</ul></li>
											<li><a href="hfashionmallServlet?command=brand&case=dkny"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA09">DKNY</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA09A01">WOMEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA09A02">MEN</a></li>
												</ul></li>
											<li><a href="hfashionmallServlet?command=brand&case=ck"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA07">ck Calvin Klein</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA07A04">WOMEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA07A05">MEN</a></li>
												</ul></li>
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
											<li><a href="hfashionmallServlet?command=brand&case=sjyp"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA21A02">SJYP</a>
												<ul>
												</ul></li>
											<!-- 카테고리 depth : 1, 자사 브랜드 여부 : N -->
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA43">BENSIMON</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA43A01">BENSIMON</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA43A02">SHOES</a></li>
												</ul></li>
											<li><a href="hfashionmallServlet?command=brand&case=ck"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA24">Calvin Klein</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA24A01">Jeans</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA24A02">Underwear</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA24A03">Accessories</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA33">athe vanessabruno</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA33A01">athe</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="BRND_MAIN"
												brndctgryno="BDMA30">JILL STUART NEW YORK</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA30A01">WOMEN</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="BRND_MAIN"
														brndctgryno="BDMA30A03">JSNY</a></li>
												</ul></li>
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
											<li><a href="hfashionmallServlet?command=brand&case=fila"
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
													<li><a href="hfashionmallServlet?command=catagory&case=아우터"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA01A04">아우터</a></li>
													<li><a href="hfashionmallServlet?command=catagory&case=팬츠"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA01A05">팬츠</a></li>
													<li><a href="hfashionmallServlet?command=catagory&case=맨투맨"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA01A06">맨투맨</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA01A07">수트정장</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA01A08">언더웨어</a></li>
													<li><a href="hfashionmallServlet?command=catagory&case=가방"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA01A09">가방</a></li>
													<li><a href="hfashionmallServlet?command=catagory&case=모자"
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
													<li><a href="hfashionmallServlet?command=catagory&case=bag"
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
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="CTGRY"
												dspctgryno="HFMA03">키즈</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA03A03">EXCLUSIVE</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA03A01">남아</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA03A02">여아</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="CTGRY"
												dspctgryno="HFMA04">가방/액세서리</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A10">EXCLUSIVE</a></li>
													<li><a href="hfashionmallServlet?command=catagory&case=hat"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A08">모자</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A01">여성신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A02">여성가방</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A03">여성패션잡화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A04">남성신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A05">남성가방</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A06">남성패션잡화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA04A07">키즈패션잡화</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="CTGRY"
												dspctgryno="HFMA05">#골프</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A11">EXCLUSIVE</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A01">남성 아우터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A02">남성 상의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A03">남성 하의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A04">남성 골프화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A05">여성 아우터</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A06">여성 상의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A07">여성 하의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A08">여성 골프화</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A09">골프 악세서리</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA05A10">골프 가방</a></li>
												</ul></li>
											<li><a href="javascript:void(0);"
												onclick="goCategoryLink(this);" tp="CTGRY"
												dspctgryno="HFMA06">#TOMMY EXCLUSIVE</a>
												<ul>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA06A03">상의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA06A04">하의</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA06A07">신발</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA06A05">액세서리/언더웨어</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA06A06">플러스 사이즈</a></li>
													<li><a href="javascript:void(0);"
														onclick="goCategoryLink(this);" tp="CTGRY"
														dspctgryno="HFMA06A08">원피스</a></li>
												</ul></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="gnb-category " id="">
								<a href="/special/list"> <span> 기획전</span>
								</a>
							</div>
							<div class="gnb-category " id="">
								<a href="hfashionmallServlet?command=event"> <span> 이벤트</span>
								</a>
							</div>
							<div class="gnb-category " id="">
								<a href="/display/HLive"> <span> 라이브</span>
								</a>
							</div>
							<div class="gnb-category " id="">
								<a href="/review/reviewList"> <span> 리뷰플러스</span>
								</a>
							</div>
						</div>

						<ul class="gnb-etc">
							<li><a href="/display/thema?thmCtgryNo=THMA06A13"> TJX나연</a>
							</li>
							<li><a href="/display/thema?thmCtgryNo=THMA06A04"> H
									SHOP</a></li>
						</ul>
					</div>

				</nav>
			</div>
		</header>
