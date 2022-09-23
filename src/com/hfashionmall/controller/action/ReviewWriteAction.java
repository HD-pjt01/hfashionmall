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
//--------------------------------------박서은 작성----------------------------------------------
// 작성된 리뷰 내용, 리뷰id를 받아와 리뷰 테이블에 데이터 저장
// 리뷰 테이블에 데이터 저장하고 리뷰 상태를 '작성 완료'로 변경
public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "hfashionmallServlet?command=mypage_review";

		// 로그인한 유저가 있는 지 확인 -> 없다면 로그인 창으로, 있다면 리뷰 작성 수행
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {

			int od_id = Integer.parseInt(request.getParameter("od_id"));

			// 받아온 리뷰 데이터를 리뷰테이블에 저장
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			ReviewVO reviewVO = new ReviewVO();

			reviewVO.setOd_id(od_id);
			reviewVO.setReview_content(request.getParameter("r_content"));

			reviewDAO.insertReview(reviewVO);
			System.out.println(" review content insert 완료");
			reviewDAO.updateReviewResult(od_id);
			System.out.println(" review 상태를 '리뷰 작성 완료'로 변경");
		}
		// 리뷰 작성 완료 후 다시 리뷰 작성 창 띄우기
		response.sendRedirect(url);
	}
}
//--------------------------------------박서은 작성----------------------------------------------