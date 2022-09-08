<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%	int qnaNo = 1; 
	int reviewNo = 1;
%>  
<!--  <article>
    <h1> Item </h1>
    <div id="itemdetail" >
      <form  method="post" name="formm">    
        <fieldset>
          <legend> Item detail Info</legend>  
          <a href="hfashionmallServlet?command=product_detail&product_code=${productVO.product_code}">         
            <span style="float: left;">
              <img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_01.jpg" 
              style="width:200px; height:200px;"/>
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
          <input type="button" value="장바구니에 담기"   class="submit"    onclick="go_cart()"> 
          <input type="button" value="즉시 구매"       class="submit"    onclick="go_order()"> 
          <input type="reset"  value="취소"           class="cancel">
        </div>
      </form>  
    </div>
  </article>
  -->
<h1> ${productVO.product_name}</h1>
<div class="products-box-info" id="itemdetail">
	<form  method="post" name="formm">
		<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
		<div class="products-info-image swiper-container">
			<!-- 이미지 -->
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_01.jpg" style="width:200px; height:200px;"/>
					<!-- 동기적으로 불러오기 -->
				</div>
				<div class="swiper-slide">
					<img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_02.jpg" style="width:200px; height:200px;"/>
					<!-- 동기적으로 불러오기 -->
				</div>
				<div class="swiper-slide">
					<img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_03.jpg" style="width:200px; height:200px;"/>
					<!-- 동기적으로 불러오기 -->
				</div>
				<div class="swiper-slide">
					<img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_04.jpg" style="width:200px; height:200px;"/>
					<!-- 동기적으로 불러오기 -->
				</div>
			</div>
		</div>
	<span class="products-info-desciption">※ 이미지를 좌우로 드래그하면 더 많은 이미지를 확인하실 수 있습니다.</span>		

	<div class="products-box-detail">
		<div class="products-box-detail-name">
			<!-- 상품명 -->
			<span>${productVO.product_name}</span>
		</div>
		<div class="products-box-detail-price">
			<!-- 가격 -->
			<span class="products-box-detail-price-figure">${productVO.product_price}</span>
			<span>원</span>
		</div>
		<div class="products-box-detail-allPrice">
			<span class="products-box-detail-allPrice-title">상품 금액</span>
			<span class="products-box-detail-allPrice-figure">
				<fmt:formatNumber value="${productVO.product_price}" type="number" />원
			</span>
		</div>
		<!-- 버튼 시작 -->
		<button type="button" class="buy-btn" onclick="go_order()">바로 구매</button>
		<!-- 장바구니 버튼 시작 -->
			<button type="button" class="cart-btn" onclick="go_cart();">
				<i class="material-icons">shopping_cart</i>
			</button>
		<!-- 장바구니 버튼 끝 -->
		<!-- 버튼 끝 -->
	</div>
	</form>
</div>
<!-- 아래 박스 전체 시작-->
<div class="wrap-detail-info">
	<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
	<div class="tab-detail-info">
		<ul class="tab">
			<li class="active" id="tab-img-text"><a
				href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
			<li class="active" id="tab-review"><a href="#detail-review-box"
				id="tab-review-a">리뷰</a></li>
			<li class="active" id="tab-qna"><a href="#detail-qna-box"
				id="tab-qna-a">Q&amp;A</a></li>
			<li class="active" id="tab-purchaseInfo"><a
				href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">주문정보</a></li>
		</ul>
	</div>
	<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

	<!-- 상품 상세 설명 이미지/글 시작 -->
	<!-- 우측 하단 sticky  -->
	<div class="detail-sticky-go-to-top-btn-box">
		<a href="#" class="detail-sticky-go-to-top-btn-a">
			<img class="detail-sticky-go-to-top-btn-img" src="/shop/images/build/arrowUp.png" />
		</a>
	</div>
	<!-- 우측 하단 sticky 끝 -->
	<div id="detail-img-text-box">
		${productVO.product_color}
	</div>
	<!-- 상품 상세 설명 이미지/글 끝 -->

	

	<!-- 주문정보 시작 -->
	<div id="detail-purchaseInfo-box">
		<div class="detail-purchaseInfo-header">
			주문정보 <span class="products-box-detail-realInfo-popover"
				onclick="addressInfoBox();"> ∨ </span>
		</div>
		<div id="addressInfo-box">
			<b>[배송 정보 ]</b><br />
			<p>
				고객센터 연락이 어려우니 게시판에 문의주시면 빠르게 답변드리도록 하겠습니다.<br />
				CJ대한통운(1588-1255)택배를 이용하며, 매일 오후 1시 전 주문까지만 당일발송합니다.<br /> 발송한날로부터
				1~3일 이내 받아보실수 있습니다.<br /> (택배사의 영업사정에 따라 배송지연이 있을 수 있습니다.)
			</p>
			<b>[ 교환/환불 정보 ]</b><br />
			<p>
				상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br /> 환불요청 가능 기간은 상품 수령
				후(배송완료 시점으로부터) 7일 이내입니다.<br /> 교환/환불이 발생하는 경우 그 원인을 제공한 자가 배송비를
				부담합니다.<br /> - 고객변심 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 고객이 부담<br />
				- 판매자귀책 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 판매자가 부담<br /> 다음의 경우는
				예외적으로 교환 및 환불이 불가능합니다.<br /> - 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우<br />
				- 소비자 과실로 인한 옷의 변색(예 : 착색, 화장품, 오염 등)<br /> - 착용으로 인한 니트류 상품의 늘어남
				발생 및 가죽 제품의 주름 발생<br /> - 기타 착용 흔적 : 택 제거 등<br /> - 구매확정된 주문의 경우<br />
				- 귀금속류의 경우는 소비자분쟁조정기준에 의거 교환만 가능합니다.<br /> (단, 함량미달의 경우에는 환불이 가능함)<br />
				구매자 단순변심은 상품수령후 7일이내(구매자 반품배송비 부담)
			</p>
		</div>
	</div>
	<!-- 주문정보 끝 -->

</div>
<!-- 아래 박스 전체 끝 -->
<script type="text/javascript" src="javascript/product.js"></script>
<%@ include file="../footer.jsp" %>   
 