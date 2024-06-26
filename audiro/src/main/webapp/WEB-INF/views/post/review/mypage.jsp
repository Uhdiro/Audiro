<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행후기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container-fluid">
		<main>
			<div class="mt-2 card">
				<div class="card-header">
					<span>내 여행후기</span>
					<div class="card d-flex justify-content-center align-items-center min-vh-50">
					<div style="width: 18rem;">
						<img src="https://file.notion.so/f/f/4d0dc4f1-02f9-46f4-91a0-9f52ce6ffae4/27deb1aa-b6ac-4d0b-810b-301c037c4969/defaultprofile5.png?id=91b36b7b-6527-4967-8d97-d525381995b0&table=block&spaceId=4d0dc4f1-02f9-46f4-91a0-9f52ce6ffae4&expirationTimestamp=1719468000000&signature=qNSlT7SBTNOSVupm1FZs4R9xu_5gAScBN3S_LdUOf14&downloadName=defaultprofile5.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">여행왕될꺼야</h5>
							<p class="card-text">환영해 ~~~~~~~~~ </p> 
							<p>#여행후기왕 #힐링 #체험</p>
						</div>
					</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">내 여행후기   20</li>
							<li class="list-group-item">나를 찜한 유저   55</li>
							<li class="list-group-item">내가 쓴 댓글 120</li>
						</ul>
						<div class="card-body">
							<a href="#" class="card-link">없앨까 고민중</a> <a href="#"
								class="card-link">찜하기 버튼</a>
						</div>
					</div>
					
					<!-- 후기목록리스트 -->
					<div class="mt-5 list-group row justify-content-cente">
						<a href="#" class="list-group-item list-group-item-action active"
							aria-current="true">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">부산여행 1박2일</h5>
								<small>2024-06-05</small>
							</div>
							<p class="mb-1">게시글 title</p> 
							<small>좋아요(good)55  댓글 수 62</small>
						</a> 
						<a href="#" class="list-group-item list-group-item-action">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">제주도 5박6일</h5>
								<small class="text-body-secondary">2024-04-06</small>
							</div>
							<p class="mb-1">게시글 title</p> 
							<small
							class="text-body-secondary">And some muted small print.
							</small>
						</a> 
						<a href="#" class="list-group-item list-group-item-action">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">부산여행 1박2일</h5>
								<small>2024-06-05</small>
							</div>
							<p class="mb-1">게시글 title</p> 
							<small>좋아요(good)55  댓글 수 62</small>
						</a> 
						<a href="#" class="list-group-item list-group-item-action">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">List group item heading</h5>
								<small class="text-body-secondary">3 days ago</small>
							</div>
							<p class="mb-1">Some placeholder content in a paragraph.</p> 
							<small
							class="text-body-secondary">And some muted small print.
							</small>
						</a> 
						<a href="#" class="list-group-item list-group-item-action">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">List group item heading</h5>
								<small class="text-body-secondary">3 days ago</small>
							</div>
							<p class="mb-1">Some placeholder content in a paragraph.</p> <small
							class="text-body-secondary">And some muted small print.</small>
						</a>
					</div>
				</div>

				<!-- 페이징 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>