package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.ProductVO;

public class SearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "./Search_Result.jsp";
		System.out.println("request : " + request);
		String SearchWord = request.getParameter("SearchWord");
		
		
		System.out.println("Search Word : "+ SearchWord);
		
		ProductDAO productDAO=ProductDAO.getInstance();
		ArrayList<ProductVO> productSearchList= productDAO.listSearchProduct(SearchWord);
		
		request.setAttribute("productSearchList", productSearchList);
		
		
		
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
