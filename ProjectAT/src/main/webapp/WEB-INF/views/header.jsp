<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<!-- 브라우저 크기가 작아졌을 때 버튼 생성 -->
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/ProjectAT/main"><strong>AT출결 관리 시스템</strong></a>
		</div>
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="/ProjectAT/board/notice/list">공지사항</a></li>
				<li><a href="/ProjectAT/subject/list?state=1">강좌</a></li>
				<li><a href="/ProjectAT/board/jobinfo/list">취업정보</a></li>
				<li><a href="/ProjectAT/board/qna/list">Q&A</a></li>
				<li><a href="/ProjectAT/attendence/list">출결현황</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.name==null}">
						<li><a href="/ProjectAT/member/loginform">로그인</a></li>
						<li><button class="btn btn-primary btn-sm navbar-btn" onclick="location.href='/ProjectAT/member/joinform'" type="button">회원가입</button></li>
					</c:when>
					<c:otherwise>
						<li><a><strong>${sessionScope.name}</strong>님 반갑습니다.</a></li>
						<sec:authorize access="hasAuthority('admin')">
							<li><a href="/ProjectAT/admin/studentView">관리자</a></li>
						</sec:authorize>
						<li><a href="/ProjectAT/member/check_pw">마이페이지</a></li>
						<li><a href="/ProjectAT/logout">로그아웃</a></li>
					</c:otherwise>		
				</c:choose>
			</ul>
		</div>
	</div>
</nav>