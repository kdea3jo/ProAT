<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/resources/bootstrap/datepicker/js/bootstrap-datepicker.js"/>"></script>
<link href='<c:url value="/resources/bootstrap/datepicker/css/datepicker3.css"/>' rel="stylesheet">
<style type="text/css">
#wrap_subject{width:700px}
.wraper div{border:1px solid black}
input{width: 100%}
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
/* 		
		$('#create').on('click', function(){
			alert($('#time').val());
		}); */
		
	});
</script>

<form:form id="subjectform" commandName="subjectVo" action="create">
<div class="container" id="wrap_subject">
	<div class="control-group">
		<div class="col-md-6">
			<span>강좌명</span>
			<form:input path="classname"/>
			<form:errors path="classname" cssClass="text-danger"/>
		</div>
		<div class="col-md-6">
			<span>인원</span>
			<form:input path="total" type="number"/>
			<form:errors path="total" cssClass="text-danger"/>
		</div>
	</div>
	<div class="control-group">
		<div class="col-md-6">
			<span>시작일</span>
			<form:input path="startdate" cssClass="dateselect input-sm" placeholder="클릭하세요" readOnly="true"/>
			<form:errors path="startdate" cssClass="text-danger"/>
		</div>
		<div class="col-md-6">
			<span>종료일</span>
			<form:input path="enddate" cssClass="dateselect input-sm" placeholder="클릭하세요" readOnly="true"/>
			<form:errors path="enddate" cssClass="text-danger"/>
		</div>
	</div>
	<div class="control-group">
		<div class="col-md-6">
			<span>시작 시간</span>
			<form:input path="starttime" type="time" placeholder="클릭하세요"/>
			<form:errors path="starttime" cssClass="text-danger"/>
		</div>
		<div class="col-md-6">
			<span>종료 시간</span>
			<form:input path="endtime" type="time" placeholder="클릭하세요"/>
			<form:errors path="endtime" cssClass="text-danger"/>
		</div>
	</div>
	<div class="control-group">
		<div class="col-md-12">
			<form:textarea path="content"/>
			<form:errors path="content" cssClass="text-danger"/>
		</div>
	</div>
	<div class="control-group">
		<div class="col-md-12"><button type="submit" id="create">개설</button></div>
	</div>
</div>
</form:form>

<%-- <div class="container" id="wrap_subject">
	<div class="control-group">
		<div class="col-md-6"><span>강좌명</span><input type="text" name="classname"></div>
		<div class="col-md-6"><span>인원</span><input type="number" name="total"></div>
	</div>
	<div class="control-group">
		<div class="col-md-6"><span>시작일</span><input type="text" class="dateselect input-sm" name="22" placeholder="클릭하세요" readOnly="true" /></div>
		<div class="col-md-6"><span>종료일</span><input type="text" class="dateselect input-sm" name="22" placeholder="클릭하세요" readOnly="true" /></div>
	</div>
	<div class="control-group">
		<div class="col-md-3">시작 시간</div><div class="col-md-3"><input type="time" name='starttime'/></div>
		<div class="col-md-3">종료 시간</div><div class="col-md-3"><input type="time" name='endtime'/></div>
	</div>
	<div class="control-group">
		<div class="col-md-12"><textarea></textarea></div>
	</div>
	<div class="control-group">
		<div class="col-md-12"><button type="submit" id="create">개설</button></div>
	</div>
</div>

</form> --%>