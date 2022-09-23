package com.hfashionmall.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.controller.action.Action;
import com.hfashionmall.dao.AdminDAO;

/**
 * 수정자        수정내용
 * --------    -------------------------------
 * 정승하        관리자 아이디, 비밀번호 체크 후 로그인 실행
 */
public class AdminLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "hfashionmallServlet?command=admin_login_form";
		String msg = "";
		String admin_id = request.getParameter("admin_id").trim();
		String admin_pw = request.getParameter("admin_pw").trim();

		AdminDAO adminDAO = AdminDAO.getInstance();

		int result = adminDAO.adminCheck(admin_id, admin_pw);

		if (result == 1) {// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("admin_id", admin_id);
			url = "hfashionmallServlet?command=admin_product_list";
		} else if (result == 0) {
			msg = "비밀번호를 확인하세요.";
		} else if (result == -1) {
			msg = "아이디를 확인하세요.";
		}
		request.setAttribute("message", msg);
		request.getRequestDispatcher(url).forward(request, response);
	}
}