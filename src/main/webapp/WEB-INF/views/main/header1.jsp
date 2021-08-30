<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
.header_margin{
margin: 0% !important;
}

</style>
</head>
<body>
	<div class="header_margin container d-flex flex-wrap">
		<ul class="nav me-auto">
			<li><a class="navbar-brand nav-link link-dark px-2" href="${pageContext.request.contextPath}/main/main">MOKKOJI</a></li>
		</ul>
		<ul class="nav">
			<li class="nav-item"><a class="nav-link link-dark px-2" href="/springProject01/member/login">Login</a></li>
			<li class="nav-item"><a class="nav-link link-dark px-2" href="/springProject01/member/join">Sign up</a></li>
		</ul>
	</div>
</body>
</html>