<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
<h1 align="center">로그인</h1>
<div align="center">
	<form id="signupForm">
		<input type="text" id="userId" placeholder="ID" autofocus onkeyup="enterKeyCheck()" style="margin: 0.5%; padding:0.5%;"><br>
		<input type="password" id="password"  placeholder="Password" onkeyup="enterKeyCheck()" style="margin: 0.5%; padding:0.5%;"><br>
		<input type="button" value="회원가입" onclick="location.href='/signUp'">
		<input type="button" value="로그인" onclick="loginValidation()">
	</form>
</div>
</body>
<script type="text/javascript">
function loginValidation(){
	var userId = $("#userId").val();
	var password = $("#password").val();
	if(!userId){
		alert("아이디를 입력하세요.");
		$("#userId").focus();
		return false;
	}else if(!password){
		alert("비밀번호를 입력하세요.");
		$("#password").focus();
		return false;
	}else {
		login(userId,password);
	}
}

function login(userId,password){
	$.ajax({
		url : "/login",
		type : 'POST',
		data : { userId : userId, 
				password : password	
		},
		success:function(data){
			if(data == 2){
				alert("아이디 혹은 비밀번호가 맞지 않습니다.");
				return false;
			}else if(data == 3){
				location.href="/view/dashboard";
			}
		}
	})
}

function enterKeyCheck(){
	if(event.keyCode == 13)
	{	
		loginValidation();
	}
}
</script>
</html>