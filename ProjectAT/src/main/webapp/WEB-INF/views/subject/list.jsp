<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table{border: 1px solid black}
td,th{border:1px solid black}
.clickable-row{cursor: pointer}
</style>
<a href="list?state=1">진행중</a> <a href="list?state=0">종료</a>
<table>
<tr><th>번호</th><th>강좌명</th><th>시작일/종료일</th><th>모집인원</th><th>신청</th></tr>
<c:forEach items="${SubjectList}" var="subject" varStatus="status">
	<tr class='clickable-row' data-href='#'>
		<td>${status.count}</td>
		<td>${subject.classname}</td>
		<td><fmt:formatDate value='${subject.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${subject.enddate}' pattern='yyyy-MM-dd'/></td>
		<td>${subject.total}</td>
		<td><button>신청</button></td>
	</tr>
</c:forEach>
</table>