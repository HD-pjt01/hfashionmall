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

import sun.security.util.Length;

public class RealMyPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mypage/real_mypage.jsp";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			OrderDAO orderDAO = OrderDAO.getInstance();
			ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
			 orderList = orderDAO.listOrderAllById(loginUser.getMember_id());
			 
			 for(OrderVO orderVO : orderList  ) {
					
					  if( orderVO.getOrder_detail_result().equals("1")) 
					  {orderVO.setOrder_detail_result("주문 완료"); } 
					  else if (orderVO.getOrder_detail_result().equals("2")) {
					  orderVO.setOrder_detail_result("배송 완료"); } 
					  else {
					  orderVO.setOrder_detail_result("이상"); }	 
				
			 }


				request.setAttribute("title", "주문 완료 주문 조회");
				request.setAttribute("orderList", orderList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
