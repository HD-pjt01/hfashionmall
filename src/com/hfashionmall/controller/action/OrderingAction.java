package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.CartDAO;
import com.hfashionmall.dto.CartVO;
import com.hfashionmall.dto.MemberVO;
//--------------------------------------박서은 작성----------------------------------------------
// '카트리스트'에서 제품 주문 시 주문서 창 띄우는 action처리
public class OrderingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mypage/ordering.jsp";
		
		// 로그인한 유저가 있는 지 확인 -> 없다면 로그인 창으로, 있다면 리뷰 작성 수행
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "hfashionmallServlet?command=login_form";
		} else {
			CartDAO cartDAO = CartDAO.getInstance();
			ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getMember_id());

			int totalPrice = 0;

			// 카트에 담긴 제품들의 가격 다 더하기
			for (CartVO cartVO : cartList) {
				totalPrice += cartVO.getProduct_price() * cartVO.getProduct_count();
			}

			// 카트 리스트와 total가격을 받아와 주문서 뷰(jsp)에 전달
			request.setAttribute("cartList", cartList);
			request.setAttribute("totalPrice", totalPrice);
		}
		request.getRequestDispatcher(url).forward(request, response);
		System.out.println("카트에 담긴 제품 주문서 출력");
	}

}
//--------------------------------------박서은 작성----------------------------------------------
