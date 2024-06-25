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
			<div class="col-4 border">
				<h2>찜 목록 불러오기</h2>
				<div class="row row-cols-1 row-cols-md-4 g-4 m-1" id="favDestination">
				</div>
			</div>
			<div class="col-8 border">
				<h2>여행계획</h2>
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