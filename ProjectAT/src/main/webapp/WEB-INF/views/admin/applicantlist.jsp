<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table{border: 1px solid black}
td,th{border:1px solid black}
</style>
<script type="text/javascript">

jQuery(document).ready(function($) {
    $("#yes").on('click',function(){
    	var name=$(this).parent().siblings('.username').text();
    	var id=$(this).parent().siblings('.userid').text();
    	if(!confirm('['+name+']'+'님의 수강신청을 수락하시겠습니까?')) return;
    	location.href="addstudent?id="+id;
    });
    
    $("#no").on('click',function(){
    	var name=$(this).parent().siblings('.username').text();
    	var id=$(this).parent().siblings('.userid').text();
    	if(!confirm('['+name+']'+'님의 수강신청을 거절하시겠습니까?')) return;
    	location.href="removeapplicant?id="+id;
    });   
});

</script>
<a href="studentView">학생 리스트</a> <a href="applicantView">수강 신청 리스트</a>

<table>
<tr><th>번호</th><th>신청 강좌</th><th>신청일</th><th>이름</th><th>생년월일</th><th>이메일</th><th>연락처</th><th>수락</th><th>거절</th></tr>
<c:forEach items="${ApplicantList}" var="applicant" varStatus="status">
	<tr data-href='#'>
		<td>${status.count}</td>
		<td>${applicant.educlass}</td>
		<td><fmt:formatDate value='${applicant.applicantDate}' pattern='yyyy-MM-dd'/></td>
		<td class="username">${applicant.username}</td>
		<td><fmt:formatDate value='${applicant.birthday}' pattern='yyyy-MM-dd'/></td>
		<td class="userid">${applicant.userid}</td>
		<td>${applicant.phone}</td>
		<td><button type="button" id="yes">수락</button></td>
		<td><button type="button" id="no">거절</button></td>
	</tr>
</c:forEach>
</table>