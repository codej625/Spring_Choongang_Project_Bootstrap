<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cate.css" />
<style type="text/css">
.str {
	overflow: hidden !important;
	text-overflow: ellipsis !important;
	white-space: nowrap !important;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/main/header1.jsp"%>
	<%@ include file="/WEB-INF/views/main/header2.jsp"%>
	<!-- **MAIN START** -->
	<main>
		<!-- main -->

		<div class="col-12 h-100p-5 bg-light border rounded-3"
			style="float: none; margin: 5% auto;">
			<p style="margin-left: 3%;">상세 검색 기능</p>
			<div class="row">
				<div class="col-5">
					<select onchange="if(this.value) location.href=(this.value);"
						style="margin-left: 5%;">
						<option>
							<c:choose>
								<c:when test="${bc_num == 1 }">게임/만화/애니</c:when>
								<c:when test="${bc_num == 2 }">영화/음악/그림</c:when>
								<c:when test="${bc_num == 3 }">스포츠/레저</c:when>
								<c:when test="${bc_num == 4 }">반려동물</c:when>
								<c:when test="${bc_num == 5 }">패션/미용</c:when>
								<c:when test="${bc_num == 6 }">건강/다이어트</c:when>
								<c:when test="${bc_num == 7 }">가족/육아</c:when>
								<c:when test="${bc_num == 8 }">컴퓨터/통신</c:when>
								<c:when test="${bc_num == 9 }">외국어/인문/과학</c:when>
								<c:when test="${bc_num == 10 }">경제/금융/정치/사회</c:when>
								<c:when test="${bc_num == 11 }">문학/창작</c:when>
								<c:when test="${bc_num == 12 }">기타</c:when>
							</c:choose>
						</option>
						<c:if test="${bt_num == 1 }">
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=1">게임/만화/애니</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=2">영화/음악/그림</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=3">스포츠/레저</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=4">반려동물</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=5">패션/미용</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=6">건강/다이어트</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=7">가족/육아</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=8">컴퓨터/통신</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=9">외국어/인문/과학</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=10">경제/금융/정치/사회</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=11">문학/창작</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=1&bc_num=12">기타</option>
						</c:if>
						<c:if test="${bt_num == 2 }">
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=1">게임/만화/애니</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=2">영화/음악/그림</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=3">스포츠/레저</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=4">반려동물</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=5">패션/미용</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=6">건강/다이어트</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=7">가족/육아</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=8">컴퓨터/통신</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=9">외국어/인문/과학</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=10">경제/금융/정치/사회</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=11">문학/창작</option>
							<option
								value="${pageContext.request.contextPath}/post/category?bt_num=2&bc_num=12">기타</option>
						</c:if>
					</select>
				</div>
				<div class="col-5 mb-4">
					<form class="col-4 d-flex"
						action="/springProject01/post/category/search" method="get">
						<input class="form-control me-2" type="text" name="keyword"
							id="keyword" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<c:forEach var="post" items="${listPost }">
					<div class="col-3">
						<div class="card" style="width: 18rem;">
							<img
								src="${pageContext.request.contextPath}/upload/${post.p_img}"
								class="card-img-top" alt="...">
							<div class="card-body">
								<a
									href="${pageContext.request.contextPath}/post/postListDetail?bt_num=${post.bt_num }&bc_num=${post.bc_num }&p_num=${post.p_num}&pm_id=${post.m_id }"
									class="btn btn-outline-success">${post.p_title }</a> <input
									type="hidden" name="p_num" value="${post.p_num }">
								<div class="con_contents">
									<c:choose>
										<c:when test="${post.p_cstatus == 0 }">무료</c:when>
										<c:when test="${post.p_cstatus == 1 }">유료</c:when>
									</c:choose>
								</div>
								<div class="con_subinfo">${post.p_metstart }조회수
									${post.p_hit }</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>


		<!-- 				<div class="con_item">2</div> -->
		<div aria-label="Page navigation example">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<a
					href="${pageContext.request.contextPath}/post/category?bt_num=${bt_num }&bc_num=${bc_num }&currentPage=${pg.startPage-pg.pageBlock }">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<a
					href="${pageContext.request.contextPath}/post/category?bt_num=${bt_num }&bc_num=${bc_num }&currentPage=${i }">[${i }]</a>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<a
					href="${pageContext.request.contextPath}/post/category?bt_num=${bt_num }&bc_num=${bc_num }&currentPage=${pg.startPage+pg.pageBlock }">[다음]</a>
			</c:if>
		</div>
	</main>
	<%@ include file="/WEB-INF/views//main/footer.jsp"%>
</body>
</html>