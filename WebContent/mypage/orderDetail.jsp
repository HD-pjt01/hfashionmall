<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>
<article>
	<h2>My Page(주문 상세 정보)</h2>
	<form name="formm" method="post">
		<h3>주문자 정보</h3>
		<table id="cartList">
			<tr>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문 총액</th>
			</tr>
			<tr>
				<td><fmt:formatDate value="${orderDetail.order_register}" type="date" /></td>
				<td>${orderDetail.order_id}</td>
				<td>${orderDetail.mname}</td>
				<td><fmt:formatNumber type="currency" value="${totalPrice}" /></td>
			</tr>
		</table>
		<h3>주문 상품 정보</h3>
		<table id="cartList">
			<tr>
				<th>상품명</th>
				<th>상품별주문번호</th>
				<th>수량</th>
				<th>가격</th>
				<th>처리 상태</th>
			</tr>
			<c:forEach items="${orderList}" var="orderVO">
				<tr>
					<td>${orderVO.pname}</td>
					<td>${orderVO. order_detail_id}</td>
					<td>${orderVO.product_count}</td>
					<td><fmt:formatNumber type="currency" value="${orderVO.price*orderVO.product_count}" /></td>
					<td><c:choose>
							<c:when test='${orderVO.order_detail_result=="1"}'> 진행중 </c:when>
							<c:otherwise>
								<span style="color: red"> 처리완료 </span>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>

		<div class="clear"></div>
		<div id="buttons">
			<input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='hfashionmallServlet?command=index'">
		</div>
	</form>
</article>
	<%@ include file="../footer.jsp"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body>
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

					<h3 class="page-title">주문/배송</h3>

					<div class="page-info">
						<p class="txt-type3">주문내역 및 배송상태를 조회하실 수 있습니다.</p>
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
																		<a href="javascript:void(0);" onclick="goGoodDetail('GM0121011331478', 'Y', 'SALE_PROGRS', 'Y');"> 
																		<img src="product_images/${orderVO.product_code}_01.jpg" /></a>
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
																	<span class="txt-cmt pcolor"> <span class="num"> ${orderVO.order_detail_result} </span>
																	</span>
																</div>
															</div>
														</div>
														<div class="cell-btn rowspan2">
															<!-- 셀이 합쳐질 경우 class="rowspan" -->
															<div class="cell-inner">
																<div class="btns">
																	<button type="button" class="btn-type3-sm" onclick="jsUnitCancel('OD202209154384813', 'Y', 'N');">
																		<span>주문취소</span>
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

						<script type="text/javascript">
							$(document)
									.ready(
											function() {
												$("#dialogShortage")
														.on(
																"click",
																function(e) {
																	e
																			.preventDefault();
																	$(
																			"#shortageText")
																			.html(
																					$(
																							this)
																							.data(
																									"type"));
																	$(
																			"#dialogShortageText")
																			.dialog(
																					"open");
																});
											});
							function dlvStatusInfo(th) {
								var dlvComCd = $(th).data("comcd");
								var dmstcwayBilNo = $(th).data("dmstcwaybilno");
								var dlvComNm = $(th).data("comnm");
								var cstmrNm = $(th).data("cstmrnm");
								var addrseNm = $(th).data("addrsenm");
								var baseAddr = $(th).data("baseaddr");
								var detailAddr = $(th).data("detailaddr");
								var strParams = "";
								strParams = {
									dlvComCd : dlvComCd,
									dmstcWaybilNo : dmstcwayBilNo,
									dlvComNm : dlvComNm,
									cstmrNm : cstmrNm,
									addrseNm : addrseNm,
									baseAddr : baseAddr,
									detailAddr : detailAddr,
									_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
								};
								$
										.ajax({
											type : "POST",
											data : strParams,
											url : "/secured/mypage/order/dlvStatusInfoList",
											dataType : "html",
											success : function(data) {
												$("#layerTracking").html(data);
												layer.init("layerTracking");
												layer.open("layerTracking");
											},
											error : function() {
												//openAlert('Loading Error');
											},
										});
							}
							function goPrev() {
								var page = parseInt($("#page").val()) - 1;
								if (page <= 0) {
									page = 1;
								}
								var statCd = $("#statCd").val();
								fnSearchMore(page, statCd);
							}
							function goNext() {
								var page = parseInt($("#page").val()) + 1;
								if (page > $("#total_page").val()) {
									page = $("#total_page").val();
								}
								var statCd = $("#statCd").val();
								fnSearchMore(page, statCd);
							}
							//주문취소
							function jsUnitCancel(ordNo, cnclPsblYn,
									lstClmPrgsYn) {
								if (cnclPsblYn == "Y") {
									jsLinkUrlPost(
											"/secured/mypage/claimAccept",
											{
												_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
												ordNo : ordNo,
											});
								} else if (lstClmPrgsYn == "Y") {
									alert("추가 결제가 필요한 클레임이 존재합니다.\n 추가 결제완료 후 접수가 가능합니다.");
								} else {
									alert("주문상품(패키지 또는 주문할인)과 일부 할인수단 및 결제수단을 사용한 주문은 전체취소만 가능합니다.\n 주문취소에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
								}
								return false;
							}
							//반품신청
							function jsRequestForReturn(ordNo, rtnPsblYn,
									lstClmPrgsYn) {
								if (rtnPsblYn == "Y") {
									jsLinkUrlPost(
											"/secured/mypage/requestForReturn",
											{
												_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
												ordNo : ordNo,
											});
								} else if (lstClmPrgsYn == "Y") {
									alert("추가 결제가 필요한 클레임이 존재합니다.\n 추가 결제완료 후 접수가 가능합니다.");
								} else {
									alert("주문상품(패키지 또는 주문할인)과 일부 할인수단 및 결제수단을 사용한 주문은 전체반품만 가능합니다.\n 반품에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
								}
								return false;
							}
							//교환신청
							function jsExchangeClaim(ordNo, exchPsblYn,
									lstClmPrgsYn) {
								if (exchPsblYn == "Y") {
									jsLinkUrlPost(
											"/secured/mypage/exchangeClaim",
											{
												_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
												ordNo : ordNo,
											});
								} else {
									alert("고객센터를 통해서 교환 신청이 가능합니다.\n 교환에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
								}
								return false;
							}
							//주문상세 이동
							function jsOrderInfo(ordNo, srchType) {
								var srchTypeVal;
								if (srchType == "GNRL_EXCHG"
										|| srchType == "DRT_EXCHG") {
									srchTypeVal = "EXCHG";
								} else if (srchType == "PART_CNCL"
										|| srchType == "ALL_CNCL") {
									srchTypeVal = "CNCL";
								} else {
									srchTypeVal = srchType;
								}
								location.href = "/secured/mypage/"
										+ srchTypeVal + "/" + ordNo
										+ "/orderInfo";
							}
							/*상품리뷰 등록/수정  팝업 가져오기*/
							function getLayerPopupInsertGoodsReview(ordNo,
									ordGodTurn, godNo, godEvlTurn, type) {
								var strParams = "";
								if (type == "insert") {
									strParams = {
										"ordGod.ordNo" : ordNo,
										"ordGod.ordGodTurn" : ordGodTurn,
										"ordGod.godNo" : godNo,
										type : type,
										_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
									};
								} else {
									strParams = {
										"ordGod.ordNo" : ordNo,
										"ordGod.ordGodTurn" : ordGodTurn,
										"ordGod.godNo" : godNo,
										"godGodEvl.godEvlTurn" : godEvlTurn,
										type : type,
										_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
									};
								}
								$("#getGoodsReviewPopup").load(
										"/secured/mypage/getGoodsReview.popup",
										strParams, function() {
											layer.open("reviewEdit");
										});
							}
							//배송완료
							var isDoubleUpdate = false;
							function jsUpdateDeliveryStatus(ordNo, wayBilNo,
									ordGodTurn, godNo, dlivyDrctGodNo) {
								if (isDoubleUpdate)
									return false;
								var dlvMsg = "수령완료 처리하시겠습니까?";
								if (!confirm(dlvMsg)) {
									return false;
								}
								isDoubleUpdate = true;
								jsLinkUrlPost(
										"/secured/mypage/deliveryStatus/update",
										{
											_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
											ordNo : ordNo,
											wayBilNo : wayBilNo,
											ordGodTurn : ordGodTurn,
											godNo : godNo,
											dlivyDrctGodNo : dlivyDrctGodNo,
										});
							}
							function fnNull() {
							}
							function goGoodDetail(strGodNo, godLinkPsblYn,
									godSaleSectCd, dispYn) {
								if (godSaleSectCd == "SALE_PROGRS"
										|| godSaleSectCd == "SLDOUT"
										|| godSaleSectCd == "TMPR_SLDOUT") {
									if (dispYn == "N") {
										alert("현재 판매중인 상품이 아닙니다.");
										return false;
									}
								}
								if (godSaleSectCd == "TMPR_SALE_STPGE"
										|| godSaleSectCd == "SALE_END") {
									alert("현재 판매중인 상품이 아닙니다.");
									return false;
								}
								if (godLinkPsblYn == "Y") {
									location.href = "/product/" + strGodNo
											+ "/detail";
								}
							}
						</script>
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

					<script type="text/javascript">
						$(document).ready(function() {
							setDay(-15);
							setSearchValue("1");
						});
						function setSearchValue(page) {
							var fromDate = $("#dateStart").val();
							var today = $("#dateEnd").val();
							var strParams = {
								_csrf : "c0a1f299-9cc0-47ee-a547-1ac477b0abb0",
								srchType : "A",
								dateStart : fromDate,
								dateEnd : today,
								page : page,
								pageSize : "10",
								statCd : "",
							};
							$("#includeOrderList").load(
									"/secured/mypage/listOrderInclude",
									strParams);
						}
						function goSearch(statCd, dayType) {
							var srchType = $("#srchType").val();
							if (dayType == "oMouth" || dayType == "tMouth"
									|| dayType == "sMouth") {
								setMonth(dayType);
							} else if (dayType == "oWeek") {
								setWeek();
							} else if (dayType == "15d") {
								setDay(-15);
							}
							var startDay = parseInt($("#dateStart").val()
									.replace(/-/g, ""), 10);
							var endDay = parseInt($("#dateEnd").val().replace(
									/-/g, ""), 10);
							var toDay = parseInt(moment().format("YYYY-MM-DD")
									.replace(/-/g, ""), 10);
							if (startDay > endDay) {
								alert("종료일이 시작일보다 앞일 수 없습니다.");
								return;
							}
							if (!checkDateTerm($("#dateStart").val().replace(
									/-/g, ""), $("#dateEnd").val().replace(
									/-/g, ""))) {
								alert("시작일로부터 최대 1년까지 조회 가능합니다.");
								return;
							}
							setSearchValue("1");
						}
						function setMonth(type) {
							var val = 0;
							var addMonth = 0;
							//var today = "";
							//var fromDate = "";
							if (type == "ready") {
								addMonth = -3;
							}
							if (type == "ready") {
								val = Number($("#srchMonth").val()) + 3;
								addMonth = val * -1;
								today = moment().format("YYYY-MM-DD");
								fromDate = moment().add(addMonth, "months")
										.format("YYYY-MM-DD");
							}
							if (type == "oMouth") {
								addMonth = -1;
								today = moment().format("YYYY-MM-DD");
								fromDate = moment().add(addMonth, "months")
										.format("YYYY-MM-DD");
							}
							if (type == "tMouth") {
								addMonth = -3;
								today = moment().format("YYYY-MM-DD");
								fromDate = moment().add(addMonth, "months")
										.format("YYYY-MM-DD");
							}
							if (type == "sMouth") {
								addMonth = -6;
								today = moment().format("YYYY-MM-DD");
								fromDate = moment().add(addMonth, "months")
										.format("YYYY-MM-DD");
							}
							if (type == "yMouth") {
								addMonth = -12;
								today = moment().format("YYYY-MM-DD");
								fromDate = moment().add(addMonth, "months")
										.format("YYYY-MM-DD");
							}
							if (type == "action") {
								today = $("#dateEnd").val();
								fromDate = $("#dateStart").val();
							}
							$("#dateStart").val(fromDate);
							$("#dateEnd").val(today);
							$("#srchMonth").val(val);
						}
						function setWeek() {
							var addWeek = -7;
							today = moment().format("YYYY-MM-DD");
							fromDate = moment().add(addWeek, "d").format(
									"YYYY-MM-DD");
							$("#dateStart").val(fromDate);
							$("#dateEnd").val(today);
						}
						function setDay(dayCnt) {
							var addWeek = dayCnt;
							today = moment().format("YYYY-MM-DD");
							fromDate = moment().add(addWeek, "d").format(
									"YYYY-MM-DD");
							$("#dateStart").val(fromDate);
							$("#dateEnd").val(today);
						}
						function fnSearchMore(page, statCd) {
							$("#page").val(page);
							var srchType = $("#srchType").val();
							var srchMonth = $("#srchMonth").val();
							setMonth("action");
							setSearchValue(page);
						}
						function closeShortage() {
							$("#dialogShortageText").dialog("close");
						}
						function checkDateTerm(fromDate, endDate) {
							var startDt = new Date(Number(fromDate.substring(0,
									4)), Number(fromDate.substring(4, 6)) - 1,
									Number(fromDate.substring(6, 8)));
							var endDt = new Date(
									Number(endDate.substring(0, 4)),
									Number(endDate.substring(4, 6)) - 1,
									Number(endDate.substring(6, 8)));
							var year = startDt.getFullYear();
							var dif = endDt - startDt;
							var day = 1000 * 60 * 60 * 24;
							var d = parseInt(dif / day, 10);
							if (367 <= d) {
								return false;
							} else {
								return true;
							}
						}
					</script>
				</div>
			</section>
		</div>
	</div>
</body>

<%@ include file="../footer.jsp"%>