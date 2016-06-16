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
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$('.cancel_btn').on('click', function(){
		
		bootbox.confirm({ 
		    message: '['+$(this).parent().siblings('.classname').text()+']'+'를 수강 취소하시겠습니까?', 
		 	callback: function(result){
		 		if(!result) return;
				location.href="cancel";
		 	}
		});
	});
});

</script>
<div class="tableArea">
<c:choose>
	<c:when test="${subjectVo.num!=null}">
	<p class="text-right"><img data-toggle="tooltip" data-placement="top" title="강좌는 중복 신청이 불가능합니다." src="<c:url value="/resources/images/icon/light.png"/>"></p>
	<table class="table table-striped table-bordered table-hover text-center">
		<thead>
			<tr>
				<th class="col-xs-5 text-center">강좌명</th>
				<th class="col-xs-3 text-center">시작일/종료일</th>
				<th class="col-xs-1 text-center">모집인원</th>
				<th class="col-xs-2 text-center">신청일</th>
				<th class="col-xs-1 text-center">취소</th>
			</tr>
		</thead>

		<tr class='clickable-row' data-href='#'>
			<input class="classnum" type="hidden" value="${subjectVo.num}" />
			<td class="classname">${subjectVo.classname}</td>
			<td><fmt:formatDate value='${subjectVo.startdate}' pattern='yyyy-MM-dd' />~
				<fmt:formatDate	value='${subjectVo.enddate}' pattern='yyyy-MM-dd' />
			</td>
			<td>${subjectVo.total}</td>
			<td><fmt:formatDate value='${subjectVo.adate}' pattern='yyyy-MM-dd' /></td>
			<td><button type="button" class="btn btn-secondary dropdown-toggle cancel_btn">취소</button></td>
		</tr>
	</table>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$(document).ready(function(){
				bootbox.alert('신청중인 강좌가 존재하지 않습니다.', function(result) {
		    		location.href="/ProjectAT/subject/list?state=1";
		    	});
			});
			
		</script>
	</c:otherwise>
</c:choose>
</div>