<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring Legacy 2</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	
	<c:url var="courseCSS" value="/css/course.css" />
	<link rel="stylesheet" href="${courseCSS}">
</head>
<body>
	<div class="container-fluid">
		<%@ include file="../fragments/header.jspf"%>
		<main>
			<div class="card">
				<div class="card-header">
					<c:url var="planSearchPage" value="/travel/plan/search" />
					<form method="get" action="${planSearchPage}"> <!-- 검색바 -->
						<div class="row justify-content-end">
							<div class="col-3">
								<select class="form-control" name="category" onchange="this.form.submit()">
									<option value="c"  ${empty param.category or param.category == 'c' ? 'selected' : ''}>작성순</option>
									<option value="m" ${param.category == 'm' ? 'selected' : ''}>최신순</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="card-body">
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>기간</th>
								<th>기간</th>
								<th>후기작성여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${travelPlan}" var="t">
								<tr>
									<td>
										<c:url var="planDetailsPage" value="/travel/plan/details">
	                                		<c:param name="id" value="${t.travelPlanId}"></c:param> 
	                                	</c:url>
	                               		<a href="${planDetailsPage}">${t.title}</a>
									</td>
									<c:set var="days" value="${t.duration+1}"></c:set>
									<td>${t.duration}박 ${days}일</td>
									<td>${t.startDate}~${t.endDate}</td>
									<td>
										<c:choose>
											<c:when test="${t.isReviewed==0}">
												No
											</c:when>
											<c:when test="${t.isReviewed==1}">
												Yes
											</c:when>
										</c:choose>
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</main>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>