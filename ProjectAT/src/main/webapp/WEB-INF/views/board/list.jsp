<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/* 글쓰기 버튼 */
			$("#writeBtn").on("click",function(){
				location.href = "write";			
			});
			/* 검색 버튼 */
			$("#searchBtn").on("click",function(){
				var type = $("#searchForm div select").val();
				var keyword = $("#searchForm div input").val();
				if(keyword==null||keyword==""){
					alert("검색어를 입력하세요.")
					$("#searchForm div input").focus();
				}else{
					location.href="list?type="+type+"&keyword="+keyword;
				}
			});
		});
	</script>
	<style>
		th {background-color: #337AB7; color:white;}
	</style>
<div class="tableArea">
	<h1>
	<c:choose>
		<c:when test="${requestScope.boardname=='notice'}">공지사항</c:when>
		<c:when test="${requestScope.boardname=='qna'}">Q&A</c:when>
		<c:when test="${requestScope.boardname=='jobinfo'}">취업정보</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	</h1>

	<div class="currPageTotalPage">${requestScope.pageNation.currPage}/
		${requestScope.pageNation.totalPages}</div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th class="num col-xs-1 text-center">NO</th>
				<th class="title col-xs-6 text-center">제목</th>
				<th class="userid col-xs-2 text-center">작성자</th>
				<th class="wDate col-xs-3 text-center">날짜</th>
			</tr>
		</thead>
		<c:forEach var="items" items="${requestScope.boardList}"
			varStatus="status">
			<tr>
				<td class="num col-xs-1 text-center">${items.num}</td>
				<td class="title col-xs-6"><a
					href="../${requestScope.boardname}/read?num=${items.num}">${items.title}</a></td>
				<td class="userid col-xs-2 text-center">${items.username}</td>
				<td class="wDate col-xs-3 text-center">${items.wDate}</td>
			</tr>
		</c:forEach>

	</table>
	<div class="btnArea">
	<c:choose>
		<c:when test="${requestScope.boardname=='notice'}">
			<sec:authorize access="hasAuthority('admin')">
				<button id="writeBtn" class="next btn btn-primary" type="button">글쓰기</button>
			</sec:authorize>
		</c:when>
	</c:choose>
	</div>

	<!-- pagination -->
	<div class="navArea">
		<nav>
			<ul class="pagination" style="margin-top: 0px">
				<!-- 이전 -->
				<c:choose>
					<c:when test="${requestScope.pageNation.leftMore==true}">
						<li class="page-item"><a class="page-link" 
						href="../${requestScope.boardname}/list?pg=${requestScope.pageNation.linkBegin-1}
							<c:if test="${requestScope.search.keyword!=null}">&type=${requestScope.search.type}&keyword=${requestScope.search.keyword}</c:if>
							" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
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
				<c:forEach var="i" begin="${requestScope.pageNation.linkBegin}"
					end="${requestScope.pageNation.linkEnd}">
					<c:choose>
						<c:when test="${requestScope.pageNation.currPage==i}">
							<li class="page-item active">
							<a class="page-link" href="../${requestScope.boardname}/list?pg=${i}
							<c:if test="${requestScope.search.keyword!=null}">&type=${requestScope.search.type}&keyword=${requestScope.search.keyword}</c:if>
							">${i}<span class="sr-only">(current)</span></a></li>
						</c:when>

						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="../${requestScope.boardname}/list?pg=${i}
								<c:if test="${requestScope.search.keyword!=null}">&type=${requestScope.search.type}&keyword=${requestScope.search.keyword}</c:if>
								">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 -->
				<c:choose>
					<c:when test="${requestScope.pageNation.rightMore==true}">
						<li class="page-item"><a class="page-link"
							href="../${requestScope.boardname}/list?pg=${requestScope.pageNation.linkEnd+1}
							<c:if test="${requestScope.search.keyword!=null}">&type=${requestScope.search.type}&keyword=${requestScope.search.keyword}</c:if>
							" aria-label="Next"> <span aria-hidden="true">&raquo;</span> 
							<span class="sr-only">Next</span>
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
	<form id="searchForm" class="form-inline text-center">
		<div class="form-group">
			<select name="type" class="form-control">
				<option value="title">제목</option>
				<option value="contents">내용</option>
				<option value="num">글번호</option>
				<option value="userid">글쓴이</option>
			</select>
		</div>
		<div class="form-group">
			<label class="control-label sr-only" for="search">검색</label> 
			<input name="keyword" id="search" type="text" class="form-control col-xs-3"
				placeholder="검색어를 입력하세요">
		</div>
		<button id="searchBtn" class="next btn btn-primary" type="button">검색</button>
	</form>
</div>