/**
 * /post/review/create.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {

	   
	//create.jsp 저장
	const saveBtn = document.querySelector('button#savebtn');
	saveBtn.addEventListener('click', saveBtnListener);
	
	//cerate.jsp 임시저장
	const draftBtn = document.querySelector('button#draftbtn');
	draftBtn.addEventListener('click', draftBtnListener);
	
	
	//임시저장불러오기
	const selectDraft = document.querySelector('form#"selectDraftForm"')
	selectDraft.addEventListener('click', selectDraftListener);
	/*
	//좋아요 클릭 이벤트 
	const btnLike = document.querySelectorAll('.like-btn');	
	btnLikes.forEach(btnLike => {
	       btnLike.addEventListener('click', saveLike);
	   });
	*/
	
	
	
	
	/*--------------------------------------------------------------------------------------------------------- */


	//임시저장 불러오기
	function selectDraftListener(e) {
		alert('임시저장불러오기!!!');
		
		//임시저장 
		
	}
	

	// 저장 버튼 클릭 시 실행할 함수
	function saveBtnListener(e) {
		//alert('저장 버튼 클릭!');
		
		e.preventDefault();// 버튼기본동작을 막음.
		
		// form 찾음. -> form.action, form.method 설정 -> form.submit()
		const form = document.querySelector('form#createForm')
		
		form.action ='create';
		form.method = 'POST'; 
		
		form.submit();
		
	}

	// 임시 저장 버튼 클릭 시 실행할 함수
	function draftBtnListener(e) {
		//alert('임시 저장 버튼 클릭!');

		e.preventDefault();// 버튼기본동작을 막음.
		
		const form = document.querySelector('form#createForm')
				
				form.action ='draft';
				form.method = 'POST'; 
				
				form.submit();
	}


	
	
});



