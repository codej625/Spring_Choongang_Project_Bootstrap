<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userInfo.css" />
	
<script type="text/javascript">
	
	function allBtn() 
	{
	    all = $("#all").css("display");
	    class_ = $("#class_").css("display");
	    meeting = $("#meeting").css("display");
	    
	    if(all=="none") {
	    	$("#all").css("display", "");
	    	$("#class_").css("display", "none");
	    	$("#meeting").css("display", "none");
	    	
	    }
	    else			   	$("#all").css("display", "none");
	}
	
	function classBtn() 
	{
		all = $("#all").css("display");
	    class_ = $("#class_").css("display");
	    meeting = $("#meeting").css("display");
	    
	    if(class_=="none") {
	    	$("#class_").css("display", "");
	    	$("#all").css("display", "none");
	    	$("#meeting").css("display", "none");
	    }
	    else {
	    	$("#class_").css("display", "none");
	    	$("#all").css("display", "");
	    }
	    					
	}
	
	function meetingBtn() 
	{
		all = $("#all").css("display");
	    class_ = $("#class_").css("display");
	    meeting = $("#meeting").css("display");
	    
	    if(meeting=="none") {
	    	$("#meeting").css("display", "");
	    	$("#all").css("display", "none");
	    	$("#class_").css("display", "none");
	    }
	    else {
	    	$("#meeting").css("display", "none");
	    	$("#all").css("display", "");
	    }
	}
	
</script>
</head>
<body>
  	<%@ include file="/WEB-INF/views/main/header1.jsp"%>
  	<%@ include file="/WEB-INF/views/main/header2.jsp"%>
	<!-- **MAIN START** -->
	<main>
		<!-- main -->		<div class="userinfo_wrap">
			<div class="title">${lhj_MemberVO.m_name }님의 마이페이지</div>
			<div class="info_nav_bar">
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage">마이페이지 홈</a></div>
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_update">회원정보 수정</a></div>
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_mycertification">인증</a></div>
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_myPostList">내가 쓴 글</a></div>
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_myreginfo">신청 내역</a></div>
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_mybookmark">관심 내역</a></div>
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_changePW">비밀번호 변경</a></div>
				<div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_deleteMyself">회원 탈퇴</a></div>
			</div>
<!-- 				reginfo 전부 보여주는거  -->
			<div class="my_info_box">
				<div>
					<input type="button" value="all" onclick="allBtn()">
					<input type="button" value="class" onclick="classBtn()">
					<input type="button" value="meeting" onclick="meetingBtn()">
				</div>
				<div>
				<table id="all" border="1">
				<c:forEach var="lhj_MemberVO" items="${myRegInfoList }">
					<tr>
						<td rowspan="3" id="table_img">
						<a href="${pageContext.request.contextPath}/post/postListDetail?bt_num=${lhj_MemberVO.bt_num }&bc_num=${lhj_MemberVO.bc_num }&p_num=${lhj_MemberVO.p_num}">
						<c:if test="${lhj_MemberVO.p_img == null}">
							<img src="${pageContext.request.contextPath}/img/goya.jpg" width="250px">
						</c:if>
						<c:if test="${lhj_MemberVO.p_img != null}">
							<img src="${pageContext.request.contextPath}/upload/${lhj_MemberVO.p_img }" width="250px">
						</c:if>
						</a>
						</td>
						<td colspan="2">
							${lhj_MemberVO.p_title }
							<c:if test="${lhj_MemberVO.p_cstatus == '0'}">
								(무료)
							</c:if>
							<c:if test="${lhj_MemberVO.p_cstatus == '1'}">
								(유료)
							</c:if>
							<a href="${pageContext.request.contextPath}/chat/chat2?bt_num=${lhj_MemberVO.bt_num }&bc_num=${lhj_MemberVO.bc_num }&p_num=${lhj_MemberVO.p_num}">
							asd</a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							${lhj_MemberVO.p_intro }
						</td>
					</tr>
					<tr>
						<td>가격 : ${lhj_MemberVO.p_cost }</td>
						<td>
<!-- 							유료인경우 -->
							<c:if test="${lhj_MemberVO.p_cstatus == '1'}">
								<c:choose>
									<c:when test="${lhj_MemberVO.ri_pstatus == 'N'}">
										<a href="http://localhost:8181/springProject01/post/postRegInfoApplication?bt_num=${lhj_MemberVO.bt_num }&bc_num=${lhj_MemberVO.bc_num }&p_num=${lhj_MemberVO.p_num }">
										<input type="button" value="결제 하기" ></a>
									</c:when>
									<c:when test="${lhj_MemberVO.ri_pstatus == 'Y'}">
										결제 완료
									</c:when>
								</c:choose>
							</c:if>
							<form action="${pageContext.request.contextPath}/member/mypage_myreginfoDE">
								<input type="hidden" name="m_id" value="${lhj_MemberVO.m_id }">
								<input type="hidden" name="bt_num" value="${lhj_MemberVO.bt_num }">
								<input type="hidden" name="bc_num" value="${lhj_MemberVO.bc_num }">
								<input type="hidden" name="p_num" value="${lhj_MemberVO.p_num }">
								
								<input type="submit" value="신청 취소">
							</form>
							<input type="button" value="채팅" onclick="location.href='${pageContext.request.contextPath}/chat/chat2?bt_num=${lhj_MemberVO.bt_num }&bc_num=${lhj_MemberVO.bc_num }&p_num=${lhj_MemberVO.p_num}'">
						</td>
					</tr>
				</c:forEach>	
				</table>

<!-- 				reginfo - class만 보여주는 거 -->

				<table class="myreginfo_table" border="1" id="class_" style="display: none">
								<c:forEach var="lhj_MemberVO" items="${myRegInfoList }">
					<tr>
						<td rowspan="3" id="table_img">
						<a href="${pageContext.request.contextPath}/post/postListDetail?bt_num=${lhj_MemberVO.bt_num }&bc_num=${lhj_MemberVO.bc_num }&p_num=${lhj_MemberVO.p_num}">
						<c:if test="${lhj_MemberVO.p_img == null}">
							<img src="${pageContext.request.contextPath}/img/goya.jpg" width="250px">
						</c:if>
						<c:if test="${lhj_MemberVO.p_img != null}">
							<img src="${pageContext.request.contextPath}/upload/${lhj_MemberVO.p_img }" width="250px">
						</c:if>
						</a>
						</td>
						<td colspan="2">
							${lhj_MemberVO.p_title }
							<c:if test="${lhj_MemberVO.p_cstatus == '0'}">
								(무료)
							</c:if>
							<c:if test="${lhj_MemberVO.p_cstatus == '1'}">
								(유료)
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							${lhj_MemberVO.p_intro }
						</td>
					</tr>
					<tr>
						<td>가격 : ${lhj_MemberVO.p_cost }</td>
						<td>
							<c:if test="${lhj_MemberVO.ri_pstatus == 'N'}">
								<input type="button" value="결제 하기" >
							</c:if>
							<c:if test="${lhj_MemberVO.ri_pstatus == 'Y'}">
								결제 완료
							</c:if>
							<form action="${pageContext.request.contextPath}/member/mypage_myreginfoDE">
								<input type="hidden" name="m_id" value="${lhj_MemberVO.m_id }">
								<input type="hidden" name="bt_num" value="${lhj_MemberVO.bt_num }">
								<input type="hidden" name="bc_num" value="${lhj_MemberVO.bc_num }">
								<input type="hidden" name="p_num" value="${lhj_MemberVO.p_num }">
								
								<input type="submit" value="신청 취소">
							</form>
						</td>
					</tr>
				</c:forEach>	
				</table>
				
<!-- 				reginfo - meeting만 보여주는 거 -->

				<table class="myreginfo_table" border="1" id="meeting" style="display: none">
								<c:forEach var="lhj_MemberVO" items="${myRegInfoList }">
					<tr>
						<td rowspan="3" id="table_img">
						<a href="${pageContext.request.contextPath}/post/postListDetail?bt_num=${lhj_MemberVO.bt_num }&bc_num=${lhj_MemberVO.bc_num }&p_num=${lhj_MemberVO.p_num}">
						<c:if test="${lhj_MemberVO.p_img == null}">
							<img src="${pageContext.request.contextPath}/img/goya.jpg" width="250px">
						</c:if>
						<c:if test="${lhj_MemberVO.p_img != null}">
							<img src="${pageContext.request.contextPath}/upload/${lhj_MemberVO.p_img }" width="250px">
						</c:if>
						</a>
						</td>
						<td colspan="2">
							${lhj_MemberVO.p_title }
							<c:if test="${lhj_MemberVO.p_cstatus == '0'}">
								(무료)
							</c:if>
							<c:if test="${lhj_MemberVO.p_cstatus == '1'}">
								(유료)
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							${lhj_MemberVO.p_intro }
						</td>
					</tr>
					<tr>
						<td>가격 : ${lhj_MemberVO.p_cost }</td>
						<td>
							<c:if test="${lhj_MemberVO.ri_pstatus == 'N'}">
								<input type="button" value="결제 하기" >
							</c:if>
							<c:if test="${lhj_MemberVO.ri_pstatus == 'Y'}">
								결제 완료
							</c:if>
							<form action="${pageContext.request.contextPath}/member/mypage_myreginfoDE">
								<input type="hidden" name="m_id" value="${lhj_MemberVO.m_id }">
								<input type="hidden" name="bt_num" value="${lhj_MemberVO.bt_num }">
								<input type="hidden" name="bc_num" value="${lhj_MemberVO.bc_num }">
								<input type="hidden" name="p_num" value="${lhj_MemberVO.p_num }">
								
								<input type="submit" value="신청 취소">
							</form>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views//main/footer.jsp"%>
</body>
</html>