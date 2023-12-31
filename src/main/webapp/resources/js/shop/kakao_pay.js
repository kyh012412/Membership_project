function kakaopay(f){
	let m_id = f.m_id.value.trim();
	let m_password = f.m_password.value.trim();
	
	let url = "login";

	let param = {
		"m_id": encodeURIComponent(m_id),
		"m_password": encodeURIComponent(m_password)
	};
	send_request(url, param, kakao, "post");
}

function kakao() {
        var IMP = window.IMP;
        IMP.init('imp57607280');
        var msg;
        let order_list_json = localStorage.getItem("order_list_json");

        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '${payment_name}',
            amount: '${payment_price}',
            buyer_email: '${id.m_email}',
            buyer_name: '${id.m_name}',
            buyer_tel: '${id.m_tel}',
            buyer_addr: '${id.m_addr1}',
            buyer_postcode: "01181"
        }, function (rsp) {
        	if('${membership}' == 1 ) {
        		if (rsp.success) {
	                // 서버단에서 결제정보 조회를 위해 fetch로 imp_uid 전달하기
	                // 여기도 payment_completed로 하면 2번 왔다갔다해서 2개월 결제됨 그래서 main으로 설정
	                fetch('membership_payment_completed', {
	                    method: 'POST',
	                    headers: {
	                        'Content-Type': 'application/json;charset=UTF-8'
	                    },
	                    body: JSON.stringify({
	                        
	                        // 기타 필요한 데이터가 있으면 추가 전달
	                    })
	                })
	                .then(response => {
	                    if (!response.ok) {
	                        throw new Error('Network response was not ok');
	                    }
	                    return response.json();
	                })
	                .then(data => {
	                    if (data.everythings_fine) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\n결제 금액 : ' + rsp.paid_amount;
	                        msg += '\n카드 승인번호 : ' + rsp.apply_num;
	
	                        alert(msg);
	                    } else {
	                        // 결제가 아직 완료되지 않았습니다.
	                        // 결제된 금액이 요청한 금액과 달라 결제를 자동 취소처리하였습니다.
	                    }
	                })
	                .catch(error => {
	                    console.error('Error:', error.message);
	                });
	                window.localStorage.setItem("isMembership", "1");
	                // 성공시 이동할 페이지
	                
	                location.href = '<%=request.getContextPath()%>/completed_page';
	            } else {
	                msg = '결제에 실패하였습니다.';
	                // msg += '\에러내용 : ' + rsp.error_msg;
	                // 실패시 이동할 페이지
	                alert(msg);
	                location.href = "shop";
	            }
        	} else {
        		if (rsp.success) {
	                // 서버단에서 결제정보 조회를 위해 fetch로 imp_uid 전달하기
	                fetch("payment_completed", {
	                    method: 'POST',
	                    headers: {
	                        'Content-Type': 'application/json;charset=UTF-8'
	                    },
	                    body: JSON.stringify({
	                       order_list_json
	                        // 기타 필요한 데이터가 있으면 추가 전달
	                    })
	                })
	                .then(response => {
	                    if (!response.ok) {
	                        throw new Error('Network response was not ok');
	                    }
	                    return response.json();
	                })
	                .then(data => {
	                    if (data.everythings_fine) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\n결제 금액 : ' + rsp.paid_amount;
	                        msg += '\n카드 승인번호 : ' + rsp.apply_num;
	
	                        alert(msg);
	                    } else {
	                        // 결제가 아직 완료되지 않았습니다.
	                        // 결제된 금액이 요청한 금액과 달라 결제를 자동 취소처리하였습니다.
	                    }
	                })
	                .catch(error => {
	                    console.error('Error:', error.message);
	                });
	                // 성공시 이동할 페이지
	                location.href = '<%=request.getContextPath()%>/completed_page';
	            } else {
	                msg = '결제에 실패하였습니다.';
	                // msg += '\에러내용 : ' + rsp.error_msg;
	                // 실패시 이동할 페이지
	                alert(msg);
	                location.href = "shop";
	            }
        	}
            
        });
    });