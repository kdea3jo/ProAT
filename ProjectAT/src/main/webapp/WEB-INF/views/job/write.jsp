<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
	function formcheck() {
		var period=$('#pre_period').val()+' ~ '+$('#post_period').val();
		$('#period').val(period);
		$('form').submit();
	}
</script>
    
<form:form commandName="jobInfoVo" action="write" method="post">
<div class="writeFormArea">
	<table>
		<tr id="subject_title">
			<td colspan="3">
				<form:input path="title" cssClass="form-control input-xs typeahead tt-query" placeholder="제목을 입력하세요."/>
			</td>
			<td>
				<form:input path="company" cssClass="form-control input-xs typeahead tt-query" placeholder="회사명을 입력하세요."/>
			</td>
		</tr>
		<tr class="errArea">
			<td colspan="3">
				<form:errors path="title" cssClass="text-danger"/>
			</td>
			<td>
				<form:errors path="company" cssClass="text-danger"/>
			</td>
		</tr>
		<tr>
			<th>채용 인원</th>
			<td>
				<form:input path="hirecount" type="number" cssClass="form-control input-xs typeahead tt-query" placeholder="채용 인원을 설정하세요." value=""/>
			</td>
			<th>채용 기간</th>
			<td>
				<span><input type="text" id="pre_period" class="dateselect input-xl" placeholder="시작일" readOnly="true"/></span>&nbsp~&nbsp
				<span><input type="text" id="post_period" class="dateselect input-xl" placeholder="종료일" readOnly="true"/></span>
			</td>
		</tr>
		<tr class="errArea">
			<td></td>
			<td>
				<form:errors path="company" cssClass="text-danger"/>
			</td>
			<td></td>
			<td>
				<form:errors path="period" cssClass="text-danger"/>
			</td>
		</tr>
		<tr id="subject_content">
			<td colspan="4">
				<form:textarea id="contentArea" path="contents" cssClass="form-control"/>
				<form:errors path="contents" cssClass="text-danger"/>
			</td>
		</tr>
	</table>
	<form:input path="period" id="period" type="hidden"/>
	<button type="button" onclick="formcheck()">개설</button>
	<button type="button" onclick="location.href='list?state=1'">목록</button>
</div>
</form:form>