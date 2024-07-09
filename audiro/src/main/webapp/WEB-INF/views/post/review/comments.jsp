<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>title</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
</head>
<body>



 <style>
        .comment-section {
            width: 50%;
            margin: 0 auto;
        }
        .comment {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
            display: flex;
            align-items: flex-start;
        }
        .comment img.profile {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }
        .comment-content {
            display: flex;
            flex-direction: column;
        }
        .comment-content img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="comment-section">
        <h2>Leave a Comment</h2>
        <form id="commentForm">
            <textarea id="commentText" placeholder="Write a comment..." rows="4" cols="50"></textarea><br>
            <input type="file" id="commentImage" accept="image/*"><br><br>
            <button type="submit">Post Comment</button>
        </form>
        <div id="commentsContainer"></div>
    </div>



















	<!-- Bootstrap의 JS 라이브러리 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<!-- Axio JS 라이브러리 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	
	
	    <script src="script.js"></script>
	

</body>


</html>