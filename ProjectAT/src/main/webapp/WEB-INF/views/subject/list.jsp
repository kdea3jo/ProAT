<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
table{border: 1px solid black}
td,th{border:1px solid black}
.clickable-row{cursor: pointer}
</style>
<script type="text/javascript">

$(document).ready(function(){
	$('.apply_btn').on('click', function(){
		
		if(!confirm('['+$(this).parent().siblings('.classname').text()+']'+'를 수강 신청하시겠습니까?')) return;

		$.ajax({
	        type:"get",
	        url:"apply",
	        data:{'num':$(this).parent().parent().children('.classnum').val()},
	        dataType:"json",
	        success:function(result){
	        	alert(result);
	            if(result==1) {
	            	alert('이미 수강 신청 중인 강좌가 존재합니다.');
	            }else if(result==2) {
	            	alert('수강 신청이 완료되었습니다.');
	            }else alert("알 수 없는 에러 발생!");
	        },
	        complete:function(data){            
	        },
	        error:function(xhr,status,error){
	 
	        }
		});
	});
});

</script>
<a href="list?state=1">진행중</a> <a href="list?state=0">종료</a>
<table>
<tr><th>번호</th><th>강좌명</th><th>시작일/종료일</th><th>모집인원</th>
	<sec:authorize access="hasAuthority('member')">
	<th>신청</th>
	</sec:authorize>
	</tr>
<c:forEach items="${SubjectList}" var="subject" varStatus="status">
	<tr class='clickable-row' data-href='#'>
		<input class="classnum" type="hidden" value="${subject.num}"/>
		<td>${status.count}</td>
		<td class="classname">${subject.classname}</td>
		<td><fmt:formatDate value='${subject.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${subject.enddate}' pattern='yyyy-MM-dd'/></td>
		<td>${subject.total}</td>
		
		<sec:authorize access="hasAuthority('member')">
			<td><button type="button" class="apply_btn">신청</button></td>
		</sec:authorize>
		
	</tr>
</c:forEach>
</table>
<sec:authorize access="hasAuthority('admin')">
	<button type="button" onclick="location.href='createform'">개설</button>
</sec:authorize>
