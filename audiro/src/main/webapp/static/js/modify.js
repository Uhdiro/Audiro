/**
 * /post/review/modify.jsp포함
 */
document.addEventListener('DOMContentLoaded', () => {
	
	//modify 수정완료
	const modifyBtn = document.querySelector('button#modifyBtn');
	modifyBtn.addEventListener('click', modifyBtnListener);
	
	
	////////////////////////////////////////////////////////////////////////////////

	// 수정완료
	function modifyBtnListener(e) {
		alert('수정완료버튼!');
		
		e.preventDefault();
		const form = document.querySelector('form#modifyForm');
		
		form.action = 'update'
		form.method= 'get'
		form.submit();
		
	}
	});
	
	
