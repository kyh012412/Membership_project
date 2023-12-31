let b_email_auth = false;

function send_password(f){
	let m_id = document.getElementById("m_id").value;
	let m_email = document.getElementById("m_email").value;
	let m_code = document.getElementById("m_code").value;
	
	if(m_id == ''){
		alert('아이디를 입력해주세요');
		return;
	}
	
	if(m_email == ''){
		alert('이메일을 입력해주세요');
		return;
	}
	
	if(m_code != code){
		alert('인증번호를 확인해주세요');
		return;
	}
	
	if(!b_email_auth){
		alert('이메일 인증을 해주세요');
		return;
	}
	
	let url = "find_password";

	let param = {
		"m_id": encodeURIComponent(m_id),
		"m_email": encodeURIComponent(m_email),
		"m_code": encodeURIComponent(m_code)
	};

	send_request(url, param, check, "post");
}

function check(...args){
	let res = args[0].param
	
	let form = document.getElementsByTagName("form")[0];
	
	if(res == 'no_m_email'){
		alert('이메일이 일치하지 않습니다');
		form.m_email.focus();
		return;	
	} else if(res == 'no_m_id'){
		alert('아이디와 이메일이 일치하지 않습니다.');
		form.m_id.focus();
		return;
	} else {
		alert('비밀번호 찾기 성공');
		location.href='password';
	}
}

function check_email(f){
	let m_email = document.getElementById("m_email").value;
	
	let url = "check_email";

	let param = {
		"m_email": encodeURIComponent(m_email)
	};
	send_request(url, param, e_check, "post");
}

function e_check(...args){
	let res = args[0].param
	
	if(res == 'ok_m_email'){
		b_email_auth = false;
		return;
	} else {
		return;
	}
}