<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	if(!confirm("정말로 강좌를 삭제하시겠습니까?")) return;
	location.href="delete?num="+"${subjectVo.num}";
}
</script>

<div class="writeFormArea">
	<table>
		<tr><td colspan="4" id="subject_title"><h1>${subjectVo.classname}</h1></td></tr>
		<tr>
			<th>기간</th>
			<td>
				<fmt:formatDate value='${subjectVo.startdate}' pattern='yyyy-MM-dd'/> ~
				<fmt:formatDate value='${subjectVo.enddate}' pattern='yyyy-MM-dd'/>
			</td>
			<th>운영 시간</th>
			<td>${subjectVo.starttime}~${subjectVo.endtime}</td>
		</tr>
		<tr>
			<th>총 인원</th>
			<td>${subjectVo.total}</td>
			<th>수강 신청 인원</th>
			<td>${count}</td>
		</tr>
		<tr><td colspan="4" id="subject_content">
				${subjectVo.contents}
			</td>
		</tr>
	</table>
	<p class="text-right" style="margin-top: 20px">
		<button type="button" class="btn btn-btn-secondary" onclick="location.href='list?state=1'">목록</button>
		<sec:authorize access="hasAuthority('admin')">
			<button type="button" class="btn btn-btn-secondary" onclick="location.href='modifyform?num='+${subjectVo.num}">수정</button>
			<button type="button" class="btn btn-btn-secondary" onclick="deleteSubject()">삭제</button>
		</sec:authorize>
	</p>
</div>