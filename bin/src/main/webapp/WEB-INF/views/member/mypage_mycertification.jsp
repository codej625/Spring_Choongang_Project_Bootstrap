<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
   String context = request.getContextPath();
%>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInfo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles22.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   function validate() {
      alert("인증 신청이 완료되었습니다.")
   }
</script>
<script type="text/javascript">
   function mail(){
      $.ajax({
         url :"${pageContext.request.contextPath}/member/mailTransport", 
         data : {'m_id' : resultform.m_id.value},
         type :"POST",
         success : function(data){   
            alert("인증번호를 보냈습니다.");
         },
         error : function(){
            alert("ajax error");
         }
      });
   }
</script>
<title>Insert title here</title>
</head>
<body>
     	<%@ include file="/WEB-INF/views/main/header1.jsp"%>
  	<%@ include file="/WEB-INF/views/main/header2.jsp"%>
   <!-- **MAIN START** -->
      <!-- main -->
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
        
         <div class="userinfo_wrap">
            <div class="title">${lhj_MemberVO.m_name }님의 마이페이지</div>
<!--                <div class="info_nav_bar"> -->
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage">마이페이지 홈</a></div> --%>
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_update">회원정보 수정</a></div> --%>
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_mycertification">인증</a></div> --%>
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_myPostList">내가 쓴 글</a></div> --%>
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_myreginfo">신청 내역</a></div> --%>
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_mybookmark">관심 내역</a></div> --%>
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_changePW">비밀번호 변경</a></div> --%>
<%--                   <div class="info_nav_menu"><a href="${pageContext.request.contextPath}/member/mypage_deleteMyself">회원 탈퇴</a></div> --%>
<!--                </div> -->
<!--                <div class="info_section"> -->
                  <div class="my_info_box">
                  <c:choose>
                  
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'M' and lhj_MemberVO.m_masterauth eq 'M'}">
                        <form method="post" action="${pageContext.request.contextPath}/member/certification" enctype="multipart/form-data" name="resultform" onsubmit="return validate();">
                           <div>
                           		<div class="exex3">
                                 <table>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받을 권한을 선택&gt;</font></td>
                                    <tr>
                                       <td><input type="checkbox" name="m_meetingauth"value="N">&nbsp;모임&nbsp; 
                                          <input type="checkbox"name="m_masterauth" value="N">&nbsp;클래스
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받으려는 이유를 선택&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <select name="m_certification">
                                             <option value="정보 공유">정보 공유</option>
                                             <option value="상업적인 목적">상업적인 목적</option>
                                             <option value="취미 활동">취미 활동</option>
                                             <option value="기타">기타</option>
                                          </select>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;메일 인증&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" placeholder="${lhj_MemberVO.m_id}" readonly></td>
                                       <td><input type="button" onclick="mail()" value="인증번호 받기"></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" name="m_mail" placeholder="인증번호를 입력하세요" required></td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;첨부 파일&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="hidden" name="m_id" value="${lhj_MemberVO.m_id}"></td>
                                       <td><input type="hidden" name="m_name" value="${lhj_MemberVO.m_name}"></td>
                                       <td><input type="hidden" name="m_tel" value="${lhj_MemberVO.m_tel}"></td>
                                       <td><input type="hidden" name="m_field" value="${lhj_MemberVO.m_field}"></td>
                                       <td><input type="hidden" name="m_regdate" value="${lhj_MemberVO.m_regdate}"></td>
                                    </tr>
                                    <tr>
                                       <td><input multiple="multiple" type="file" name="files"></td>
                                       <td><input type="submit" value="개설자 인증받기"></td>
                                    </tr>
                                 </table>
                                 </div>
                           </div>
                        </form>
                        <script>
                           window.onload = function(){
                             alert("2019년 05월 29일부로 개인정보보호법에 따라 개설 인증이 적용되었습니다. \n모임개설 수정 및 신청자 정보 확인을 위해 최초 1회(이메일/휴대전화)의 \n개설자 인증이 필요합니다.")}
                        </script>
                     </c:when>
      
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'M' and lhj_MemberVO.m_masterauth eq 'N'}">
                        <form method="post" action="${pageContext.request.contextPath}/member/certification2" enctype="multipart/form-data" name="resultform" onsubmit="return validate();">
                           <div>
                              <div>
                                 <div class="exex3">
                                    <table>
                                       <tr>
                                          <td><font color="blue">&lt;인증 받을 권한을 선택&gt;</font></td>
                                       <tr>
                                          <td>
                                             <input type="checkbox" name="m_meetingauth"value="N">&nbsp;모임&nbsp; 
                                          </td>
                                       </tr>
                                       <tr>
                                          <td><font color="blue">&lt;인증 받으려는 이유를 선택&gt;</font></td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <select name="m_certification">
                                                <option value="정보 공유">정보 공유</option>
                                                <option value="상업적인 목적">상업적인 목적</option>
                                                <option value="취미 활동">취미 활동</option>
                                                <option value="기타">기타</option>
                                             </select>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td><font color="blue">&lt;메일 인증&gt;</font></td>
                                       </tr>
                                       <tr>
                                          <td><input type="text" placeholder="${lhj_MemberVO.m_id}" readonly></td>
                                          <td><input type="button" onclick="mail()" value="인증번호 받기"></td>
                                       </tr>
                                       <tr>
                                          <td><input type="text" name="m_mail" placeholder="인증번호를 입력하세요" required></td>
                                       </tr>
                                       <tr>
                                          <td><font color="blue">&lt;첨부 파일&gt;</font></td>
                                       </tr>
                                       <tr>
                                          <td><input type="hidden" name="m_id" value="${lhj_MemberVO.m_id}"></td>
                                          <td><input type="hidden" name="m_name" value="${lhj_MemberVO.m_name}"></td>
                                          <td><input type="hidden" name="m_tel" value="${lhj_MemberVO.m_tel}"></td>
                                          <td><input type="hidden" name="m_field" value="${lhj_MemberVO.m_field}"></td>
                                          <td><input type="hidden" name="m_regdate" value="${lhj_MemberVO.m_regdate}"></td>
                                       </tr>
                                       <tr>
                                          <td><input multiple="multiple" type="file" name="files"></td>
                                          <td><input type="submit" value="개설자 인증받기"></td>
                                       </tr>
                                    </table>
                                 </div>
                              </div>                     
                           </div>
                        </form>
                              <div class="exex">
                                          &nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/클래스.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;
                              </div>
                              <div class="exex2">
                                          <font color="red">&lt;클래스 개설 권한 심사 중입니다&gt;</font>
                              </div>
                        <script>
                           window.onload = function(){
                             alert("2019년 05월 29일부로 개인정보보호법에 따라 개설 인증이 적용되었습니다. \n모임개설 수정 및 신청자 정보 확인을 위해 최초 1회(이메일/휴대전화)의 \n개설자 인증이 필요합니다.")}
                        </script>
                     </c:when>
            
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'N' and lhj_MemberVO.m_masterauth eq 'M'}">
                        <form method="post" action="${pageContext.request.contextPath}/member/certification2" enctype="multipart/form-data" name="resultform" onsubmit="return validate();">
<!--                            <div class="info_img"> -->
<!--                               <div id="image_container"> -->
                                 <div>
                                  <div class="exex3">
                                 <table>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받을 권한을 선택&gt;</font></td>
                                    <tr>
                                       <td>
                                          <input type="checkbox"name="m_masterauth" value="N">&nbsp;클래스
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받으려는 이유를 선택&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <select name="m_certification">
                                             <option value="정보 공유">정보 공유</option>
                                             <option value="상업적인 목적">상업적인 목적</option>
                                             <option value="취미 활동">취미 활동</option>
                                             <option value="기타">기타</option>
                                          </select>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;메일 인증&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" placeholder="${lhj_MemberVO.m_id}" readonly></td>
                                       <td><input type="button" onclick="mail()" value="인증번호 받기"></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" name="m_mail" placeholder="인증번호를 입력하세요" required></td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;첨부 파일&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="hidden" name="m_id" value="${lhj_MemberVO.m_id}"></td>
                                       <td><input type="hidden" name="m_name" value="${lhj_MemberVO.m_name}"></td>
                                       <td><input type="hidden" name="m_tel" value="${lhj_MemberVO.m_tel}"></td>
                                       <td><input type="hidden" name="m_field" value="${lhj_MemberVO.m_field}"></td>
                                       <td><input type="hidden" name="m_regdate" value="${lhj_MemberVO.m_regdate}"></td>
                                    </tr>
                                    <tr>
                                       <td><input multiple="multiple" type="file" name="files"></td>
                                       <td><input type="submit" value="개설자 인증받기"></td>
                                    </tr>
                                 </table>
                              </div>
                           </div>
                           <div class="exex">
                                       &nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/모임.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;
                           </div>
                           <div class="exex2">
                                       <font color="red">&lt;모임 개설 권한 심사 중입니다&gt;</font>
                           </div>
                        </form>
                        <script>
                           window.onload = function(){
                             alert("2019년 05월 29일부로 개인정보보호법에 따라 개설 인증이 적용되었습니다. \n모임개설 수정 및 신청자 정보 확인을 위해 최초 1회(이메일/휴대전화)의 \n개설자 인증이 필요합니다.")}
                        </script>
                     </c:when>
                     
                                       <c:when test="${lhj_MemberVO.m_meetingauth eq 'Y' and lhj_MemberVO.m_masterauth eq 'M'}">
                     <form method="post" action="${pageContext.request.contextPath}/member/certification2" enctype="multipart/form-data" name="resultform" onsubmit="return validate();">
<!--                            <div class="info_img"> -->
<!--                               <div id="image_container"> -->
                                 <div class="ex">
                                  <div class="exex3">
                                 <table>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받을 권한을 선택&gt;</font></td>
                                    <tr>
                                       <td>
                                          <input type="checkbox"name="m_masterauth" value="N">&nbsp;클래스
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받으려는 이유를 선택&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <select name="m_certification">
                                             <option value="정보 공유">정보 공유</option>
                                             <option value="상업적인 목적">상업적인 목적</option>
                                             <option value="취미 활동">취미 활동</option>
                                             <option value="기타">기타</option>
                                          </select>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;메일 인증&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" placeholder="${lhj_MemberVO.m_id}" readonly></td>
                                       <td><input type="button" onclick="mail()" value="인증번호 받기"></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" name="m_mail" placeholder="인증번호를 입력하세요" required></td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;첨부 파일&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="hidden" name="m_id" value="${lhj_MemberVO.m_id}"></td>
                                       <td><input type="hidden" name="m_name" value="${lhj_MemberVO.m_name}"></td>
                                       <td><input type="hidden" name="m_tel" value="${lhj_MemberVO.m_tel}"></td>
                                       <td><input type="hidden" name="m_field" value="${lhj_MemberVO.m_field}"></td>
                                       <td><input type="hidden" name="m_regdate" value="${lhj_MemberVO.m_regdate}"></td>
                                    </tr>
                                    <tr>
                                       <td><input multiple="multiple" type="file" name="files"></td>
                                       <td><input type="submit" value="개설자 인증받기"></td>
                                    </tr>
                                 </table>
                              </div>
                           </div>
                              <div class="exex">
                                       &nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/모임.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;
                              </div>
                              <div class="exex2">
                                 <font color="blue">&lt;모임 개설 권한을 받았습니다&gt;</font>
                              </div>
                        </form>
                        <script>
                           window.onload = function(){
                             alert("2019년 05월 29일부로 개인정보보호법에 따라 개설 인증이 적용되었습니다. \n모임개설 수정 및 신청자 정보 확인을 위해 최초 1회(이메일/휴대전화)의 \n개설자 인증이 필요합니다.")}
                        </script>
                     </c:when>
                     
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'M' and lhj_MemberVO.m_masterauth eq 'Y'}">
                     <form method="post" action="${pageContext.request.contextPath}/member/certification2" enctype="multipart/form-data" name="resultform" onsubmit="return validate();">
<!--                            <div class="info_img"> -->
<!--                               <div id="image_container"> -->
                                 <div>
                                  <div class="exex3">
                                 <table>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받을 권한을 선택&gt;</font></td>
                                    <tr>
                                       <td>
                                          <input type="checkbox"name="m_meetingauth" value="N">&nbsp;모임
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;인증 받으려는 이유를 선택&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <select name="m_certification">
                                             <option value="정보 공유">정보 공유</option>
                                             <option value="상업적인 목적">상업적인 목적</option>
                                             <option value="취미 활동">취미 활동</option>
                                             <option value="기타">기타</option>
                                          </select>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;메일 인증&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" placeholder="${lhj_MemberVO.m_id}" readonly></td>
                                       <td><input type="button" onclick="mail()" value="인증번호 받기"></td>
                                    </tr>
                                    <tr>
                                       <td><input type="text" name="m_mail" placeholder="인증번호를 입력하세요" required></td>
                                    </tr>
                                    <tr>
                                       <td><font color="blue">&lt;첨부 파일&gt;</font></td>
                                    </tr>
                                    <tr>
                                       <td><input type="hidden" name="m_id" value="${lhj_MemberVO.m_id}"></td>
                                       <td><input type="hidden" name="m_name" value="${lhj_MemberVO.m_name}"></td>
                                       <td><input type="hidden" name="m_tel" value="${lhj_MemberVO.m_tel}"></td>
                                       <td><input type="hidden" name="m_field" value="${lhj_MemberVO.m_field}"></td>
                                       <td><input type="hidden" name="m_regdate" value="${lhj_MemberVO.m_regdate}"></td>
                                    </tr>
                                    <tr>
                                       <td><input multiple="multiple" type="file" name="files"></td>
                                       <td><input type="submit" value="개설자 인증받기"></td>
                                    </tr>
                                 </table>
                              </div>
                           </div>
                           <div class="exex">
                                       &nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/클래스.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;
                           </div>
                           <div class="exex2">
                                       <font color="blue">&lt;클래스 개설 권한을 받았습니다&gt;</font>
                           </div>
                        </form>
                        <script>
                           window.onload = function(){
                             alert("2019년 05월 29일부로 개인정보보호법에 따라 개설 인증이 적용되었습니다. \n모임개설 수정 및 신청자 정보 확인을 위해 최초 1회(이메일/휴대전화)의 \n개설자 인증이 필요합니다.")}
                        </script>
                     </c:when>
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'N' and lhj_MemberVO.m_masterauth eq 'N'}">
                        <div class="exex4">
                        <table>
                           <tr>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/모임.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/클래스.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                           </tr>
                           <tr>
                              <th align="center"><font color="red">&lt;모임 개설 권한을 심사 중입니다&gt;</font></th><th><font color="red">&lt;클래스 개설 권한 심사 중입니다&gt;</font></th>
                           </tr>
                        </table>                  
                        </div>
                     </c:when>
      
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'N' and lhj_MemberVO.m_masterauth eq 'Y'}">
                        <div class="exex4">
                        <table>
                           <tr>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/모임.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/클래스.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                           </tr>
                           <tr>
                              <th align="center"><font color="red">&lt;모임 개설 권한을 심사 중입니다&gt;</font></th><th><font color="blue">&lt;클래스 개설 권한 받았습니다&gt;</font></th>
                           </tr>
                        </table>
                        </div>
                     </c:when>
      
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'Y' and lhj_MemberVO.m_masterauth eq 'N'}">
                        <div class="exex4">
                        <table>
                           <tr>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/모임.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/클래스.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                           </tr>
                           <tr>
                              <th align="center"><font color="blue">&lt;모임 개설 권한을  받았습니다&gt;</font></th><th><font color="red">&lt;클래스 개설 권한 심사 중입니다&gt;</font></th>
                           </tr>
                        </table>
                        </div>
                     </c:when>
      
                     <c:when test="${lhj_MemberVO.m_meetingauth eq 'Y' and lhj_MemberVO.m_masterauth eq 'Y'}">
                        <div class="exex4">
                        <table>
                           <tr>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/모임.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                              <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="error" src="${pageContext.request.contextPath}/img/클래스.jpg" width="320" height="240" align="middle">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                           </tr>
                           <tr>
                              <th align="center"><font color="blue">&lt;모든 개설 권한을 받았습니다&gt;</font></th>
                           </tr>
                        </table>
                        </div>
                     </c:when>
                  </c:choose>
               </div>
            </div>
         </main>
   <%@ include file="/WEB-INF/views//main/footer.jsp"%>
</body>
</html>