<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
	  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
	  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
    <title>Hello, world!</title>
    
    <style>

.str{text-overflow: ellipsis;

white-space: nowrap;

overflow: hidden;

}
.row_title{
text-align: center;
padding-bottom: 5%;
padding-top: 5%;

}

.hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.80);
        font-size: 2em;
        margin: 8px 0px;
      }
      .hr-sect::before,
      .hr-sect::after {
        content: "";
        flex-grow: 1;
        background: rgba(0, 0, 0, 0.80);
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
      }

</style>
  </head>
  <body>
  	<%@ include file="/WEB-INF/views/main/header1.jsp"%>
  	<%@ include file="/WEB-INF/views/main/header2.jsp"%>
    <!-- Option 1: Bootstrap Bundle with Popper -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
    -->
	 <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/1447x430" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/1447x430" alt="Second slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
			<div class="container">
			<div class="row_title hr-sect">All the Best 클래스.ver</div>
  	<div class="row">
			  <c:forEach var="post1" items="${bestList1 }">
    <div class="col-3">
     <div class="col-lg-12 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/upload/${post1.p_img}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="${pageContext.request.contextPath}/post/postListDetail?bt_num=${post1.bt_num }&bc_num=${post1.bc_num }&p_num=${post1.p_num}"></a>
                </h4>
                <div class="str">${post1.p_title }</div>
              </div>
            </div>
          </div>
    </div>
      </c:forEach>
      </div>
<div class="row_title hr-sect">All the Best 모임.ver</div>
<div class="row">
<c:forEach var="post2" items="${bestList2 }">
    <div class="col-3">
     <div class="col-lg-12 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/upload/${post2.p_img}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="${pageContext.request.contextPath}/post/postListDetail?bt_num=${post2.bt_num }&bc_num=${post2.bc_num }&p_num=${post2.p_num}"></a>
                </h4>
                <div class="str">${post2.p_title }</div>
              </div>
            </div>
          </div>
    </div>
      </c:forEach>
  </div>
  </div>
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>		
  </body>
</html>