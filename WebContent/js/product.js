/**
 * 
 */
var tab1 = $("#detail-img-text-box").offset().top - 100;
var tab2 = $("#detail-review-box").offset().top - 100;
var tab3 = $("#detail-qna-box").offset().top - 100;
var tab4 = $("#detail-purchaseInfo-box").offset().top - 100;


$(window).on("scroll", function() {
	var nowY = $(this).scrollTop();
	
	if(nowY > tab1) {
		$("#tab-img-text").css('border-bottom', '4px solid black');
		$("#tab-img-text-a").css('color','black');
	} else {
		$("#tab-img-text").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-img-text-a").css('color','#9a9a9e');
	}
	
	if (nowY > tab2) {
		$("#tab-img-text").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-img-text-a").css('color','#9a9a9e');
		$("#tab-review").css('border-bottom', '4px solid black');
		$("#tab-review-a").css('color','black');
	} else {
		$("#tab-review").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-review-a").css('color','#9a9a9e');
	}
	
	if (nowY > tab3) {
		$("#tab-review").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-review-a").css('color','#9a9a9e');
		$("#tab-qna").css('border-bottom', '4px solid black');
		$("#tab-qna-a").css('color','black');
	} else {
		$("#tab-qna").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-qna-a").css('color','#9a9a9e');
	}
	
	if (nowY > tab4) {
		$("#tab-qna").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-qna-a").css('color','#9a9a9e');
		$("#tab-purchaseInfo").css('border-bottom', '4px solid black');
		$("#tab-purchaseInfo-a").css('color','black');
	} else {
		$("#tab-purchaseInfo").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-purchaseInfo-a").css('color','#9a9a9e');
	}
});

$("#tab-img-text-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab1+10}, 1000);
});
$("#tab-review-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab2+10}, 1000);
});
$("#tab-qna-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab3+10}, 1000);
});
$("#tab-purchaseInfo-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab4+10}, 1000);
});