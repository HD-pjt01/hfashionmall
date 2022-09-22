<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="container">
	<!-- 요약창 부분 -->
	<div id="mypage_summ">
		<ul id="mypage_summ_ul">
			<li id="summ_first">
				<div class="top">
					<span id="name" class="bold">${sessionScope.loginUser.member_name}</span>
					<span id="name_top" class="text">님</span>
				</div>
				<div class="bottom">
					<span id="name_bottom" class="text">환영합니다.</span>
				</div>
			</li>
			<li id="summ_last">
				<div class="top">
					<span id="del_top" class="text">배송중인 주문</span>
				</div>
				<div class="bottom">
					<!-- 진행중인 주문 리스트와 개수 -->
					<span id="del" class="bold"><a href="#">10</a></span> <span
						id="del_bottom" class="text">건</span>
				</div>
			</li>
		</ul>
	</div>





	<!-- <script>
	const pointer_tr = document.getElementsByClassName('pointer_tr');
	const rateField = document.getElementsByClassName('rateField');

	document.getElementsByClassName('reviewWrite_tr').addEventListener('click', function() {
		/* rateField.classList.toggle('view_hide'); */
		alert('hi');
	});
</script> -->

	<!-- <style>
.view_hide {
	display: none;
} 
</style>-->
<script>
let pointer_tr = document.getElementsByClassName('reviewWrite_tr');

pointer_tr.onclick = function() {
  alert('정답입니다!');
}
</script>

	<article>
		<h2>My Page(${title})</h2>


		<table id="cartList">
			<tr>
				<th>주문일자</th>
				<th>상품명</th>
				<th>결제 금액</th>
			</tr>


			<c:forEach items="${orderList}" var="orderVO">

				<!-- 이 리스트를 선택하면 리뷰 창이 생성 -->
				<tr class="reviewWrite_tr" id="reviewWrite">
					<td><fmt:formatDate value="${orderVO.order_register}"
							type="date" /></td>
					<td>${orderVO.pname}</td>
					<td><fmt:formatNumber value="${orderVO.price}" type="currency" /></td>
				</tr>

				<!-- 작성칸 -->

				<tr>

					<td id="id1" class="rateField view_hide" colspan="5">
						별점 할 때 사용					
							<div class="rate_star_wrapper">
							<%
								for (int i = 0; i < 5; i++) {
							%>
							<input type="radio" class="rate_star"
								id="rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%>" name="r_rate"
								value="<%=i + 1%>">

							<script>
											const rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%> = document.getElementById('rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%>');
							</script>

							<label for="rate_star<%=i + 1%>_<%=o_index%>_<%=p_code%>"
								id="lable_star<%=i + 1%>_<%=o_index%>_<%=p_code%>"> <i
								class="nStar far fa-star"></i>
							</label>
							<%
								}
							%>
							<input type="hidden" name="o_index" value="<%=o_index%>">
							<input type="hidden" name="p_code" value="<%=p_code%>"> <input
								type="hidden" name="id" value="<%=id%>">
						</div>

						<div class="r_content_wrapper">
							<form name="review" id="review" method="post"
								action="hfashionmallServlet?command=review_write&od_id=${orderVO.order_detail_id}">
								<textarea name="r_content" id="reviewText" style="resize: none;"></textarea>
								<input type="hidden" name="od_id"
									value="${orderVO.order_detail_id}">
								<!-- 여기서 서블렛으로 od_id값을 넘겨줌 -->
							</form>
						</div> 							<script>
										const reviewText_<%=o_index%>_<%=p_code%> = document.getElementById('reviewText_<%=o_index%>_<%=p_code%>
								');
							</script>

						<button type="submit" form="review">작성</button>

					</td>

				</tr>
				<!-- 작성칸 -->

			</c:forEach>
		</table>

		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="쇼핑 계속하기" class="cancel"
				onclick="location.href='hfashionmallServlet?command=index'">
		</div>

	</article>
</div>
<%@ include file="../footer.jsp"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<body>
	<script type="text/javascript">
		$(function() {
			$('.btn-type3-sm').click(function() {
				$('#reviewPopup').show();
			});
		});

		$(function() {
			$('#reviewClose').click(function() {
				$('#reviewPopup').hide();
			});
		});
	</script>
	<div class="wrap">
		<div id="container">
			<section class="content-wrap">
				<div class="snb-wrap">
					<h2 class="lnb-title">
						<a href="/secured/mypage/myPage">MYPAGE</a>
					</h2>
					<nav id="lnb" class="lnb">
						<ul>
							<li>
								<div class="menu-depth1">주문 조회</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=mypage">주문 완료 주문 조회</a></li>
									<li><a href="hfashionmallServlet?command=order_all">배송 완료 주문 조회</a></li>
									<li><a href="hfashionmallServlet?command=cart_list">장바구니 내역</a></li>
								</ul>
							</li>
							<li>
								<div class="menu-depth1">리뷰 관리</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=mypage_review">리뷰 쓰기</a></li>
									<li><a href="hfashionmallServlet?command=review_list">나의 상품리뷰</a></li>
								</ul>
							</li>
							<li>
								<div class="menu-depth1">QnA 조회</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=qna_view">1:1 문의 내역</a></li>
								</ul>
							</li>
							<li>
								<div class="menu-depth1">회원정보</div>
								<ul class="menu-depth2">
									<li><a href="hfashionmallServlet?command=mypage_edit">회원정보 수정</a></li>
									<li><a href="hfashionmallServlet?command=mypage_out">회원 탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				<div class="snb-content-wrap">
					<script type="text/javascript" src="/resources/js/moment.js"></script>
					<script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220914145945"></script>

					<input type="hidden" name="_csrf" value="c0a1f299-9cc0-47ee-a547-1ac477b0abb0" /> <input type="hidden" id="srchMonth" name="srchMonth" value="" /> <input type="hidden" name="srchType" id="srchType" value="A" />

					<h3 class="page-title">리뷰 작성 가능 주문</h3>

					<div class="page-info">
						<p class="txt-type3">배송 완료 상품에 한해 리뷰 작성이 가능합니다.</p>
					</div>

					<!-- period-search-group -->
					<div class="period-search-group">
						<dl class="period-btns-box">
							<dt>기간</dt>
							<dd>
								<div class="period-btns">
									<label> <input type="radio" name="period" onclick="setDay('-15');" checked="" /> <span>15일</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('oMouth');" /> <span>1개월</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('tMouth');" /> <span>3개월</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('sMouth');" /> <span>6개월</span>
									</label> <label> <input type="radio" name="period" onclick="setMonth('yMouth');" /> <span>12개월</span>
									</label>
								</div>
							</dd>
						</dl>


					</div>
					<script>
						$(".datepicker").datepicker({
							showOn : "button",
							buttonImage : "/resources/images/btn_calendar.png",
							buttonImageOnly : false,
							buttonText : "날짜 선택",
						});
					</script>
					<!-- //period-search-group -->

					<div id="includeOrderList" class="order-list-wrap">
						<!-- 다이나믹 컨피그 설정 HFM_EQL_CONN_YN ERP 연동 유무 -->
						<script type="text/javascript" src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220914145945"></script>

						<input type="hidden" id="viewType" name="viewType" value="" /> <input type="hidden" id="page" name="page" value="1" /> <input type="hidden" id="pageSize" name="pageSize" value="10" /> <input type="hidden" id="total_page" name="total_page" value="" /> <input type="hidden" id="totalCount" name="totalCount" value="" /> <input type="hidden" id="statCd" name="statCd" value="" /> <input type="hidden" id="srchFlag" name="srchFlag" value="ORD" />
						<!-- includeOrderList -->


						<c:choose>
							<c:when test="${orderList.size() == 0}">
								<div class="nodata">
									<p class="txt-nodata">최근 주문 상품이 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${orderList}" var="orderVO">
									<div class="order-tbl order-history">
										<div class="head">
											<div class="cell-order-id">
												<span class="order-date">${orderDetail.order_register} </span>
											</div>
										</div>
										<!-- //head -->

										<!-- body -->
										<div class="body">
											<div class="row plural">
												<div class="inner">
													<div class="cell-pd-wrap">
														<!-- inner-row -->
														<div class="inner-row">
															<!-- 상품한개씩 -->
															<!-- info-row -->
															<div class="info-row">
																<div class="cell-pd">
																	<div class="item-img">
																		<a href="javascript:void(0);" onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');"> <img src="product_images/${orderVO.product_code}_01.jpg" /></a>
																	</div>

																	<div class="item-info">
																		<!-- <div class="item-brand">
                                              <a
                                                href="javascript:void(0);"
                                                onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');"
                                              >
                                                TOMMY HILFIGER MEN
                                              </a>
                                            </div> -->
																		<div class="item-name clear-ellipsis">
																			<a href="javascript:void(0);" onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');">${orderVO.pname} </a>
																		</div>
																		<div class="item-opt">
																			<span> BLACK , F </span> <span>수량 : ${orderVO.product_count}</span>
																		</div>
																	</div>
																</div>
																<div class="cell-price">
																	<div class="cell-inner">
																		<div class="price">
																			<span><span class="num">${orderVO.price*orderVO.product_count}</span> 원</span>
																		</div>
																	</div>
																</div>

																<div class="cell-status">
																	<!-- 셀이 합쳐질 경우 class="rowspan" -->
																	<div class="cell-inner">
																		<div class="status"></div>
																	</div>
																</div>
																<div class="cell-btn">
																	<!-- 셀이 합쳐질 경우 class="rowspan" -->
																	<div class="cell-inner">
																		<div class="btns"></div>
																	</div>
																</div>
															</div>
															<!-- //info-row  구성상품 단위 -->
														</div>
														<!-- inner-row 그룹단위(패키지, 단품, 주문할인) -->

														<!-- 전체취소되었거나 전체취소 가능시에 하나로 묵어서 표시 -->
														<div class="cell-status rowspan2">
															<!-- 셀이 합쳐질 경우 class="rowspan" -->
															<div class="cell-inner">
																<div class="status">
																	배송 완료
																	<br />
																	<span class="txt-cmt pcolor">리뷰 작성 가능</span>
																</div>
															</div>
														</div>
														<div class="cell-btn rowspan2">
															<!-- 셀이 합쳐질 경우 class="rowspan" -->
															<div class="cell-inner">
																<div class="btns">
																	<button type="button" id="reviewWrite" class="btn-type3-sm">
																		<span>리뷰 작성</span>
																	</button>
																</div>
															</div>
														</div>
														<!--  그룹단위 -->
													</div>
													<!--  cell-pd-wrap -->
												</div>
												<!--  inner -->
											</div>
											<!-- //row -->
										</div>
										<!--  body  단위 -->
									</div>
									<!-- 주문번호 order-tbl -->

									<!-- 모달 테스트  -->
									<div id="reviewPopup" style="display: none;">
										<form id="review" name="review" method="post" action="hfashionmallServlet?command=review_write&od_id=${orderVO.order_detail_id}">
											<div id="reviewEdit" class="layer-pop lg review-layer" tabindex="0" style="display: block;">
												<input type="hidden" name="godNo" value="GM0122090888720">
												<div class="layer-wrap" tabindex="0">
													<div class="layer-header">
														<h2 class="layer-title">리뷰 작성</h2>
													</div>
													<div class="layer-container">
														<div class="layer-content review-write">
															<div class="write-inner">
																<section class="write-section">
																	<h3 class="sub-title">1. 상품</h3>
																	<p class="review-product-name">${orderVO.pname}</p>
																</section>


																<section class="write-section">
																	<h3 class="sub-title">
																		2 . 리뷰를 작성해 주세요 <span class="required">(필수)</span>
																	</h3>
																	<textarea cols="30" rows="10" id="r_content" name="r_content" title="좋은 점 작성" maxlength="1000" placeholder="상품 문의는 상품 정보 우측 하단의 [상품문의] 버튼을 누르시거나, 또는 [MY PAGE > 리뷰 및 문의 > 1:1문의] 메뉴를 이용해 주시기 바랍니다."></textarea>
																	<input type="hidden" name="od_id" value="${orderVO.order_detail_id}">
																	<!-- 여기서 서블릿으로 전달  -->
																	<span class="str-length"><span id="reviewContLength">0</span>/1,000</span>
																</section>

																<!--  </div>
                    <div class="write-inner"> -->

																<!--                                 <section class="write-section">
                            <h3 class="sub-title">6. 평점을 남겨주세요. <span class="required">(필수)</span></h3>
                            <div class="point-select">
                                <span>
                                    <input type="radio" name="godGodEvl.totEvlScore" id="pdPointSel5" value="5">
                                    <label for="pdPointSel5">5점</label>
                                    <input type="radio" name="godGodEvl.totEvlScore" id="pdPointSel4" value="4">
                                    <label for="pdPointSel4">4점</label>
                                    <input type="radio" name="godGodEvl.totEvlScore" id="pdPointSel3" value="3">
                                    <label for="pdPointSel3">3점</label>
                                    <input type="radio" name="godGodEvl.totEvlScore" id="pdPointSel2" value="2">
                                    <label for="pdPointSel2">2점</label>
                                    <input type="radio" name="godGodEvl.totEvlScore" id="pdPointSel1" value="1">
                                    <label for="pdPointSel1">1점</label>
                                </span>
                            </div>
                            </section> -->

															</div>

															<section class="alert-section">
																<h3 class="sub-title">상품리뷰 작성시 주의사항</h3>
																<ul class="txt-list">
																	<li>작성하신 리뷰는 마이페이지에서 확인 가능합니다.</li>
																	<li>작성하신 리뷰는 상품상세 외 H패션몰 내 다른 화면에서 판매 목적으로 전시될 수 있습니다. ( ex. 메인, 프로모션 리뷰 PLUS, STYLE 콘텐츠 등)</li>
																	<li>리뷰 작성 시 이메일, 휴대폰번호 등 개인정보 입력은 금지되어있습니다.<br>개인 정보 입력 시 발생하는 모든 피해 및 저작권 침해에 대한 책임은 작성자에게 있습니다.
																	</li>
																	<li>다음과 같은 경우 작성하신 리뷰가 통보없이 미노출 처리될 수 있으며, 리뷰 포인트가 미지급될 수 있습니다.
																		<ul class="txt-list2">
																			<li>상품상세 이미지를 캡쳐해서 사용</li>
																			<li>타 회원의 리뷰 이미지를 도용</li>
																			<li>리뷰내용이 부적합하거나 비속어 사용</li>
																		</ul>
																	</li>
																</ul>
															</section>
															<div class="btn-box">
																<button type="submit" form="review" class="btn-type2-lg">
																	<span>등록</span>
																</button>
															</div>

														</div>
													</div>
													<!--   <button type="button" id="reviewClose" class="btn-layer-close" onclick="layer.close('reviewEdit');">닫기</button> -->
													<button type="button" id="reviewClose" class="btn-layer-close">닫기</button>
												</div>
											</div>
										</form>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>

						<!-- head -->



						<!--  주문번호  -->
						<div class="paging">
							<span> <strong title="현재 페이지" class="btn-page selected">1 </strong>
							</span>
						</div>
						<!-- includeOrderList 생성 페이지 이동 끝 -->

						<h4 class="sec-title">주문/배송 단계 안내</h4>
						<div class="process-img-guide">
							<ol class="order-process">
								<li>입금대기</li>
								<li>결제완료</li>
								<li>상품준비중</li>
								<li>배송중</li>
								<li>배송완료</li>
							</ol>
						</div>

						<div class="process-txt-guide">
							<ol>
								<li><strong class="title">1. 입금대기</strong>
									<div class="txt">
										주문이 정상적으로 접수 되었습니다.
										<br />
										결제 방법을 현금 입금으로 선택하신 경우, 정해진 기간내에 입금이 완료 되어야
										<br />
										결제완료 단계로 진행됩니다. 정해진 기간 경과시, 주문은 자동 취소 됩니다.
									</div></li>
								<li><strong class="title">2. 결제완료</strong>
									<div class="txt">주문, 결제/입금이 최종 완료 되었습니다. 배송정보 수정 및 주문최소가 가능합니다.</div></li>
								<li><strong class="title">3. 상품준비중</strong>
									<div class="txt">
										상품의 재고를 확인하고, 상품의 택배 배송을 위해 준비하는 단계 입니다.
										<br />
										(배송 준비중인 경우, 주문취소가 불가할 수 있습니다. 자세한 사항은
										<br />
										고객센터(1800-5700) 또는 1:1게시판으로 문의 부탁 드립니다.)
									</div></li>
								<li><strong class="title">4. 배송중</strong>
									<div class="txt">
										택배사에 상품이 인계되어 고객님께 배송중입니다. 도서/산간 지역을 제외한 지역의경우,
										<br />
										통상적으로 2~3일 정도 소요됩니다. 배송 추적이 가능합니다.
									</div></li>
								<li><strong class="title">5. 배송완료</strong>
									<div class="txt">
										해당 물품을 고객님께서 수령하여 배송이 완료된 상태입니다. 포인트 적립 및 상품평
										<br />
										작성이 가능합니다. 배송 완료 7일 이내에만 반품 및 교환 신청이 가능 합니다.
									</div></li>
							</ol>
						</div>

						<!-- 리뷰 작성 팝업 -->
						<div id="getGoodsReviewPopup"></div>
						<div id="layerTracking" class="layer-pop" tabindex="0"></div>


					</div>

					<!-- s : 리뷰 작성 / 수정 레이어 팝업-->
					<div id="__dialogReview__"></div>
					<!-- s: popup - 배송 조회 -->

					<div id="deliveryInfoPopup" class="ui-dialog-contents" title="배송 조회">
						<div class="dialog-contents-flex">
							<div class="delivery-info-box">
								<div class="tbl-wrap tbl-row">
									<table id="dlvTabUser"></table>
								</div>

								<div class="tbl-wrap tbl-col">
									<table id="dlvTabInfo"></table>
								</div>
							</div>
						</div>
					</div>


				</div>
			</section>
		</div>
	</div>

</body>

<%@ include file="../footer.jsp"%>
