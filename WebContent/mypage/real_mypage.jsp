<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<body>
    <div class="wrap">
        <div id="container">
            <section class="content-wrap">
                <div class="snb-wrap">
                    <h2 class="lnb-title">
                        <a href="hfashionmallServlet?command=mypage">MYPAGE</a>
                    </h2>
                    <nav id="lnb" class="lnb">
                        <ul>
                            <li>
                                <div class="menu-depth1">주문 조회</div>
                                <ul class="menu-depth2">
                                    <li><a href="hfashionmallServlet?command=mypage">주문 완료 주문 조회</a></li>
                                    <li><a href="hfashionmallServlet?command=order_all">배송 완료 주문 조회</a></li>
                                    <li><a href="hfashionmallServlet?command=cart_list">장바구니 내역</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="menu-depth1">리뷰 관리</div>
                                <ul class="menu-depth2">
                                    <li><a href="hfashionmallServlet?command=mypage_review">리뷰 쓰기</a></li>
                                    <li><a href="hfashionmallServlet?command=review_list">나의 상품리뷰</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="menu-depth1">회원정보</div>
                                <ul class="menu-depth2">
                                    <li><a href="/secured/mypage/updateMember">회원정보 수정</a></li>

                                    <li><a href="/secured/mypage/memberSecession">회원 탈퇴</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="snb-content-wrap">
                    <!-- 환영합니다 창 -->
                    <div id="mypage_summ">
                        <ul id="mypage_summ_ul">
                            <li id="summ_first">
                                <div class="top">
                                    <span id="name" class="bold">${sessionScope.loginUser.member_name}</span> <span
                                        id="name_top" class="text">님</span>
                                </div>
                                <div class="bottom">
                                    <span id="name_bottom" class="text">환영합니다.</span>
                                </div>
                            </li>
                            <li id="summ_last">
                                <div class="top">
                                    <span id="del_top" class="text">배송중인 주문</span>
                                </div>
                                <div class="bottom">
                                    <!-- 진행중인 주문 리스트와 개수 -->
                                    <span id="del" class="bold"><a href="#">${fn:length(orderList)}</a></span> <span id="del_bottom"
                                        class="text">건</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- 환영합니다 창 끝!!!!! -->
                    <!-- 200713 수정 -->
                    <script type="text/javascript"
                        src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220907151706"></script>

                    <!-- 다이나믹 컨피그 설정 HFM_EQL_CONN_YN ERP 연동 유무 -->
                    <!-- includeOrderList -->

                    <h3 class="sec-title">
                        최근 주문상품 <span class="sub2">(최근 1개월 기준)</span>
                    </h3>

                    <div class="order-list-wrap order-slide-section">
                        <c:choose>
                            <c:when test="${orderList.size() == 0}">
                                <div class="nodata">
                                    <p class="txt-nodata">최근 주문 상품이 없습니다.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="order-tbl order-history order-slide">
                                    <div class="slide-container noswipe">
                                        <!-- 전체한번만 노출 -->
                                        <div class="swiper-wrapper">
                                            <!--  슬라이드 단위 주문 3건씩 노출 -->
                                            <div class="swiper-slide">
                                                <!-- body -->
                                                <div class="body">
                                                    <!-- row -->
                                                    <div class="row">
                                                        <div class="inner">
                                                            <div class="cell-pd-wrap">
                                                                <c:forEach items="${orderList}" var="orderVO">
                                                                    <!-- 상품1개씩 -->
                                                                    <div class="inner-row">
                                                                        <div class="info-row">
                                                                            <div class="cell-pd">
                                                                                <div class="item-img"
                                                                                    godno="GM0121011331478">
                                                                                    <a href="javascript:void(0);"
                                                                                        onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');">
                                                                                        <img
                                                                                            src="https://cdn.hfashionmall.com/goods/THBR/21/01/13/GM0121011331478_0_ORGINL.jpg?RS=135x135&amp;AR=0&amp;CS=90x135" />
                                                                                    </a>
                                                                                </div>
                                                                                <div class="item-info">
                                                                                    <!-- <div class="item-brand">
                                                                                        <a href="javascript:void(0);"
                                                                                            onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');">
                                                                                            TOMMY HILFIGER MEN
                                                                                        </a>
                                                                                    </div> -->
                                                                                    <div
                                                                                        class="item-name clear-ellipsis">
                                                                                        <a href="javascript:void(0);"
                                                                                            onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');">${orderVO.pname}
                                                                                            
                                                                                        </a>
                                                                                    </div>
                                                                                    <!-- <div class="item-opt">
                                                                                        <a href="javascript:void(0);"
                                                                                            onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');">
                                                                                            <span> BLACK , F </span>
                                                                                            <span>수량 : 1</span>
                                                                                        </a>
                                                                                    </div> -->
                                                                                    <div class="item-btn"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="cell-price">
                                                                                <div class="cell-inner">
                                                                                    <div class="price">
                                                                                        <span><span
                                                                                                class="num">${orderVO.price}</span>
                                                                                            원</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="cell-status">
                                                                                <div class="cell-inner">
                                                                                    <div class="status">
                                                                                       
                                                                                        <span
                                                                                            class="txt-cmt pcolor">${orderVO.order_detail_result}</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="cell-btn">
                                                                                <div class="cell-inner">
                                                                                    <div class="cell-inner">
                                                                                        <div class="btns">
                                                                                           <%--  <button type="button"
                                                                                                class="btn-type3-sm"
                                                                                                onclick="location.href='hfashionmallServlet?command=order_detail&order_id=${orderVO.order_id}'">
                                                                                                <span>조회</span>
                                                                                            </button> --%>
                                                                                            ${orderVO.order_register}
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- //inner-row 상품1개씩-->

                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <!-- order-tbl -->
                        <!--  orderList -->
                    </div>
                </div>
            </section>
        </div>
    </div>

    <!-- 전체한번만 노출 -->

    

    <script>
        slide.bind(".order-slide", "opt22 nav count");
    </script>
    <!-- //order-tbl -->

    <div class="order-links">
        <ul>
            <li>
                <a href="/secured/mypage/listOrder">주문/배송 조회</a>
            </li>
            <li>
                <a href="/secured/mypage/listClaimOrder">취소/교환/반품 <span class="num">0</span>건</a>
            </li>
        </ul>
    </div>
</body>

<%@ include file="../footer.jsp" %>