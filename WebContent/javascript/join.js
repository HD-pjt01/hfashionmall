function allAgrCheckResult() {
    if($("#allAgrChk").is(':checked')){
        $("#usefStplat").prop('checked',true);
        $("#consignmentStplat").prop('checked',true);
        $("#privacyRequired").prop('checked',true);
        $("#privacyChoise").prop('checked',true);
        $("#mktAgree").prop('checked',true);
        $("#smsRecptnAgrYn").prop('checked',true);
        $("#emailRecptnAgrYn").prop('checked',true);
    }else{
        $("#usefStplat").prop('checked',false);
        $("#consignmentStplat").prop('checked',false);
        $("#privacyRequired").prop('checked',false);
        $("#privacyChoise").prop('checked',false);
        $("#mktAgree").prop('checked',false);
        $("#smsRecptnAgrYn").prop('checked',false);
        $("#emailRecptnAgrYn").prop('checked',false);
    }
}

// 레이어
var layer = {
	btn : {},
	init : function(id) {
		var body = document.body;
		var el = document.querySelector('#'+id);
		
		el.style.display = 'none';
		body.classList.remove('scroll-lock');
		body.style.removeProperty('width');
		$('#header .header-inner')[0].style.removeProperty('width');

		var elClone = el.cloneNode(true);
		el.parentNode.replaceChild(elClone, el);
	},

	open : function(id) {
		// layer.init(id);
		
		if(event) var target = event.currentTarget || event.srcElement;
		var body = document.body;
		var layerPop = document.querySelector('#'+id);
		var layerWrap = layerPop.querySelector('.layer-wrap');
		var btnLayerClose = layerWrap.querySelector('.btn-layer-close');

		body.classList.add('scroll-lock');
		if( !$('.layer-pop').is(':visible') ){
			
			$('body').css('width', 'calc(100% - ' + (window.scrollWidth || 0) + 'px)');
			$('#header .header-inner').css('width', 'calc(100% - ' + (window.scrollWidth || 0) + 'px)');
			
		}
		layerPop.style.display = 'block';
		layerWrap.focus();

		if(!layer.btn[id]) {
			// layerPop.addEventListener('click', function(){
			// 	layer.close(id);
			// });
			// layerWrap.addEventListener('click', function(){
			// 	(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;

			// 	$('.select').removeClass('open');
			// });
			
			// $(layerPop).off('click.layerdim').on('click.layerdim', function(e){
			// 	if (e.target && $(e.target).hasClass('layer-pop')) {
			// 		layer.close(id);
			// 	}
			// }); //20.11.05 삭제 - 레드마인 #19267

			$(layerWrap).off('click.layercontent').on('click.layercontent', function(e){
				// e.stopPropagation();
				$('.select').removeClass('open');
			});
			
			layerPop.addEventListener('focus', function(){
				btnLayerClose.focus();
			});
			btnLayerClose.addEventListener('keydown', function(){
				if(event.keyCode == 9) {
					layerWrap.focus();
				}
			});
		}
		
		if(layerWrap.querySelector('#shoppingBagItem') && !slide.obj['shoppingBagItem']) {
			slide.create('shoppingBagItem');
		}

		// if(layerWrap.querySelector('#likeItemList') && !slide.obj['likeItemList']) {
		// 	slide.create('likeItemList');
		// }

		// if(layerWrap.querySelector('#coordinateItem') && !slide.obj['coordinateItem']) {
		// 	slide.create('coordinateItem');
		// }

		// if(layerWrap.querySelector('#coordinateItem2') && !slide.obj['coordinateItem2']) {
		// 	slide.create('coordinateItem2');
		// }

		// if(layerWrap.querySelector('#coordinateItem3') && !slide.obj['coordinateItem3']) {
		// 	slide.create('coordinateItem3');
		// }
		
		if(event && target instanceof HTMLElement) layer.btn[id] = target;
	},
	close : function(id) {
		var body = document.body;
		var layerWrap = document.querySelector('#'+id);

		$(layerWrap).trigger('beforeclose');
		layerWrap.style.display = 'none';
		body.classList.remove('scroll-lock');
		
		/* mod : 220622 begin */
		if( !$('.layer-pop').is(':visible') ){
			
			body.classList.remove('scroll-lock');
			body.style.removeProperty('width');
			
		}
		/* // mod : 220622 end */
		$('#header .header-inner')[0].style.removeProperty('width');

		$(layerWrap).trigger('close');
		if(layer.btn[id] && layer.btn[id] instanceof HTMLElement) {
			layer.btn[id].focus();
		}
		$(layerWrap).trigger('afterclose');
	},
	create : function(id, title) {
		var wrap = document.querySelector('#wrap');
		var footer = document.querySelector('#footer');
		var div = document.createElement('div');
		div.setAttribute('id', id);
		div.setAttribute('class', 'layer-pop');
		div.setAttribute('tabindex', '0');

		var template = '';
		template += '<div class="layer-wrap" tabindex="0">'
		if(title) {
			template += '	<div class="layer-header">'
			template += '		<h2 class="layer-title">'+title+'</h2>'
			template += '	</div>'
		}
		template += '	<div class="layer-container">'
		template += '		<div class="layer-content">'
		template += '			<div class="layer-content-inner">'
		template += '			</div>'
		template += '		</div>'
		template += '	</div>'
		template += '	<button type="button" class="btn-layer-close" onclick="layer.remove(\''+id+'\');">닫기</button>'
		template += '</div>'

		div.innerHTML = template;

		wrap.insertBefore(div, footer);
		$(id).trigger('create');
	},
	remove : function(id) {
		var layerWrap = document.querySelector('#'+ id);
		var body = document.querySelector('body');

		// 2020.12.09
		if( !$('#reviewDetail').is(':visible') ){
			body.classList.remove('scroll-lock');
			body.style.removeProperty('width');
			$('#header .header-inner')[0].style.removeProperty('width');
		}

		// body.classList.remove('scroll-lock');
		// body.style.removeProperty('width');
		// $('#header .header-inner')[0].style.removeProperty('width');

		layerWrap.style.display = 'none';
		layerWrap.parentNode.removeChild(layerWrap);
		
		if(layer.btn[id]) {
			layer.btn[id].focus();
			delete layer.btn[id];
		}

		$(document).trigger('removed.layer');
	}
}

function idcheck() {
	if (document.formm.member_id.value == "") {
	alert('아이디를 입력하여 주십시오.');
	document.formm.member_id.focus();
	return;
	}
	var url = "hfashionmallServlet?command=id_check_form&id=" + document.formm.member_id.value;
	window.open( url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=100");
} // 나중에 고칠곳

function pwcheck(){
	if (document.formm.member_pw.value.length < 5){
		alert("비밀번호의 제약사항을 맞춰주세요.");
		document.formm.member_pw.focus();
		return;
	}
}

function repwcheck(){
	if (document.formm.member_pw.value != document.formm.pwdCheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.formm.pwdCheck.focus();
		return;
	}
}

function must_next(){
	if (document.formm.usefStplat.checked == true && document.formm.consignmentStplat.checked == true && document.formm.privacyRequired.checked == true){
		document.formm.submit();
	}
	else{
		if(document.formm.usefStplat.checked == false){
			alert('이용약관, 멤버십 약관 동의를 체크하십시오.');
			document.formm.usefStplat.focus();
		}
		else if(document.formm.consignmentStplat.checked == false){
			alert('개인정보 취급 위탁 동의를 체크하십시오.');
			document.formm.consignmentStplat.focus();
		}
		else if(document.formm.privacyRequired.checked == false){
			alert('개인정보 수집/이용 동의를 체크하십시오.');
			document.formm.privacyRequired.focus();
		}
	}
}

function go_save() {
	if (document.formm.member_id.value == "") {
		alert("아이디를 입력하여 주세요.");
		document.formm.member_id.focus();
	//} else if (document.formm.member_id.value != document.formm.reid.value) {
		//alert("중복확인을 클릭하여 주세요.");
		//document.formm.member_id.focus();
	} else if (document.formm.member_pw.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.formm.member_pw.focus();
	} else if (document.formm.member_pw.value.length < 5){
		alert("비밀번호의 제약사항을 맞춰주세요.");
	} else if (document.formm.pwdCheck.value == "") {
		alert("재확인 비밀번호를 입력해 주세요.");
		document.formm.pwdCheck.focus();
	} else if ((document.formm.member_pw.value != document.formm.pwdCheck.value)) {
		alert("비밀번호가 일치하지 않습니다.");
		document.formm.member_pw.focus();
	} else if (document.formm.member_name.value == "") {
		alert("이름을 입력해 주세요.");
		document.formm.member_name.focus();
	} else if (document.formm.member_email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.formm.member_email.focus();
	} else if (document.formm.member_birth.value == "") {
		alert("생일을 입력해 주세요.");
		document.formm.member_email.focus();
	} else if (document.formm.member_phone.value == "") {
		alert("핸드폰 번호를 입력해 주세요.");
		document.formm.member_phone.focus();
	} else {
		document.formm.action = "hfashionmallServlet?command=join";
		must_next();
	}
}

function post_zip() {
	var url = "hfashionmallServlet?command=find_zip_num";
	window.open( url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=300, top=300, left=300, ");
}

function go_next() {

    	document.formm.action = "hfashionmallServlet?command=join_form";
    	document.formm.submit();

}