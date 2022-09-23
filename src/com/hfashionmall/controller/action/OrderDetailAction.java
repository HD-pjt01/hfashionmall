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

	// 주문 상세 조회 클릭 시 상세 주문리스트를 받아와서 상세 뷰에 전달
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
			// 로그인한 유저와 주문 id를 통해 상세 주문 내역 불러오기
			ArrayList<OrderVO> orderList = orderDAO.listOrderByOrderId(loginUser.getMember_id(), order_id);

			int totalPrice = 0;
			for (OrderVO ovo : orderList) {
				totalPrice += ovo.getPrice() * ovo.getProduct_count();
				// 주문의 상태가 1이라면 주문 완료를, 상태가 2이면 배송 완료를 출력
				if(ovo.getOrder_detail_result().equals("1")) {
					ovo.setOrder_detail_result("주문 완료");
				} else {
					ovo.setOrder_detail_result("배송 완료");
				}
			}
			
			request.setAttribute("orderDetail", orderList.get(0));
			request.setAttribute("orderList", orderList);
			request.setAttribute("totalPrice", totalPrice);

		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
