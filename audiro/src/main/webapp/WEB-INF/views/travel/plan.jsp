<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Plan</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
		crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../fragments/header.jspf" %>
	</div>

	<div class="container-full mx-5 text-center">
		<div class="row">
			<div class="col-4 px-0">
				<div class="border">
					<h2>찜 목록 불러오기</h2>
				</div>
				<div class="row row-cols-1 row-cols-md-4 g-4 m-1"
					id="favDestination"></div>
				<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="pages-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">4</a></li>
					    <li class="page-item"><a class="page-link" href="#">5</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
				</nav>
			</div>
			<div class="col-8 px-0">
				<div class="border">
					<h2>여행계획</h2>
				</div>
				<div class="row g-0 border">
					<div class="col-2 ">
						<button>일차 추가</button>
						<button>전체 삭제</button>
					</div>
					<div class="col-10">
						<div style="background-color:#F6F1B4">
							<div class="row g-0">
								<div class="col-2">
									<img style="object-fit:cover" alt="삭제" src="">
								</div>
								<div class="col-10">
									<h5>1일차</h5>
								</div>
							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<c:url var="planJS" value="/js/plan.js" />
	<script src="${planJS}"></script>
</body>
</html>