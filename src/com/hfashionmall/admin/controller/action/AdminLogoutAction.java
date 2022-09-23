package com.hfashionmall.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.controller.action.Action;
/**
 * 수정자        수정내용
 * --------    -------------------------------
 * 정승하        관리자 로그아웃 실행
 */
public class AdminLogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "hfashionmallServlet?command=admin_login_form";

		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
			request.setAttribute("message", "");
		}

		request.getRequestDispatcher(url).forward(request, response);
	}
}

