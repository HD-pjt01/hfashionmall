function go_cart() {
	document.fomm.action = "hfashionmallServlet?command=cart_insert";
	document.fomm.submit();
}

function go_direct_order() {
document.fomm.action = "hfashionmallServlet?command=ordering_one";
	document.fomm.submit();
}


function go_direct_order_insert() {
document.fomm.action = "hfashionmallServlet?command=order_direct_insert";
	document.fomm.submit();
}


function go_cart_delete() {
	/*alert("삭제 클릭");*/
	var count = 0;

	if (document.formm.cart_id.length == undefined) {
		if (document.formm.cart_id.checked == true) {
			count++;
		}
	}

	for (var i = 0; i < document.formm.cart_id.length; i++) {

		if (document.formm.cart_id[i].checked == true) {
			count++;

		}
	}
	if (count == 0) {
		alert("삭제할 항목을 선택해 주세요.");

	} else {
		document.formm.action = "hfashionmallServlet?command=cart_delete";
		document.formm.submit();
	}
}


function go_ordering() {
	document.formm.action = "hfashionmallServlet?command=ordering";
	document.formm.submit();
}

// formm 수정해야 함
function go_order_insert() {
	document.formm.action = "hfashionmallServlet?command=order_insert";
	document.formm.submit();
}

/*function go_order_direct_insert(product_code) {
  document.formm.action = "hfashionmallServlet?command=order_direct_insert&product_code=product_code";
  document.formm.submit();
}*/

function go_order_delete() {
	var count = 0;

	if (document.formm.oseq.length == undefined) {
		if (document.formm.oseq.checked == true) {
			count++;
		}
	}

	for (var i = 0; i < document.formm.oseq.length; i++) {
		if (document.formm.oseq[i].checked == true) {
			count++;
		}
	}
	if (count == 0) {
		alert("삭제할 항목을 선택해 주세요.");

	} else {
		document.formm.action = "hfashionmallServlet?command=order_delete";
		document.formm.submit();
	}
}

function go_order() {
	document.formm.action = "hfashionmallServlet?command=mypage";
	document.formm.submit();
}