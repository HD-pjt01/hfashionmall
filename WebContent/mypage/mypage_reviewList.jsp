<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../header.jsp"%>

<div id="container">
<section class="content-wrap">
    <input type="hidden" name="hPointEnableYn" id="hPointEnableYn" value="">	
<!-- snb -->
<div class="snb-wrap">
<h2 class="lnb-title"><a href="/secured/mypage/myPage">MYPAGE</a></h2>
<nav id="lnb" class="lnb">
    <ul>
        <li>
            <div class="menu-depth1">주문 조회</div>
            <ul class="menu-depth2">
                <li><a href="hfashionmallServlet?command=mypage">배송 중인
                        주문 조회</a></li>
                <li><a href="hfashionmallServlet?command=order_all">배송
                        완료 주문 조회</a></li>
                <li><a href="hfashionmallServlet?command=cart_list">장바구니
                        내역</a></li>
            </ul>
        </li>
        <li>
            <div class="menu-depth1">리뷰 관리</div>
            <ul class="menu-depth2">
                <li><a href="hfashionmallServlet?command=mypage_review">리뷰
                        쓰기</a></li>
                <li><a href="hfashionmallServlet?command=review_list">나의
                        상품리뷰</a></li>
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
                <li><a href="/secured/mypage/updateMember">회원정보 수정</a></li>

                <li><a href="/secured/mypage/memberSecession">회원 탈퇴</a></li>
            </ul>
        </li>
    </ul>
</nav>
</div>
<!-- //snb -->
<!-- snb-content-wrap -->
    <div class="snb-content-wrap">
        <script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220916135540"></script>

<h3 class="page-title">나의 상품리뷰</h3>

<!-- period-search-group --> 
<div class="period-search-group">
<dl class="period-btns-box">
<dt>기간</dt>
<dd>
<div class="period-btns">
<label>
    <input type="radio" name="period" onclick="setDate('15d')">
    <span>15일</span>
</label>
<label>
    <input type="radio" name="period" onclick="setDate('1m')" checked="">
    <span>1개월</span>
</label>
<label>
    <input type="radio" name="period" onclick="setDate('3m')">
    <span>3개월</span>
</label>
<label>
    <input type="radio" name="period" onclick="setDate('6m')">
    <span>6개월</span>
</label>
<label>
    <input type="radio" name="period" onclick="setDate('12m')">
    <span>12개월</span>
</label>
</div>
</dd>
</dl>


</div>

<div id="reviewFold" class="board-list board-review ui-fold"><!-- s: 200413 수정 || 리뷰 내용 텍스트 4줄 노출 후 클릭시 전체 노출 기능 추가, 첨부이미지 등록시 타입 추가 -->
                                <ul class="list-content">

                                    <c:choose>
                                        <c:when test="${reviewList.size() == 0}">
                                           <div class="nodata">
                                    <p class="txt-nodata">리뷰가 없습니다.</p>
                                </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="review" items="${reviewList}">
                                                <li>
                                                    <div class="list-row fold-header">
                                                        <div class="cell-title">
                                                            <ul class="etc-info">
                                                                <li>
                                                                    <span class="point size-m"><span class="ico"
                                                                            style="width:80%">별점 4점</span></span>
                                                                </li>
                                                                <li>
                                                                    <button type="button" class="btn-like2"
                                                                        onclick="location.href='hfashionmallServlet?product_detail&product_code=${review.product_code}'"
                                                                        godevlturn="1" reviewgodno="115369702">
                                                                        <span class="like-count" likecnt="3">
                                                                            </span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span class="date">${review.review_register}</span>
                                                                </li>
                                                            </ul>
                                                            <p class="title-review">
                                                                ${review.review_content}
                                                            </p>
                                                            <button type="button" class="btn-fold">열기</button>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
    <div class="paging">
        <span> <strong title="현재 페이지">1</strong>
        </span>
    </div>

</div>
    <!-- //snb-content-wrap -->
</section>
</div>
<%@ include file="../footer.jsp"%>