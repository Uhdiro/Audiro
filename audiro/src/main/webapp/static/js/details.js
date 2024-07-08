/**
 * /post/review/details.jsp포함
 */

	const allComment = null;
	
	document.addEventListener('DOMContentLoaded', () => {

	//details 수정
	const modifyBtn = document.querySelector('button#modifybtn');
	modifyBtn.addEventListener('click', modifyBtnListener);

	//details 삭제
	const deleteBtn = document.querySelector('button#deletebtn');
	deleteBtn.addEventListener('click', deletebtnBtnListener);


	//details  commnet 등록
	const registerCommmetnbtn = document.querySelector('button#registerCommmetnbtn');
	registerCommmetnbtn.addEventListener('click', registerCommmetnbtnListener);




	//details  commnet 삭제
	//details  commnet 대댓글 등록
	//details  commnet 비밀글


	////////////////////////////////////////////////////////////////////////////////


	
	//댓글 등록
	function registerCommmetnbtnListener(e) {
		alert('댓글등록!!!')

		const postId = document.querySelector('#postId').value;
		const content = document.querySelector('#comment').value;
		const usersId = document.querySelector('#usersId').value;
		if (content === '') {
			alert('댓글 내용을 입력하세요.')
			return;
		}
		const data = { postId, content, usersId};

		axios
			.post('/audiro/api/comment/new', data)
			.then((response) => {
				alert('댓글등록성공!!')
				getAllComments();
				document.querySelector('textarea#comment').value = '';
			})
			.catch((error) => {
			});
	}


	//모든 댓글 가져오기
	function getAllComments() {
		const postId = document.querySelector('#postId').value;

		const uri = `/audiro/api/comment/${postId}`;
		axios
			.get(uri)
			.then((response) => {
				document.querySelector('#commentList').innerHTML = makeCommentElements(response.data, 0);
			})
			.catch((error) => {
				console.log(error);
			});
	}

	//모든 댓글 그리기
	function makeCommentElements(data, level) {
		
		return data.map(cmm => {
			
		// 타임스탬프를 Date 객체로 변환
		const modifiedTime = new Date(cmm.modifiedTime);

		// 연도별 시분초 포맷팅 (24시간 형식)
		   const formattedHours = modifiedTime.getHours().toString().padStart(2, '0');
		   const formattedMinutes = modifiedTime.getMinutes().toString().padStart(2, '0');
		   const formattedSeconds = modifiedTime.getSeconds().toString().padStart(2, '0');
		   const formattedTime = `${modifiedTime.getFullYear()}-${modifiedTime.getMonth() + 1}-${modifiedTime.getDate()} ${formattedHours}:${formattedMinutes}:${formattedSeconds}`;
		
			return `
			<div class="mt-2" style="display: flex; align-items: flex-start; margin-left: ${level * 50}px;">
			    <img src="" alt="프로필 이미지" class="p-profile-image" id="p-profile-image" style="margin-right: 10px; margin-left: 50px;">
			    <div style="flex: 1;">
			        <div style="display: flex; align-items: center; margin-bottom: 5px;">
			            <span style="font-weight: bold; margin-right: 10px;">${cmm.nickname}</span>
			            <label for="modifiedTime" class="form-time" style="font-size: 0.8em; color: #888;">
			                ${formattedTime}
			            </label>
			        </div>
			        <div class="custom-label" style="max-height: 100px; overflow-y: auto; padding: 5px; border: 1px solid #ccc; margin-bottom: 5px; display: flex; align-items: center; justify-content: space-between;">
			            <span>${cmm.content}</span>
			            <div style="display: flex; align-items: center;">
			                <button id="modifybtn(${cmm.commentsId})" class="btn btn-link" style="margin-left: 10px; padding: 0; border: none; background: none;">
			                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
			                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
			                    </svg>
			                </button>
			                <button id="deletebtn(${cmm.commentsId})" class="btn btn-link" style="margin-left: 10px; padding: 0; border: none; background: none;">
			                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
			                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
			                    </svg>
			                </button>
			            </div>
			        </div>
			        <div style="display: flex; justify-content: flex-end;">
			            <button onClick="activeReply(${cmm.commentsId})" class="btn btn-warning rounded-pill px-3 py-2 reply-btn" data-comments-id="${cmm.commentsId}" style="font-size: 0.8em; margin-right: 10px;">
			                대댓글 추가
			            </button>
			        </div>
			    </div>
			</div>
			<div id="replyContent${cmm.commentsId}" class="replyCommentGroup" style="display: none; align-items: flex-start; margin-left: ${level * 50}px;">
			    <img src="" alt="프로필 이미지" class="profile-image" style="margin-right: 10px;">
			    <textarea id="comment${cmm.commentsId}" class="form-control mt-2" rows="3" style="max-height: 100px; overflow-y: auto; flex: 1;"></textarea>
			    <button onClick="addReply(${cmm.commentsId})" type="button" class="btn btn-dark mt-3 add-reply-btn" data-comments-id="${cmm.commentsId}" style="font-size: 0.8em;">
			        댓글 등록
			    </button>
			</div>

			    ${makeCommentElements(cmm.childComment, level + 1)}		
				`
		}).reduce((o1, o2) => o1 + o2, "")
	}
	// 초기화 함수 호출
	getAllComments();


	// 수정버튼
	function modifyBtnListener(e) {
		//alert('수정버튼!');

		e.preventDefault();
		const postId = document.querySelector('input#postId').value;
		const uri = `http://localhost:8080/audiro/post/review/modify?postId=${postId}`;

		form.action = uri;
		form.method = 'put';
		form.submit();
	}


	// 삭제버튼
	function deletebtnBtnListener(e) {
		alert('삭제버튼!');

		e.preventDefault();
		const result = confirm('정말 삭제할까요?');
		if (result) {
			const form = document.querySelector('form#modifyForm');

			form.action = 'delete';
			form.method = 'post';
			form.submit();
		}
	}
	
	
	//댓글 수정
	function modifyBtnListener(e) {
		
		e.preventDefault();
		const modifyBtn = document.querySelector('modifybtn(${cmm.commentsId}');
		const uri = `/audiro/api/comment/${commentsId}`
		
		
	}
	
	//댓글 삭제


});    


	
	//대댓글 등록하면 아래 댓글창 나타내기
	function activeReply(commentsId) {
		document.querySelectorAll('.replyCommentGroup').forEach(rcg => rcg.style.display = 'none')
		document.querySelector(`#replyContent${commentsId}`).style.display = 'flex';
	}

	//대댓글 등록
	function addReply(commentsId) {
		const postId = document.querySelector('#postId').value;
		const content = document.querySelector(`#comment${commentsId}`).value;
		const usersId = document.querySelector('#usersId').value;
		
		if (content === '') {
			alert('댓글 내용을 입력하세요.')
			return;
		}
		const data = { postId, usersId, content, parentCommentId: commentsId };
		const uri = `/audiro/api/comment/`;
		axios
			.post(uri, data)
			.then((response) => {
				alert('댓글등록성공!!')
				//allComment();
			})
			.catch((error) => {
			});
		}