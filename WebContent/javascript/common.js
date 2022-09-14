/**
 * 브랜드 메인 호출
 */
function goBrandMain(obj) {

    var brandShopNo = $(obj).attr("ctgryNo");
    var ctgryOutptTpCd = $(obj).attr("ctgryOutptTpCd");
    var outptSectCd = $(obj).attr("outptSectCd");
    var outptLinkUrl = $(obj).attr("outptLinkUrl");

    if (brandShopNo || outptLinkUrl) {
        if (outptSectCd == 'LINK' && ctgryOutptTpCd == 'NEW_WIN') {
            window.open(outptLinkUrl);
        } else if (outptSectCd == 'LINK') {
            location.href = outptLinkUrl;
        } else {
            location.href = "/display/brand?brndCtgryNo=" + brandShopNo;
        }
    }
}

/**
 * 상품 좋아요 기능
 */
function addBukmk(obj, callbackFunction) {
    console.log($(obj));
    var _godNo = $(obj).attr("godNo");

    var url;
    var params = "conttNo=" + _godNo + "&bukmkTp=GOD";

    if ($(obj).hasClass("on")) {
        url = "/product/deleteBukmk.json";
    } else {
        url = "/product/addBukmk.json";
    }

    $.ajax({
        type: "POST",
        url: url,
        data: params,
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if (data.result > 0) {
                if ($(obj).hasClass("on")) {
                    $(obj).removeClass("on");
                    $(obj).attr("state", "delete");
                } else {
                    $(obj).addClass("on");
                    $(obj).attr("state", "insert");
                }

                if (callbackFunction) {
                    callbackFunction(obj);
                }
            }
        }
    });
}

/**
 * 로그인한 mbrNo의 찜한 상품목록 조회
 */
function getBukmk() {
    $.ajax({
        type: "POST",
        url: "/product/getBukmk.json",
        data: '',
        success: function (data) {
            if (data.list != null) {
                setBukmkGod(data.list);
            }
        }
    });

}

/**
 * 상품 좋아요 체크 [캐시 문제로 인해 비동기 체크]
 */
function setBukmkGod(data) {
    for (var i = 0; i < data.length; i++) {
        $(".btn-like[godNo='" + data[i] + "']").addClass("on");
    }
}


/**
 * 상품 퀵뷰 호출
 */
function showProductQuickView(godNo) {

    $.ajax({
        type: "POST",
        dataType: "html",
        url: "/product/quickView",
        data: {
            'godNo': godNo
        },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if ($("#quickView").length > 0) {
                $("#quickView").remove();
            }

            if ($("#layerMemBenefit").length > 0) {
                $("#layerMemBenefit").remove();
            }

            $("body").append(data);
            quickView.open('quickView');
            getBukmk();

        },
        error: function (pa_data, status, err) {}
    });

}

/**
 * 추천(recopick) 호출
 *
 * @param type  ORD : 장바구니 or 주문완료
 *              MY  : 마이페이지 메인
 * @param godNo ORD 일 경우 온라인품번 리스트 (구분자 ,)
 * @param divId 노출할 divId
 */
function getRecommendInfo(type, godNo, divId) {
    $.ajax({
        type: "POST",
        dataType: "html",
        url: "/display/getRecommendList",
        data: {
            'type': type,
            'godNo': godNo
        },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $("#" + divId).html(data);
            if ($("#" + divId).find("li").length < 1) {
                $("#" + divId).remove();
            } else {
                if (type == 'ORD') {
                    getBukmk();
                    slide.create('productSlideList');
                } else if (type == 'MY') {
                    if ($('.item3-slide').length > 0) {
                        slide.bind('.item3-slide', 'opt17 nav page');
                    }
                    if ($('.item4-slide').length > 0) {
                        slide.bind('.item4-slide', 'opt15 nav page');
                    }
                    getBukmk();
                }
            }
        },
        error: function (pa_data, status, err) {}
    });

}

/**
 * 상품상세 이동
 *
 * @param godNo
 */
function goGodDetail(godNo, inflowSn, promtSn, reviewViewYn) {

    //상품 뒤로가기 시 기억을 위한 sessionStorage 설정
    var getSessionStorage = window.sessionStorage;
    getSessionStorage.pageYOffset = window.pageYOffset;

    try {
        //최근 본 상품 저장
        setRecGod(godNo);
    } catch (e) {
        console.log(e);
    }

    var params = "";
    var paramList = [];
    var url = "/product/" + godNo + "/detail";

    if (inflowSn) {
        var temp = {};
        temp["inflowSn"] = inflowSn;
        paramList.push(temp);
    }

    if (promtSn) {
        var temp = {};
        temp["promtSn"] = promtSn;
        paramList.push(temp);
    }

    if (reviewViewYn) {
        var temp = {};
        temp["reviewViewYn"] = reviewViewYn;
        paramList.push(temp);
    }

    if (paramList.length > 0) {
        params += "?";

        for (var i = 0; i < paramList.length; i++) {

            var keys = Object.keys(paramList[i]);
            if (i != 0) {
                params += "&";
            }

            for (var j in keys) {
                params += keys[j] + "=" + paramList[i][keys[j]];
            }
        }
    }

    url += params;
    location.href = url;
}


/**
 * 레코픽 추천 상품 클릭
 *
 * @param obj
 */
function clickRecommendProducts(obj) {
    var godNo = $(obj).attr("godNo");
    var clickLogUrl = $(obj).attr("clickLogUrl");

    try {
        //최근 본 상품 저장
        setRecGod(godNo);
    } catch (e) {
        console.log(e);
    }

    //traceRecommendGoodsClick(clickLogUrl,goGodDetail,godNo);
    var url = location.origin + "/product/" + godNo + "/detail";
    var recoUrl = clickLogUrl + "&url=" + encodeURI(url);

    window.location.href = recoUrl;

}

/**
 * 추천 서비스 Recopick의 경우 추천 품질 향상을 위하여
 * 사용자들이 추천상품을 클릭하는 경우, clicklog_link를 통해 추천 클릭로그를 남겨준다.
 * 추천 클릭 로그를 제대로 남기지 않을 경우, 추천에 대한 성과를 계산할 수 없으며, 향후 추천 품질이 저하되는 문제가 생긴다.
 * 참조: http://docs.recopick.com/pages/viewpage.action?pageId=3244364
 */
function traceRecommendGoodsClick(clickLogUrl, callbackF, param) {
    if ((typeof (clickLogUrl) == 'undefined') ||
        (clickLogUrl == null) || (clickLogUrl == 'null') || (clickLogUrl == '')) {
        return;
    }
    //console.log(clickLogUrl);
    $.ajax({
        type: "GET",
        async: true,
        url: clickLogUrl,
        dataType: 'jsonp',
        success: function (data) {
            //console.log(data);
        },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        error: function (data) {
            //console.log(data);
        },
        complete: function () {
            if (callbackF && typeof callbackF == 'function') {
                callbackF(param);
            }
        }
    });
}

/**
 * 최근 본 상품 저장
 * @param godNo
 */
function setRecGod(godNo) {
    var recently_view_god = window.localStorage.getItem("recently_view_god");
    var godlist = [];
    var newlist = [];
    if (recently_view_god != null && recently_view_god != '') {
        godlist = JSON.parse(recently_view_god);
    }

    var now = new Date();
    for (var ii = 0; ii < godlist.length; ii++) {
        if (now.getTime() < new Date(godlist[ii].viewdt).getTime()) {
            newlist.push(godlist[ii]);
        }
    }

    var include = false;
    for (var i = 0; i < newlist.length; i++) {
        if (newlist[i].godNo == godNo) {
            include = true;
            break;
        }
    }
    if (newlist.length == 50) {
        newlist.shift();
    }
    if (!include && newlist.length < 50) {
        newlist.push({
            'godNo': godNo,
            'viewdt': now.setDate(now.getDate() + 7)
        });
    }
    if (newlist.length > 0) {
        window.localStorage.setItem("recently_view_god", JSON.stringify(newlist));
    } else {
        window.localStorage.removeItem("recently_view_god");
    }
}

/**
 * 최근 본 카테고리 저장
 *
 * @param obj
 */
function setRecCategory(obj) {
    try {
        // if (getCookie("localStorage") != givenOption.localStorageTimestamp) {
        //     setCookie("localStorage", givenOption.localStorageTimestamp, 7);
        //     localStorage.clear();
        // }
    } catch (e) {
        console.log(e);
    }

    var tp = $(obj).attr('tp');
    var brndCtgryNo = $(obj).attr('brndCtgryNo');
    var dspCtgryNo = $(obj).attr('dspCtgryNo');
    var brndId = $(obj).attr('brndId');

    tp = tp ? tp : '';
    dspCtgryNo = dspCtgryNo ? dspCtgryNo : '';
    brndCtgryNo = brndCtgryNo ? brndCtgryNo : '';
    brndId = brndId ? brndId : '';

    var catelist = window.localStorage.getItem("cate");
    var cate = [];
    if (catelist != null && catelist != '') {
        cate = JSON.parse(catelist);
    }

    var newlist = [];
    var now = new Date();
    for (var ii = 0; ii < cate.length; ii++) {
        if (now.getTime() < new Date(cate[ii].viewdt).getTime()) {
            newlist.push(cate[ii]);
        }
    }

    var item = {
        'tp': tp,
        'dspCtgryNo': dspCtgryNo,
        'brndCtgryNo': brndCtgryNo,
        'brndId': brndId
    };
    var include = false;
    for (var i = 0; i < newlist.length; i++) {
        if (newlist[i].tp == tp &&
            newlist[i].dspCtgryNo == dspCtgryNo &&
            newlist[i].brndCtgryNo == brndCtgryNo &&
            newlist[i].brndId == brndId) {
            include = true;
            break;
        }
    }
    if (newlist.length == 30) {
        newlist.shift();
    }
    if (!include && newlist.length < 30) {
        item['viewdt'] = now.setDate(now.getDate() + 7);
        newlist.push(item);
    }
    if (newlist.length > 0) {
        window.localStorage.setItem("cate", JSON.stringify(newlist));
    } else {
        window.localStorage.removeItem("cate");
    }
}

/**
 * 최근본 필터 저장
 *
 * @param filterObj
 */
function setRecFilter(filterObj) {
    var uripath = location.pathname;

    var tp = '';
    var brndCtgryNo = '';
    var dspCtgryNo = '';
    var brndId = '';
    var otltYn = '';

    var item = {};
    filterObj.forEach(function (o) {
        if (o.name == 'dspCtgryNo') {
            dspCtgryNo = o.value;
        }
        if (o.name == 'brndCtgryNo') {
            brndCtgryNo = o.value;
        }
        if (o.name == 'brndId') {
            brndId = o.value;
        }
        if (o.name == 'otltYn') {
            otltYn = o.value;
        }
    });

    if (uripath == '/display/category/list') {
        if (otltYn != '' && otltYn == 'Y') {
            tp = 'OTLT_LIST';
            if (dspCtgryNo != '' && dspCtgryNo != 'HFM') {
                item = {
                    'tp': tp,
                    'dspCtgryNo': dspCtgryNo,
                    'brndCtgryNo': '',
                    'brndId': '',
                    'godFilter': filterObj
                };
            } else if (brndId != '') {
                item = {
                    'tp': tp,
                    'dspCtgryNo': '',
                    'brndCtgryNo': '',
                    'brndId': brndId,
                    'godFilter': filterObj
                };
            }
        } else {
            if (dspCtgryNo != '') {
                tp = 'CTGRY';
                item = {
                    'tp': tp,
                    'dspCtgryNo': dspCtgryNo,
                    'brndCtgryNo': '',
                    'brndId': '',
                    'godFilter': filterObj
                };
            }
        }
    }
    if (uripath == '/display/otltMain') {
        tp = 'OTLT_MAIN';
        item = {
            'tp': tp,
            'dspCtgryNo': '',
            'brndCtgryNo': '',
            'brndId': '',
            'godFilter': filterObj
        };
    }
    if (uripath == '/display/brand') {
        tp = 'BRND_MAIN';
        item = {
            'tp': tp,
            'dspCtgryNo': '',
            'brndCtgryNo': brndCtgryNo,
            'brndId': '',
            'godFilter': filterObj
        };
    }
    if (uripath == '/display/brand/shop') {
        tp = 'BRND_SHOP';
        item = {
            'tp': tp,
            'dspCtgryNo': '',
            'brndCtgryNo': brndCtgryNo,
            'brndId': '',
            'godFilter': filterObj
        };
    }

    var catelist = window.localStorage.getItem("cate");
    var cate = [];
    if (catelist != null && catelist != '') {
        cate = JSON.parse(catelist);
    }

    var include = false;
    for (var i = 0; i < cate.length; i++) {
        if (cate[i].tp == item['tp'] &&
            cate[i].dspCtgryNo == item['dspCtgryNo'] &&
            cate[i].brndCtgryNo == item['brndCtgryNo'] &&
            cate[i].brndId == item['brndId']) {

            cate[i]['godFilter'] = filterObj;
            include = true;
        }
    }
    if (!include) {
        cate.push(item);
    }
    if (cate.length > 0) {
        window.localStorage.setItem("cate", JSON.stringify(cate));
    }
}


//쿠키생성
function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function getCookie(varname) {
    varname += "=";
    startpos = document.cookie.indexOf(varname);
    if (startpos >= 0) {
        startpos += varname.length;
        endpos = document.cookie.indexOf(";", startpos);
        if (endpos == -1) endpos = document.cookie.length;
        return unescape(document.cookie.substring(startpos, endpos));
    }
}


/**
 * IE에서 url 타겟 지정이 안되는 현상으로 강제 지정
 * @param url
 * @returns {string|*}
 */
function getLoginTarget(url) {
    if (url == '' || url == undefined) {
        return '/main';
    } else {
        return url;
    }
}

function showQuickViewHistory() {

    //최근 본 상품
    var recently_view_god = window.localStorage.getItem("recently_view_god");
    var recGod = [];
    if (recently_view_god != null && recently_view_god != '') {
        recGod = JSON.parse(recently_view_god);
    }

    //최근 본 카테고리
    var recently_cate = window.localStorage.getItem("cate");
    var recCate = [];
    if (recently_cate != null && recently_cate != '') {
        recCate = JSON.parse(recently_cate);
    }

    var param = {
        'recGod': recGod,
        'recCate': recCate
    };
    $.ajax({
        type: "POST",
        url: "/public/common/getQuickViewHistory",
        contentType: "application/json",
        data: JSON.stringify(param),
        success: function (data) {
            //console.log(data);
            $("#quickViewHistory").html(data);
            quickView.open('quickViewHistory');
        },
        error: function (pa_data, status, err) {}
    });

}

function showQuickViewBnc() {

    $.ajax({
        type: "POST",
        url: "/public/common/getQuickViewBnc",
        dataType: "html",
        //data: { '':  },
        success: function (data) {
            //console.log(data);
            $("#quickViewBnC").html(data);
            quickView.open('quickViewBnC');

        },
        error: function (pa_data, status, err) {}
    });

}

/**
 * 퀵뷰에서 쿠폰 개별 다운로드
 */
function cpnDown(prmNo) {

    $.ajax({
        type: "GET",
        async: false,
        url: "/public/goods/detail/downloadCpn.json",
        data: {
            "prmNo": prmNo
        },
        success: function (data) {
            var msg = "";
            if (data.result == 'SUCCES') {
                layer.open('layerAlertCoupon2');
            } else if (data.result == 'NOT_LOGIN') {
                alert("로그인 후 다운로드 받을 수 있습니다.");
                location.href = "/public/member/login";
            }
        },
        error: function (pa_data, status, err) {
            alert("다운로드시 에러가 발생하였습니다.");
        }
    })
}

/**
 * 퀵뷰에서 쿠폰 전체 다운로드
 */
function cpnAllDown() {
    var prmNoValues = $("input[name='prmNoValues']").length; // 쿠폰 갯수
    var prmNoData = new Array(prmNoValues);

    var not_login_count = 0; // 로그인하지 않았을 때 
    var success_count = 0; // 쿠폰이 다운로드 되었을 때
    var error_count = 0; // 에러 발생

    for (var i = 0; i < prmNoValues; i++) {
        prmNoData[i] = $("input[name='prmNoValues']")[i].value;
    }

    for (var j = 0; j < prmNoData.length; j++) {

        $.ajax({
            type: "GET",
            async: false,
            url: "/public/goods/detail/downloadCpn.json",
            data: {
                "prmNo": prmNoData[j]
            },
            success: function (data) {
                if (data.result == 'NOT_LOGIN') {
                    not_login_count++;
                } else if (data.result == 'SUCCES') {
                    success_count++;
                }
            },
            error: function (pa_data, status, err) {
                error_count++;
            }
        })
    }

    if (not_login_count > 0) { // 로그인을 하지 않았을 때
        alert("로그인 후 다운로드 받을 수 있습니다.");
        location.href = "/public/member/login";
    } else if (success_count == prmNoData.length) { // 모든 쿠폰이 정상적으로 다운로드 되었을 때
        layer.open('layerAlertCoupon');
    } else if (error_count > 0) { // 에러 발생 시
        alert("다운로드시 에러가 발생하였습니다.");
    }
}