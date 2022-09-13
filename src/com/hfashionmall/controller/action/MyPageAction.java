package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.OrderDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.OrderVO;

public class MyPageAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "mypage/mypage.jsp";

    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

    if (loginUser == null) {
      url = "hfashionmallServlet?command=login_form";
    } else {
      OrderDAO orderDAO = OrderDAO.getInstance();
      ArrayList<Integer> oseqList = orderDAO.selectSeqOrderIng(loginUser
          .getMember_id());

      ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();

      for (int oseq : oseqList) {
        ArrayList<OrderVO> orderListIng = orderDAO.listOrderById(
            loginUser.getMember_id(), "1", oseq);

        //주문에서 제일 처음 주문 가져오기
        OrderVO orderVO = orderListIng.get(0);
        int count = orderListIng.size()-1;
        orderVO.setPname(orderVO.getPname() + " 외 "
            + count + "건");
        
        int totalPrice = 0;
        for (OrderVO ovo : orderListIng) {
          totalPrice += ovo.getPrice() * ovo.getProduct_count();
        }
        orderVO.setPrice(totalPrice);
        orderList.add(orderVO);
      }
      request.setAttribute("title", "진행 중인 주문 내역");
      request.setAttribute("orderList", orderList);
    }
    request.getRequestDispatcher(url).forward(request, response);
  }
}
