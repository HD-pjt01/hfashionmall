<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<%-- <%@ include file="sub_img.html"%> 
<%@ include file="sub_menu.jsp" %>     --%>   
  <article>
      <h2> Order List </h2>
      <form name="formm" method="post">
        <table id="cartList">
       <tr>
        <th>상품명</th> <th>수 량</th><th>가 격</th> <th>주문일</th> <th> 진행 상태 </th>    
       </tr>
       <c:forEach items="${orderList}"  var="orderVO">
       <tr>      
        <td>
        <!-- 수정 필요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            <a href="hfashionmallServlet?command=product_detail&product_code=${orderVO.product_code}">
              <h3> ${orderVO.pname} </h3>              
          </a>    
        </td>
        <td> ${orderVO.product_count} </td>
        <td> <fmt:formatNumber value="${orderVO.price*orderVO.product_count}" type="currency"/> </td>      
        <td> <fmt:formatDate value="${orderVO.order_register}" type="date"/></td>
        <td> 처리 진행 중 </td>
       </tr>
       </c:forEach>
       <tr>
         <th colspan="2"> 총 액 </th>
         <th colspan="2"> <fmt:formatNumber value="${totalPrice}" type="currency"/><br>     </th> 
         <th> 주문 처리가 완료되었습니다. </th>                
       </tr> 
      </table>   
          
      <div class="clear"></div>
      <div id="buttons" >
       <input type="button"    value="쇼핑 계속하기"  class="cancel"  onclick="location.href='hfashionmallServlet?command=index'">     
      </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>