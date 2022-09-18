package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.CartDAO;
import com.hfashionmall.dao.OrderDAO;
import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.MemberVO;

public class OrderInsertAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "hfashionmallServlet?command=order_list";    
    
    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    } else {
      CartDAO cartDAO = CartDAO.getInstance();
      ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getMember_id());
      
      OrderDAO orderDAO = OrderDAO.getInstance();      
      
      int maxOrder_id=orderDAO.insertOrder(cartList, loginUser.getMember_id());
      url = "hfashionmallServlet?command=order_list&order_id="+maxOrder_id;
    }
    response.sendRedirect(url);
  }
}

