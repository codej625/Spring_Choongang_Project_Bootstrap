<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userInfo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles22.css" />
<script>
	//프로필 이미지 업로드 할때 사진 보여주는거
	function setThumbnail(event) {
		var reader = new FileReader(); 
     	reader.onload = function(event) {
	        var img = document.createElement("img"); 
	        img.setAttribute("src", event.target.result); 
	        document.querySelector("div#image_container").appendChild(img); 
     	}; 
  		reader.readAsDataURL(event.target.files[0]); 
  	} 
</script>

</head>
<body>
  	<%@ include file="/WEB-INF/views/main/header1.jsp"%>
  	<%@ include file="/WEB-INF/views/main/header2.jsp"%>
	<!-- **MAIN START** -->
	<main>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">Clarence Taylor</span>
                <span class="d-none d-lg-block">
<!--                 	<img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="assets/img/profile.jpg" alt="..."> -->
                	<c:if test="${lhj_MemberVO.m_img == null}">
						<img src="${pageContext.request.contextPath}/img/흰둥이.jpg" class="img-fluid img-profile rounded-circle mx-auto mb-2">				
					</c:if>
					<c:if test="${lhj_MemberVO.m_img != null}">
						<img src="${pageContext.request.contextPath}/upload/${lhj_MemberVO.m_img}" class="img-fluid img-profile rounded-circle mx-auto mb-2">				
					</c:if>
                
                </span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage">mypage_home</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage_update">userinfo_update</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage_mycertification">certification</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage_myPostList">my_history</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage_myreginfo">my_reginfo</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage_mybookmark">my_bookmark</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage_changePW">changePW</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/member/mypage_deleteMyself">delete_myself</a></li>
                </ul>
            </div>
        </nav>
	
		<form action="${pageContext.request.contextPath}/member/mypage_update" method="post" enctype="multipart/form-data">
		<!-- main -->
		<div class="userinfo_wrap">
			<div class="title">${lhj_MemberVO.m_name }님의 마이페이지</div>
<!-- 			<div class="info_nav_bar"> -->
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage">마이페이지 홈</a></div> --%>
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_update">회원정보 수정</a></div> --%>
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_mycertification">인증</a></div> --%>
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_myPostList">내가 쓴 글</a></div> --%>
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_myreginfo">신청 내역</a></div> --%>
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_mybookmark">관심 내역</a></div> --%>
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_changePW">비밀번호 변경</a></div> --%>
<%-- 				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_deleteMyself">회원 탈퇴</a></div> --%>
<!-- 			</div> -->
			<div class="info_section">
				<input type="hidden" value="${lhj_MemberVO.m_id }" name="m_id">
				<input type="hidden" value="${lhj_MemberVO.m_pw }">
				<input type="hidden" value="${lhj_MemberVO.m_regdate }">
				<input type="hidden" value="${lhj_MemberVO.m_rate }">
				<input type="hidden" value="${lhj_MemberVO.m_withdrawal }">
				<div class="info_img">
					<div id="image_container"></div>
					<input type="file" name="m_img" onchange="setThumbnail(event);" class="img_size"/>
				</div>
				
				<div>
					<table class="myreginfo_table_up">
						<tr><th>이름</th><td><input type="text" value="${lhj_MemberVO.m_name }" name="m_name"></td></tr>
						<tr><th>번호</th><td><input type="text" value="${lhj_MemberVO.m_tel }" name="m_tel" ></td></tr>
						<tr><th>지역</th><td><input type="text" value="${lhj_MemberVO.m_area }" name="m_area"></td></tr>
						<tr>
							<th>분야</th>
							<td>
								<select id="m_field" name="m_field">
									<option value="게임/만화/애니">게임/만화/애니</option>
									<option value="영화/음악/그림">영화/음악/그림</option>
									<option value="스포츠/레저">스포츠/레저</option>
									<option value="반려동물">반려동물</option>
									<option value="패션/미용">패션/미용</option>
									<option value="건강/다이어트">건강/다이어트</option>
									<option value="가족/육아">가족/육아</option>
									<option value="컴퓨터/통신">컴퓨터/통신</option>
									<option value="외국어/인문/과학">외국어/인문/과학</option>
									<option value="경제/금융/정치/사회">경제/금융/정치/사회</option>
									<option value="문학/창작">문학/창작</option>
									<option value="기타">기타</option>
								</select>
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td colspan="2"> -->
<!-- 								<input type="submit" value="수정"> -->
<!-- 		 						<input type="reset" value="취소"> -->
<!-- 							</td> -->
<!-- 						</tr> -->
					</table>
				</div>
				<div class="for_Btn">
						<input type="submit" value="수정" class="update_Btn"> 
		 				<input type="reset" value="취소" class="can_Btn">
				</div>
				
<!-- 				<div class="info_items"> -->
<!-- 					<div class="info_item"> -->
<!-- 						<div class="item_title">이름</div> -->
<!-- 						<div class="item_content"> -->
<%-- 							<input type="text" value="${lhj_MemberVO.m_name }" name="m_name"> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="info_item"> -->
<!-- 						<div class="item_title">번호</div> -->
<!-- 						<div class="item_content"> -->
<%-- 							<input type="text" value="${lhj_MemberVO.m_tel }" name="m_tel" > --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="info_item"> -->
<!-- 						<div class="item_title">지역</div> -->
<!-- 						<div class="item_content"> -->
<%-- 							<input type="text" value="${lhj_MemberVO.m_area }" name="m_area"> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="info_item"> -->
<!-- 						<div class="item_title">분야</div> -->
<!-- 						<div class="input_item"> -->
<!-- 						<select id="m_field" name="m_field"> -->
<!-- 							<option value="게임/만화/애니">게임/만화/애니</option> -->
<!-- 							<option value="영화/음악/그림">영화/음악/그림</option> -->
<!-- 							<option value="스포츠/레저">스포츠/레저</option> -->
<!-- 							<option value="반려동물">반려동물</option> -->
<!-- 							<option value="패션/미용">패션/미용</option> -->
<!-- 							<option value="건강/다이어트">건강/다이어트</option> -->
<!-- 							<option value="가족/육아">가족/육아</option> -->
<!-- 							<option value="컴퓨터/통신">컴퓨터/통신</option> -->
<!-- 							<option value="외국어/인문/과학">외국어/인문/과학</option> -->
<!-- 							<option value="경제/금융/정치/사회">경제/금융/정치/사회</option> -->
<!-- 							<option value="문학/창작">문학/창작</option> -->
<!-- 							<option value="기타">기타</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<input type="submit" value="수정"> -->
<!-- 						<input type="reset" value="취소"> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
		</form>
	</main>
	<%@ include file="/WEB-INF/views//main/footer.jsp"%>
</body>
</html>