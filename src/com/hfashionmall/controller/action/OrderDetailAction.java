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

public class OrderDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mypage/orderDetail.jsp";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			int order_id = Integer.parseInt(request.getParameter("order_id"));
			OrderDAO orderDAO = OrderDAO.getInstance();
			// 진행중인 상품이므로 상태가 1인 리스트만 가져온다
			ArrayList<OrderVO> orderList = orderDAO.listOrderByOrderId(loginUser.getMember_id(), order_id);

			int totalPrice = 0;
			for (OrderVO ovo : orderList) {
				totalPrice += ovo.getPrice() * ovo.getProduct_count();
				if(ovo.getOrder_detail_result().equals("1")) {
					ovo.setOrder_detail_result("주문 완료");
				} else {
					ovo.setOrder_detail_result("배송 완료");
				}
			}

			
			
			request.setAttribute("orderDetail", orderList.get(0));
			request.setAttribute("orderList", orderList);
			request.setAttribute("totalPrice", totalPrice);

			System.out.println(orderList.get(0).getMname());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
