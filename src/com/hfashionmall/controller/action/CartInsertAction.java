package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.CartDAO;
import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.MemberVO;

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
      cartVO.setId(loginUser.getMember_id());
      cartVO.setPseq(Integer.parseInt(request.getParameter("pseq")));
      cartVO.setQuantity(Integer.parseInt(request
          .getParameter("quantity")));

      CartDAO cartDAO = CartDAO.getInstance();
      cartDAO.insertCart(cartVO);
    }
    response.sendRedirect(url);
  }
}
