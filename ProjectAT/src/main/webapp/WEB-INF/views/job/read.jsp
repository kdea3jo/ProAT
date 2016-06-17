<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.writeFormArea table {width: 100%}
.writeFormArea th { border: gray solid 1px;padding: 10px; text-align: center; background-color: #eee;}
.writeFormArea td { border: gray solid 1px;padding: 3px; text-align: center;}
#subject_title{border-top: none; padding-bottom: 50px}
#subject_content{padding: 50px 20px 100px 20px; text-align: justify;}
.writeFormArea th, .writeFormArea td {border-right: none;border-left: none;} 
</style>

<script type="text/javascript">

function deleteSubject() {
	bootbox.confirm({ 
		 message: "정말로 채용 정보를 삭제하시겠습니까?", 
		 callback: function(result){
			 if(!result) return;
			 location.href="delete?num="+"${subjectVo.num}";
		 }
	});	
}

</script>

<div class="writeFormArea">
	<table>
		<tr><td colspan="4" id="subject_title"><h1><img src="<c:url value="/resources/images/icon/book.png"/>">&nbsp${jobinfoVo.title}</h1></td></tr>
		<tr>
			<th>회사명</th>
			<td>${jobinfoVo.company}</td>
			<th>채용 기간</th>
			<td>${jobinfoVo.period}</td>
		</tr>
		<tr>
			<th>채용 인원</th>
			<td>${jobinfoVo.hirecount}명</td>
			<th>작성일</th>
			<td><fmt:formatDate value='${jobinfoVo.wdate}' pattern='yyyy-MM-dd'/></td>
		</tr>
		<tr><td colspan="4" id="subject_content">
				${jobinfoVo.contents}
			</td>
		</tr>
	</table>
	<p class="text-right" style="margin-top: 20px">
		<button type="button" class="btn btn-btn-secondary" onclick="location.href='list'">목록</button>
		<sec:authorize access="hasAuthority('admin')">
			<button type="button" class="btn btn-btn-secondary" onclick="location.href='modifyform?num='+${subjectVo.num}">수정</button>
			<button type="button" class="btn btn-btn-secondary" onclick="deleteSubject()">삭제</button>
		</sec:authorize>
	</p>
</div>