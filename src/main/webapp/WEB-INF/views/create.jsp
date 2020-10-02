<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>CREATE</title>
</head>
<body>
	<%String id = (String)session.getAttribute("loginId");%>
	<h2 align="right"><a style="cursor: pointer;" onclick="logout()"><%=id %></a></h2>
	<h1 align="center">글 작성</h1>
	<div align="center">
		<form action="/boardMain" method="post">
			<table>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" id="title" size = "50" maxlength = "50" placeholder="제목을 입력하세요." style="margin: 0.5%; padding:0.5%;">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="13" cols="50" id="content" placeholder="내용을 입력하세요." style="margin: 0.5%; padding:0.5%; resize: none;"></textarea>
					</td>
				</tr>
			</table>
			<input type="button" value="작성완료" onclick="create()" style="padding:0.5%;">
			<input type="button" value="취소" onclick="location.href='/boardMain'" style="padding:0.5%;">
		</form>
	</div>
</body>
<script type="text/javascript">
function create(){
	var title = $("#title").val();
	var content = $("#content").val();
	$.ajax({
		url : "/board/insert",
		type : 'POST',
		data : { title : title, 
			content : content
		},
		success:function(data){
			location.href="/boardMain";
		}
	})
}
</script>
</html>