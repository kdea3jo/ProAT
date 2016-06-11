<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 취소 */
		$("#backtoread").on("click",function(){
			location.href="read?num=${requestScope.content.num}";
		});
		$("#update").on("click", function(){
			var data=$("#inputForm").serialize();
			var url = "../${requestScope.boardname}/update";
            $.ajax({
                type:"post",
                url:url,
                data: data,
                dataType:"json",
                success:function(obj){
                	if(obj){
                    	location.href="read?num=${requestScope.content.num}";
                	} else if(!obj){
                		alert("수정 실패, 다시 해주세요.")
                	}
                },
                error:function(xhr,status,error){
                    console.log('실패: '+error);
                },
                complete:function(data){
                    
                }
            });
		});
	});
</script>
<div class="writeFormArea">
	<h1>수정</h1>
	<form id="inputForm">
			<label for="userid" >작성자</label>
			<span id="userid">${requestScope.content.userid}</span>
			<label for="wDate" >작성일</label>
			<span id="wDate">${requestScope.content.wDate}</span>
			<label for="num" >글번호</label>
			<span id="num">${requestScope.content.num}</span>
		<div class="form-group">
			<input name="num" class="sr-only" type="text" value="${requestScope.content.num}">
			<label for="title">제목</label> 
			<input class="form-control" name="title" id="title" type="text" value="${requestScope.content.title}"></input>
		</div>
		<div class="form-group">
			<label for="content">내용</label> 
			<textarea id="content" name="content" class="form-control" rows="25">${requestScope.content.content}</textarea>
		</div>
		<div id="btnArea">
			<button id="update" type="button" class="btn btn-success">수정</button>
			<button id="backtoread" type="button" class="btn btn-success">취소</button>
		</div>

	</form>
</div>