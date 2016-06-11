<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
$(function() {
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
<div class="writeFormArea">
	<h1>글읽기</h1>
	<label for="userid" >작성자</label>
	<span id="userid">${requestScope.content.userid}</span>
	<label for="wDate" >작성일</label>
	<span id="wDate">${requestScope.content.wDate}</span>
	<label for="num" >글번호</label>
	<span id="num">${requestScope.content.num}</span>
	<label for="hit" >조회수</label>
	<span id="hit">${requestScope.content.hit}</span>
	<div class="form-group">
		<label for="title">제목</label> ${requestScope.content.title}
	</div>
	<div class="form-group">
		<label for="content">내용</label> ${requestScope.content.content}
	</div>
	<div class="btnArea">
		<button id="update" type="button" class="btn btn-success">수정</button>
		<button id="delete" type="button" class="btn btn-success">삭제</button>
		<button id="backtolist" type="button" class="btn btn-success">목록</button>
	</div>

	<h3>댓글</h3>
	<div class="commentArea">
		<ul>
			<c:forEach var="items" items="${requestScope.commentList}" varStatus="status">
				<li>
					<div>${items.userid} &nbsp; ${items.wdate}</div>
					<div>${items.content}</div>
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
			<span id="commentUserid"><input name="userid" type="text" class="sr-only" value="<sec:authentication property="principal"/>"></input><sec:authentication property="principal"/></span><br>
			<label for="commentContent" class="sr-only">내용</label>
			<textarea id="commentContent" name="content" class="form-control" rows="3"></textarea>
			<input name="boardnum" value="${requestScope.content.num}" class="sr-only">
		<div class="btnArea form-group">
			<button id="ok" type="submit" class="btn btn-success">댓글등록</button>
		</div>
	</form>
</div>
</div>