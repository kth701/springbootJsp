<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/include/taglib.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mybatis 연동 JSP Page</title>

	<!--  인크루드 -->
	<%-- <%@ include file="/include/bs_header.jsp" %> --%>
	<jsp:include page="/include/bs_header.jsp" />


</head>
<body>
	<div class="container">
		<h1>회원 목록 조회 </h1>
		
		<div>
			<table class="table table-bordered ">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">이름</th>
			      <th scope="col">이메일</th>
			      <th scope="col">등록일자</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%-- start --%>
			  	<c:forEach var="member" items="${members }">
			  	
			    <tr>
			      <th scope="row">${member.id }</th>
			      <td>${member.name }</td>
			      <td>${member.email }</td>
			      <td>
			      	<fmt:formatDate value="${member.joinDate }" pattern="yyyy-MM-dd hh:mm:ss" />
		          </td>
			    </tr>
			    
		    	</c:forEach><%-- end --%>
			  </tbody>
			</table>			
		</div>
		
		<div class="d-flex justify-content-between mt-4" >
			<div><!--  버튼 -->
				<button type="button" class="btn btn-success btn-sm"
						onclick="register();">회원가입</button>
			</div>
			<div><!-- 네비게이션 -->
				<nav aria-label="...">
				  <ul class="pagination">
				    <li class="page-item disabled">
				      <span class="page-link">이전</span>
				    </li>
				    
				    <c:forEach begin="1" end="10" var="i">
				    <li class="page-item"><a class="page-link" href="#">${i}</a></li>
				    </c:forEach>
				    
				    <li class="page-item">
				      <a class="page-link" href="#">다음</a>
				    </li>
				  </ul>			
				 </nav>
			</div>
		</div>
		
		
	</div>
	
	
<script type="text/javascript">
	function register(){
		location.href="/member/registerMember";
	}
</script>
</body>
</html>