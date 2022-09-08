<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<%--  <%@ include file="sub_img.html"%> 
<%@ include file="sub_menu.html" %>--> --%>
  <article>
    <h2> productVO.product_brand : ${productVO.product_brand}</h2>     
    <c:forEach items="${productBrandList}"  var="productVO">
      <div id="item">
        <a href="hfashionmallServlet?command=product_detail&product_code=${productVO.product_code}"> 
          <img src="product_images/BRAND/${productVO.product_brand}/${productVO.product_code}/${productVO.product_code}_01.jpg" />
          <h3>${productVO.product_name}</h3>        
          <p>${productVO.product_price}</p>
        </a>  
      </div>
    </c:forEach>    
    <div class="clear"></div>
  </article>
<%@ include file="../footer.jsp" %>      