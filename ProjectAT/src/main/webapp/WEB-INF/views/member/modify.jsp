<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/resources/bootstrap/datepicker/js/bootstrap-datepicker.js"/>"></script>
<link href="<c:url value="/resources/bootstrap/datepicker/css/datepicker3.css"/>" rel="stylesheet">

<style type="text/css">
.form-join {
	max-width: 450px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}
</style>
<script type="text/javascript">

	$(function init() {
		$('input[name=userpw]').val('');
	});
</script>

<div class="container">
	<div class="row">

		<form:form id="joinform" commandName="memberVo" cssClass="form-join" action="modify">
			<fieldset>
				<div id="legend">
					<legend class="">회원 정보 수정</legend>
				</div>
				<div class="control-group">
					<label class="control-label" for="userid">아이디</label>
					<div class="controls">
						<form:input path="userid" cssClass="form-control input-lg typeahead tt-query" readOnly="true"/>
						<form:errors path="userid" cssClass="text-danger"/>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="password">비밀번호</label>
					<div class="controls">
						<form:input type="password" path="userpw" cssClass="form-control input-lg typeahead tt-query" placeholder="비밀번호를 입력하세요." />
						<form:errors path="userpw" cssClass="text-danger"/>
						<input type="password" class="form-control input-lg typeahead tt-query" placeholder="비밀번호를 재입력하세요."/>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="username">이름</label>
					<div class="controls">
						<form:input path="username" cssClass="form-control input-lg typeahead tt-query" readOnly="true"/>
					</div>
				</div>

 				<div class="control-group">
					<label class="control-label" for="birthday">생년월일</label>
					<div class="controls">
						<form:input path="birthday" id="wrtDtReg" cssClass="form-control input-sm" placeholder="클릭하세요" readOnly="true"/>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="phone">연락처</label>
					<div class="controls">
						<form:input path="phone" cssClass="form-control input-lg typeahead tt-query" placeholder="-를 제외한 숫자만 입력하세요."/>
						<form:errors path="phone" cssClass="text-danger"/>
					</div>
				</div>

				<div class="control-group">
					<!-- Button -->
					<div class="controls">
						<form:button class="btn btn-success" id="join" type="submit">완료</form:button>
					</div>
				</div>
			</fieldset>
		</form:form>
	</div>
</div>