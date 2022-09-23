package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.CartDAO;
import com.hfashionmall.dao.OrderDAO;
import com.hfashionmall.dto.MemberVO;

//--------------------------------------박서은 작성----------------------------------------------
// 제품 '바로 구매' 클릭 시 제품 주문 테이블에 저장하는 actio 처리
public class OrderDirectInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "hfashionmallServlet?command=order_list";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			// product code 받아옴
			System.out.println("sdf");
			String product_code = request.getParameter("product_code").trim();
			int product_count = Integer.parseInt(request.getParameter("product_count"));

			System.out.println("product_code : " + product_code);
			System.out.println("product_count : " + product_count);

			OrderDAO orderDAO = OrderDAO.getInstance();
			int maxOrder_id = orderDAO.insertDirectOrder(loginUser.getMember_id(), product_code, product_count);

			System.out.println(maxOrder_id);

			url = "hfashionmallServlet?command=order_list&order_id=" + maxOrder_id;

		}
		response.sendRedirect(url);
	}
}
//--------------------------------------박서은 작성----------------------------------------------
