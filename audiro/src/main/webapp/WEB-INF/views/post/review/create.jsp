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
			<c:url var="reviewPage" value="/post/review/create" />
				<form id="createForm" method="post" calss="from-iline">
					<div class="mt-2">
                        <input id="title" class="form-control" type="text" name="title" placeholder="제목을 입력하세요" required />
					</div>
					<textarea id="summernote" name="content"></textarea>
				<div class="text-right mt-3">
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
	<c:url var="mypageJS" value="../../js/review.js" />
	<script src="${mypageJS}"></script>
  
</body>
</html>