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


	/*
	//좋아요 클릭 이벤트 
	const btnLike = document.querySelectorAll('.like-btn');	
	btnLikes.forEach(btnLike => {
		   btnLike.addEventListener('click', saveLike);
	   });
	*/

	// 썸네일 선택 버튼 클릭 시 파일 입력 요소 클릭
	const thumbnailButton = document.querySelector('#thumbnailButton');
	const thumbnailInput = document.querySelector('#thumbnailInput');
	//const thumbnailPreview = document.querySelector('#thumbnailPreview');

	thumbnailButton.addEventListener('click', () => {
		thumbnailInput.click();
	});




	/*--------------------------------------------------------------------------------------------------------- */


	//썸네일 이미지 추가하기
	thumbnailInput.addEventListener('change', (event) => {
		const input = event.target;
		if (input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e) {
				const imgSrc = e.target.result;
				// 썸네일 이미지 미리보기 업데이트
				//const thumbnailPreview = document.querySelector('#thumbnailPreview');
				//thumbnailPreview.src = imgSrc;
				//thumbnailPreview.style.display = 'block';

				// Summernote 에디터에 이미지 삽입
				$('#summernote').summernote('focus');
				const imgNode = $('<img>').attr('src', imgSrc).css('max-width', '100%');
				$('#summernote').summernote('pasteHTML', imgNode[0].outerHTML);

				// 이미지 선택 후 파일 입력 요소 초기화
				input.value = '';
			};
			reader.readAsDataURL(input.files[0]);
		}
	});

	// 여행 코스 선택 버튼 클릭 시 모달 표시
	const selectTravelCourseButton = document.querySelector('#selectTravelCourseButton');
	selectTravelCourseButton.addEventListener('click', () => {
		$('#selectTravelCourseModal').modal('show');
	});

	// 여행 코스 선택 완료 버튼 클릭 시 처리
	const selectTravelCourseCompleteButton = document.querySelector('#selectTravelCourseCompleteButton');
	selectTravelCourseCompleteButton.addEventListener('click', () => {
		// 여행 코travelCourseContent스 선택 로직 구현 (임시로 선택 완료 버튼 클릭 시 alert만 띄우도록 예시로 작성)
		alert('여행 코스를 선택했습니다.');

		// 여행 코스 내용을 특정 영역에 표시할 부분 추가
		const selectedCourse = '여행 코스 내용을 가져와서 여기에 표시'; // 여행 코스 선택 로직 구현 필요

		const travelCourseContent = document.querySelector('#travelCourseContent');
		travelCourseContent.textContent = selectedCourse;

		// 모달 닫기
		$('#selectTravelCourseModal').modal('hide');
	});


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
		form.action = 'create';
		form.method = 'POST';

		form.submit();

	}

	// 임시 저장하기
	function draftBtnListener(e) {
		e.preventDefault();// 버튼기본동작을 막음.

		const form = document.querySelector('form#createForm')

		form.action = 'draft';
		form.method = 'POST';
		form.submit();
		
		// 임시 저장 완료 알림창 표시
		alert('임시 저장되었습니다.' 
		+ '여행 후기 게시글로 이동합니다.');
	
	}


	// 임시저장 목록에 제목 클릭 이벤트 처리
	const draftLinks = document.querySelectorAll('.draft-link');
	draftLinks.forEach(function(link) {
		link.addEventListener('click', function(event) {
			event.preventDefault(); // 기본 동작(링크 이동) 방지
			const draftPostId = event.target.getAttribute('data-draftPostId'); // 링크에 설정된 데이터 속성에서 draftPostId 값 가져오기
			console.log('draftPostId=' + draftPostId);
			loadDraftContent(draftPostId); // loadDraftContent 함수 호출
		});
	});

	// 클릭한 임시 저장 내용을 불러오는 함수
	function loadDraftContent(draftPostId) {
		// Axios를 사용하여 서버로부터 데이터 가져오기
		const uri = 'http://localhost:8080/audiro/api/review/draftPost?draftPostId=' + draftPostId;
		axios.get(uri)
			.then(response => {
				// 성공적으로 데이터를 받아왔을 때 처리
				const draft = response.data; // response.data에서 draft 객체를 가져옴
				console.log('draft=' + draft.title);
				const inputTitle = document.querySelector('input#title');
				const summernote = document.querySelector('textarea#summernote');

				inputTitle.value = draft.title; // input의 value 속성을 설정
				summernote.value = draft.content; // textarea의 value 속성을 설정



				// 모달 닫기 (Bootstrap 모달 사용 시)
				$('#selectDraftModal').modal('hide');

			})
			.catch(error => {
				// 요청이 실패한 경우 처리
				console.error('Error:', error);
			});
	}





	//썸네일 이미지
	$('#thumbnailInput').on('change', function() {
		const file = this.files[0];
		if (file) {
			const reader = new FileReader();
			reader.onload = function(e) {
				$('#thumbnailPreview').attr('src', e.target.result).show();
				$('#thumbnailDeleteButton').show();
				// 썸네일 이미지를 Summernote content에 추가
				const img = '<img src="' + e.target.result + '" alt="썸네일 이미지">';
				$('#summernote').summernote('pasteHTML', img);
			}
			reader.readAsDataURL(file);
		}
	});


	$('#thumbnailDeleteButton').on('click', function() {
		$('#thumbnailPreview').attr('src', '#').hide();
		$('#thumbnailInput').val('');
		$(this).hide();

		// Summernote 콘텐츠에서 썸네일 이미지 제거
		const content = $('#summernote').summernote('code');
		const cleanedContent = content.replace(/<img[^>]+>/g, ''); // 모든 img 태그 제거
		$('#summernote').summernote('code', cleanedContent);
	});



	$('#thumbnailDeleteButton').on('click', function() {
		$('#thumbnailPreview').attr('src', '#').hide();
		$('#thumbnailInput').val('');
		$(this).hide();
		// Summernote content에서 썸네일 이미지 제거
		const imgRegex = /<img[^>]+src="([^">]+)"/g;
		const content = $('#summernote').summernote('code');
		const cleanedContent = content.replace(imgRegex, function(match, capture) {
			if (capture !== $('#thumbnailPreview').attr('src')) {
				return match;
			}
			return '';
		});
		$('#summernote').summernote('code', cleanedContent);
	});
});










