<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.clickable-row{cursor: pointer}
th {background-color: #FFBB00; color:white;}
</style>
<script type="text/javascript">

$(document).ready(function(){
	$('.apply_btn').on('click', function(){
		var subject=$(this).parent().siblings('.classname').text();
		var num=$(this).parent().parent().children('.classnum').val();
		bootbox.confirm({ 
		    message: '['+subject+']'+'를 수강 신청하시겠습니까?', 
		 	callback: function(result){
		 		if(!result) return;
		 		
		 		$.ajax({
			        type:"get",
			        url:"apply",
			        data:{'num':num},
			        dataType:"json",
			        success:function(result){
			            if(result==0) {
			            	bootbox.alert('이미 수강 신청 중인 강좌가 존재합니다.', function() {});
			            }else if(result>=1) {
			            	bootbox.alert('수강 신청이 완료되었습니다.<br>'+
				            		 	'신청 현황 및 취소는 [마이페이지]에서 가능합니다.', function() {});
			            }else alert("알 수 없는 에러 발생!");
			        },
			        complete:function(data){            
			        },
			        error:function(xhr,status,error){
			 
			        }
				});
		 	}
		});
	});
	
	$('tr td:not(:last-child)').on('click', function(){
		location.href = $(this).parent().attr('onclick');
	});
});

</script>
<div class="tableArea">
<img width="100%" src="<c:url value="/resources/images/image/jobinfo.png"/>">

	<table class="table table-striped table-hover" style="margin-top: 40px">
		<thead>
			<tr>
				<th class="col-xs-1 text-center">번호</th>
				<th class="col-xs-3 text-center">제목</th>
				<th class="col-xs-2 text-center">회사명</th>
				<th class="col-xs-1 text-center">채용인원</th>
				<th class="col-xs-3 text-center">채용기간</th>
			</tr>
		</thead>
		
		<c:forEach items="${jobinfoVo}" var="job" varStatus="status">
			<tr class='clickable-row' onclick="read?num=${job.num}">
				<input class="jobnum" type="hidden" value="${job.num}" />
				<td class="text-center">${status.count}</td>
				<td class="text-center">${job.title}</td>
				<td class="text-center">${job.company}</td>
				<td class="text-center">${job.hirecount}</td>
				<td class="text-center">${job.period}</td>
			</tr>
		</c:forEach>
	</table>
	<sec:authorize access="hasAuthority('admin')">
		<p class="text-right" style="margin-top: 20px">
			<button type="button" class="btn btn-btn-secondary" onclick="location.href='writeform'">등록</button>
		</p>
	</sec:authorize>
</div>
