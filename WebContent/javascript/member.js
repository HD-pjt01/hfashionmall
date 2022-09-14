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