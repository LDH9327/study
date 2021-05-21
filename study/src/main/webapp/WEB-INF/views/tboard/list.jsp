<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
	
	f.submit();
}
</script>
</head>
<body>
	<div>
		<div>
			<h3>QnA</h3>
		</div>
		<table>
			<tr>
				<td>
					${dataCount}개(${page}/${total_page})페이지
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.listNum}</td>
					<td>
						<c:forEach var="n" begin="1" end="${dto.depth}">
							&nbsp;
						</c:forEach>
						<c:if test="${dto.depth!=0}">└&nbsp;</c:if>
						<a href="${articleUrl}&boardNum=${dto.boardNum}">${dto.subject}</a>
					</td>
					<td>${dto.name}</td>
					<td>${dto.created}</td>
					<td>${dto.hitCount}</td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td>
					${dataCount==0? "등록된 게시물이 없습니다." : paging}
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/tboard/list'">새로고침</button>
				</td>
				<td>
					<form name="searchForm" action="${pageContext.request.contextPath}/tboard/list" method="post">
						<select name="condition">
							<option value="all">제목+내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="name">작성자</option>
							<option value="reg_date">등록일</option>
						</select>
						<input type="text" name="keyword">
						<button type="button" onclick="searchList();" class="btn">검색</button>
					</form>
				</td>
				<td>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/tboard/insert'">등록하기</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>