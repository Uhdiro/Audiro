<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행일기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<style>
	#list {
		width: 100%;
	}
	
	#profil {
		width: 100%;
	}
	
	.heart-icon {
		width: 70px; 
		height: 70px; 
	}
	
	.heart-icon.active {
		filter: grayscale(0%) brightness(100%);   /* 클릭 후 색이 변하도록 필터 적용 */
	}
</style>
</head>


<body>
	<div class="container-fluid">
		<c:set var="travelReviewPage" value="내 여행일기" />
		<%@ include file="../../fragments/header.jspf"%>
		
		<main>
			<div class="row" id="row">
				<!-- 프로필 파일 합치면 그때 내용 불러오기하기. -->
				<div class="col-md-2">
					<div class="mt-2 card">
						<div class="card-header">
							<span>닉네임</span>
							<a href="#" class="card-link" style="display: block; text-align: right;">
								<img src="heart-icon.png" alt="하트 아이콘">
							</a>
						</div>
						<div class="card-body" id="profil">
							<div class="card" style="width: 13rem;">
								<img
									src="https://file.notion.so/f/f/4d0dc4f1-02f9-46f4-91a0-9f52ce6ffae4/27deb1aa-b6ac-4d0b-810b-301c037c4969/defaultprofile5.png?id=91b36b7b-6527-4967-8d97-d525381995b0&table=block&spaceId=4d0dc4f1-02f9-46f4-91a0-9f52ce6ffae4&expirationTimestamp=1719468000000&signature=qNSlT7SBTNOSVupm1FZs4R9xu_5gAScBN3S_LdUOf14&downloadName=defaultprofile5.png"
									class="card-img-top" alt="프로필 이미지">
								<div class="card-body">
									<p class="card-text">환영해 ~~~~~~~~~</p>
									<p>#여행후기왕 #힐링 #체험</p>
								</div>
								<ul class="list-group list-group-flush" >
									<li id ="" class="list-group-item">내 여행일기 ${reviewCount}</li>
            						<li id ="" class="list-group-item">나를 찜한 유저 ${likedUsersCount}</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
					
					
				<!-- 여행일기 목록불러오기 -->
				<div class="col-md-8">
					<div class="mt-2 card" id="list">
						
						<div class="card-body">
							<!-- 정렬순 -->
							<div class="d-flex justify-content-end mb-3">
								<form id="rank" name="rank" method="POST" action="/mypage2">
									<select class="form-select form-select-sm me-2"
										aria-label=".form-select-sm example">
										<option value="latest">최신순</option>
										<option value="likes">좋아요순</option>
									</select>
								</form>	
							</div>
				
							<div class="row row-cols-1 row-cols-md-4 g-4">
								<!-- 여행후기 카드 반복문  db에서불러올꺼임 추후에 변경해야함 -->
                                <c:forEach var="list" items="${list}">
                                    <div class="col">
                                        <div class="card h-80">
											 <button class="btn like-btn" data-review-id="${list.postId}" style="text-align: right;">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
  													<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1"/>
												</svg>
											</button>
											<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f8f357b6-4fdf-41dc-a6ff-cfddb4087409" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">${list.title}</h5>                                             
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="d-flex w-100 justify-content-between">
                                                        <small>${list.modifiedTime}</small>
                                                    </div>
                                                </a> 
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>





							

							<!-- 페이징 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center mt-4">
									<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>

			</div>
		</main>
	</div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-wEmeIV1mKuiNp12aFgE3XrA6sgC09K6Qap604vR9CLMNHOVvA20vFJo7Gh2NvGhP"
		crossorigin="anonymous">
	</script>
	
	<!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	
	<!-- reviewMypage.js -->
	<c:url var="mypageJS" value="/js/reviewMypage.js" />
    <script src="${mypageJS}"></script> 
	
</body>
</html>
