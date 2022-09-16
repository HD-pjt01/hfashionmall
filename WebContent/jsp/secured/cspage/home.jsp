<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="./header.jsp" %>

<body>
    <div id="container">
        <section class="content-wrap">
            <h2 class="page-title">고객센터</h2>

                        <!-- snb -->
                            <nav id="snb" class="snb-cs">
                <ul>
                    <li id="home" class="active"><a href="/public/cspage/home">HOME</a></li>
                    <li id="faq"><a href="/public/cspage/faq">FAQ</a></li>
                    <li id="notice"><a href="/public/cspage/notice">공지사항</a></li>
                    <li><a href="/secured/mypage/myInquiryList">1:1문의</a></li>
                    <li id="repairPrgsChk"><a href="/public/cspage/repairPrgsChk">수선진행조회</a></li>
                    <li id="shopinfo"><a href="/public/cspage/shopInfo">매장안내</a></li>
                    <li id="import"><a href="/public/cspage/import">입점/제휴문의</a></li>
                    <li id="voc"><a onclick="vocTermsOpen();">고객의 소리</a></li>
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

                function vocTermsOpen(){
                $.ajax({
                    type: 'GET'
                    , url: '/public/voc/terms'
                    , dataType: "html"
                    , success: function (data) {
                        $('body').append(data);
                        layer.open('layerPrivacyAgree');
                    }
                    , error: function () {
                    alert("약관 조회 실패")
                    }
                });
                }
                </script><!-- snb end -->

                        <!-- body -->
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
                //폼 submit 변수
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
                </script><!-- body end -->
        </section>
</div>
</body>

<%@ include file="../footer.jsp" %>