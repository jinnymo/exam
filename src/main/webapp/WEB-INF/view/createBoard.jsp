<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 작성</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center mb-4">게시글 작성</h2>
  <div class="card">
    <div class="card-body">
      <form action="${pageContext.request.contextPath}/createProc" method="post">
        <div class="form-group">
          <label for="title">제목</label>
          <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required>
        </div>
        <div class="form-group">
          <label for="content">내용</label>
          <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력하세요" required></textarea>
        </div>
        <div class="form-group">
          <label for="userName">작성자</label>
          <input type="text" class="form-control" id="userName" name="userName" placeholder="작성자 이름을 입력하세요" required>
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-primary">작성하기</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
