/**
 * /post/review/mypage.jsp에 포함
 */



// 최신순, 좋아요 콤보박스 클릭이벤트
//const combobox = document.querySelector('form#rank');
//combobox.addEventListener('change', SelectCombobox);

//유저 관심등록 클릭 이벤트
const btnLike = document.querySelector('button#userLike');
btnLike.addEventListener('click', likeBtn);

//여행후기 찜 담기 클릭 이벤트
const btnReveiwLike = document.querySelectorAll('button#likeReview');

btnReveiwLike.forEach(button => {
       button.addEventListener('click', function() {
           const postId = button.getAttribute('data-review-id');
           
           axios.post('/likeReview', {
               postId: postId
           })
           .then(function(response) {
               // 성공적으로 처리된 경우
               console.log(response.data);
               // 화면 갱신 등의 추가 작업 수행
           })
           .catch(function(error) {
               // 에러 처리
               console.error('Error saving favorite post: ', error);
           });
       });
   });

////////////////////////////////////////////////////////////

//유저 관심 담기
function likeBtn() {
	alert('유저 좋아요');
}

//여행후기 찜 담기
function likeReviewBtn(){
	alert('후기 담기!!!')
}




/*
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
    
		*/
