<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.form-signin {
	max-width: 350px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	text-align: center;
}

.form_body {
	padding: 10px 40px 29px;
}

.form-signin-heading{
	padding-bottom: 20px; padding-top: 30px
}

input{
	width: 100%;
}

.form-signin input[type="text"], .form-signin input[type="password"] {
	font-size: 12px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>

<script type="text/javascript">
	
	function formcheck() {		
		$.ajax({
			type : "post",
			url : "checkpw",
			data : {'pw':$('input[name=pw]').val()},
			dataType : "json",
			success : function(result) {
				if(!result){
					$('#result_box').text('비밀번호를 다시 입력하세요.');
				}else{
					location.href="mypage";
				}
			},
			complete : function(data) {
			},
			error : function(xhr, status, error) {
			}
		});
	}
	
</script>

<div class="container">
	<form class="form-signin">
		<h4 class="form-signin-heading"><img src="<c:url value="/resources/images/icon/warning.png"/>">&nbsp인증이 필요한 서비스입니다.</h4>
		<div class="form_body">
			<input type="password" class="input-block-level" name="pw" placeholder="비밀번호를 입력하세요.">
			<p id="result_box" class="text-warning"></p>
			<button class="btn btn-block btn-primary" type="button" onclick="formcheck()">확인</button>
		</div>
	</form>
</div>
