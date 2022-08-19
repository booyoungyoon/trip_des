<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행지 추천</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/c34800a0df.js" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
           @font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
      
   * {font-family: 'yg-jalnan', cursive }

        .gd-container {
  max-width: 1100px;
  position: relative;
  margin: 0 auto;
  padding-left: 15px;
  padding-right: 15px;
}
.container{
max-width: 1000px;
}

 ul > li > a {color: #212121;}
 #slider {width: 1000px; height: 1000px; margin: 0 auto;}
 
 h1 { text-align: center; }
</style>
  
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
<div class="card">
   
	</div>
	<br><br>
	<div id="slider">
		<!-- 여기에 내용 넣으세요 -->
		<h1>자유게시판</h1>
		<hr>
		<!--게시판 메인페이지 영역 시작-->
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					
					
					<thead>
						<tr>
							<th style="backgorund-color: #eeeeee; text-align: center;">번호</th>
							<th style="backgorund-color: #eeeeee; text-align: center;">제목</th>
							<th style="backgorund-color: #eeeeee; text-align: center;">작성자</th>
							<th style="backgorund-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="board">
					
						<tr>
							<td><c:out value="${board.boardNum}" /></td>
							<td>
								<a class='move'  href=<c:out value="${board.boardNum}"/>>
								<c:out value="${board.boardNum}"/></a>
							</td>
							<td><c:out value="${board.boardNum}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.boardDate}" /></td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 검색 조건 Start-->
					<form id="searchForm" action="/board/board" method="get">
						<select name="type">
							<option value=""   	<c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>  	>--</option>
							<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>
							>제목</option>
							<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>내용</option>
							<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>작성자</option>
							<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>제목+내용</option>
							<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>제목+작성자</option>
							<option value="TCW"  <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : '' }"/> >제목+내용+작성자</option>
						</select>
						
						<input type="text" name="keyword" />
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<button class="btn btn-primary">Search</button>
					</form>	
							
				<!-- 검색 조건 End -->
				
				<!-- 페이지 처리 Start -->
				<div class="pull-right">
					  <ul class="pagination">
					  
					    <c:if test="${pageMaker.prev }">
						    <li class="paginate_button previous"><a  href="${pageMaker.startPage-1}">Previous</a></li>
					    </c:if>
				
					  	<c:forEach  var="num"  begin="${pageMaker.startPage }"  end="${pageMaker.endPage }">
						    <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active" : "" }">
						    <a  href="${num }">${num }</a></li>
					  	</c:forEach>
					    
					    <c:if test="${pageMaker.next }">
						    <li class="paginate_button next"><a  href="${pageMaker.endPage+1}">Next</a></li>
					    </c:if>
					  </ul>
				</div>
				<!-- 페이지 처리 End -->

			</div>
		</div>
		<!--게시판 메인페이지 영역 끝-->
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-primary me-md-2" type="button">글쓰기</button>
	</div>
	</div>

	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>