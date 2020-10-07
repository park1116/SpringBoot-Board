<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>UPDATE</title>
</head>
<body>
	<%String id = (String)session.getAttribute("loginId");%>
	<h2 align="right"><a style="cursor: pointer;" onclick="logout()"><%=id %></a></h2>
	<h1 align="center">글 수정</h1>
	<div align="center">
		<form action="/update" method="post">
			<table>
				<tr>
					<td style="width: 10%;" align="center">제목</td>
					<td>
			 			<input type="text" id="title" style="width: 98%; margin: 1%;" value="${dto.title}" />
			 		</td>
				</tr>
				<tr>
					<td style="width: 10%;" align="center">내용</td>
					<td colspan="7" align="center">
						<textarea rows="13" id="content" style="margin: 0.5%; padding:0.5%; width:100%; resize: none;">${dto.content}</textarea>
					</td>
				</tr>
			</table>
			<input type="button" value="수정완료" onclick="update()" style="padding:0.5%;">
			<input type="button" value="취소" onclick="location.href='/read?num='+${dto.num}" style="padding:0.5%;">
		</form>
	</div>
</body>
<script type="text/javascript">
function update(){
	var title = $("#title").val();
	var content = $("#content").val();
	var num = ${dto.num};
	$.ajax({
		url : "/board/update",
		type : 'POST',
		data : { title : title, 
			content : content,
			num : num
		},
		success:function(data){
			location.href="/read?num="+${dto.num};
		}
	})
}

function logout() {
	var flag = confirm("로그아웃하시겠습니까?");
	if(flag){
		location.href="/";
	}
}
</script>
</html>