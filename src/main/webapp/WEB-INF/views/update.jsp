<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE</title>
</head>
<body>
	<%String id = (String)session.getAttribute("loginId");%>
	<h2 align="right" onclick="logout()"><%=id %></h2>
	<h1 align="center">글 수정</h1>
	<div align="center">
		<table style="width: 70%">
			<tr>
				<td style="width: 10%;" align="center">글 번호</td>
				<td style="width: 10%;" align="center">${dto.num}</td>
				<td style="width: 10%;" align="center">제목</td>
				<td style="width: 20%;" align="center">${dto.title}</td>
				<td style="width: 10%;" align="center">작성자</td>
				<td style="width: 15%;" align="center">${dto.name}</td>
				<td style="width: 10%;" align="center">작성 시간</td>
				<td style="width: *%;" align="center">${dto.regdate}</td>
			</tr>
			<tr>
				<td style="width: 10%;" align="center">내용</td>
				<td colspan="7" align="center">
					<textarea rows="13" id="content" style="margin: 0.5%; padding:0.5%; width:100%; resize: none;">${dto.content}</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div align="center" style="padding: 1%;">
		<button type="button" onclick="update()" style="padding:0.5%;">수정 완료</button>
		<button type="button" onclick="/boardMain" style="padding:0.5%;">취소</button>
	</div>
</body>
</html>