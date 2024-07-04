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
	const selectDraftList = document.querySelector('form#selectDraftForm')
	selectDraftList.addEventListener('submit', selectDraftListener);
	/*
	//좋아요 클릭 이벤트 
	const btnLike = document.querySelectorAll('.like-btn');	
	btnLikes.forEach(btnLike => {
	       btnLike.addEventListener('click', saveLike);
	   });
	*/
	
	
	
	
	/*--------------------------------------------------------------------------------------------------------- */

	// 저장 버튼 클릭 시 실행할 함수
	function saveBtnListener(e) {
		//alert('저장 버튼 클릭!');
		
		e.preventDefault();// 버튼기본동작을 막음.
		
		const inputTitle = document.querySelector('input#title');
		const summernote = document.querySelector('textarea#summernote');
		
		// form 찾음. -> form.action, form.method 설정 -> form.submit()
		const form = document.querySelector('form#createForm')
		// 제목과 내용이 비어있는 지 체크:
			if (inputTitle.value === '' || summernote.value === '') {
		        alert('제목과 내용은 반드시 입력하세요.');
		        return;
		        }	
		form.action ='create';
		form.method = 'POST'; 
		
		form.submit();
		
	}


	
	
	//임시저장 불러오기
	function selectDraftListener(e) {
		e.preventDefault();// 버튼기본동작을 막음.
		alert('임시저장불러오기!!!');
		
		//임시저장 
		
	}
	//임시저장목록에 제목 클릭이벤트
	function selectDraftById(draftPostId) {
		const form = document.getElementById('draftForm');
		if (form) {
			document.getElementById('selectedDraft').value = draftPostId;
			form.submit();
		} else {
			console.error('error');
		}
	}

	   // HTML 요소에 직접 onclick 이벤트를 설정하지 않고, 이벤트 리스너를 추가하는 방법
	   const draftLinks = document.querySelectorAll('.list-group-item a');
	   draftLinks.forEach(function(link) {
	       link.addEventListener('click', function(event) {
	           event.preventDefault(); // 기본 동작(링크 이동) 방지
	           const draftId = this.dataset.draftPostId; // 링크에 설정된 데이터 속성에서 draftPostId 값 가져오기
	           selectDraftById(draftId); // selectDraftById 함수 호출
	       });
	   });
	
	/*
	// 임시저장 목록 항목 클릭 이벤트
	   const draftItems = document.querySelectorAll('#draftList .list-group-item');
	   draftItems.forEach(item => {
	       item.addEventListener('click', () => {
	           const title = item.querySelector('.title').textContent.trim();
	           const modifiedTime = item.querySelector('.modifiedTime').textContent.trim();
	           const content = item.querySelector('.content').textContent.trim();

	           // create 양식의 필드에 값 채우기
	           const inputTitle = document.querySelector('input#title');
	           const summernote = document.querySelector('textarea#summernote');

	           inputTitle.value = title;
	           summernote.value = content;

	           // 모달 닫기
	           $('#selectDraftModal').modal('hide');
	       });
	   });
*/
	
	
	
	
	

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



