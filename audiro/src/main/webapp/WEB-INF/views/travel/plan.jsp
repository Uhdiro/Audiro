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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

	<c:url var="planCSS" value="/css/plan.css" />
	<link rel="stylesheet" href="${planCSS}">
	
	<c:url var="timelineCSS" value="/css/plan_timeline.css" />
	<link rel="stylesheet" href="${timelineCSS}">
	
	<c:url var="calenderCSS" value="/css/plan_calender.css" />
	<link rel="stylesheet" href="${calenderCSS}">
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../fragments/header.jspf"%>


		<div class="container-full mx-5 text-center">
			<div class="row">
				<div class="card col-8 px-0">
					<c:url var="createPlan" value="/api/plan/create"></c:url>
					<form method="post" action="${createPlan}">
						<div class="row g-0 ">
							<div class="col-3 p-2 ">
								<div class="row g-0">
									<div id="btnContainer">

										<button id="deleteAll" class="btn btn-primary">전체 삭제</button>
										<button type="submit" id="btnSave" class="btn btn-primary">저장</button>
									</div>
								</div>
								<div id="dayContainer"></div>
								<button id="createDay" class="btn btn-primary">일차 추가</button>
							</div>

							<div class="col-9">
								<div id="dayPlan">
									<div class="row g-0 m-2">
										<div id="alert"></div>
										<div class="col-sm-6 col-12 mb-2">
											<div id="title" class="mb-2">
												<input type="text" id="title" name="title" maxlength="40"
													placeholder="제목을 입력하세요." class="form-control" />
											</div>
										</div>
										<div class="date col-sm-3 col-6 mb-2">
											<input type="text" id="startDate" name="startDate"
												class="form-control" placeholder="start" readonly /> <input
												type="hidden" id="duration" name="duration" />
										</div>
										<div class="date col-sm-3 col-6 mb-2">
											<input type="text" id="endDate" name="endDate"
												class="form-control" placeholder="end" readonly />
										</div>

									</div>
								</div>
							</div>
						</div>
					</form>

				</div>
				<div>
					<!-- hidden input for travelPlanId -->
                	<input type="hidden" id="travelPlanIdForModify" name="travelPlanIdForModify" value="${travelPlanIdForModify}" />
				</div>

				<div class="card col-4 px-0">
					<div class="card-body">
						<h2>찜 목록 불러오기</h2>

						<div class="content row row-cols-1 row-cols-md-4 g-4 m-1"
							id="favDestination"></div>
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="pages-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>정말 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnConfirm" class="btn btn-primary">확인</button>
					<button type="button" id="btnCancel" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	
	<c:url var="destinationJS" value="/js/plan_fav_des.js" />
	<script src="${destinationJS}"></script>
	
	<c:url var="planJS" value="/js/plan.js" />
	<script src="${planJS}"></script>

	<c:url var="modifyJS" value="/js/plan_modify.js" />
	<script src="${modifyJS}"></script>

</body>
</html>