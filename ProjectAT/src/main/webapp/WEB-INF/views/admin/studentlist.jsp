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
	$('tr td:not(:last-child)').on('click', function(){
		var id=$(this).parent().children('.userid').val();
		location.href='userdetails?id='+id;
	});
    
	$('.delete').on('click', function(){
		var tr=$(this).closest('tr');	
	
		bootbox.confirm({ 
		    message: '['+$(this).parent().siblings('.username').text()+']'+'님을 학생에서 삭제하시겠습니까?', 
		 	callback: function(result){
		    	if(!result) return;
				$.ajax({
			        type:"get",
			        url:"removestudent",
			        data:{'id':tr.children('.userid').val()},
			        dataType:"json",
			        success:function(result){
			            if(result) {
			            	bootbox.alert("삭제 되었습니다.", function() {});
			            	tr.remove();
			            }else{
			            	alert("삭제 실패");
			            }
			        },
			        complete:function(data){            
			        },
			        error:function(xhr,status,error){
			        }
				})
		    }
		});
	});
});

</script>
<div class="tableArea">
	<ul class="pager text-right" style="margin-top: 30px">
  		<li><a href="studentView">학생</a></li>
  		<li><a href="applicantView">수강 신청자</a></li>
	</ul>

	<table class="table table-striped table-bordered table-hover text-center">
		<thead>
			<tr>
				<th class="col-xs-1 text-center">번호</th>
				<th class="col-xs-3 text-center">이름</th>
				<th class="col-xs-4 text-center">수강 강좌</th>
				<th class="col-xs-3 text-center">생년 월일</th>
				<th class="col-xs-1 text-center">삭제</th>
			</tr>
		</thead>

		<c:forEach items="${StudentList}" var="student" varStatus="status">
			<tr class='clickable-row'>
				<input class="userid" type="hidden" value="${student.userid}" />
				<td>${status.count}</td>
				<td class="username">${student.username}</td>
				<td>${student.educlass}</td>
				<td><fmt:formatDate value='${student.birthday}'
						pattern='yyyy-MM-dd' /></td>
				<td><button type="button" class="apply_btn btn btn-secondary delete">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
</div>