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