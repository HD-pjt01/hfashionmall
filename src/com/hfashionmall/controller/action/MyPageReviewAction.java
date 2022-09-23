package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.OrderDAO;
import com.hfashionmall.dao.ReviewDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.OrderVO;

public class MyPageReviewAction implements Action {

	// mypage에서 리뷰 가능한 주문 받아와서 mypage 리뷰 작성 페이지에 값 전달
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "mypage/mypage_review.jsp";

		// 현재 로그인한 유저 받아오기
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			OrderDAO orderDAO = OrderDAO.getInstance();

			ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
			orderList = orderDAO.listOrderRivewable(loginUser.getMember_id(), "2", "1");
			
			request.setAttribute("title", "리뷰 가능한 주문 내역");
			request.setAttribute("orderList", orderList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
