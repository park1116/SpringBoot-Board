<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>BOARD</title>
</head>
<body>
	<%String id = (String)session.getAttribute("loginId");%>
	<h2 align="right" onclick="logout()"><%=id %></h2>
	<h1 align="center">글 목록</h1>
	<div align="right">
		<form action="/search" method="get">
			<input type="text" name="searchData" placeholder="검색어를 입력하세요." />
			<button type="submit">검색</button>
		</form>
	</div>
	<table style="width: 98%; margin: 1%;">
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성 날짜</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td align="center" width="10%">${dto.num}</td>
				<td align="center" width="20%"><a style="cursor: pointer;" onclick="read('${dto.title}')">${dto.title}</a></td>
				<td align="center" width="*%"><a style="cursor: pointer;" onclick="read('${dto.title}')">${dto.content}</a></td>
				<td align="center" width="10%">${dto.name}</td>
				<td align="center" width="10%">${dto.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<div align="left">
		<button onclick="location.href='/create'" style="padding:0.5%;">글 쓰기</button>
	</div>
</body>
</html>