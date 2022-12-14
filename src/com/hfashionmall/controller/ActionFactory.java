package com.hfashionmall.controller;

import com.hfashionmall.controller.action.*;
import com.hfashionmall.admin.controller.action.*;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory : " + command);
		/* 추가된 부분 */
		if (command.equals("index")) {
			action = new IndexAction();
		} else if (command.equals("product_detail")) {
			action = new ProductDetailAction();
		}

		/**
		 * 수정자        수정내용
		 * --------    -------------------------------
		 * 정승하        상품의 브랜드, 카테고리, 디테일 액션 팩토리 설정
		 */
		else if (command.equals("brand")) {
			action = new ProductBrandAction();
		} else if (command.equals("catagory")) {
			action = new ProductCategoryAction();
		} 
		else if (command.equals("contract")) {
			action = new ContractAction();
		} else if (command.equals("join_form")) {
			action = new JoinFormAction();
		} else if (command.equals("id_check_form")) {
			action = new IdCheckFormAction();
		} else if (command.equals("join")) {
			action = new JoinAction();
		} else if (command.equals("login_form")) {
			action = new LoginFormAction();
		} else if (command.equals("login")) {
			action = new LoginAction();
		} else if (command.equals("logout")) {
			action = new LogoutAction();
		} else if (command.equals("cart_insert")) {
			action = new CartInsertAction();
		} else if (command.equals("cart_list")) {
			action = new CartListAction();
		} else if (command.equals("cart_delete")) {
			action = new CartDeleteAction();
		} else if (command.equals("order_insert")) {
			action = new OrderInsertAction();
		} else if (command.equals("order_list")) {
			action = new OrderListAction();
		} else if (command.equals("mypage_order_complete")) {
			action = new MyPageOrderCompleteAction();
		} else if (command.equals("mypage_edit")) {
			action = new MyPageEditAction();
		} else if (command.equals("mypage_out")) {
			action = new MyPageOutAction();
		} else if (command.equals("order_detail")) {
			action = new OrderDetailAction();
		} else if (command.equals("mypage_deliv_complete")) {
			action = new MyPageOrderDelivCompleteAction();
		}
		/**
		 * 수정자        수정내용
		 * --------    -------------------------------
		 * 정승하        QnA 액션 팩토리 설정
		 */
		else if (command.equals("qna")) {
			action = new QnaAction();
		} else if (command.equals("qna_write")) {
			action = new QnaWriteAction();
		} else if (command.equals("qna_view")) {
			action = new QnaViewAction();
		}

		// 마이 페이지 리뷰 액션 추가
		else if (command.equals("mypage_review")) {
			action = new MyPageReviewAction();
		} else if (command.equals("review_write")) {
			action = new ReviewWriteAction();
		} else if (command.equals("review_list")) {
			action = new ReviewListAction();
		} else if (command.equals("mypage")) {
			action = new MyPageAction();
		}

		// 상세 페이지에서 direct으로 order에 삽입
		else if (command.equals("order_direct_insert")) {
			action = new OrderDirectInsertAction();
		}

		// 카트 -> 주문서 창
		else if (command.equals("ordering")) {
			action = new OrderingAction();
			// 제품 하나만 주문할 때 주문 창
		} else if (command.equals("ordering_one")) {
			action = new OrderingOneAction();
		}
		// 검색
		else if (command.equals("search")) {
			action = new SearchFormAction();
		} else if (command.equals("search_result")) {
			action = new SearchAction();
		}
		// 차트
		else if (command.equals("chart")) {
			action = new ChartAction();
		}

		/**
		 * 수정자        수정내용
		 * --------    -------------------------------
		 * 정승하        관리자 액션 팩토리 설정
		 */
		if (command.equals("admin_login_form")) {
			action = new AdminIndexAction();
		} else if (command.equals("admin_login")) {
			action = new AdminLoginAction();
		} else if (command.equals("admin_logout")) {
			action = new AdminLogoutAction();
		} else if (command.equals("admin_product_list")) {
			action = new AdminProductListAction();
		} else if (command.equals("admin_member_list")) {
			action = new AdminMemberListAction();
		} else if (command.equals("admin_qna_list")) {
			action = new AdminQnaListAction();
		} else if (command.equals("admin_qna_detail")) {
			action = new AdminQnaDetailAction();
		} else if (command.equals("admin_qna_repsave")) {
			action = new AdminQnaResaveAction();
		}
		return action;
	}
}