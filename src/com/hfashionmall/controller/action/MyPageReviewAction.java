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

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// reviewdao에서 odList 가져와서
		// orderdao에서 order 가져오기
		String url = "mypage/mypage_review.jsp";

		// 현재 로그인한 유저 받아오기
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			// reviewdao, orderdao 만들기
			//ReviewDAO reviewDAO = ReviewDAO.getInstance();
			OrderDAO orderDAO = OrderDAO.getInstance();

			// 리뷰가능한 order_detail_id 받아오기
			//ArrayList<Integer> odIdList = reviewDAO.ReviewAbleOdId(loginUser.getMember_id(), "2", "1");

			// order_detail_id로 orderlist가져오기
			/*
			 * ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
			 * 
			 * for (int od_id : odIdList) { OrderVO orderVO =
			 * orderDAO.OrderByReviewable(od_id); orderList.add(orderVO); }
			 */
			ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
			orderList = orderDAO.listOrderRivewable(loginUser.getMember_id(), "2", "1");
			
			request.setAttribute("title", "리뷰 가능한 주문 내역");
			request.setAttribute("orderList", orderList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
