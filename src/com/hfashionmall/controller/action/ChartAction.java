package com.hfashionmall.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashionmall.dao.chartDAO;
import com.hfashionmall.dto.ChartVO;

public class ChartAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "./Chart.jsp";
		System.out.println("request : " + request);
		
		chartDAO ChartDAO = chartDAO.getInstance();
		
		ArrayList<ChartVO> chartList = ChartDAO.Product_price_count();
		request.setAttribute("chartList", chartList);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
