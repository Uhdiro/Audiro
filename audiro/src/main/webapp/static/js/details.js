/**
 * /post/review/details.jsp포함
 */


document.addEventListener('DOMContentLoaded', () => {

	//details 수정
	const modifyBtn = document.querySelector('button#Modifybtn');
	modifyBtn.addEventListener('click', modifyBtnListener);

	//details 삭제
	const deleteBtn = document.querySelector('button#deletebtn');
	deleteBtn.addEventListener('click', deletebtnBtnListener);


	//details  commnet 등록
	//details  commnet 삭제
	//details  commnet 대댓글 등록
	//details  commnet 비밀글


	////////////////////////////////////////////////////////////////////////////////

	// 수정버튼
	function modifyBtnListener(e) {
		//alert('수정버튼!');

		e.preventDefault();
		const form = document.querySelector('form#modifyForm');
		const postId= document.querySelector('input#postId').value;
		const uri = `http://localhost:8080/audiro/post/review/modify?postId=${postId}`;
		
		form.action = 'modify';
		form.method = 'get';
		form.submit();
	}


	// 삭제버튼
	function deletebtnBtnListener(e) {
		alert('삭제버튼!');

		e.preventDefault();
		const result = confirm('정말 삭제할까요?');
		if(result){
			const form = document.querySelector('form#modifyForm');
			
			form.action = 'delete';
			form.method = 'post';
			form.submit();
			}
		}
			
});
