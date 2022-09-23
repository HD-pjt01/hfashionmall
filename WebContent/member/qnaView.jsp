<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div id="container">
	<form name="formm" method="post">
		<section class="content-wrap">
			<div class="snb-wrap">
				<h2 class="lnb-title">
					<a href="hfashionmallServlet?command=order_all">MYPAGE</a>
				</h2>
				<nav id="lnb" class="lnb">
					<ul>
						<li>
							<div class="menu-depth1">주문 조회</div>
							<ul class="menu-depth2">
								<li><a href="hfashionmallServlet?command=mypage">배송 중인
										주문 조회</a></li>
								<li><a href="hfashionmallServlet?command=order_all">배송
										완료 주문 조회</a></li>
								<li><a href="hfashionmallServlet?command=cart_list">장바구니
										내역</a></li>
							</ul>
						</li>
						<li>
							<div class="menu-depth1">리뷰 관리</div>
							<ul class="menu-depth2">
								<li><a href="hfashionmallServlet?command=mypage_review">리뷰
										쓰기</a></li>
								<li><a href="/secured/mypage/getMyGodGodEvlList">나의
										상품리뷰</a></li>
							</ul>
						</li>
						<li>
							<div class="menu-depth1">QnA 조회</div>
							<ul class="menu-depth2">
								<li><a href="hfashionmallServlet?command=qna_view">1:1
										문의 내역</a></li>
							</ul>
						</li>
						<li>
							<div class="menu-depth1">회원정보</div>
							<ul class="menu-depth2">
								<li><a href="hfashionmallServlet?command=mypage_edit">회원정보
										수정</a></li>

								<li><a href="hfashionmallServlet?command=mypage_out">회원
										탈퇴</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			<div class="snb-content-wrap">
				<input type="hidden" name="_csrf"
					value="60d516a6-cc06-4ae0-8ed6-77d9a6564fbb"> <input
					type="hidden" name="hPointEnableYn" id="hPointEnableYn" value="">
				<!-- 200713 수정 -->
				<script type="text/javascript"
					src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220907151706"></script>
				<div id="getGoodsReviewPopup"></div>
				<div id="layerTracking" class="layer-pop" tabindex="0"></div>

				<script type="text/javascript">
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
							'dlvComCd' : dlvComCd,
							'dmstcWaybilNo' : dmstcwayBilNo,
							'dlvComNm' : dlvComNm,
							'cstmrNm' : cstmrNm,
							'addrseNm' : addrseNm,
							'baseAddr' : baseAddr,
							'detailAddr' : detailAddr,
							'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb'
						};

						$.ajax({
							type : 'POST',
							data : strParams,
							url : '/secured/mypage/order/dlvStatusInfoList',
							dataType : "html",
							success : function(data) {
								$("#layerTracking").html(data);

								layer.init('layerTracking');
								layer.open('layerTracking');
							},
							error : function() {
								//openAlert('Loading Error');
							}
						});
					}

					//주문취소
					function jsUnitCancel(ordNo, cnclPsblYn, lstClmPrgsYn) {
						if (cnclPsblYn == 'Y') {
							jsLinkUrlPost(
									'/secured/mypage/claimAccept',
									{
										'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb',
										'ordNo' : ordNo
									});
						} else if (lstClmPrgsYn == 'Y') {
							alert("추가 결제가 필요한 클레임이 존재합니다.\n 추가 결제완료 후 접수가 가능합니다.");
						} else {
							alert("주문상품(패키지 또는 주문할인)과 일부 할인수단 및 결제수단을 사용한 주문은 전체취소만 가능합니다.\n 주문취소에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
						}
						return false;
					}

					//반품신청
					function jsRequestForReturn(ordNo, rtnPsblYn, lstClmPrgsYn) {
						console.log("jsRequestForReturn");
						if (rtnPsblYn == 'Y') {
							jsLinkUrlPost(
									'/secured/mypage/requestForReturn',
									{
										'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb',
										'ordNo' : ordNo
									});
						} else if (lstClmPrgsYn == 'Y') {
							alert("추가 결제가 필요한 클레임이 존재합니다.\n 추가 결제완료 후 접수가 가능합니다.");
						} else {
							alert("주문상품(패키지 또는 주문할인)과 일부 할인수단 및 결제수단을 사용한 주문은 전체반품만 가능합니다.\n 반품에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
						}
						return false;
					}

					//교환신청
					function jsExchangeClaim(ordNo, exchPsblYn, lstClmPrgsYn) {
						if (exchPsblYn == 'Y') {
							jsLinkUrlPost(
									'/secured/mypage/exchangeClaim',
									{
										'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb',
										'ordNo' : ordNo
									});
						} else {
							alert("고객센터를 통해서 교환 신청이 가능합니다.\n 교환에 대한 자세한 문의는 1:1문의 혹은 고객센터로 문의해 주시기 바랍니다.");
						}
						return false;
					}

					/*상품리뷰 등록/수정  팝업 가져오기*/
					function getLayerPopupInsertGoodsReview(ordNo, ordGodTurn,
							godNo, godEvlTurn, type) {
						var strParams = "";
						if (type == 'insert') {
							strParams = {
								'ordGod.ordNo' : ordNo,
								'ordGod.ordGodTurn' : ordGodTurn,
								'ordGod.godNo' : godNo,
								'type' : type,
								'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb'
							};
						} else {
							strParams = {
								'ordGod.ordNo' : ordNo,
								'ordGod.ordGodTurn' : ordGodTurn,
								'ordGod.godNo' : godNo,
								'godGodEvl.godEvlTurn' : godEvlTurn,
								'type' : type,
								'_csrf' : '60d516a6-cc06-4ae0-8ed6-77d9a6564fbb'
							};
						}
						$("#getGoodsReviewPopup").load(
								"/secured/mypage/getGoodsReview.popup",
								strParams, function() {
									layer.open('reviewEdit');
								});
					}

					function fnNull() {
					}

					function goGoodDetail(strGodNo, godLinkPsblYn,
							godSaleSectCd, dispYn) {

						if (godSaleSectCd == 'SALE_PROGRS'
								|| godSaleSectCd == 'SLDOUT'
								|| godSaleSectCd == 'TMPR_SLDOUT') {
							if (dispYn == 'N') {
								alert('현재 판매중인 상품이 아닙니다.');
								return false;
							}
						}

						if (godSaleSectCd == 'TMPR_SALE_STPGE'
								|| godSaleSectCd == 'SALE_END') {
							alert('현재 판매중인 상품이 아닙니다.');
							return false;
						}

						if (godLinkPsblYn == 'Y') {
							location.href = "/product/" + strGodNo + "/detail";
						}
					}
				</script>
			</div>
			<div class="snb-content-wrap">
				<script type="text/javascript"
					src="/hfm_pc/resources/js/mypage/mypagecommon.js?timestamp=20220916135540"></script>
				<input type="hidden" id="_csrf" name="_csrf"
					value="f0fed5b3-c8e3-4909-9fc8-d4dbbd491417">
				<div class="summary-box">
					<ul>
						<li><span class="title">전체문의</span> <span class="value">${fn:length(qnaList)}</span></li>
					</ul>
				</div>
				<input type="hidden" id="ansStatCd" value="">
				<div id="divList" class="board-list board-qna myqna ui-fold">
					<script src="/resources/js/ui.js"></script>

					<c:forEach items="${qnaList}" var="qnaVO">
						<ul class="list-content">
							<li class="on">
								<div class="list-row fold-header">
									<div class="cell-num">${qnaVO.qna_sequence}</div>
									<div class="cell-title">
										<ul class="etc-info">
											<li><span class="cate">${qnaVO.qna_classification}</span></li>
											<li><span class="date">${qnaVO.qna_register}</span></li>
											<li><span class="state"> <c:choose>
														<c:when test="${qnaVO.qna_answer == 'no'}">답변대기</c:when>
														<c:when test="${qnaVO.qna_answer != 'no'}">답변완료</c:when>
													</c:choose>
											</span></li>
										</ul>
										<p class="title">${qnaVO.qna_subject}</p>
										<button type="button" class="btn-fold">열기</button>
									</div>
								</div>
								<div class="fold-cont open">
									<div class="qna-group">
										<!-- 질문 -->
										<div class="question-box">
											<div class="question-item">
												<div class="txt-box">${qnaVO.qna_content}</div>
												<ul class="files">
												</ul>
											</div>
										</div>
										<c:choose>
											<c:when test="${qnaVO.qna_answer == 'no'}">
												<div class="question-box">
													<div class="question-item">
														<div class="txt-box"
															style="color: black; font-size: 20px;">빠른 시일 내에
															답변드리겠습니다.</div>
														<ul class="files">
														</ul>
													</div>
												</div>
											</c:when>
											<c:when test="${qnaVO.qna_answer != 'no'}">
												<div class="question-box">
													<div class="question-item">
														<div class="txt-box"
															style="color: black; font-size: 20px;">${qnaVO.qna_answer}</div>
														<ul class="files">
														</ul>
													</div>
												</div>
											</c:when>
										</c:choose>
										<!-- //질문 -->

										<!-- 답변 -->
										<!-- //답변 -->

										<div class="btns-group">
											<div class="btns">
												<button type="button" class="btn-type3-sm"
													onclick="deleteInquiry('222843')">
													<span>삭제</span>
												</button>
												<button type="button" class="btn-type1-sm"
													onclick="goInquiryEdit('222843')">
													<span>수정</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</c:forEach>
					<div class="paging">
						<span> <strong title="현재 페이지">1</strong>
						</span>
					</div>
					<script>
						$(document).ready(function() {
							setTimeout(function() {
								$("#divList").removeClass("initialized");
								fold.init();
							}, 1000);
						});
						$("#ansStatCdAll").html(1);
						$("#ansStatCdCompt").html(0);
						$("#ansStatCdWait").html(1);
					</script>
				</div>
			</div>
		</section>
	</form>
</div>
<%@ include file="../footer.jsp"%>