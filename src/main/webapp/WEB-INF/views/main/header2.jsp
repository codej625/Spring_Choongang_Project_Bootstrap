<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
       <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MEETING
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=1">게임/만화/애니</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=2">영화/음악/그림</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=3">스포츠/레저</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=4">반려동물</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=5">패션/미용</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=6">건강/다이어트</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=7">가족/육아</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=8">컴퓨터/통신</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=9">외국어/인문/과학</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=10">경제/금융/정치/사회</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=11">문학/창작</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=12">기타</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            CLASS
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=1">게임/만화/애니</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=2">영화/음악/그림</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=3">스포츠/레저</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=4">반려동물</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=5">패션/미용</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=6">건강/다이어트</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=7">가족/육아</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=8">컴퓨터/통신</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=9">외국어/인문/과학</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=10">경제/금융/정치/사회</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=11">문학/창작</a></li>
         <li><a class="dropdown-item" href="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=12">기타</a></li>
          </ul>
        </li>
      </ul>
         <form class="d-flex" action="${pageContext.request.contextPath}/post/category/search" method="get">
           <input class="form-control me-2" type="text" name="keyword" id="keyword" aria-label="Search">
           <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
</body>
</html>