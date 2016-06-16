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
	            if(result==0) {
	            	alert('이미 수강 신청 중인 강좌가 존재합니다.');
	            }else if(result>=1) {
	            	alert('수강 신청이 완료되었습니다.\n'+
	            		  '신청 현황 및 취소는 [마이페이지]에서 가능합니다.');	            	
	            }else alert("알 수 없는 에러 발생!");
	        },
	        complete:function(data){            
	        },
	        error:function(xhr,status,error){
	 
	        }
		});
	});
	
	$('tr td:not(:last-child)').on('click', function(){
		location.href = $(this).parent().attr('onclick');
	});
});

</script>
<div class="tableArea">
<img width="100%" src="<c:url value="/resources/images/image/subject.jpg"/>">

	<ul class="pager text-right" style="margin-top: 30px">
  		<li><a href="list?state=1">진행중</a></li>
  		<li><a href="list?state=0">종료</a></li>
	</ul>

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
			<tr class='clickable-row' onclick="read?num=${subject.num}">
				<input class="classnum" type="hidden" value="${subject.num}" />
				<td class="text-center">
				${status.count}</td>
				<td class="classname">${subject.classname}</td>
				<td class="text-center"><fmt:formatDate value='${subject.startdate}' pattern='yyyy-MM-dd'/>~<fmt:formatDate value='${subject.enddate}' pattern='yyyy-MM-dd'/></td>
				<td class="text-center">${subject.total}</td>
				<sec:authorize access="hasAuthority('member')">
					<td class="text-center"><button type="button" class="apply_btn btn btn-secondary">신청</button></td>
				</sec:authorize>
			</tr>
		</c:forEach>
	</table>
	<sec:authorize access="hasAuthority('admin')">
		<p class="text-right" style="margin-top: 20px">
			<button type="button" class="btn btn-btn-secondary" onclick="location.href='createform'">개설</button>
		</p>
	</sec:authorize>
</div>
