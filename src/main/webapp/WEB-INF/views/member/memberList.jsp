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
<%-- 	<div>현재 페이지 표시할 회원 정보수 : ${pageResponseDTO.memberList.size()}</div>
		<div>현재 패이지 표시할 회원 정보: ${pageResponseDTO.memberList}</div>
		<div>조회할 전체 레코드수: ${pageResponseDTO.total}</div>	 --%>
		<div id="test"></div>
	<div class="container">
		<h1>회원 목록 조회 </h1>
		<!-- 검색 기능 -->
		<form action="/member/list" method="get" id="searchForm">
			
			<div>
				
				
			</div>
			<div>
				<button type="submit" class="btn btn-outline-success">Search</button>
				<button type="rest" class="btn btn-outline-info">clear</button>
			</div>
		</form>

		<hr>
		<div>
			<table class="table table-bordered ">
			  <thead>
			    <tr>
			      <th scope="col">NO</th>
			      <th scope="col">아이디</th>
			      <th scope="col">이름</th>
			      <th scope="col">이메일</th>
			      <th scope="col">등록일자</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%-- start --%>
			  	<%-- <c:forEach var="member" items="${members }"> --%>
			  	<c:forEach var="member" items="${pageResponseDTO.memberList }">
			    <tr>
			      <td>${member.recnum}</td>
			      <td scope="row">
			      	<a href="/member/view?id=${member.id}" 
			      		class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">
			      		${member.id}</a>
			      </td>
			      <td>${member.name}</td>
			      <td>${member.email}</td>
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
				  
				  	<c:if test="${pageResponseDTO.prev}"><!-- 첫번째 블럭(시작페이지 번호가 1이면 비활성화 -->
				    <li class="page-item">
				      <a class="page-link" data-num="${pageResponseDTO.start-1}">이전</a>
				    </li>
				    </c:if>
				    
				    <!--  해당 블럭의 시작 페이지 번호와 마지막번호 -->
				    <c:forEach begin="${pageResponseDTO.start}" end="${pageResponseDTO.end }" var="i">
				    <li class="page-item  ${pageResponseDTO.page == i  ? 'active' : '' }">
				    	<a class="page-link" data-num="${i}">${i}</a>
				    </li>
				    </c:forEach>
				    
				    <!-- 마지막번째 블럭이면 next버튼 비활성화 -->
				    <c:if test="${pageResponseDTO.next}">
				    <li class="page-item">
				      <a class="page-link" href="#" data-num="${pageResponseDTO.end+1}">다음</a>
				    </li>
				    </c:if>
				  </ul>			
				 </nav>
			</div>
		</div>
		

	</div>
	

	
<jsp:include page="/include/bs_footer.jsp" />	
<script type="text/javascript">

	
	$('.pagination a').click(function(e){
		e.preventDefault();
		e.stopPropagation();// 현재 이벤트가 발생시 상위요소에서 이벤트감지를 막음
		
		
		let page_num = $(this).attr('data-num');
		console.log("요청한 페이지 data-num: ", page_num);
		
		if (${pageResponseDTO.page} != page_num){
			// 매개변수로 전달시
			//location.href="/member/list?page="+page_num;
			
			// 객체로 전달시
			// javascript
			//const formObj = document.querySelector("#searchForm")
			//const formObj = document.querySelector("form")
			//formObj.innerHTML += '<input type="hidden" name="page" value="'+ page_num + '">';
			
			//jQuery
			const formObj = $('#searchForm');
			formObj.html('<input type="hidden" name="page" value="'+ page_num + '">');
			formObj.submit();
			
		} else { return;}
		
	});
	
	function register(){
		location.href="/member/registerMember";
	}	
	

</script>
</body>
</html>