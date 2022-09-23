package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.ProductVO;

/**
 * 수정자        수정내용
 * --------    ---------------------------
 * 정승하        선택한 상품 브랜드의 리스트를 호출
 */
public class ProductBrandAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "product/productBrand.jsp";
		String brand = request.getParameter("case").trim();

		System.out.println("brand : " + brand + "가(이) 선택되었습니다.");

		ProductDAO productDAO = ProductDAO.getInstance();
		ArrayList<ProductVO> productBrandList = productDAO.listBrandProduct(brand);
		
		request.setAttribute("productBrandList", productBrandList);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
