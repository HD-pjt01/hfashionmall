<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>       
  <article>
    <h1> Item </h1>
    <div id="itemdetail" >
      <form  method="post" name="formm">    
        <fieldset>
          <legend> Item detail Info</legend>  
          <a href="hfashionmallServlet?command=product_detail&product_code=${productVO.product_code}">         
            <span style="float: left;">
              <img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_01.jpg" />
            </span>              
            <%-- <h2>${productVO.product_name}</h2>   --%>
          </a>    
          <label> 가 격 :  </label>
          <p> ${productVO.product_price} 원</p>  
          <label> 수 량 : </label>
          <input  type="text"      name="quantity"  size="2"      value="1"><br>
          <input  type="hidden"    name="product_code"       value="${productVO.product_code}"><br>
        </fieldset>
        <div class="clear"></div>
        <div id="buttons">
          <input type="button" value="장바구니에 담기"  class="submit"    onclick="go_cart()"> 
          <input type="button" value="즉시 구매"      class="submit"    onclick="go_order()"> 
          <input type="reset"  value="취소"          class="cancel">
        </div>
      </form>  
    </div>
  </article>
  
  <!-- 상단 박스 끝 -->
<!-- 아래 박스 전체 시작-->

<!-- reviewvo 받아왔음 -> 그거 띄우기 + review_detail에 roductcode 보내기 -->
<div class="wrap-detail-info">
	<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
	<div class="tab-detail-info">
		<ul class="tab">
			<li class="active" id="tab-img-text"><a href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
			<li class="active" id="tab-review"><a href="#detail-review-box" id="tab-review-a">리뷰</a></li>

		</ul>
	</div>
	<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

	<!-- 상품 상세 설명 이미지/글 시작 -->
	<!-- 우측 하단 sticky  -->
<!-- 	<div class="detail-sticky-go-to-top-btn-box">
		<a href="#" class="detail-sticky-go-to-top-btn-a"> <img class="detail-sticky-go-to-top-btn-img" src="/shop/images/build/arrowUp.png" />
		</a>
	</div> -->
	<!-- 우측 하단 sticky 끝 -->
	<%-- <div id="detail-img-text-box">${prodDto.detail}</div> --%>
	<div id="detail-img-text-box">상세설명</div>
	<!-- 상품 상세 설명 이미지/글 끝 -->

	<!-- 리뷰 시작 -->
	<div id="detail-review-box">
		<div class="detail-review-header">
		리뷰 페이지 헤더 -  전체보기 + 리뷰작성 들어가야함
			<%-- 리뷰 (${countReview})
			<c:if test="${sessionScope.principal != null}">
				<a href="<%=request.getContextPath()%>/review?cmd=reviewWrite&prodNo=${prodDto.prodId}" class="detail-qna-header-a" id="detail-qna-write">리뷰작성</a>
			</c:if>
			<a class="detail-qna-header-a" href="<%=request.getContextPath()%>/review?cmd=reviewAll&prodNo=${prodDto.prodId}">전체보기</a> --%>
		</div>
		<div class="detail-qna-body">
		<!-- <a href = "hfashionmallServlet?command=review_detail&product_code=${productVO.product_code}"> -->
		리뷰 내용들어가기
<%-- 			<c:if test="${reviewList != null}">
				<c:forEach var="review" items="${reviewList}">
					<div class="detail-qna-item">
						<span class="detail-qna-item-number"><%=reviewNo%></span> <a href="<%=request.getContextPath()%>/review?cmd=openReviewDetail&reviewId=${review.id}" target="_blank"> <span class="detail-qna-item-detail">${review.detail}</span>
						</a> <span class="detail-qna-item-writerName"> ${fn:substring(review.name, 0, fn:length(review.name)-1)}* </span> <span class="detail-qna-item-createDate"> <fmt:formatDate value="${review.createDate}" type="date" />
						</span>
					</div>
					<%
						reviewNo += 1;
					%>
				</c:forEach>
			</c:if> --%>
		</div>

	</div>
	<!-- 리뷰 끝 -->
<%@ include file="../footer.jsp" %>    