<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>READ</title>
</head>
<body>
	<%String id = (String)session.getAttribute("loginId");%>
	<h2 align="right" onclick="logout()"><%=id %></h2>
	<h1 align="center">글 조회</h1>
	<div align="center">
		<table>
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
				<td colspan="7" align="center">${dto.content}</td>
			</tr>
		</table>
	</div>
	<div align="center" style="padding: 1%;">
		<button type="button" onclick="reviseData('${dto.title}')">수정</button>
		<button type="button" onclick="location='/boardMain'">목록으로</button>
		<button type="button" onclick="deleteData('${dto.title}','${dto.num}')">삭제</button>
	</div>
</body>
</html>