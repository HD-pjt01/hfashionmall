package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.ReviewDAO;
import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.ReviewVO;
//--------------------------------------박서은 작성----------------------------------------------
// 리뷰데이터를 받아와서 사용자 별로 자신이 작성한 리뷰 리스트 출력
public class ReviewListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "mypage/mypage_reviewList.jsp";

		// 로그인한 유저가 있는 지 확인 -> 없다면 로그인 창으로, 있다면 리뷰 리스트 출력
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
			// 사용자 아이디로 리뷰 리스트 받아오기
			reviewList = reviewDAO.findByMember_id(loginUser.getMember_id());
			request.setAttribute("reviewList", reviewList);
		}
		// 뷰(jsp)에 데이터 전달
		request.getRequestDispatcher(url).forward(request, response);
		System.out.println("리뷰 리스트출력");
	}

}
//--------------------------------------박서은 작성----------------------------------------------