<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
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
<div class="tableArea">
<a href="list?state=1">진행중</a> / <a href="list?state=0">종료</a>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th class="col-xs-1 text-center">번호</th>
				<th class="col-xs-4 text-center">강좌명</th>
				<th class="col-xs-3 text-center">시작일/종료일</th>
				<th class="col-xs-1 text-center">모집인원</th>
				<sec:authorize access="hasAuthority('member')">
					<th class="col-xs-1 text-center">신청</th>
				</sec:authorize>
				</tr>
		</thead>
	
		<c:forEach items="${SubjectList}" var="subject" varStatus="status">
			<tr class='clickable-row' onclick="location.href='read?num='+${subject.num}">
				<input class="classnum" type="hidden" value="${subject.num}"/>
				<td class="text-center">${status.count}</td>
				<td class="classname">${subject.classname}</td>
				<td class="text-center"><fmt:formatDate value='${subject.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${subject.enddate}' pattern='yyyy-MM-dd'/></td>
				<td class="text-center">${subject.total}</td>
				<sec:authorize access="hasAuthority('member')">
					<td><button type="button" class="apply_btn">신청</button></td>
				</sec:authorize>
			</tr>
		</c:forEach>
	</table>
</div>
<sec:authorize access="hasAuthority('admin')">
	<button type="button" onclick="location.href='createform'">개설</button>
</sec:authorize>
