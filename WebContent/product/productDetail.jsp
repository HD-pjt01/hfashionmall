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
          <input type="button" value="장바구니에 담기"   class="submit"    onclick="go_cart()"> 
          <input type="button" value="즉시 구매"       class="submit"    onclick="go_order()"> 
          <input type="reset"  value="취소"           class="cancel">
        </div>
      </form>  
    </div>
  </article>
<%@ include file="../footer.jsp" %>    