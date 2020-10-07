<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>SIGN UP</title>
</head>
<body>
<h1 align="center">회원가입</h1>
	<div align="center">
		<form id="signupForm">
			<label for="userId">아이디</label>
			<input type="text" id="userId" placeholder="ID" onkeydown="duplicationCheck()" style="margin: 0.5%; padding:0.5%;">
			<input type="hidden" id="idDuplication" value="false">
			<input type="button" value="ID중복확인" onclick="idCheck()"><br>
			<label for="password">비밀번호</label>
			<input type="text" id="password"  placeholder="Password" style="margin: 0.5%; padding:0.5%;"><br>
			<label for="passwordCheck">비밀번호 확인</label>
			<input type="password" id="passwordCheck"  placeholder="Password Check" style="margin: 0.5%; padding:0.5%;"><br>
			<input type="button" value="가입완료" onclick="insertData()" style="padding:0.5%;">
			<input type="button" value="취소" onclick="location.href='/'" style="padding:0.5%;">
		</form>
	</div>
</body>
<script type="text/javascript">
function duplicationCheck(){
	$("#idDuplication").val("false");
}

function idCheck(){
	var userId = $("#userId").val();
	$.ajax({
		url : "/idCheck",
		type : 'POST',
		data : { userId : userId
		},
		success:function(data){
			if(data){
				$("#idDuplication").val("true");
				alert("사용가능한 아이디입니다.");
			}else{
				$("#idDuplication").val("false");
				alert("중복된 아이디가 있습니다.");
			}
		}
	})
}

function insertData(){
	var userId = $("#userId").val();
	var password = $("#password").val();
	var check = $("#passwordCheck").val();
	if(password == check && $("#idDuplication").val() == "true"){
		insert(userId,password);
	}else if($("#idDuplication").val() == "false"){
		alert("ID중복확인을 해야합니다.");
	}else{
		alert("비밀번호와 비밀번호 확인이 다릅니다.");
	}
}

function insert(userId,password){
	$.ajax({
		url : "/insertData",
		type : 'POST',
		data : { userId : userId, 
			password : password	
		},
		success:function(data){
			location.href="/";
		}
	})
}
</script>
</html>