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
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
</script>
<a href="studentView">학생 리스트</a> <a href="applicantView">수강 신청 리스트</a>
<table>
<tr><th>번호</th><th>이름</th><th>수강 강좌</th><th>생년월일</th><th>이메일</th><th>연락처</th></tr>
<c:forEach items="${StudentList}" var="student" varStatus="status">
	<tr class='clickable-row' data-href='#'>
		<td>${status.count}</td>
		<td>${student.username}</td>
		<td>${student.educlass}</td>
		<td><fmt:formatDate value='${student.birthday}' pattern='yyyy-MM-dd'/></td>
		<td>${student.userid}</td>
		<td>${student.phone}</td>
	</tr>
</c:forEach>
</table>