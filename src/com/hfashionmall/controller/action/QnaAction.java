package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.hfashionmall.dto.MemberVO;

/**
 * 수정자        수정내용
 * --------    ---------------------------
 * 정승하        QnA 작성 URL을 호출
 */
public class QnaAction implements Action {
	  @Override
	  public void execute(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {    
	    String url = "member/qna.jsp";  
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");    
	    if (loginUser == null) {
	      url = "hfashionmallServlet?command=login_form";
	    } 
	    request.getRequestDispatcher(url).forward(request, response);
	}
}