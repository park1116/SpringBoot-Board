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
<title>READ</title>
</head>
<body>
	<%String id = (String)session.getAttribute("loginId");%>
	<h2 align="right" onclick="logout()"><%=id %></h2>
	<h1 align="center">글 조회</h1>
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
					<textarea rows="13" id="content" style="margin: 0.5%; padding:0.5%; width:95%; resize: none;" readonly="readonly">${dto.content}</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div align="center" style="padding: 1%;">
		<button type="button" onclick="location.href='/update?num='+${dto.num}" style="padding:0.5%;">수정</button>
		<button type="button" onclick="location='/boardMain'" style="padding:0.5%;">목록으로</button>
		<c:set var="sessionId" value="<%=id%>"/>
		<c:if test="${dto.name eq sessionId}">
			<button type="button" onclick="deleteData('${dto.num}')" style="padding:0.5%;">삭제</button>
		</c:if>
	</div>
</body>
<script type="text/javascript">
function deleteData(num) {
	var result = confirm("정말 삭제하시겠습니까?");
	if(result){
		$.ajax({
			url : "/board/delete",
			type : 'POST',
			data : { num : num
			},
			success:function(data){
				location.href="/boardMain";
			}
		})	
	}
}
</script>
</html>