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
<!-- <link href="css/ui.css" rel="stylesheet">
 -->
</head>

<body>

	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap" class="main">
        <div class="skip-nav">
            <a href="#gnb">메뉴 바로가기</a>
            <a href="#container">본문 바로가기</a>
        </div>

        <!-- Header -->


        <header id="header" class="">
            <div class="header-inner">
                <div class="header-wrap">
                    <h1 class="header-logo"><a href="/main">H FASHION MALL</a></h1>

                    <nav class="header-util">
                        <button type="button" class="btn-search" id="btnSearchLayer"><span>검색열기</span></button>
                        <!-- 로그인 전 -->
                        <span><a href="/public/member/login">로그인</a></span>
                        <span><a href="/public/member/addMemberStep1">회원가입</a></span>
                        <!-- //로그인 전 -->
                        <!-- 로그인 후-->
                        <!--로그인 후 -->
                        <span><a href="/secured/mypage/myPage">마이페이지</a></span>
                        <span><a href="/public/cart/list">장바구니</a></span>
                    </nav>

                    <!-- layer -->
                    <div id="layerSimpleGnb" class="layer-pop" tabindex="0">
                        <div class="layer-wrap" tabindex="0">
                            <div class="layer-header">
                                <h2 class="layer-title">H패션몰 간편가입 안내</h2>
                            </div>
                            <div class="layer-container">
                                <div class="layer-content">
                                    <div class="page-info">
                                        <p class="txt-type2">현재 회원님은 H.Point 회원입니다.</p>
                                        <p class="txt-type1">H.Point 통합회원 정보로 H패션몰 회원가입이 가능합니다.<br> 단, H패션몰 가입 확인을 위해
                                            아래의 정보로 조회가 진행됩니다.<br> 동의하시면 회원가입 해주시기 바랍니다.</p>
                                    </div>
                                    <p class="txt-simple-info">조회정보 : 이름, 휴대폰번호, 생년월일, CI</p>

                                    <div class="btn-box">
                                        <button type="button" class="btn-type4-lg"
                                            onclick="layer.close('layerSimpleGnb');"><span>취소</span></button>
                                        <a href="#" onclick="goHpointSimpleJoinGnb();" class="btn-type2-lg"
                                            title="새창으로 열림">간편가입</a>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn-layer-close"
                                onclick="layer.close('layerSimpleGnb');">닫기</button>
                        </div>
                    </div>
                    <!-- //layer -->

                    <!-- layer -->
                    <div id="layerPwGnb" class="layer-pop" tabindex="0">
                        <div class="layer-wrap" tabindex="0">
                            <div class="layer-header">
                                <h2 class="layer-title">H.POINT 통합 멤버십 비밀번호 변경</h2>
                            </div>
                            <div class="layer-container">
                                <div class="layer-content">
                                    <div class="page-info">
                                        <p class="txt-type2">H.Point 통합 멤버십<br> 비밀번호 변경 대상 회원입니다.<br> 비밀번호를 변경해주세요.</p>
                                    </div>

                                    <div class="btn-box">
                                        <button onclick="nextUpdatePasswordGnb();" type="button"
                                            class="btn-type4-lg"><span>다음에 변경</span></button>
                                        <a href="javascript:updatePasswordGnb();" class="btn-type2-lg">비밀번호 변경</a>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn-layer-close"
                                onclick="layer.clsoe('layerPwGnb');">닫기</button>
                        </div>
                    </div>
                    <!-- //layer -->

                    <script>
                        /* hpoint sso URL */
                        var hpoint_sso_url = "https" + '://' + "sso.h-point.co.kr" + ':' + "29865"
                    </script>

                    <script type="text/javascript"
                        src="/hfm_pc/resources/js/hpoint/SsoAjax.js?timestamp=20220907151706"></script>

                    <script>
                        // HPoint SSO 권한 코드
                        SSO_AUTH_CD = "";
                        // HPoint 통합 고객 번호
                        MCUST_NO = "";

                        // HPoint SSO 인증
                        if (SSO_AUTH_CD != "" && MCUST_NO != "") { // 권한코드 및 통합 고객번호가 존재 할 경우 토큰 발급을 요청한다.
                            // console.log('권한코드 및 통합 고객번호가 존재 할 경우 토큰 발급을 요청한다.');
                            gfnReqSSoToknIssuAjax(MCUST_NO, SSO_AUTH_CD);
                        } else {

                            // console.log('비로그인시 SSO 인증을 요청한다.');
                            gfnSsoReqAjax(fnSsoCallback);

                        }

                        //SSO 요청 처리 콜백
                        function fnSsoCallback(data) {
                            if (data.succYn == "Y") {
                                console.log("해당 고객번호(" + data.mcustNo + ")로 자동 로그인 시도");

                                $.ajax({
                                    type: "POST",
                                    url: '/loginProcess',
                                    data: {
                                        '_csrf': '2a3101fa-1c56-4c5f-a325-dd7c7aedb37d',
                                        'loginTarget': '',
                                        'pageMode': 'false',
                                        'unityCstmrNo': data.mcustNo,
                                        'loginFlag': 'sso',
                                    },
                                    async: false,
                                    headers: {
                                        'ajax-login': true
                                    },
                                    success: function (args) {
                                        callbackLoginAfterGnb();
                                    },
                                    error: function (e) {
                                        try {
                                            var text = $.parseJSON(e.responseText);
                                            var failMessage = text.failMessage;
                                            var code = text.code;
                                            if ((failMessage == 'HPOINT_JOIN')) {
                                                // HPoint만 가입하거나 H패션몰 계정과 연결되어 있지않은 회원
                                                MCUST_NO = data.mcustNo;
                                                SSO_AUTH_CD = data.ssoAuthCd;
                                                layer.open('layerSimpleGnb');
                                            } else if (failMessage == '5') {
                                                // H패션몰 계정 잠김
                                                alert('5회 이상 로그인 실패하셨습니다.\n비밀번호 재설정 후 로그인해주시기 바랍니다.');
                                            } else if (failMessage == 'black') {
                                                alert('H패션몰 운영원칙에 어긋나는 활동으로 로그인이 제한되었습니다.');
                                            } else if (failMessage == 'drmncy') {
                                                alert('H패션몰 회원정보가 휴면상태입니다.\nH패션몰 휴면해제후 다시 이용해주세요.');
                                            } else { // 9999 시스템 장애입니다.
                                                alert('시스템 장애입니다.');
                                            }
                                        } catch (e) {
                                            console.log(e);
                                        }
                                    }
                                });
                            }
                        }

                        function callbackLoginAfterGnb() {
                            $.ajax({
                                type: "GET",
                                data: {
                                    '_csrf': '2a3101fa-1c56-4c5f-a325-dd7c7aedb37d'
                                },
                                url: '/public/member/loginAction.json',
                                cache: false,
                                beforeSend: function (request) {
                                    var csrfToken = $("meta[name='_csrf']").attr("content");
                                    var csrfName = $("meta[name='_csrf_header']").attr("content");
                                    request.setRequestHeader(csrfName, csrfToken);
                                },
                                success: function (args) {


                                    if (args.code == 'L004') { // 통합회원 비밀번호 변경 대상자이면
                                        gfnReqSSoToknIssuAjax(MCUST_NO, SSO_AUTH_CD);
                                        layer.open('layerPw');
                                    } else if (args.isChangePw != null && args.isChangePw ==
                                        true) { // H패션몰 비밀번호 변경 대상자이면
                                        window.document.location.href =
                                            '/secured/member/changePassword?regPath=';
                                    } else {
                                        if ('' == '' || '' == 'null') {
                                            window.document.location.href = '';
                                        } else {
                                            window.document.location.href = '/main?regPath=';
                                        }
                                    }
                                },
                                error: function (e) {
                                    chkBtn = true;
                                }
                            });
                        }

                        // 로그아웃
                        function goLogout() {
                            if (confirm("로그아웃 하시겠습니까?")) {
                                alert('안전하게 로그아웃 되었습니다. 이용해 주셔서 감사합니다.');
                                gfnSsoDscdToknReqAjax(dscdCallback);
                            } else {
                                return;
                            }
                        }

                        // 토큰 만료 콜백
                        function dscdCallback(data) {
                            if (data.succYn == "Y") {
                                // console.log("토큰 만료처리");
                            }
                            var url = '/secured/logout';
                            var strParams = null;
                            strParams = {
                                '_csrf': '2a3101fa-1c56-4c5f-a325-dd7c7aedb37d'
                            };
                            linkUrlPost(url, strParams);
                        }

                        // H.Point 간편 가입 요청(통멤 계정만 존재할 때)
                        function goHpointSimpleJoinGnb() {
                            var IF_MB_I024 = "/cu/join/simpJoinStart.nhd"; /* 간편 가입 요청 */
                            var ssl = "https"; /* hpoint 프로토콜 https */
                            var host = "www.h-point.co.kr"; /* hpoint 호스트 */
                            var partnerId = "D080"; /* 참여사 ID */
                            var channelId = "2102"; /* 참여사 채널 ID */
                            var url = ssl + '://' + host + IF_MB_I024 + '?prtnrReqGb=03&prtnrId=' + partnerId +
                                '&chnnlId=' + channelId + '&ssoMcustNo=' + MCUST_NO;
                            window.open(url, '_blank');
                            layer.close('layerSimpleGnb');
                        }

                        // 통합회원 비밀번호 변경 새창
                        function updatePasswordGnb() {
                            var url = ssl + '://' + host + showCustInfo;
                            window.open(url, '_blank');
                            layer.clsoe('layerPwGnb');
                        }

                        // 통합회원 비밀번호 30일 후에 변경 처리
                        function nextUpdatePasswordGnb() {
                            $.ajax({
                                type: "POST",
                                url: "/secured/member/reqHPointPwdLater.json",
                                async: false,
                                success: function (args) {},
                                error: function (e) {
                                    console.log(e.responseText);
                                }
                            });
                            layer.clsoe('layerPwGnb');
                        }
                    </script><!-- 브랜드, 테마관, 아울렛 -->
                    <div class="dp-header">

                        <div class="dp-header-btns">
                            <a href="/main">홈</a>
                            <button type="button" class="btn-menu"><span>전체메뉴</span></button>
                        </div>

                        <h2 class="dp-header-logo">
                        </h2>
                        <!--
                    <h2 class="dp-header-logo"><a href="#"><img src="../resources/images/img_brand_th.png" alt="브랜드명"></a></h2>
                    <h2 class="dp-header-logo"><a href="#">SHOES COLLECTION</a></h2>
                    <h2 class="dp-header-logo"><a href="#">OUTLET</a></h2>
                    -->

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
                                    <input type="text" title="검색어 입력" class="inp-reset" id="reKeyword" name="reKeyword"
                                        autocomplete="off" escapexml="false">
                                    <div class="etc">
                                        <button type="button" class="btn-clear"><span>지우기</span></button>
                                    </div>
                                </div>
                                <button type="button" class="btn-search" id="btnSearch"><span>검색</span></button>
                            </div>
                        </fieldset>
                        <div class="keyword-wrap">
                            <div class="keyword-related" id="autoKeywordList">
                            </div>
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
                                <a href="/main">
                                    <span>
                                        홈</span>
                                </a>
                            </div>
                            <div class="gnb-category " id="gnbContt">
                                <a href="/article/list">
                                    <span>
                                        매거진</span>
                                </a>
                                <div class="depth2">
                                    <div class="depth2-inner menu-type3">
                                        <ul class="depth2-menu">
                                            <li>
                                                <a href="/article/list">
                                                    ALL<span class="menu-sub">한눈에 확인하는
                                                        <br>매거진 소식</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="/article/list?contType=hstyle">
                                                    STYLE<span class="menu-sub">H패션몰이 제안하는
                                                        <br>트렌디한 스타일가이드</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="/article/list?contType=htv">
                                                    H-TV<span class="menu-sub">영상으로 확인하는
                                                        <br>브랜드 스토리</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="/article/list?contType=lookbook">
                                                    LOOKBOOK<span class="menu-sub">브랜드 NEW 시즌
                                                        <br>디자인 테마</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb-category " id="">
                                <a href="/display/newItem">
                                    <span>
                                        신상품</span>
                                </a>
                            </div>
                            <div class="gnb-category " id="gnbOtlt">
                                <a href="/display/otltMain">
                                    <span>
                                        아울렛</span>
                                </a>
                                <div class="depth2">
                                    <ul class="depth2-tab">
                                        <li class="active"><button type="button"><span>브랜드별 보기</span></button></li>
                                        <li><button type="button"><span>카테고리별 보기</span></button></li>
                                    </ul>
                                    <div class="depth2-inner active">
                                        <ul class="depth2-menu">
                                            <li class="depth2-menu-main"><a href="javascript:void(0);"
                                                    onclick="goCategoryLink(this);" tp="OTLT_MAIN">MAIN</a></li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="THBR">TOMMY HILFIGER</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="T1HGR">MEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="T2HGR">WOMEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="T3HGR">TOMMY JEANS</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="T4HGR">KIDS</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="T5HGR">SHOES</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="T6HGR">GOLF</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="DKBR">DKNY</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="DWHGR">WOMEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="DMHGR">MEN</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="CKBR">ck Calvin Klein</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="VWHGR">WOMEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="VMHGR">MEN</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="DEHGR">DECKE</a></li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="RAHGR">rouge＆lounge</a></li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="PVBR">Calvin Klein</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" brndid="VAHGR">Accessories</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="PWHGR">SJYP</a></li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="KPHGR">Kipling</a></li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="TMHGR">Taylormade</a></li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" brndid="TBHGR">Timberland</a></li>
                                        </ul>
                                    </div>
                                    <div class="depth2-inner">
                                        <ul class="depth2-menu">
                                            <li class="depth2-menu-main"><a href="javascript:void(0);"
                                                    onclick="goCategoryLink(this);" tp="OTLT_MAIN">MAIN</a></li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" dspctgryno="HFMA01">남성</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A18">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A01">티셔츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A02">셔츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A03">니트/스웨터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A04">아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A05">팬츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A06">데님</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A07">수트정장</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A08">언더웨어</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A09">가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A10">신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A12">수영복</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A13">악세서리</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA01A14">스포츠웨어</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" dspctgryno="HFMA02">여성</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A17">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A03">니트/스웨터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A01">티셔츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A02">셔츠/블라우스</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A04">아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A05">팬츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A06">데님</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A07">수트정장</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A09">원피스</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A10">스커트</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A11">가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A12">신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A14">수영복</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A15">악세서리</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA02A16">스포츠웨어</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" dspctgryno="HFMA03">키즈</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA03A03">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA03A01">남아</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA03A02">여아</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" dspctgryno="HFMA04">가방/액세서리</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A10">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A08">모자</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A01">여성신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A02">여성가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A03">여성패션잡화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A04">남성신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A05">남성가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A06">남성패션잡화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA04A07">키즈패션잡화</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" dspctgryno="HFMA05">#골프</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A01">남성 아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A02">남성 상의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A03">남성 하의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A04">남성 골프화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A05">여성 아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A06">여성 상의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A07">여성 하의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A08">여성 골프화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A09">골프 악세서리</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA05A10">골프 가방</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="OTLT_LIST" dspctgryno="HFMA06">#TOMMY EXCLUSIVE</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA06A03">상의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA06A04">하의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA06A07">신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA06A05">액세서리/언더웨어</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="OTLT_LIST" dspctgryno="HFMA06A06">플러스 사이즈</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb-category " id="">
                                <a href="/display/best">
                                    <span>
                                        베스트</span>
                                </a>
                            </div>
                            <div class="gnb-category " id="gnbBrnd">
                                <a href="#">
                                    <span>
                                        브랜드</span>
                                </a>
                                <div class="depth2">
                                    <div class="depth2-inner">
                                        <ul class="depth2-menu">
                                            <!-- 카테고리 depth : 1, 자사 브랜드 여부 : Y -->
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA08">TOMMY HILFIGER</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA08A01">MEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA08A02">WOMEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA08A03">TOMMY JEANS</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA08A04">KIDS</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA08A05">SHOES</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA08A09">GOLF</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA09">DKNY</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA09A01">WOMEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA09A02">MEN</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA07">ck Calvin Klein</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA07A04">WOMEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA07A05">MEN</a></li>
                                                </ul>
                                            </li>
                                            <!-- 카테고리 depth : 2, 자사 브랜드 여부 : Y -->
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A04">DECKE</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A01">rouge＆lounge</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A02">SJYP</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <!-- 카테고리 depth : 1, 자사 브랜드 여부 : N -->
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA43">BENSIMON</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA43A01">BENSIMON</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA43A02">SHOES</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA24">Calvin Klein</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA24A01">Jeans</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA24A02">Underwear</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA24A03">Accessories</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA33">athe vanessabruno</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA33A01">athe</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA30">JILL STUART NEW YORK</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA30A01">WOMEN</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="BRND_MAIN" brndctgryno="BDMA30A03">JSNY</a></li>
                                                </ul>
                                            </li>
                                            <!-- 카테고리 depth : 2, 자사 브랜드 여부 : N -->
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A21">allegri</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A34">American Needle</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A19">ARENA</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A32">BOSS</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A18">DESCENTE</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A31">Ferraro Milano</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A09">FILA</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A12">GUESS</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A23">Havaianas</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A25">HUGO</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A26">Kipling</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A29">Laulhere</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A27">Le Minor</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A33">LORNA MURRAY</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A28">MARTINE GOLF</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A30">SKECHERS</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A22">Taylormade</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A20">Timberland</a>
                                                <ul>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                    tp="BRND_MAIN" brndctgryno="BDMA21A24">vanessabruno</a>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb-category " id="gnbCtgry">
                                <a href="#">
                                    <span>
                                        카테고리</span>
                                </a>
                                <div class="depth2">
                                    <div class="depth2-inner">
                                        <ul class="depth2-menu">
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);" tp="CTGRY"
                                                    dspctgryno="HFMA01">남성</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A18">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A01">티셔츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A02">셔츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A03">니트/스웨터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A04">아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A05">팬츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A06">데님</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A07">수트정장</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A08">언더웨어</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A09">가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A10">신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A12">수영복</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A13">악세서리</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA01A14">스포츠웨어</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);" tp="CTGRY"
                                                    dspctgryno="HFMA02">여성</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A17">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A03">니트/스웨터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A01">티셔츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A02">셔츠/블라우스</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A04">아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A05">팬츠</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A06">데님</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A07">수트정장</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A08">언더웨어</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A09">원피스</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A10">스커트</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A11">가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A12">신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A14">수영복</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A15">악세서리</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA02A16">스포츠웨어</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);" tp="CTGRY"
                                                    dspctgryno="HFMA03">키즈</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA03A03">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA03A01">남아</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA03A02">여아</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);" tp="CTGRY"
                                                    dspctgryno="HFMA04">가방/액세서리</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A10">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A08">모자</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A01">여성신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A02">여성가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A03">여성패션잡화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A04">남성신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A05">남성가방</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A06">남성패션잡화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA04A07">키즈패션잡화</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);" tp="CTGRY"
                                                    dspctgryno="HFMA05">#골프</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A11">EXCLUSIVE</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A01">남성 아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A02">남성 상의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A03">남성 하의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A04">남성 골프화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A05">여성 아우터</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A06">여성 상의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A07">여성 하의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A08">여성 골프화</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A09">골프 악세서리</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA05A10">골프 가방</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:void(0);" onclick="goCategoryLink(this);" tp="CTGRY"
                                                    dspctgryno="HFMA06">#TOMMY EXCLUSIVE</a>
                                                <ul>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA06A03">상의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA06A04">하의</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA06A07">신발</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA06A05">액세서리/언더웨어</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA06A06">플러스 사이즈</a></li>
                                                    <li><a href="javascript:void(0);" onclick="goCategoryLink(this);"
                                                            tp="CTGRY" dspctgryno="HFMA06A08">원피스</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb-category " id="">
                                <a href="/special/list">
                                    <span>
                                        기획전</span>
                                </a>
                            </div>
                            <div class="gnb-category " id="">
                                <a href="/event/list">
                                    <span>
                                        이벤트</span>
                                </a>
                            </div>
                            <div class="gnb-category " id="">
                                <a href="/display/HLive">
                                    <span>
                                        라이브</span>
                                </a>
                            </div>
                            <div class="gnb-category " id="">
                                <a href="/review/reviewList">
                                    <span>
                                        리뷰플러스</span>
                                </a>
                            </div>
                        </div>

                        <ul class="gnb-etc">
                            <li>
                                <a href="/display/thema?thmCtgryNo=THMA06A13">
                                    TJX나연</a>
                            </li>
                            <li>
                                <a href="/display/thema?thmCtgryNo=THMA06A04">
                                    H SHOP</a>
                            </li>
                        </ul>
                    </div>

                </nav>
            </div>
</body>
