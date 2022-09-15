<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<div id="container">
    <section class="content-wrap">
        <h2 class="page-title">고객센터</h2>
            <nav id="snb" class="snb-cs">
	            <ul>
	                <li id="home">HOME</li>
	                <li id="faq">FAQ</li>
	                <li id="notice">공지사항</li>
	                <li>1:1문의</li>
	                <li id="repairPrgsChk">수선진행조회</li>
	                <li id="shopinfo">매장안내</li>
	                <li id="import">입점/제휴문의</li>
	                <li id="voc" style="cursor : pointer;" onclick="layer.open('layerPrivacyAgree');">고객의 소리</li>
	            </ul>
            </nav>
            <script>
            var url = document.location.href;
            if(url.indexOf('/public/cspage/home') > -1 ){
            $('#home').removeAttr("class");
            $('#home').attr('class','active');
            } else if(url.indexOf('/public/cspage/faq') > -1){
            $('#faq').removeAttr("class");
            $('#faq').attr('class','active');
            } else if(url.indexOf('/public/cspage/notice') > -1){
            $('#notice').removeAttr("class");
            $('#notice').attr('class','active');
            } else if(url.indexOf('/public/cspage/repairPrgsChk') > -1){
            $('#repairPrgsChk').removeAttr("class");
            $('#repairPrgsChk').attr('class','active');
            } else if(url.indexOf('/public/cspage/shopInfo') > -1){
            $('#shopinfo').removeAttr("class");
            $('#shopinfo').attr('class','active');
            } else if(url.indexOf('/public/cspage/import') > -1){
            $('#import').removeAttr("class");
            $('#import').attr('class','active');
            } else {
            $('#voc').removeAttr("class");
            $('#voc').attr('class','active');
            } 
			
            
            document.getElementById('voc').addEventListener('click', function () {
            	document.querySelector('.layer-pop').style.display = 'block';
            });
            document.querySelector('.btn-layer-close').addEventListener('click', function () {
            	document.querySelector('.layer-pop').style.display = 'none';
            });

            </script><!-- snb end -->


            <div class="cs-main">

            <h3 class="sec-title eng">FAQ SEARCH</h3>
            <form id="faqForm" action="/public/cspage/faq" method="post" onsubmit="return chkFlag();">
            <input type="hidden" id="searchFaqSectCd" name="searchFaqSectCd" value="">
            <div class="cs-search-wrap">
                <div class="search-input-group">
                    <div class="search-input">
                        <input type="text" name="searchFaq" id="searchFaq" title="검색어" placeholder="검색어를 입력해 주세요." class="inp-search">
                        <button type="button" id="searchBtn" onclick="return false;" class="btn-search"><span>검색</span></button>
                    </div>

                    <div class="frequency-keywords">
                        <span class="title">자주 찾는 검색어</span>
                        <ul class="keywords">
                            <li><a href="javascript:void(0);" onclick="searchNoticeList('FAQ_GOD')">상품</a></li>
                            <li><a href="javascript:void(0);" onclick="searchNoticeList('FAQ_ORD_PAY')">주문/결제</a></li>
                            <li><a href="javascript:void(0);" onclick="searchNoticeList('FAQ_RTGOD_EXCHG')">교환/반품</a></li>
                            <li><a href="javascript:void(0);" onclick="searchNoticeList('FAQ_MBR_BNEF')">회원/혜택</a></li>
                            <li><a href="javascript:void(0);" onclick="searchFaqList('이벤트')">이벤트</a></li>
                        </ul>
                    </div>
                </div>

                <div class="cs-info">
                    <dl>
                        <dt>고객센터 운영안내</dt>
                        <dd>
                            <p class="tel" style="white-space: nowrap;">1800-5700(유료)</p>
                            <div class="service-time">
                                <p>평일 <span class="time">09 : 00 ~ 18 : 00</span></p>
                                <p>토, 일, 공휴일 휴무</p>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
            </form>

            <h3 class="sec-title eng">QUICK SERVICE</h3>
            <div class="cs-quick">
            <ul>
                <li class="quick1"><a href="javascript:void(0);" onclick="sessionCheck('/secured/mypage/listOrder','true')">주문배송조회</a></li>
                <li class="quick2"><a href="javascript:void(0);" onclick="sessionCheck('/secured/mypage/listClaimOrder','true')">취소/교환/반품 신청</a></li>
                <li class="quick3"><a href="/public/member/searchMbrId">ID/PW 찾기</a></li>
                <li class="quick4"><a href="/public/cspage/notice">이벤트 당첨 확인</a></li>
                <li class="quick5"><a href="javascript:void(0);" onclick="sessionCheck('/secured/mypage/updateMember','true')">회원정보 변경</a></li>
                <li class="quick6"><a href="/public/member/login?tabId=3">비회원 주문조회</a></li>
            </ul>
            </div>

            </div>
            <script>
            var flag = false;

            function chkFlag(){
            return flag;
            }

            $(document).ready(function () {
            //검색
            $("#searchBtn").click(function(){
                if($("#searchFaq").val() != ""){
                    flag = true;
                    $("#faqForm").submit();
                } else{
                    alert("검색어를 입력해주세요.");
                }
            });

            // 엔터키
            $('#searchFaq').keyup(function(e){
                if (e.which == 13 || e.keyCode == 13) {/* 13 == enter key@ascii */
                    $("#searchBtn").click();
                }
            });
            });

            function searchFaqList(search){
            flag = true;
            $('#searchFaq').val(search);
            $("#faqForm").submit();
            }

            function searchNoticeList(searchFaqSectCd) {
            flag = true;
            $("#searchFaqSectCd").val(searchFaqSectCd);
            $('#searchFaq').val('');
            $("#faqForm").submit();
            }

            function sessionCheck(url, role) {
            if(role == 'true'){
                if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
                    location.href = url;
                }
            } else {
                location.href = url;
            }
            }
		</script>
    </section>
<div id="layerPrivacyAgree" class="layer-pop" tabindex="0">
	<div class="layer-wrap" tabindex="0">
	        <div class="layer-header">
	            <h2 class="layer-title">고객의 소리 개인정보 수집·이용동의</h2>
	        </div>
	        <div class="layer-container">
	            <div class="layer-content">
	
	                <div class="terms-wrap">
							<pre id="termsArea"><p>1. 개인정보의 수집 · 이용목적</p>
	<p>한섬은 고객의 소리를 통해 고객의 상담내용을 접수하고 답변을 보내기 위해 개인정보를 수집합니다.</p>
	<p>2. 수집하는 개인정보의 항목</p>
	<p>한섬은 고객의 소리 작성 시 팔수 수집 정보인 이름, 휴대폰번호 제외한 개인정보는 받지 않고 있습니다. 고객의 소리를 통한 상담 내용 접수 및 답변전달, 답변메일 발송 이외의 다른 어떠한 목적으로도 사용되지 않습니다.</p>
	<p>&nbsp;</p>
	<p>3. 개인정보의 보유 및 폐기</p>
	<p>개인의 소리를 통해 목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기한 동안 보존 합니다.</p>
	<p>&nbsp;</p>
	<p>&lt;내부방침에 의해 정보보유 사유&gt;<br>▶ 개인정보에 관한 기록<br>- 보존 이유: 서비스 이용의 혼선 방지<br>- 보존 기간: 관련 법령에 따른 보존 기간까지</p>
	<p>&nbsp;</p>
	<p>4. 개인정보 제 3자 제공</p>
	<p>한섬은 고객의 소리를 통하여 수집한 개인정보를 제 3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
	<p>- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
	<p>&nbsp;</p>
	<p>5. 개인정보 정정 및 삭제</p>
	<p>고객의 소리를 통해 개인정보를 작성하신 분들은 언제든지 자신의 개인정보를 정정할 수 있으며, 삭제를 요청할 수 있습니다. 개인정보와 관련하여 불만이나 의견이 있으신 분은 한섬으로 의견을 주시면 접수 즉시 조치하고 처리결과를 통보해 드리겠습니다.</p>
	<p>&nbsp;</p>
	<p>6. 고객의 소리 관리 담당자</p>
	<p>한섬은 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 고객의 소리 관리 담당자를 지정하고 있습니다.</p>
	<p>&nbsp;</p>
	<p>▶고객의 소리 관리 담당자<br>성명: 이자영(고객관리팀)<br>이메일: voc@hyundaihmall.com</p>
	<p>&nbsp;</p>
	<p>귀하께서는 한섬의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 고객의 소리 관리 담당자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것 입니다.</p></pre>
	                </div>
	
	                <div class="agree-wrap">
	                    <div class="page-info">
	                        <p class="txt-type1">위 개인정보 수집 및 이용에 동의 하십니까?</p>
	                    </div>
	
	                    <div class="check-group">
	                        <label class="radio-skin"><input type="radio" name="privacyAgree" value="Y"><span>동의함</span></label>
	                        <label class="radio-skin"><input type="radio" name="privacyAgree" value="N" checked=""><span>동의안함</span></label>
	                    </div>
	                </div>
	
	                <ul class="txt-list">
	                    <li>개인정보수집을 원치 않으시면 E-mail(voc@hyundaihmall.com)을 통해서도 접수하실 수 있습니다. 감사합니다.</li>
	                </ul>
	                <form id="moveVocPage" name="moveVocPage" method="post">
		                <ul class="input-info-group">
							<li>
								<div class="input-box">
									<input type="text" title="고객명(필수)" placeholder="고객명(필수)" name="userNm" id="custNm" class="inp-reset">
									<div class="etc">
										<button type="button" class="btn-clear"><span>지우기</span></button>
									</div>
								</div>
								<p class="txt-invalid">오류 메시지 출력</p><!-- style="display: block;" -->
		</li>
		<li>
			<div class="input-box">
				<input type="text" title="연락처(필수)" placeholder="연락처(필수)" name="userPhone" id="custMpNo" class="inp-reset">
				<div class="etc">
					<button type="button" class="btn-clear"><span>지우기</span></button>
				</div>
			</div>
			<p class="txt-invalid">오류 메시지 출력</p><!-- style="display: block;" -->
			</li>
			</ul>
			<input type="hidden" id="answYn" name="answYn" value="total">
			<input type="hidden" id="certYn" value="">
		</form>
	
		            <div class="btn-box">
		                <button type="button" class="btn-type2-lg" onclick="checkCustData()"><span>확인</span></button>
		           </div>
		       </div>
		   </div>
		   <button type="button" class="btn-layer-close" onclick="layer.close('layerPrivacyAgree');">닫기</button>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>