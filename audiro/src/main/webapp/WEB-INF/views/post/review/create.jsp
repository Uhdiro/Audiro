<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Summernote with Bootstrap 4</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>

<body>
	<div class="container-fluid">
		<c:set var="travelReviewPage" value="내 여행일기" />
		<%@ include file="../../fragments/header.jspf"%>

	<header>
		<h3 name="usersId">로그인유저</h3>
	</header>
	<main>
		<div class="mt-2 card">
			<div class="card-header">
				<h4>여행후기 글쓰기</h4>
			</div>
			<div class="card-body">
			<c:url var="reviewPage" value="/post/review/list" />
				<form id="createForm" method="POST" calss="from-iline">
					<div class="mt-2">
                        <input id="title" name="title" class="form-control" type="text" placeholder="제목을 입력하세요" required />
					</div>
					<textarea id="summernote" name="content"></textarea>
				<div class="text-right mt-3">
				
						<!--  여행코스 불러오기 모달창 -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#selectTravelCourseModal">
    						여행 코스 선택하기
						</button>
							<div class="modal fade" id="selectTravelCourseModal"
								tabindex="-1" role="dialog"
								aria-labelledby="selectTravelCourseModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="selectTravelCourseModalLabel">여행 코스 선택</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<!-- 여기에 여행 코스 목록을 동적으로 불러올 수 있는 내용 추가  반복문사용-->
											<ul class="list-group">
												<li class="list-group-item">1111111111 ${travelPaln}</li>
												<li class="list-group-item">여행 코스 2</li>
												<li class="list-group-item">여행 코스 3</li>
												<!-- 실제로는 서버에서 여행 코스 데이터를 가져와서 동적으로 생성하는 것이 좋습니다. -->
											</ul>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-primary">선택 완료</button>
										</div>
									</div>
								</div>
							</div>
							
							<!--  임시저장 불러오기 모달창 -->
							<form id="selectDraftForm" >
								<button type="button" class="btn btn-primary" data-toggle="modal"
									data-target="#selectDraftModal">임시저장 불러오기</button>
	
								<div class="modal fade" id="selectDraftModal" tabindex="-1"
									role="dialog" aria-labelledby="selectDraftModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="selectDraftModalLabel">임시저장
													후기 불러오기</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<ul id="draftList" class="list-group">
													<!-- 동적으로 추가될 임시저장 목록 -->
													<li class="list-group-item">1111111111 ${travelPaln}</li>
													<li class="list-group-item">임시저장2</li>
													<li class="list-group-item">임시서장3 추후 반복문</li>
												</ul>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary"
													id="loadDraftsBtn">불러오기</button>
											</div>
										</div>
									</div>
								</div>
							</form>



							<button type="submit" class="btn" id="savebtn">저장</button> 
                        <button type="submit" class="btn btn-secondary ml-2" id="draftbtn" >임시저장</button>
                    </div>
				</form>

			</div>

		</div>

	</main>
	
	</div>





	<script>
	//summernote
      $('#summernote').summernote({
        placeholder: '내용입력하세요',
        tabsize: 2,
        height: 300
      });
      </script>
      
    <!-- reviewMypage.js -->
	<c:url var="mypageJS" value="/js/create.js" />
	<script src="${mypageJS}"></script>
  
</body>
</html>