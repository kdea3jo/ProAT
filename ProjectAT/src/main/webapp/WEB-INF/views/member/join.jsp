<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	
	$(document).ready(function() {
		$('#wrtDtReg').datepicker({
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

<div class="container">
	<div class="row">

		<form:form id="joinform" commandName="memberVo" cssClass="form-join" action="join">
			<fieldset>
				<div id="legend">
					<legend class="">AT출결 관리 시스템과 함께 합니다.</legend>
				</div>
				<div class="control-group">
					<label class="control-label" for="userid">아이디</label>
					<div class="controls">
						<form:input path="userid" cssClass="form-control input-lg typeahead tt-query" placeholder="유효한 이메일을 입력하세요."/>
						<form:errors path="userid" cssClass="text-danger"/>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="password">비밀번호</label>
					<div class="controls">
						<form:input type="password" path="userpw" cssClass="form-control input-lg typeahead tt-query" placeholder="비밀번호를 입력하세요."/>
						<form:errors path="userpw" cssClass="text-danger"/>
						<input type="password" class="form-control input-lg typeahead tt-query" placeholder="비밀번호를 재입력하세요."/>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="username">이름</label>
					<div class="controls">
						<form:input path="username" cssClass="form-control input-lg typeahead tt-query" placeholder="실명을 입력하세요." />
						<form:errors path="username" cssClass="text-danger"/>
					</div>
				</div>

 				<div class="control-group">
					<label class="control-label" for="birthday">생년월일</label>
					<div class="controls">
						<form:input path="birthday" id="wrtDtReg" cssClass="form-control input-sm" placeholder="클릭하세요" readonly="readonly"/>
						<form:errors path="birthday" cssClass="text-danger"/>
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
						<form:button class="btn btn-success" id="join" type="submit">가입하기</form:button>
					</div>
				</div>
			</fieldset>
		</form:form>
		
<%-- 		<form id="joinform" class="form-join">
			<fieldset>
				<div id="legend">
					<legend class="">AT출결 관리 시스템과 함께 합니다.</legend>
				</div>
				<div class="control-group">
					<label class="control-label" for="userid">아이디</label>
					<div class="controls">
						<input type="text" name="userid" placeholder="이메일을 입력하세요."
							class="form-control input-lg typeahead tt-query"
							autocomplete="off" spellcheck="false">
						<p class="help-block">이메일은 아이디로 사용됩니다.</p>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="password">비밀번호</label>
					<div class="controls">
						<input type="password" name="userpw" placeholder="비밀번호를 입력하세요."
							class="form-control input-lg">
						<p class="help-block">8자리 이상의 대소문자와 특수문자를 포함한 문자</p>
						<input type="password" placeholder="비밀번호를 재입력하세요."
							class="form-control input-lg">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="username">이름</label>
					<div class="controls">
						<input type="text" name="username" placeholder="실명을 입력하세요."
							class="form-control input-lg typeahead tt-query"
							autocomplete="off" spellcheck="false">
					</div>
				</div>

 				<div class="control-group">
					<label class="control-label" for="birthday">생년월일</label>
					<div class="controls">
						<input class="form-control input-sm" type="date" name="birthday"
							id="wrtDtReg" placeholder="클릭하세요." readonly="readonly">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="phone">연락처</label>
					<div class="controls">
						<input type="text" name="phone" placeholder="연락처를 입력하세요."
							class="form-control input-lg typeahead tt-query"
							autocomplete="off" spellcheck="false">
						<p class="help-block">'-'를 제외한 숫자만 입력하세요.</p>
					</div>
				</div>

				<div class="control-group">
					<!-- Button -->
					<div class="controls">
						<button class="btn btn-success" type="button" id="join"
							onclick="formcheck()">가입하기</button>
					</div>
				</div>
			</fieldset>
		</form> --%>
	</div>
</div>