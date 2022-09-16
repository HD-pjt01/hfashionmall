package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.ProductDAO;
import com.hfashionmall.dto.ProductVO;
import com.hfashionmall.dao.ReviewDAO;
import com.hfashionmall.dto.ReviewVO;

public class ProductDetailAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url="product/productDetail.jsp";
    
    String product_code=request.getParameter("product_code").trim();
    
    System.out.println("product_code : " + product_code);
    
    ProductDAO productDAO=ProductDAO.getInstance();
    ProductVO productVO= productDAO.getProduct(product_code);
    
    // product_code로 리뷰 vo 생성
    ReviewDAO reviewDAO = ReviewDAO.getInstance();
    ArrayList<ReviewVO> reviewList = reviewDAO.findByProd(product_code);
    int reviewCount = reviewDAO.countTotalReview(product_code);
    
    request.setAttribute("productVO", productVO);
    request.setAttribute("reviewList", reviewList);
    request.setAttribute("reviewCount", reviewCount);
    // request.setAttribute("reviewVO", reviewVO);
    
    RequestDispatcher dispatcher = request
        .getRequestDispatcher(url);
    dispatcher.forward(request, response);
  }
}
