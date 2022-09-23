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
//--------------------------------------박서은, 정승하 작성----------------------------------------------시작
// 제품 상세 페이지 처리
public class ProductDetailAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url="product/productDetail.jsp";
    
    String product_code=request.getParameter("product_code").trim();    
    System.out.println("product_code : " + product_code);
    
    ProductDAO productDAO=ProductDAO.getInstance();
    ProductVO productVO= productDAO.getProduct(product_code);
    
    // 제품 별로 작성된 리뷰를 가져옴
    ReviewDAO reviewDAO = ReviewDAO.getInstance();
    ArrayList<ReviewVO> reviewList = reviewDAO.findByProd(product_code);
    int reviewCount = reviewDAO.countTotalReview(product_code);
    
    // 제품, 리뷰리스트를 상세페이지 뷰에 전달
    request.setAttribute("productVO", productVO);
    request.setAttribute("reviewList", reviewList);
    request.setAttribute("reviewCount", reviewCount);

    RequestDispatcher dispatcher = request
        .getRequestDispatcher(url);
    dispatcher.forward(request, response);
    
    System.out.println("제품 상세 페이지 출력");
  }
}
//--------------------------------------박서은, 정승하 작성----------------------------------------------끝