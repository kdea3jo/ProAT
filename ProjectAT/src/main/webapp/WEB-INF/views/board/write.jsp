<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 목록 버튼 */
		$("#cancel").on("click", function() {
			location.href = "list";
		});
		/* 등록 버튼 */
		$("#ok").on("click", function() {
			if($("input[name=title]").val()==null||$("input[name=title]").val()==""){
				alert("제목을 입력하세요.");
				$("input[name=title]").focus();
			}else if($("textarea[name=contents]").val()==null||$("textarea[name=contents]").val()==""){
				alert("내용을 입력하세요.");
				$("textarea[name=contents]").focus();
			}else{
				var data=$("#inputForm").serialize();
				var url = "../${requestScope.boardname}/insert";
	            $.ajax({
	                type:"post",
	                url:url,
	                data: data,
	                dataType:"json",
	                success:function(obj){
	                    location.href="read?num="+obj;
	                },
	                error:function(xhr,status,error){
	                    console.log('실패: '+error);
	                },
	                complete:function(data){
	                    
	                }
	            });
			}
		});
		
	});
</script>
<div class="writeFormArea">
	<h1>글쓰기</h1>
	<form id="inputForm">
		<div class="form-group">
			<label for="title">제목</label> 
			<input name="title" type="text" class="form-control" id="title" placeholder="제목을 입력하세요."></input>
			<input name="ref" type="text" class="sr-only" value="0"></input>
			<input name="userid" type="text" class="sr-only" value='<sec:authentication property="principal"/>'></input>
		</div>
		<div class="form-group">
			<label for="contents">내용</label>
			<textarea name="contents" class="form-control" rows="25" placeholder="내용을 입력하세요."></textarea>
		</div>
		<div id="btnArea">
			<button id="ok" type="button" class="btn btn-success">등록</button>
			<button id="cancel" type="button" class="btn btn-success">취소</button>
		</div>
	</form>
</div>