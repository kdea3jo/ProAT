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
    $(".yes").on('click',function(){
      	
    	var tr=$(this).closest('tr');
    	var name=$(this).closest('tr').children('.username').text();
    	var id=$(this).closest('tr').children('input').val();

    	/* if(!confirm('['+name+']'+'님의 수강신청을 수락하시겠습니까?')) return;
 */    	    	    	
    	$.ajax({
	        type:"get",
	        url:"addstudent",
	        data:{'id':id},
	        dataType:"json",
	        success:function(result){
	            if(result) {
	            	alert('['+name+']'+'님이 학생으로 등록되었습니다.');
	            	tr.remove();
	            }else{
	            	alert("학생 등록에 실패하였습니다.");
	            }
	        },
	        complete:function(data){            
	        },
	        error:function(xhr,status,error){
	 
	        }
		});
	});
    
    $(".no").on('click',function(){
    	
    	var tr=$(this).closest('tr');
    	var name=$(this).closest('tr').children('.username').text();
    	var id=$(this).closest('tr').children('input').val();

    	if(!confirm('['+name+']'+'님의 수강신청을 거절하시겠습니까?')) return;
    	    	    	
    	$.ajax({
	        type:"get",
	        url:"removeapplicant",
	        data:{'id':id},
	        dataType:"json",
	        success:function(result){
	            if(result) {
	            	alert('['+name+']'+'님의 수강신청을 거절했습니다.');
	            	tr.remove();
	            }else{
	            	alert("실패하였습니다.");
	            }
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
	<ul class="pager text-right" style="margin-top: 30px">
		<li><a href="studentView">학생</a></li>
		<li><a href="applicantView">수강 신청자</a></li>
	</ul>

	<table
		class="table table-striped table-bordered table-hover text-center">
		<thead>
			<tr>
				<th class="col-xs-1 text-center">번호</th>
				<th class="col-xs-3 text-center">강좌명</th>
				<th class="col-xs-2 text-center">신청일</th>
				<th class="col-xs-1 text-center">이름</th>
				<th class="col-xs-2 text-center">생년월일</th>
				<th class="col-xs-1 text-center">상태</th>
			</tr>
		</thead>

		<c:forEach items="${ApplicantList}" var="applicant" varStatus="status">
			<tr>
				<input type="hidden" value="${applicant.userid}"/>
				<td>${status.count}</td>
				<td>${applicant.educlass}</td>
				<td><fmt:formatDate value='${applicant.applicantDate}' pattern='yyyy-MM-dd' /></td>
				<td class="username">${applicant.username}</td>
				<td><fmt:formatDate value='${applicant.birthday}' pattern='yyyy-MM-dd' /></td>
<%-- 			<td class="userid">${applicant.userid}</td>
				<td>${applicant.phone}</td> --%>
				<td>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							data-toggle="dropdown">
							설정 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#" class="yes">수락</a></li>
							<li><a href="#" class="no">거절</a></li>
						</ul>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>