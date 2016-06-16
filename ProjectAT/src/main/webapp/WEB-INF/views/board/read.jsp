<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".commentList:odd").css("background-color","#eee");
	/* 목록 버튼 */
	$("#backtolist").on("click", function() {
		location.href = "list";
	});
	/* 수정 버튼 */
	$("#update").on("click", function() {
		location.href = "modify?num=${requestScope.content.num}";
	});
	/* 삭제 버튼 */
	$("#delete").on("click", function() {
		if (confirm("삭제하시겠습니까?")) {
			var data = ${requestScope.content.num};
			var url = "../${requestScope.boardname}/delete";
			$.ajax({
				type : "post",
				url : url,
				data : {"num":data},
				dataType : "json",
				success : function(obj) {
					if (obj) {
						alert("삭제되었습니다.");
						location.href = "list";
					}else if(!obj){
						alert("다시시도");
					}
				}
			});
		}
	});
});
</script>
<style>
	.writeFormArea table {width: 100%}
	.writeFormArea th { border: gray solid 1px;padding: 3px;text-align: center;background-color: #eee;}
	.writeFormArea td { border: gray solid 1px;padding: 3px;text-align: center;}
	.writeFormArea th, .writeFormArea td { border-right: none;border-left: none;} 
	
	#realtitle { font-size: 30px; font-weight: bold;padding: 30px; border-bottom: none;}
	#realcontent { font-size: 15px; padding:30px 10px 50px 10px;border-bottom: none;border-top: none;}
	
	.commentList {padding: 10px; list-style: none;}
	
</style>
<div class="writeFormArea">
	<h1 class="sr-only">글읽기</h1>
	<table>
		<tr>
			<th><label for="num" >글번호</label></th><td><span id="num">${requestScope.content.num}</span></td>
			<th><label for="userid" >작성자</label></th><td><span id="userid">${requestScope.content.username}</span></td>
			<th><label for="wDate" >작성일</label></th><td><span id="wDate"></span>${requestScope.content.wDate}</td>
			<th><label for="hit" >조회수</label></th><td><span id="hit">${requestScope.content.hit}</span></td>
		</tr>
		<tr>
			<td id="realtitle" colspan="8" style="text-align: left"><label for="title" class="sr-only">제목</label>${requestScope.content.title}</td>
		</tr>
		<tr>
			<td id="realcontent" colspan="8" style="text-align: left"><label for="contents" class="sr-only">내용</label>${requestScope.content.contents}</td>
		</tr>
	</table>
	
	<div class="btnArea" style="border-bottom: gray solid 1px;padding-bottom: 10px;">
		<c:if test="${requestScope.isWriter=='yes'}">
			<button id="update" type="button" class="btn btn-success">수정</button>
			<button id="delete" type="button" class="btn btn-success">삭제</button>
		</c:if>
		<button id="backtolist" type="button" class="btn btn-success">목록</button>
	</div>
	<h3>댓글</h3>
	<div class="commentArea">
		<ul>
			<c:forEach var="items" items="${requestScope.commentList}" varStatus="status">
				<li class="commentList">
					<div>${items.userid} &nbsp; <fmt:formatDate value='${items.wdate}' pattern='yyyy-MM-dd h:mm'/></div>
					<div>${items.contents}</div>
				</li>
			</c:forEach>
	
		</ul>
		<!-- pagination -->
		<div class="navArea">
			<nav>
				<ul class="pagination" style="margin-top: 0px">
					<!-- 이전 -->
					<c:choose>
						<c:when test="${requestScope.commentPage.leftMore==true}">
							<li class="page-item"><a class="page-link"
								href="../${requestScope.boardname}/read?num=${requestScope.content.num}&pg=${requestScope.commentPage.linkBegin-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><span class="page-link"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</span></li>
						</c:otherwise>
					</c:choose>
	
					<!-- 페이지 -->
					<c:forEach var="i" begin="${requestScope.commentPage.linkBegin}"
						end="${requestScope.commentPage.linkEnd}">
						<c:choose>
							<c:when test="${requestScope.commentPage.currPage==i}">
								<li class="page-item active">
								<a class="page-link" href="../${requestScope.boardname}/read?num=${requestScope.content.num}&pg=${i}">${i}<span
										class="sr-only">(current)</span></a></li>
							</c:when>
	
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="../${requestScope.boardname}/read?num=${requestScope.content.num}&pg=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 -->
					<c:choose>
						<c:when test="${requestScope.commentPage.rightMore==true}">
							<li class="page-item"><a class="page-link"
								href="../${requestScope.boardname}/read?num=${requestScope.content.num}&pg=${requestScope.commentPage.linkEnd+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><span class="page-link"
								href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
							</span></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	<form id="commentForm" action="comment" method="post">
			<label for="commentUserid" >작성자</label>
			<span id="commentUserid"><input name="userid" type="text" class="sr-only" value='<sec:authentication property="principal"/>'></input>${sessionScope.name}</span><br>
			<label for="commentContent" class="sr-only">내용</label>
			<textarea id="commentContent" name="contents" class="form-control" rows="3"></textarea>
			<input name="boardnum" value="${requestScope.content.num}" class="sr-only">
		<div class="btnArea form-group">
			<button id="ok" type="submit" class="btn btn-success">댓글등록</button>
		</div>
	</form>
</div>
</div>