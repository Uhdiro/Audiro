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

	//유저 관심 담기
	function likeBtn() {
		alert('유저 좋아요');
	}


	/*
	//여행후기 찜 담기
	function favoriteReview(){
		alert('후기 담기!!!')
		const uri= `/audiro/api/review/likeReview`;
					axios
					.get(uri)
					.then((response) => {
						console.log("담기성공!!!");
					})
					.catch((error) => {
					console.log(error);
					});
					}
	*/




	async function favoriteReview(event) {
		const postId = event.target.dataset.reviewId; // 클릭된 버튼의 data-review-id 값 가져오기
		try {
			const response = await axios.post('/api/review/likeReview/toggle', { postId });
			if (response.data === 'Added to favorites') {
				event.target.classList.add('active'); // 좋아요 추가된 경우 UI 업데이트
			} else if (response.data === 'Removed from favorites') {
				event.target.classList.remove('active'); // 좋아요 제거된 경우 UI 업데이트
			}
		} catch (error) {
			console.error('Error toggling favorite:', error);
		}
	}


	/*
	// axios를 사용하여 서버에 POST 요청 보내기
				axios.post('/likeReview', {
					message: '후기를 저장합니다.'
				})
				.then(function (response) {
					console.log('후기가 성공적으로 저장되었습니다.');
					// 여기에 필요한 처리를 추가할 수 있습니다.
				})
				.catch(function (error) {
					console.error('후기 저장 중 오류가 발생했습니다.', error);
					// 오류 발생 시 처리할 내용을 추가할 수 있습니다.
				});
			*/






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

