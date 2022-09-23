function getFilterLayer(params) {

    $.ajax({
        type: "GET",
        url: "/display/search/api/getFilterData",
        data: params,
        success: function (data) {
            $("#filterLayer").append(data);
            filterCategory();

            if(typeof(paramObj) != "undefined"){
                setFilterParam(paramObj);
                filterLoad();
            }

            try{
                if(history.state){
                    setFilterHistory();
                    //selectProductList(false);
                }else{
                    history.replaceState({ data: $('#searchForm').serializeArray() }, '', location.href);
                }
            }catch(e){
                console.log(e)
            }
        }, error: function () {
        }, complete: function () {
        }
    });
}

function searchFilter() {//검색 버튼 클릭시
    if($("[name='mallGubun']").val()!="SEARCH"){
        resetKeywordList();
        $("#productsList").html("");
        filterDataSet();//필터 데이터 셋팅
        $("[name='currentPage']").val("1");
        selectProductList(true);

        //최근 본 필터 저장 (최근 본 카테고리에 set)
        try{
            setRecFilter($('#searchForm').serializeArray());

        } catch (e) { }
    }else{
        //검색페이지 필터 검색은 API 호출
        filterDataSet();
        getSearchGodFilter();
    }
}


function resetFilter(){ //필터 초기화
    $("[group='filterValue']").prop("checked",false);

    var wrap = document.querySelector('.selected-filter');
    var btn = wrap.querySelectorAll('button');
    var filterWrap = document.querySelector('.list-filter');
    var input = filterWrap.querySelectorAll('input');

    [].forEach.call(btn, function(obj) {
    	if(!obj.classList.contains('btn-reset')) obj.parentNode.removeChild(obj);
    });
    [].forEach.call(input, function(_this){
    	if(_this.checked == true) {
    		_this.checked = false;
    	}
    	else if(_this.type == 'text' || _this.type == 'hidden') {
            _this.value = '';
        }
    });



    filterReset();
    getCount();
}

function selectProductList(stateFlag) {
    getGodListLoading = true;
    //spinner.show();

    var data = $('#searchForm').serialize();

    $.ajax({
        type: "GET",
        url: "/product/productBrand",
        data: data,
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {

            var currentPage = $("#currentPage").val();
            var html = "";
            html += data;

            $("#productsList").html(html);
            $("#pagingArea").html($("#hidenPageArea").html());

            var totalRow = $("#hidenPageArea").find("[name='totalRow']").val();
            if(currentPage == "1") {
                $("#totalCount").html(numberWithCommas(totalRow));
            }

            getBukmk();
            getGodIconList(grdCd, "#productsList");

            try{
                if(stateFlag) {
                    history.replaceState({ data: $('#searchForm').serializeArray() }, '', location.origin+location.pathname+"?"+$('#searchForm').serialize());
                }
            }catch(e){
                console.log(e)
            }

            pagingScrollTop();
            getGodListLoading = false;
            spinner.hide();

        }, error: function () {
            alert("다시 시도 부탁드립니다.");
            window.location.reload();
            getGodListLoading = false;
            spinner.hide();

        }, complete: function () {
            getGodListLoading = false;
            //spinner.hide();
        }
    });
}


//필터 선택시 카운트
function getCount(){
    //console.log('getCount');
    filterDataSet();//필터 데이터 셋팅
    var params = $('#searchForm').serialize();

    $.ajax({
        type:"GET",
        url: "/display/search/api/getFilterCount.json",
        data: params,
        contentType :  "application/json",
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success : function (data) {
            if(data.mallGubun == 'SEARCH') {
                var keyword = $("#searchForm").find("input[name=searchWord]").val().trim();
                $("#searchForm").find("input[name='searchWord']").val(decodeURI(keyword));
            }

            $("#totalCount").html(numberWithCommas(data.totalCount));
        }
    })
}

function filterDataSet(){
    var lCateFilter=[];
    var cateNos=[];
    var mCateFilter=[];
    var sCateFilter=[];
    var dCateFilter=[];
    var brandId=[];
    var price =[];
    var rate = [];
    var size =[];
    var color =[];
    var matr = [];
    var modelCut ="";
    var exceptSoldout = "";
    var mallGubun =$("#searchForm").find("[name='mallGubun']").val();


    if(mallGubun=='BRND'){
        $("#searchForm").find("input[name='cateCd']").val("");

        var upperBrnd = $("input[name='upperBrandId']").val();
        var brnd = $("input[name='brandId']").val();

        $("#searchForm").find("input[name='upperBrandId']").val(upperBrnd);
        $("#searchForm").find("input[name='brandId']").val(brnd);

        if(upperBrnd == '') {
            brandId.push(brnd);
        }
    }else if(mallGubun=='CTGRY'){
        var dspCtgryNo = $("input[name='dspCtgryNo']").val();

        var otltYn = $("input[name='otltYn']").val();
        var upperBrnd = $("input[name='upperBrandId']").val();
        var brnd = $("input[name='brandId']").val();

        if(otltYn == 'Y') {
            if((dspCtgryNo == '' || dspCtgryNo == 'HFM') && brnd != '') {
                $("#searchForm").find("input[name='upperBrandId']").val(upperBrnd);
                $("#searchForm").find("input[name='brandId']").val(brnd);

                if(upperBrnd == '') {
                    brandId.push(brnd);
                }
            }
            else {
                $("#searchForm").find("input[name='cateCd']").val(dspCtgryNo);
            }
        }
        else {
            $("#searchForm").find("input[name='cateCd']").val(dspCtgryNo);
        }
    }
    else {
        $("#searchForm").find("input[name='cateCd']").val("");
    }

    //필터 DB 데이터 셋팅 E
    $("[group='filterValue']").each(function () {
        if($(this).prop("checked")==true){
            var name = $(this).attr("name");
            var data = $(this).val();
            //console.log(name);
            //console.log(data);

            if(name=="category1"){
                cateNos.push(data);
                lCateFilter.push(data);
            }else if(name=="category2"){
                cateNos.push(data);
                mCateFilter.push(data);
            }else if(name=="category3"){
                cateNos.push(data);
                sCateFilter.push(data);
            }else if(name=="category4"){
                cateNos.push(data);
                dCateFilter.push(data);
            }else if(name=="filterBrndIds"){
                brandId.push(data);
            }else if(name=="filterSizeCds"){
                size.push(data);
            }else if(name=="filterColorCds"){
                color.push(data);
            }
            else if(name=="filterMatrCds") {
                matr.push(data);
            }
            else if(name=="filterModelCut") {
                modelCut = data;
            }
            else if(name=="filterExceptSoldout") {
                exceptSoldout = data;
            }
        }
    });

    //가격
    var fPriceSelf1 = $("input[name='fPriceSelf1']").val();
    var fPriceSelf2 = $("input[name='fPriceSelf2']").val();

    if(fPriceSelf1 != '' ||fPriceSelf2 != '') {
        if(fPriceSelf1 == '') {
            fPriceSelf1 = '0';
        }
        if(fPriceSelf2 == '') {
            fPriceSelf2 = '500';
        }
        price.push(fPriceSelf1);
        price.push(fPriceSelf2);
    }

    //할인율
    var fSaleSelf1 = $("input[name='fSaleSelf1']").val();
    var fSaleSelf2 = $("input[name='fSaleSelf2']").val();

    if(fSaleSelf1 != '' ||fSaleSelf2 != '') {
        if(fSaleSelf1 == '') {
            fSaleSelf1 = '0';
        }
        if(fSaleSelf2 == '') {
            fSaleSelf2 = '100';
        }
        rate.push(fSaleSelf1);
        rate.push(fSaleSelf2);
    }


    $("#searchForm").find("input[name='lCateFilter']").val(lCateFilter);
    $("#searchForm").find("input[name='mCateFilter']").val(mCateFilter.toString());
    $("#searchForm").find("input[name='sCateFilter']").val(sCateFilter.toString());
    $("#searchForm").find("input[name='dCateFilter']").val(dCateFilter.toString());
    $("#searchForm").find("input[name='cateNos']").val(cateNos.toString());
    $("#searchForm").find("input[name='brandId']").val(brandId.toString());

    $("#searchForm").find("input[name='price']").val(price.toString());
    $("#searchForm").find("input[name='rate']").val(rate.toString());
    $("#searchForm").find("input[name='size']").val(size.toString());
    $("#searchForm").find("input[name='color']").val(color.toString());
    $("#searchForm").find("input[name='matr']").val(matr.toString());

    $("#searchForm").find("input[name='modelCut']").val(modelCut);
    $("#searchForm").find("input[name='exceptSoldout']").val(exceptSoldout);


}

function setFilterParam(obj) {
    if(obj) {
        if(obj.lCateFilter) {
            filterSet('category1', obj.lCateFilter);
        }
        if(obj.mCateFilter) {
            filterSet('category2', obj.mCateFilter);
        }
        if(obj.sCateFilter) {
            filterSet('category3', obj.sCateFilter);
        }
        if(obj.dCateFilter) {
            filterSet('category4', obj.dCateFilter);
        }
        if(obj.cateCd) {
            $("[name='cateCd']").val(obj.cateCd);
        }

        if(obj.brandId) {
            filterSet('filterBrndIds', obj.brandId);
        }
        if(obj.color) {
            $("[name='filterColorCds']").each(function () {
               if(obj.color.indexOf($(this).val()) > -1) {
                   $(this).prop("checked", true);
               }
            });
        }
        if(obj.size) {
            filterSet('filterSizeCds', obj.size);
        }
        if(obj.matr) {
            filterSet('filterMatrCds', obj.matr);
        }
        if(obj.price) {
            var arPrice = obj.price.split(",");
            $("[name='fPriceMin']").val(arPrice[0]);
            $("[name='fPriceMax']").val(arPrice[1]);

            $("[name='fPriceSelf1']").val(arPrice[0]);
            $("[name='fPriceSelf2']").val(arPrice[1]);
        }
        if(obj.rate) {
            var arRate = obj.rate.split(",");
            $("[name='fSaleMin']").val(arRate[0]);
            $("[name='fSaleMax']").val(arRate[1]);

            $("[name='fSaleSelf1']").val(arRate[0]);
            $("[name='fSaleSelf2']").val(arRate[1]);
        }

        if(obj.exceptSoldout) {
            $("[name='filterExceptSoldout'][value='" + obj.exceptSoldout + "']").prop("checked", true);
        }
        if(obj.modelCut) {
            $("[name='filterModelCut'][value='" + obj.modelCut + "']").prop("checked", true);
        }

    }
}

function filterSet(name, value) {
    var array = value.split(",");
    for (var i = 0; i < array.length; i++) {
        $("[name='"+ name +"'][value='" + array[i] + "']").prop("checked", true);
    }
}

var isTrigger = false; //count 중복실행방지
//history data 세팅
function setFilterHistory(){
    if(history.state){
        isTrigger = true;

        var frm = $('#searchForm');
        var dataArray = history.state.data;
        //console.log(dataArray);
        for(var i = 0; i < dataArray.length; i++){
            var obj = dataArray[i];
            if(!obj.value){
                continue
            }
            if("lCateFilter" === obj.name) {
                filterSet('category1', obj.value);
            }
            if("mCateFilter" === obj.name) {
                filterSet('category2', obj.value);
            }
            if("sCateFilter" === obj.name) {
                filterSet('category3', obj.value);
            }
            if("dCateFilter" === obj.name) {
                filterSet('category4', obj.value);
            }
            if("cateCd" === obj.name) {
                $("[name='cateCd']").val(obj.value);
            }
            if("brandId" === obj.name) {
                filterSet('filterBrndIds', obj.value);
            }
            if("color" === obj.name) {
                $("[name='filterColorCds']").each(function () {
                    if(obj.value.indexOf($(this).val()) > -1) {
                        $(this).prop("checked", true);
                    }
                });
            }
            if("size" === obj.name) {
                filterSet('filterSizeCds', obj.value);
            }
            if("matr" === obj.name) {
                filterSet('filterMatrCds', obj.value);
            }
            if("price" === obj.name) {
                var arPrice = obj.value.split(",");
                $("[name='fPriceMin']").val(arPrice[0]);
                $("[name='fPriceMax']").val(arPrice[1]);

                $("[name='fPriceSelf1']").val(arPrice[0]);
                $("[name='fPriceSelf2']").val(arPrice[1]);
            }
            if("rate" === obj.name) {
                var arRate = obj.value.split(",");
                $("[name='fSaleMin']").val(arRate[0]);
                $("[name='fSaleMax']").val(arRate[1]);

                $("[name='fSaleSelf1']").val(arRate[0]);
                $("[name='fSaleSelf2']").val(arRate[1]);
            }
            if("exceptSoldout" === obj.name) {
                $("[name='filterExceptSoldout'][value='" + obj.value + "']").prop("checked", true);
            }
            if("modelCut" === obj.name) {
                $("[name='filterModelCut'][value='" + obj.value + "']").prop("checked", true);
            }
            if("searchCount" === obj.name) {
                $("[name='searchCount']").val(obj.value);
                $("[name='searchGodCnt']").val(obj.value);
            }

        }
        //카운트 가져오기
        getCount();
        isTrigger = false;
    }else{
        console.log('state Null!!');
    }
}

//정렬 값 선택시
$(document).on("change", "[name='pdSort']", function (e) {
    if($("[name='mallGubun']").val() != 'SEARCH') {
        var sortColumn = $(this).val();
        $("input[name='sortColumn']").val(sortColumn);
        $(this).removeClass("selected");
        $(this).addClass("on");

        $('#searchForm').find("input[name='currentPage']").val("1");

        $("#productsList").html("");

        selectProductList(true);
    }
    else {
        var sortColumn = $(this).val();

        $('#searchForm').find("input[name='sort']").val(sortColumn);
        $(this).removeClass("selected");
        $(this).addClass("on");

        getSearchGodFilter();
    }

});

//필터 항목 클릭 이벤트
$(document).on('change', '.filter-layer input',function () {
    //console.log('list-filter input change ===' + $(this).attr('name'));
    getCount();
});

$(document).on('delete', '#saleFilter', function(){
    getCount();
});

$(document).on('delete', '#priceFilter', function(){
    getCount();
});

//하위카테고리 영역 선택 시
$(document).find("#selCtgList").find(".keyword-list").find("button").on('click',function (e) {
    var valatr = $(this).attr("valatr");
    if(valatr != undefined && valatr != '' && valatr == 'brnd') {
        //$("input[name='filterBrndIds']").prop('checked', false);
        resetFilter();

        var brndId = $(this).val();
        if($(this).hasClass("active")) {
            $(this).parent().find("button").removeClass("active");
            $(this).removeClass("active");
            $("input[name='filterBrndIds'][value='" + brndId + "']").prop('checked', false);
        }
        else {
            $(this).parent().find("button").removeClass("active");
            $(this).addClass("active");
            $("input[name='filterBrndIds'][value='" + brndId + "']").prop('checked', true);
        }
    }
    else {
        //$('input[name^="category"]').prop('checked', false);
        resetFilter();

        var ctg = $(this).val();
        if($(this).hasClass("active")) {
            $(this).parent().find("button").removeClass("active");
            $(this).removeClass("active");
            $('input[name^="category"][value="' + ctg + '"]').prop('checked', false);
        }
        else {
            $(this).parent().find("button").removeClass("active");
            $(this).addClass("active");
            $('input[name^="category"][value="' + ctg + '"]').prop('checked', true);
        }
    }
    filterLoad();
    searchFilter();
});

function resetKeywordList() {
    if($(".keyword-list").find("button.active").length == 1) {
        var valatr = $(".keyword-list").find("button.active").attr("valatr");
        if(valatr != undefined && valatr != '' && valatr == 'brnd') {
            if(!($('input[name="filterBrndIds"]:checked').length == 1 && $('input[name="filterBrndIds"]:checked').val() == $(".keyword-list").find("button.active").attr("value"))) {
                $(".keyword-list").find("button").removeClass("active");
            }
        }
        else {
            if(!($('input[name^="category"]:checked').length == 1 && $('input[name^="category"]:checked').val() == $(".keyword-list").find("button.active").attr("value"))) {
                $(".keyword-list").find("button").removeClass("active");
            }
        }
    }
}
