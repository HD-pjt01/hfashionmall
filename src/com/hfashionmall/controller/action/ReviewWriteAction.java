package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dto.MemberVO;
import com.hfashionmall.dto.ReviewVO;

public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "hfashionmallServlet?command=review_detail";
		
		 HttpSession session = request.getSession();
		    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		    if (loginUser == null) {
		      url = "hfashionmallServlet?command=login_form";
		    } else {
		    	ReviewVO reviewVO = new ReviewVO(); 
		    	
		    }
		
	}

}
