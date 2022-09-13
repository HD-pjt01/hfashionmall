package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.ReviewVO;

public class ReviewDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String url="product/reviewDetail.jsp";
		

		 HttpSession session = request.getSession();
		    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		    if (loginUser == null) {
		      url = "hfashionmallServlet?command=login_form";
		    } else {
		    	
				// product code 받아옴
			    String product_code=request.getParameter("product_code").trim();
		    	String member_id=loginUser.getMember_id();
		    	
		    	// reviewdao에서 리뷰 가능한지 체크
		    }
		    
	}

}
