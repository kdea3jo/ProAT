<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table{border: 1px solid black}
td,th{border:1px solid black}
.clickable-row{cursor: pointer}
</style>
<script type="text/javascript">

$(document).ready(function(){
	$('.cancel_btn').on('click', function(){
		
		if(!confirm('['+$(this).parent().siblings('.classname').text()+']'+'를 수강 취소하시겠습니까?')) return;
		location.href="cancel";
	});
});

</script>
<a href="studentView">신청중</a> <a href="applicantView">수강완료</a>

<c:choose>
	<c:when test="${subjectVo.num!=null}">
		<table>
			<tr><th>강좌명</th><th>시작일/종료일</th><th>모집인원</th><th>신청일</th><th>취소</th></tr>
			<tr class='clickable-row' data-href='#'>
				<input class="classnum" type="hidden" value="${subjectVo.num}"/>
				<td class="classname">${subjectVo.classname}</td>
				<td><fmt:formatDate value='${subjectVo.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${subjectVo.enddate}' pattern='yyyy-MM-dd'/></td>
				<td>${subjectVo.total}</td>
				<td><fmt:formatDate value='${subjectVo.adate}' pattern='yyyy-MM-dd'/></td>
				<td><button type="button" class="cancel_btn">취소</button></td>
			</tr>
		</table>
	</c:when>
	<c:otherwise>
		신청한 강좌가 없습니다.
	</c:otherwise>
</c:choose>