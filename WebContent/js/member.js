function go_save() {
	if (document.formm.member_id.value == "") {
		alert("아이디를 입력하여 주세요.");
		document.formm.member_id.focus();
	} else if (document.formm.member_id.value != document.formm.reid.value) {
		alert("중복확인을 클릭하여 주세요.");
		document.formm.member_id.focus();
	} else if (document.formm.member_pw.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.formm.member_pw.focus();
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
		document.formm.submit();
	}
}

function idcheck() {
	if (document.formm.member_id.value == "") {
	alert('아이디를 입력하여 주십시오.');
	document.formm.member_id.focus();
	return;
	}
	var url = "hfashionmallServlet?command=id_check_form&id=" + document.formm.member_id.value;
	window.open( url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=200");
}

function post_zip() {
	var url = "hfashionmallServlet?command=find_zip_num";
	window.open( url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=300, top=300, left=300, ");
}

function go_next() {

    	document.formm.action = "hfashionmallServlet?command=join_form";
    	document.formm.submit();

}