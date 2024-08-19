<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .btn-delete {
      background-color: #dc3545;
      color: white;
    }

    .btn-edit {
      background-color: #ffc107;
      color: white;
    }
  </style>
</head>
<body>

<a href="${pageContext.request.contextPath}/create" class="btn btn-primary mb-3">글쓰기</a>

<div class="container mt-5">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">내용</th>
      <th scope="col">작성자</th>
      <th scope="col">액션</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${boards != null}">
        <c:forEach var="board" items="${boards}">
          <tr>
            <th scope="row">${board.id}</th>
            <td>${board.title}</td>
            <td>
              <c:choose>
                <c:when test="${fn:length(board.content) > 10}">
                  ${fn:substring(board.content, 0, 10)}...
                </c:when>
                <c:otherwise>
                  ${board.content}
                </c:otherwise>
              </c:choose>
            </td>
            <td>${board.userName}</td>
            <td>
              <button class="btn btn-delete"
                      onclick="location.href='${pageContext.request.contextPath}/delete/${board.id}'">삭제</button>

              <button class="btn btn-edit"
                      onclick="location.href='${pageContext.request.contextPath}/getById/${board.id}'">수정</button>
            </td>
          </tr>
        </c:forEach>
      </c:when>
    </c:choose>
    </tbody>
  </table>

  <!-- 페이징 네비게이션 -->
  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
      <!-- 이전 페이지로 이동 버튼 -->
      <li class="page-item <c:if test='${currentPage == 1}'>disabled</c:if>'">
        <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>

      <!-- 페이지 번호 -->
      <c:forEach var="i" begin="1" end="${totalPages}">
        <li class="page-item <c:if test='${currentPage == i}'>active</c:if>'">
          <a class="page-link" href="?page=${i}">${i}</a>
        </li>
      </c:forEach>

      <!-- 다음 페이지로 이동 버튼 -->
      <li class="page-item <c:if test='${currentPage == totalPages}'>disabled</c:if>'">
        <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
