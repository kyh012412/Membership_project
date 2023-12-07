function send(f){
	let m_id = f.m_id.value.trim();
	let m_password = f.m_password.value.trim();
	
	if(m_id == ''){
		alert('아이디를 입력해주세요');
		f.m_id.focus();
		return;
	}
	
	if(m_password == ''){
		alert('비밀번호를 입력해주세요');
		f.m_password.focus();
		return;
	}
	
	let url = "login";

	let param = {
		"m_id": encodeURIComponent(m_id),
		"m_password": encodeURIComponent(m_password)
	};
	sendRequest(url, param, myCheck, "post");
}

function myCheck(...args){
	console.log(args)
	let res = args[0];
	
	let form = document.getElementsByTagName("form")[0];

	console.log(res)

	localStorage.setItem("idx", res.m_idx);
	localStorage.setItem("id", res.m_id);
	localStorage.setItem("password", res.m_password);
	localStorage.setItem("isMaster", res.m_ismaster);

	sessionStorage.setItem("session", true);
	
	if(res == 'no_m_id'){
		alert('아이디가 존재하지 않습니다.');
		form.m_id.focus();
		return;
	} else if(res == 'no_m_password'){
		alert('비밀번호가 일치하지 않습니다');
		form.m_password.focus();
		return;
	} else {
		location.href='main';
	}
}
