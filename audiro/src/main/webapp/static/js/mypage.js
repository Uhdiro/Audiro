/**
 * /post/review/mypage.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', function() {

	// 최신순, 좋아요 콤보박스 클릭이벤트
	const sortSelect = document.querySelector('select#sortSelect');
	sortSelect.addEventListener('change', SelectCombobox);

	//유저 관심등록 클릭 이벤트
	const btnLike = document.querySelector('button#userLike');
	btnLike.addEventListener('click', likeBtn);

	//여행후기 찜 담기 클릭 이벤트
	const btnReviewLike = document.querySelectorAll('.likeReview');
	btnReviewLike.forEach(btn => {
		btn.addEventListener('click', favoriteReview);
	});






	////////////////////////////////////////////////////////////

	// 유저 관심 담기(담고 삭제하기)
	async function favoriteUser(event) {
	    const tag = event.currentTarget;
	    const userId = tag.attributes['data-user-id'].nodeValue; // 클릭된 버튼의 data-post-id 값 가져오기
	    try {
	        const response = await axios.post('/audiro/api/likeUser/toggle', { userId });
	        if (response.data) {
	            tag.classList.add('active'); // 관심 담기 추가된 경우 UI 업데이트
	        } else if (!response.data) {
	            tag.classList.remove('active'); // 관심 담기 제거된 경우 UI 업데이트
	        }
	    } catch (error) {
	        console.error('Error toggling like:', error);
	    }
	}

	//여행후기 찜담기(찜담고 삭제기능)
	async function favoriteReview(event) {
		const tag = event.currentTarget;
		const postId = tag.attributes['data-review-id'].nodeValue; // 클릭된 버튼의 data-review-id 값 가져오기
		try {
			const response = await axios.post('/audiro/api/review/likeReview/toggle', { postId });
			if (response.data) {
				tag.classList.add('active'); // 좋아요 추가된 경우 UI 업데이트
			} else if (!response.data) {
				tag.classList.remove('active'); // 좋아요 제거된 경우 UI 업데이트
			}
		} catch (error) {
			console.error('Error toggling favorite:', error);
		}
	}
	


	//콤보박스
	function SelectCombobox() {
		alert('클릭');
		/*
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
	*/


		/*
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
			
			*/

		//좋아요 db저장
		async function saveLike() {

		}

	}
});

