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

// --------------------------------------박서은 작성----------------------------------------------
// 주문 테이블에서 현재 주문한 제품 리스트 출력
public class OrderListAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "mypage/orderList.jsp";
    
 // 로그인한 유저가 있는 지 확인 -> 없다면 로그인 창으로, 있다면 주문 내역 출력
    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");    
    
    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    } else {
      OrderDAO orderDAO = OrderDAO.getInstance();
      int order_id = Integer.parseInt(request.getParameter("order_id"));
      // 주문 제품 받아오기
      ArrayList<OrderVO> orderList = orderDAO.listOrderById(loginUser.getMember_id(), "1", order_id);
      
      int totalPrice=0;
      // 주문 제품을 조회하며 가격을 더해 total가격 출력
      for(OrderVO orderVO :orderList){
        totalPrice+=orderVO.getPrice()*orderVO.getProduct_count();
      }
      
      request.setAttribute("memberVO", loginUser);
      request.setAttribute("orderList", orderList);
      request.setAttribute("totalPrice", totalPrice);
    }
    request.getRequestDispatcher(url).forward(request, response);
    System.out.println("현재 주문한 제품 리스트출력");
  }
}
//--------------------------------------박서은 작성----------------------------------------------