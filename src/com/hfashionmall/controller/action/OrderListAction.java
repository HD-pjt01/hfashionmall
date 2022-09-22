package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.MemberDAO;
import com.hfashionmall.dao.OrderDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.OrderVO;

// 주문 테이블에서 현재 주문한 데이터를 받아 주문 리스트 출력
public class OrderListAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "mypage/orderList.jsp";
    
    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");    
    
    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    } else {
      OrderDAO orderDAO = OrderDAO.getInstance();
      int order_id = Integer.parseInt(request.getParameter("order_id"));
      ArrayList<OrderVO> orderList = orderDAO.listOrderById(loginUser.getMember_id(), "1", order_id);
      
      int totalPrice=0;
      for(OrderVO orderVO :orderList){
        totalPrice+=orderVO.getPrice()*orderVO.getProduct_count();
      }
      
    
      request.setAttribute("memberVO", loginUser);
      request.setAttribute("orderList", orderList);
      request.setAttribute("totalPrice", totalPrice);
    }
    request.getRequestDispatcher(url).forward(request, response);
  }
}
