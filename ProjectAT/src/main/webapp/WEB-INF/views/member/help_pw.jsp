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
	$('#result_box').text('');
	$('#send').attr('disabled',true);
	$('.progress').show();
	
	$.ajax({
		type : "post",
		url : "searchpw",
		data : {'id':$('input[name=userid]').val()},
		dataType : "json",
		success : function(obj) {
			if(!obj){
				$('.progress').hide();
				$('#result_box').text('입력 정보가 잘못되었습니다.').attr('class','text-danger');
			}else{
				$('.progress').hide();
				$('#result_box').text('지금 바로 E-Mail을 확인하세요.').attr('class','text-primary');
			}
			$('#send').attr('disabled',false);
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
		<div class="form-signin-heading"><img src="<c:url value="/resources/images/icon/reset.png"/>">&nbsp<h4>비밀번호 재설정</h4></div>
		<div class="form_body">
			<input type="text" class="input-block-level" name="userid" placeholder="아이디를 입력하세요."/>
				<p id="result_box">
					<div class="progress" style="display: none; width: 100%">
						<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="Loading" style="width: 100%">
						LOADING</div>
					</div>
				</p>
			<button class="btn btn-block btn-primary" id="send" type="button" onclick="formcheck()">확인</button>
		</div>
	</form>
</div>


