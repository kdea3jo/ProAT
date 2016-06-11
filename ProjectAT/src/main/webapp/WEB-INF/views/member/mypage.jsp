<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.form-signin {
	max-width: 350px;
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
	text-align: center;
}

.form-signin .form-signin-heading{
	margin-bottom: 10px;
	text-align: center;
}

input{
	width: 300px;
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
			url : "modifyform",
			data : {'pw':$('input[name=pw]').val()},
			dataType : "json",
			success : function(result) {
				if(!result){
					bootbox.alert("Hello world!", function() {
						  Example.show("Hello world callback");
						});
					$('input[name=pw]').val('');
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
		<h3 class="form-signin-heading">비밀번호를 입력하세요.</h3>
		<input type="password" class="input-block-level" name="pw" placeholder="">
		<button class="btn btn-block btn-success" type="button" onclick="formcheck()">확인</button>
	</form>
</div>
