package com.hfashionmall.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashionmall.dao.CartDAO;
import com.hfashionmall.dao.OrderDAO;
import com.hfashionmall.dto.MemberVO;

// 수정 해야 함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// 여기서 받은 제품 설명으로 ordervo에 저장
public class OrderDirectInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "hfashionmallServlet?command=order_list"; 
		
		HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	      url = "hfashionmallServlet?command=login_form";
	    } else {
	    	 // product code 받아옴
	    	System.out.println("sdf");
	        String product_code=request.getParameter("product_code").trim();
	        int product_count=Integer.parseInt(request.getParameter("product_count"));
	        
	        System.out.println("product_code : " + product_code);
	        System.out.println("product_count : " + product_count);
	        
			
			  OrderDAO orderDAO = OrderDAO.getInstance(); 
			  int maxOrder_id=orderDAO.insertDirectOrder(loginUser.getMember_id(),product_code,
			  product_count); 
			  
			  System.out.println(maxOrder_id);
			  
				
			  url = "hfashionmallServlet?command=order_list&order_id="+maxOrder_id;
	        // product 코드로 product 객체 받아오기
	        // orderingoneaction 에서 받은 값 표시
	        // orderinsertoneaction에서 받은 
	        // product order테이블에 + order_detail 테이블에 저장
	        
	        // orderdao에서 insertDirectactiion 실행
	        // product_count, product_code 받아와서 실행
	        
	        
	        
	    }
		 response.sendRedirect(url); 
	}

}
