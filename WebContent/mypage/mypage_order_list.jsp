 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../header.jsp" %>

<body>
    <div class="wrap">
        <div id="container">
            <section class="content-wrap">
                <div class="snb-wrap">
                    <h2 class="lnb-title">
                        <a href="/secured/mypage/myPage">MYPAGE</a>
                    </h2>
                    <nav id="lnb" class="lnb">
                        <ul>
                            <li>
                                <div class="menu-depth1">주문 조회</div>
                                <ul class="menu-depth2">
                                    <li><a href="hfashionmallServlet?command=mypage_order_complete">주문 완료 주문 조회</a></li>
                                    <li><a href="hfashionmallServlet?command=mypage_deliv_complete">배송 완료 주문 조회</a></li>
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
								<div class="menu-depth1">QnA 조회</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=qna_view">1:1
											문의 내역</a></li>
								</ul>
							</li>
							<li>
								<div class="menu-depth1">회원정보</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=mypage_edit">회원정보 수정</a></li>
									<li><a href="hfashionmallServlet?command=mypage_out">회원 탈퇴</a></li>
								</ul>
							</li>
                        </ul>
                    </nav>
                </div>
                <div class="snb-content-wrap">
   
                    <!-- 200713 수정 -->
                    <script type="text/javascript"
                        src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220907151706"></script>

                    <!-- 다이나믹 컨피그 설정 HFM_EQL_CONN_YN ERP 연동 유무 -->
                    <!-- includeOrderList -->

                    <h3 class="sec-title">
                         ${title}
                    </h3>

                    <div class="order-list-wrap order-slide-section">
                        <c:choose>
                            <c:when test="${orderList.size() == 0}">
                                <div class="nodata">
                                    <p class="txt-nodata">상품이 없습니다.</p>
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
                                                                                            src="product_images/${orderVO.product_code}_01.jpg" />
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
                                                                                        주문 날짜<br />
                                                                                        <span
                                                                                            class="txt-cmt pcolor">${orderVO.order_register}</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="cell-btn">
                                                                                <div class="cell-inner">
                                                                                    <div class="cell-inner">
                                                                                        <div class="btns">
                                                                                            <button type="button"
                                                                                                class="btn-type3-sm"
                                                                                                onclick="location.href='hfashionmallServlet?command=order_detail&order_id=${orderVO.order_id}'">
                                                                                                <span>조회</span>
                                                                                            </button>
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