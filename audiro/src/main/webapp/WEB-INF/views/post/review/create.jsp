<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Summernote with Bootstrap 4</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<style>
body {
	width: 80%;
	margin: 0 auto;
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: #f0f0f0;
	padding: 100px;
}

#title, #buttons-container {
	width: 100%;
}

#buttons-container .btn {
	margin-right: 5px;
}

#thumbnailPreview {
	display: none;
	max-width: 100%;
	height: 200px;
	margin-top: 20px;
}
#thumbnailDeleteButton {
	display: none;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<c:set var="travelReviewPage" value="내 여행일기" />
		<%@ include file="../../fragments/header.jspf"%>

		<header></header>
		<main>
			<div class="mt-2 card">
				<div class="card-header">
					<h4>여행후기 글쓰기</h4>
				</div>
				<div class="card-body">
					<c:url var="reviewPage" value="/post/review/list" />
					<form id="createForm" class="form-inline">
						<div class="form-row w-100">
							<div class="col-md-8 mb-3">
								<input id="title" name="title" class="form-control w-100" type="text" placeholder="제목을 입력하세요" required>
							</div>
							<div id="buttons-container" class="col-md-4 mb-3 d-flex justify-content-end">
								<button type="button" id="selectTravelCourseButton" class="btn btn-primary" data-toggle="modal" data-target="#selectTravelCourseModal">
									여행 코스 선택하기</button>
								<button type="button" id="thumbnailButton" class="btn btn-primary ml-2">
									썸네일 이미지 선택하기</button>
								<input type="file" id="thumbnailInput" accept="image/*" style="display: none;">
								<button type="button" id="thumbnailDeleteButton" class="btn btn-danger ml-2">
									썸네일 이미지 삭제</button>
							</div>
						</div>
						
						
						<div class="modal fade" id="selectTravelCourseModal" tabindex="-1" role="dialog" aria-labelledby="selectTravelCourseModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="selectTravelCourseModalLabel">여행 코스 선택</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<ul class="list-group">
											<li class="list-group-item">1111111111 ${travelPaln}</li>
											<li class="list-group-item">여행 코스 2</li>
											<li class="list-group-item">여행 코스 3</li>
										</ul>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
										<button type="button" id="selectTravelCourseCompleteButton" class="btn btn-primary">선택 완료</button>
									</div>
								</div>
							</div>
						</div>
						
						<textarea id="summernote" name="content"></textarea>
						<div class="text-right mt-3 w-100">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#selectDraftModal">임시저장 불러오기</button>

							<div class="modal fade" id="selectDraftModal" tabindex="-1" role="dialog" aria-labelledby="selectDraftModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="selectDraftModalLabel">임시저장 목록</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<ul class="list-group">
												<c:forEach items="${drafts}" var="draft">
													<li class="list-group-item">
														<a href="#" class="draft-link" data-draftPostId="${draft.draftPostId}" data-dismiss="modal">
															${draft.title} - ${draft.modifiedTime}
														</a>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>

							<button type="submit" class="btn" id="savebtn">저장</button>
							<button type="submit" class="btn btn-secondary ml-2" id="draftbtn">임시저장</button>
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>

	<script>
	
	// Summernote 설정
	$('#summernote').summernote({
		placeholder : '내용을 입력하세요',
		tabsize : 2,
		height : 300
	// Summernote의 초기 높이 설정
	});

	// textarea의 높이 자동 조정
	$('#summernote').on('summernote.change', function() {
		// textarea의 높이를 Summernote의 높이에 맞게 조정
		$(this).height('');
		$(this).height(this.scrollHeight);
	});

	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-wEmeIV1mKuiNp12aFgE3XrA6sgC09K6Qap604vR9CLMNHOVvA20vFJo7Gh2NvGhP" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<c:url var="createJS" value="/js/create.js" />
	<script src="${createJS}"></script>

</body>
</html>
