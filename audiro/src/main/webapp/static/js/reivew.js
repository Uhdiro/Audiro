/**
 * /post/review/mypage.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {

	
	// 최신순, 좋아요 콤보박스 클릭이벤트	
	const combobox = document.querySelector('form#rank');
	combobox.addEventListener('change', SelectCombobox);
		
	//좋아요 클릭 이벤트 
	const btnLike = document.querySelectorAll('.like-btn');	
	btnLikes.forEach(btnLike => {
	       btnLike.addEventListener('click', saveLike);
	   });
	
	   
	//create.jsp 저장
	const savebtn = document.querySelector('button#savebtn');
	//cerate.jsp 임시저장
	const draftbtn = document.querySelector('button#draftbtn');
	
	
	/*--------------------------------------------------------------------------------------------------------- */


	// 저장 버튼 클릭 시 실행할 함수
	function savebtn() {
		alert('저장 버튼 클릭!')
		// 저장 로직을 추가할 수 있습니다.
	}

	// 임시 저장 버튼 클릭 시 실행할 함수
	function draftbtn() {
		alert('임시 저장 버튼 클릭!')
		// 임시 저장 로직을 추가할 수 있습니다.
	}



	
	
	
	
	
	
	
	
	
	
	
	
	//콤보박스
	function SelectCombobox() {
		if (combobox) {
				combobox.addEventListener('change', function() {
					const selectCombobox = combobox.value;
					if (selectCombobox === 'latest') {
						console.log('최신순');
						latest();
						
					} else if (selectCombobox === 'likes') {
						console.log('좋아요순');
						likes();
					}
				});
			} else {
				console.error('error');
			}
	}
	
	
	//최신순 목록 가져오기
	function latest() {
		const uri = `../api/latest`;
		axios
		.post(uri)
		.then((response) => {
			console.log(response.data);
		})
		.catch((error) => {
			console.log(error);
		})
	}
	//좋아요순 목록 가져오기
	function likes() {
			const uri = `../api/likes`;
			axios
			.post(uri)
			.then((response) => {
				console.log(response.data);
			})
			.catch((error) => {
				console.log(error);
			})
		}
		
	//좋아요 db저장
	async function saveLike() {
	      
			}
	    
	
});



