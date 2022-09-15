<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>
	<div id="container">
		<script type="text/javascript"
			src="/hfm_pc/resources/js/display/display.js?timestamp=20220907151706"></script>


		<section class="content-response">
			<!-- type2 저거를 뺐음 기존 클래스 명은 page-title type2 임 -->
			<!-- <h2 class="page-title type2"> -->
			<h2 class="page-title">FILA</h2>
			<div class="wrap-product-list">
				<div class="list-head">
					<div class="list-filter open">
						<div class="filter-layer" id="filterLayer">
							<div class="filter-menu category"></div>
							<div class="cell">
								<div class="select">
									<button type="button" class="sel-btn"
										onclick="select.trigger();">신상품순</button>
									<div class="sel-list">
										<ul id="sortGodColum">
											<li><label><input type="radio" name="pdSort"
													value="NEW_GOD_SEQ" checked=""> <span>신상품순</span></label></li>
											<li><label><input type="radio" name="pdSort"
													value="SALE_QTY_SEQ"> <span>인기상품순</span></label></li>
											<li><label><input type="radio" name="pdSort"
													value="LWET_PRC_SEQ"> <span>낮은가격순</span></label></li>
											<li><label><input type="radio" name="pdSort"
													value="BEST_PRC_SEQ"> <span>높은가격순</span></label></li>
											<li><label><input type="radio" name="pdSort"
													value="BEST_DC_SEQ"> <span>할인율순</span></label></li>
											<li><label><input type="radio" name="pdSort"
													value="BEST_CHOISE_SEQ"> <span>마이클로젯순</span></label></li>
										</ul>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<ul class="product-list" id="productsList">
					<li godno="GP4V22081779202">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779202"
							data-ga-name="[FILA] 헤리티지 우먼스 다운자켓 (FS2DJD4151F_BLK)"
							data-ga-brand="FILA" data-ga-price="129000">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779202')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779202_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 헤리티지 우먼스 다운자켓 (FS2DJD4151F_BLK)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779202_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 헤리티지 우먼스 다운자켓 (FS2DJD4151F_BLK)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779202">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779202');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779202')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 헤리티지 우먼스 다운자켓
										(FS2DJD4151F_BLK)</div>
									<div class="item-price">
										<span class="price">129,000</span>
										<del class="regular">219,000</del>
										<span class="percent">41%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779204">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779204"
							data-ga-name="[FILA] 와펜 트레이닝 집업 (FS2FTE1181X_INA)"
							data-ga-brand="FILA" data-ga-price="44500">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779204')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779204_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 와펜 트레이닝 집업 (FS2FTE1181X_INA)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779204">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779204');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779204')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 와펜 트레이닝 집업
										(FS2FTE1181X_INA)</div>
									<div class="item-price">
										<span class="price">44,500</span>
										<del class="regular">89,000</del>
										<span class="percent">50%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779200">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779200"
							data-ga-name="[FILA] 팝콘 보아 카라 자켓 (FS2PLD4101X_BLK)"
							data-ga-brand="FILA" data-ga-price="59000">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779200')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779200_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 팝콘 보아 카라 자켓 (FS2PLD4101X_BLK)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779200">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779200');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779200')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 팝콘 보아 카라 자켓
										(FS2PLD4101X_BLK)</div>
									<div class="item-price">
										<span class="price">59,000</span>
										<del class="regular">119,000</del>
										<span class="percent">50%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779217">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779217"
							data-ga-name="[FILA] 팝콘 보아 후드 자켓 (FS2PLD4102X_STO)"
							data-ga-brand="FILA" data-ga-price="59000">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779217')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779217_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 팝콘 보아 후드 자켓 (FS2PLD4102X_STO)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779217">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779217');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779217')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 팝콘 보아 후드 자켓
										(FS2PLD4102X_STO)</div>
									<div class="item-price">
										<span class="price">59,000</span>
										<del class="regular">109,000</del>
										<span class="percent">46%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779207">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779207"
							data-ga-name="[FILA] 아카이브 그래픽 후디 (FS2POD4104X_BLK)"
							data-ga-brand="FILA" data-ga-price="49000">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779207')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779207_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 아카이브 그래픽 후디 (FS2POD4104X_BLK)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779207">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779207');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779207')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 아카이브 그래픽 후디
										(FS2POD4104X_BLK)</div>
									<div class="item-price">
										<span class="price">49,000</span>
										<del class="regular">79,000</del>
										<span class="percent">38%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779197">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779197"
							data-ga-name="[FILA] 여성 V넥 풀오버 (FS2POE1155F_BLK)"
							data-ga-brand="FILA" data-ga-price="34500">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779197')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779197_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 여성 V넥 풀오버 (FS2POE1155F_BLK)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779197">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779197');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779197')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 여성 V넥 풀오버 (FS2POE1155F_BLK)</div>
									<div class="item-price">
										<span class="price">34,500</span>
										<del class="regular">69,000</del>
										<span class="percent">50%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779203">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779203"
							data-ga-name="[FILA] 여성 V넥 풀오버 (FS2POE1155F_GSU)"
							data-ga-brand="FILA" data-ga-price="34500">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779203')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779203_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 여성 V넥 풀오버 (FS2POE1155F_GSU)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779203">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779203');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779203')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 여성 V넥 풀오버 (FS2POE1155F_GSU)</div>
									<div class="item-price">
										<span class="price">34,500</span>
										<del class="regular">69,000</del>
										<span class="percent">50%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779199">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779199"
							data-ga-name="[FILA] 베이직 우븐 포켓 팬츠 (FS2WPE1181X_BLK)"
							data-ga-brand="FILA" data-ga-price="69300">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779199')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779199_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 베이직 우븐 포켓 팬츠 (FS2WPE1181X_BLK)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779199_1_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 베이직 우븐 포켓 팬츠 (FS2WPE1181X_BLK)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779199">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779199');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779199')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 베이직 우븐 포켓 팬츠
										(FS2WPE1181X_BLK)</div>
									<div class="item-price">
										<span class="price">69,300</span>
										<del class="regular">99,000</del>
										<span class="percent">30%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779182">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779182"
							data-ga-name="[FILA] 헤리티지 우먼스 다운자켓 (FS2DJD4151F_CRM)"
							data-ga-brand="FILA" data-ga-price="129000">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779182')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779182_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 헤리티지 우먼스 다운자켓 (FS2DJD4151F_CRM)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779182">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779182');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779182')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 헤리티지 우먼스 다운자켓
										(FS2DJD4151F_CRM)</div>
									<div class="item-price">
										<span class="price">129,000</span>
										<del class="regular">219,000</del>
										<span class="percent">41%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
					<li godno="GP4V22081779181">
						<!-- 대형 이미지 클래스 product-sp-->
						<figure class="item-box" data-ga-id="GP4V22081779181"
							data-ga-name="[FILA] 헤리티지 우먼스 다운자켓 (FS2DJD4151F_LBU)"
							data-ga-brand="FILA" data-ga-price="129000">
							<div class="item-img">
								<div class="img-box">
									<a href="javascript:void(0);"
										onclick="goGodDetail('GP4V22081779181')">
										<div class="img">
											<img
												src="https://cdn.hfashionmall.com/goods/HFBR/22/08/17/GP4V22081779181_0_ORGINL.jpg?RS=600x600&amp;AR=0&amp;CS=400x600"
												alt="[FILA] 헤리티지 우먼스 다운자켓 (FS2DJD4151F_LBU)"
												onerror="this.src='/hfm_pc/resources/images/temp/pd_430x644.jpg'">
										</div>
									</a>
								</div>
								<button type="button" class="btn-like" onclick="likeGod(this);"
									godno="GP4V22081779181">
									<span>좋아요</span>
								</button>
								<button type="button" class="btn-quick"
									onclick="showProductQuickView('GP4V22081779181');">
									<span>상품 퀵뷰</span>
								</button>
							</div>
							<figcaption class="item-info">
								<a href="javascript:void(0);"
									onclick="goGodDetail('GP4V22081779181')">
									<div class="item-brand">FILA</div>
									<div class="item-name">[FILA] 헤리티지 우먼스 다운자켓
										(FS2DJD4151F_LBU)</div>
									<div class="item-price">
										<span class="price">129,000</span>
										<del class="regular">219,000</del>
										<span class="percent">41%</span>
									</div>
									<div class="item-color">
										<span class="pdColor-" value=""></span>
									</div>
									<div class="item-label">
										<span class="label2">할인</span> <span class="label3">쿠폰</span>
									</div>
								</a>
							</figcaption>
						</figure>
					</li>
				</ul>

				<div class="paging" id="pagingArea">
					<span> <strong title="현재 페이지">1</strong> <a
						href="javascript:void(0)" id="page_2" onclick="movePage('2')">2</a>
						<a href="javascript:void(0)" id="page_3" onclick="movePage('3')">3</a>
						<a href="javascript:void(0)" id="page_4" onclick="movePage('4')">4</a>
						<a href="javascript:void(0)" id="page_5" onclick="movePage('5')">5</a>
						<a href="javascript:void(0)" id="page_6" onclick="movePage('6')">6</a>
					</span>
				</div>
			</div>
		</section>
		<script type="text/javascript"
			src="/hfm_pc/resources/js/filter.js?timestamp=20220907151706"></script>
		<script type="text/javascript"
			src="/hfm_pc/resources/js/libs/nouislider.min.js?timestamp=20220907151706"></script>

		<script>
			var grdCd = 'GNRL';
			var brndIdx = 0;
			$(document)
					.ready(
							function() {
								if ($("#visualSlide").length > 0) {
									slide.create('visualSlide');
								}
								if ($("#visualSlide10").length > 0) {
									var obj = $("#visualSlide10").find(
											".product-list").find(
											"ul:first  > li");
									if (obj != null && obj != 'undefined'
											&& obj.length > 5) {
										slide.create('visualSlide10');
										$("#brndCnrBestSellerSlideBtn").show();
									}
								}
								if ($("#banner1").length > 0) {
									slide.create('banner1');
								}
								if ($("#visualSlide2").length > 0) {
									slide.create('visualSlide2');
								}
								if ($("#visualSlide10-1").length > 0) {
									var obj = $("#visualSlide10-1").find(
											".product-list").find(
											"ul:first  > li");
									if (obj != null && obj != 'undefined'
											&& obj.length > 5) {
										//slide.create('visualSlide15');
										slide.bind('#visualSlide10-1',
												'opt4 nav auto');
										$("#btnKwdCnrGod").show();
									}
								}
								if ($("#visualSlide3").length > 0) {
									slide.create('visualSlide3');
								}
								if ($("#visualSlide6").length > 0) {
									slide.create('visualSlide6');
								}
								//slide.create 해야 함. UI 계짐.
								if ($("#visualSlide4").length > 0) {
									slide.create('visualSlide4');
								}
								if ($("#visualSlide13").length > 0) {
									var obj = $("#visualSlide13").find(
											".slide-container").find(
											"ul:first  > li");
									if (obj != null && obj != 'undefined'
											&& obj.length > 1) {
										slide.create('visualSlide13');
										$("#btnCnrConttMoviCampaing").show();
									}
								}
								if ($("#visualSlide7").length > 0) {
									slide.create('visualSlide7');
								}
								if ($("#visualSlide5").length > 0) {
									slide.create('visualSlide5');
								}

								if ($("input[name=brndCnrBesGodBrndIds]").length > 0) {
									$("input[name=brndCnrBesGodBrndIds]").each(
											function(idx) {
												// dspCtgryNo, otltYn, brndId, bestPageYn, godListSize, parentElementId
												getBestGod('', 'N', $(this)
														.val(), '', 20,
														'ulBrndCnrBestGodList_'
																+ idx);
											});
								}

								if ($('.dp-section.page-top .dp-concept').length) {
									$('.dp-main.dp-main-sub .theme-color').css(
											"height", 552);
								} else if ($('.dp-section .dp-concept').length === 0
										&& $('#visualSlide').length === 0) {
									$('.dp-main.dp-main-sub .theme-color').css(
											"height", 210);
								}

								getSearchFilterLayer();
								$(".sel-btn").text(
										$("#sortGodColum").find(
												"[name='pdSort']:checked")
												.parent().find("span").text());
								getGodIconList(grdCd, "#productsList");

								//인스타 그램 피드 가져오기
								if ($("#instagramContentSection").length > 0) {
									getInstaFeed();
								}
							});

			/**
			 * 상품 찜하기
			 *
			 * @param obj
			 */
			function likeGod(obj) {

				alert("로그인 후 이용가능합니다.");
				location.href = "/public/member/login";

			}

			function fnc_kwdCnrGodChange(obj, idx) {
				if ($(obj) != null && $(obj) != 'undefined'
						&& !$(obj).hasClass("active")) {
					$(obj).siblings().removeClass("active");
					$(obj).addClass("active");

					var elGodList = $("#ulKwdCnrGodList");
					var elGodListWrap = elGodList.parent();
					var elNewGodList = $("#ulKwdCnrGodList_" + idx);
					var elBtnKwdCnrGod = $("#btnKwdCnrGod");

					if (elNewGodList != null && elNewGodList != 'undefined'
							&& elGodList != null && elGodList != 'undefined') {
						elGodListWrap.children().remove();
						elGodListWrap.html(elNewGodList[0].outerHTML);
						elGodListWrap.find('ul').attr('id', "ulKwdCnrGodList");
						elGodListWrap.find('ul').show();
						elBtnKwdCnrGod.hide();
						if (elGodListWrap.find('ul li').length > 5) {
							//slide.create('visualSlide15');
							slide.bind('#visualSlide10-1', 'opt4 nav auto');
							elBtnKwdCnrGod.show();
						}
					}
				}
			}

			function fnc_brndCnrBestGodChange(obj, idx) {
				if ($(obj) != null && $(obj) != 'undefined'
						&& !$(obj).hasClass("on")) {
					$(obj).siblings().removeClass("on");
					$(obj).addClass("on");

					var elGodList = $("#ulBrndCnrBestGodList");
					var elGodListWrap = elGodList.parent();
					var elNewGodList = $("#ulBrndCnrBestGodList_" + idx);
					var elBtnKwdCnrGod = $("#brndCnrBestSellerSlideBtn");

					if (elNewGodList != null && elNewGodList != 'undefined'
							&& elGodList != null && elGodList != 'undefined') {
						brndIdx = idx;
						elGodListWrap.children().remove();
						elGodListWrap.html(elNewGodList[0].outerHTML);
						elGodListWrap.find('ul').attr('id',
								"ulBrndCnrBestGodList");
						elGodListWrap.find('ul').show();
						elBtnKwdCnrGod.hide();
						if (elGodListWrap.find('ul li').length > 5) {
							slide.create('visualSlide10');
							elBtnKwdCnrGod.show();
						}
					}
				}
			}

			function getSearchFilterLayer() {
				var params = {};

				params['mallGubun'] = "BRND";
				params['otltYn'] = '';
				params['mostYn'] = 'N';

				if ('N' == 'Y') {
					params['upperBrandId'] = 'FLHGR';
				} else {
					params['brandId'] = 'FLHGR';
				}

				getFilterLayer(params);
			}
			var paramObj = {
				"brndCtgryNo" : "BDMA21A09"
			};

			function getInstaFeed() {
				var dspBrndId = $("#instagramContentSection").attr("dspBrndId");

				$
						.ajax({
							type : "GET",
							async : true,
							url : "/display/getInstaFeed",
							data : {
								"dspBrndId" : dspBrndId
							},
							beforeSend : function(request) {
								var csrfToken = $("meta[name='_csrf']").attr(
										"content");
								var csrfName = $("meta[name='_csrf_header']")
										.attr("content");
								request.setRequestHeader(csrfName, csrfToken);
							},
							success : function(data) {
								$("#instagramContentSection").find(
										".style-tile-sns").html(data);

								if ($("#instagramContentSection").find(
										".style-tile-sns li").length < 1) {
									$("#instagramContentSection").remove();
								}
							},
							error : function(pa_data, status, err) {
								console.log(err);

							},
							complete : function() {
							}
						});
			}

			//braze Web - Brand Event send
			try {
				appboy.logCustomEvent("hfashion_brand", {
					brand : 'FILA',
					brandCateNo : 'BDMA21A09'
				});
			} catch (e) {
				console.log(e);
			}
		</script>
	</div>
</body>

<%@ include file="../footer.jsp"%>