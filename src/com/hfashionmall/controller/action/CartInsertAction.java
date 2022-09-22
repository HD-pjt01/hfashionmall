package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.CartDAO;
import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.MemberVO;

// 카트에 담기 시 가트테이블에 제품 삽입
public class CartInsertAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "hfashionmallServlet?command=cart_list";
    
    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    } else {
      CartVO cartVO = new CartVO();
      cartVO.setMember_member_id(loginUser.getMember_id());
// 제품 코드랑 수량 -> jsp에서 input으로 받아옴
      cartVO.setProduct_product_code(request.getParameter("product_code")); 
      cartVO.setProduct_count(Integer.parseInt(request
          .getParameter("quantity")));
      
      System.out.println(Integer.parseInt(request
          .getParameter("quantity")));

      CartDAO cartDAO = CartDAO.getInstance();
      cartDAO.insertCart(cartVO);
      System.out.println("카트 테이블에 담기 완료");
    }
// cartlist를 표현하도록 페이지 이동 -> cartlistAction을 실행
    response.sendRedirect(url);
  }
}
