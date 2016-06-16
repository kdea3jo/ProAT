<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/resources/bootstrap/datepicker/js/bootstrap-datepicker.js"/>"></script>
<link href='<c:url value="/resources/bootstrap/datepicker/css/datepicker3.css"/>' rel="stylesheet">
<style type="text/css">

.writeFormArea table {width: 100%}
.writeFormArea th { padding: 10px; text-align: center; background-color: #eee;}
.writeFormArea td { padding: 3px; text-align: center;}

#subject_title td{border-top: none; padding-bottom: 10px}
#subject_content td{padding: 20px; height: 300px}
.writeFormArea th, .writeFormArea td {border-right: none;border-left: none;} 
.errArea td{border:none}
#contentArea{height:100%}
</style>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		$('.dateselect').datepicker({
			format : "yyyy-mm-dd",
			startView : 1,
			orientation : "top auto",
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true,
			todayHighlight : true
		});
		$('#datepicker .input-date').datepicker('setDate', 'today');
	});
</script>

<form:form commandName="subjectVo" action="create" method="post">
<div class="writeFormArea">
	<table>
		<tr id="subject_title">
			<td colspan="3">
				<form:input path="classname" cssClass="form-control input-lg typeahead tt-query" placeholder="강좌명을 입력하세요."/>
			</td>
			<td>
				<form:input path="total" type="number" cssClass="form-control input-lg typeahead tt-query" placeholder="수강 인원을 설정하세요." value=""/>
			</td>
		</tr>
		<tr class="errArea">
			<td colspan="3">
				<form:errors path="classname" cssClass="text-danger"/>
			</td>
			<td>
				<form:errors path="total" cssClass="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>시작일</th>
			<td>
				<form:input path="startdate" cssClass="dateselect form-control input-sm" placeholder="클릭하세요" readOnly="true"/>
			</td>
			<th>종료일</th>
			<td>
				<form:input path="enddate" cssClass="dateselect form-control input-sm" placeholder="클릭하세요" readOnly="true"/>
			</td>
		</tr>
		<tr class="errArea">
			<td></td>
			<td>
				<form:errors path="startdate" cssClass="text-danger"/>
			</td>
			<td></td>
			<td>
				<form:errors path="enddate" cssClass="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>강의 시작 시간</th>
			<td>
				<form:input path="starttime" type="time" cssClass="form-control input-sm" placeholder="클릭하세요"/>
				<form:errors path="starttime" cssClass="text-danger"/>
			</td>
			<th>강의 종료 시간</th>
			<td>
				<form:input path="endtime" type="time" cssClass="form-control input-sm" placeholder="클릭하세요"/>
				<form:errors path="endtime" cssClass="text-danger"/>
			</td>
		</tr>
		<tr class="errArea">
			<td></td>
			<td>
				<form:errors path="starttime" cssClass="text-danger"/>
			</td>
			<td></td>
			<td>
				<form:errors path="endtime" cssClass="text-danger"/>
			</td>
		</tr>
		<tr id="subject_content">
			<td colspan="4">
				<form:textarea id="contentArea" path="contents" cssClass="form-control"/>
				<form:errors path="contents" cssClass="text-danger"/>
			</td>
		</tr>
	</table>
	<p class="text-right" style="margin-top: 20px">
		<button type="submit" class="btn btn-btn-secondary">개설</button>
		<button type="button" class="btn btn-btn-secondary" onclick="location.href='list?state=1'">목록</button>
	</p>
</div>
</form:form>