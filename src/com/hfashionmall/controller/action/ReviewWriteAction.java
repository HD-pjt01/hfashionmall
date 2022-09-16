package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.OrderDAO;
import com.hfashionmall.dao.ReviewDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.OrderVO;
import com.hfashionmall.dto.ReviewVO;

public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "hfashionmallServlet?command=mypage_review";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {

			int od_id = Integer.parseInt(request.getParameter("od_id"));

			System.out.println("여기 od_id는" + od_id);

			// od_id로 order_view에서 member_id, mname , product_code, pname, od_result가져오기
			/*
			 * OrderDAO orderDAO = OrderDAO.getInstance(); OrderVO orderVO = new OrderVO();
			 * orderVO = orderDAO.OrderByReviewable(od_id);
			 * 
			 * String member_id = orderVO.getMember_member_id(); String mname =
			 * orderVO.getMname(); String product_code = orderVO.getProduct_code(); String
			 * pname = orderVO.getPname(); String od_result =
			 * orderVO.getOrder_detail_result();
			 */

			// 받아온 값으로 리뷰테이블에 리뷰 저장
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			ReviewVO reviewVO = new ReviewVO();

			reviewVO.setOd_id(od_id);
			reviewVO.setReview_content(request.getParameter("r_content"));
			/*
			 * reviewVO.setMember_id(member_id); reviewVO.setMname(mname);
			 * reviewVO.setProduct_code(product_code); reviewVO.setPname(pname);
			 * reviewVO.setOd_result(od_result);
			 */

			reviewDAO.insertReview(reviewVO);
			System.out.println("insert 완료");
			reviewDAO.updateReviewResult(od_id);
		}
		response.sendRedirect(url);
	}
}
