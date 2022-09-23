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
//--------------------------------------박서은 작성----------------------------------------------
public class OrderInsertAction implements Action {

// 현재 카트에 담긴 제품 리스트를 주문 테이블에 저장
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "hfashionmallServlet?command=order_list";    
    
 // 로그인한 유저가 있는 지 확인 -> 없다면 로그인 창으로, 있다면 카트 리스트 주문 테이블에 저장
    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    } else {
      CartDAO cartDAO = CartDAO.getInstance();
      // 사용자 별로 카트에 담긴 제품 리스트 가져오기
      ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getMember_id());      
      OrderDAO orderDAO = OrderDAO.getInstance();            
      // 현재 주문한 주문 id를 받아와서 현재 주문한 리스트 출력 하도록 현재 주문 id 넘기기
      int maxOrder_id=orderDAO.insertOrder(cartList, loginUser.getMember_id());
      url = "hfashionmallServlet?command=order_list&order_id="+maxOrder_id;
      System.out.println("주문 테이블에 insert완료");
    }
    // 주문 입력 후 주문 리스트 띄우도록 이동
    response.sendRedirect(url);
  }
}
//--------------------------------------박서은 작성----------------------------------------------
