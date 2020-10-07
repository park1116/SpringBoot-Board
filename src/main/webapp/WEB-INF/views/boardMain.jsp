<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}

td {
	padding-top: 1%;
	padding-bottom: 1%;
}

table {
	border-collapse: collapse;
}
</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>BOARD</title>
</head>
<body>
	<%String id = (String)session.getAttribute("loginId");%>
	<h2 align="right"><a style="cursor: pointer;" onclick="logout()"><%=id %></a></h2>
	<h1 align="center">글 목록</h1>
	<div align="right">
		<form action="/search" method="post">
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
				<td align="center" width="20%"><a style="cursor: pointer;" onclick="location.href='/read?num='+${dto.num}">${dto.title}</a></td>
				<td align="center" width="*%"><a style="cursor: pointer;" onclick="location.href='/read?num='+${dto.num}">${dto.content}</a></td>
				<td align="center" width="10%">${dto.name}</td>
				<td align="center" width="10%">${dto.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<div align="left">
		<button onclick="location.href='/create'" style="padding:0.5%;">글 쓰기</button>
	</div>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/boardMain?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/boardMain?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/boardMain?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</body>
<script type="text/javascript">
function logout() {
	var flag = confirm("로그아웃하시겠습니까?");
	if(flag){
		location.href="/";
	}
}
</script>
</html>