function send_id(f){
	let m_name = document.getElementById("m_name").value;
	let m_email = document.getElementById("m_email").value;
	let m_mail = document.getElementById("m_mail").value;
	
	if(m_name == ''){
		alert('이름을 입력해주세요');
		return;
	}
	
	if(m_email == ''){
		alert('이메일을 입력해주세요');
		return;
	}
	
	if(m_mail != code){
		alert('인증번호를 확인해주세요');
		return;
	}
	
	
	let url = "register_find_id";

	let param = {
		"m_name": encodeURIComponent(m_name),
		"m_email": encodeURIComponent(m_email)
	};

	sendRequest(url, param, check, "post");
}

function check(...args){
	let res = args[0].param
	
	let form = document.getElementsByTagName("form")[0];
	
	if(res == 'no m_email'){
		alert('이메일이 일치하지 않습니다');
		form.m_email.focus();
		return;
	} else if(res == 'no m_name'){
		alert('이름이 존재하지 않습니다.');
		form.m_name.focus();
		return;
	} else {
		alert('아이디 찾기 성공');
		location.href='id';
	}
}
