<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<body>
    <div id="container">
        <section class="content-wrap">
            <h2 class="page-title">주문완료</h2>

            <div class="order-header">
                <p class="txt">
                    주문이 정상적으로 완료되었습니다.
                </p>
            </div>

            <section>
                <h3 class="sec-title">주문상품</h3>

                <div class="order-tbl type-order-com">
                    <!-- head -->
                    <div class="head">
                        <div class="cell-info">상품정보</div>
                        <div class="cell-qt">수량</div>
                        <div class="cell-price">결제금액</div>
                    </div>
                    <!-- //head -->
                    <!-- body -->
                    <div class="body">
                        <!-- row -->
                        <c:choose>
                            <c:when test="${cartList.size() == 0}">
                                <div class="nodata">
                                    <p class="txt-nodata">결제 상품이 없습니다.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${orderList}" var="orderVO">
                                    <div class="row">
                                        <!-- 패키지 명 -->
                                        <!-- //패키지 명 -->
                                        <div class="inner">
                                            <div class="cell-pd">
                                                <div class="item-img">
                                                    <img src="product_images/${orderVO.product_code}_01.jpg"
                                                        alt=""
                                                        onerror="javascript:this.src='/hfm_pc/resources/images/temp/pd_86x129.jpg'" />
                                                </div>
                                                <div class="item-info">
                                                    
                                                    <div class="item-name">${orderVO.pname}</div>
                                                    <div class="item-opt">
                                                        <span> BLACK,&nbsp;F</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="cell-qt">${orderVO.product_count}</div>
                                            <div class="cell-price">
                                                <div class="price">
                                                    <span><span class="num">${orderVO.price*orderVO.product_count}</span> 원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>

                        </c:choose>

                        <!-- //row -->
                    </div>
                    <!-- //body -->
                </div>
            </section>

            <section>
                <h3 class="sec-title">결제정보</h3>
                <div class="order-com-payment">
                    <section class="cell-discount">

                        <h4 class="title">최종결제금액</h4>
                        <ul class="list">
                            <li>
                                <span class="tit">결제금액</span>
                                <span class="num"><span>${totalPrice}</span> 원</span>
                            </li>
                            <li>
                                <span class="tit">배송비</span>
                                <span class="num"><span>0</span> 원</span>
                            </li>
                            <li>
                                <span class="tit">총 할인금액</span>
                                <span class="num"><span class="discount">0</span> 원</span>
                            </li>
                            <li class="total">
                                <span class="tit">총 결제금액</span>
                                <span class="num"><span>${totalPrice}</span> 원</span>
                            </li>
                        </ul>
                    </section>
                </div>
            </section>

            <section>
                <h3 class="sec-title">배송지 정보</h3>

                <div class="delivery-info">
                    <table>
                        <caption>
                            배송지 정보
                        </caption>
                        <colgroup>
                            <col style="width: 190px" />
                            <col />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">수신자명</th>
                                <td>${memberVO.member_name}</td>
                            </tr>
                            <tr>
                                <th scope="row">휴대폰번호</th>
                                <td>${memberVO.member_phone}</td>
                            </tr>
                            <tr>
                                <th scope="row">배송지 주소</th>
                                <td>
                                    ${memberVO.member_addr}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <div class="btn-box">
                <a href="hfashionmallServlet?command=index" class="btn-type4-lg">쇼핑 계속하기</a>
                <a href="hfashionmallServlet?command=mypage_order_complete" id="btnOrderList" class="btn-type2-lg">주문내역조회</a>
            </div>
        </section>
    </div>
</body>


<%@ include file="../footer.jsp" %>