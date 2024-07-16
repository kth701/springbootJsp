<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<%@ include file="/include/bs_header.jsp" %>

</head>
<body>
	<div class="container">
		<h1>회원 가입</h1>
		<hr>
		<div>
			<form>
			  <div class="row  align-items-center  mb-3">
				  <div class=" col-10">
				    <label for="id" 	class="form-label">ID</label>
				    <input type="text" 	class="form-control" id="id" name="id" >
				    <div id="id_msg" 	class="form-text">4자이상 숫자와영문자혼영 첫자는 영문</div>
				  </div>
				  <div class="col-2">
				  	<input type="button" id="idCheck" class="btn btn-info btn-sm"  value="ID Check" />
				  </div>
			  </div>
			  
			  <div class="mb-3">
			    <label for="email" class="form-label">Email address</label>
			    <input type="email" class="form-control" id="email" name="email" >
			    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
			  </div>
			  <div class="mb-3">
			    <label for="pwd" class="form-label">Password</label>
			    <input type="password" class="form-control" id="pwd" name="pwd">
			  </div>
			  <div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="remember " name="remember">
			    <label class="form-check-label" for="remember">remember me</label>
			  </div>
			  <div>
			  	<button type="submit" class="btn btn-primary">Submit</button>
			  </div>
			</form>			
		</div>
	</div>
	
	
	<jsp:include page="/include/bs_footer.jsp" /><!--  jquery 연결 -->
	<script type="text/javascript">
		$('#idCheck').click(function(){
			
			let id = $('#id').val();
			console.log('id: ', id)
			//서버에 전송 중복체크(등록여부확인)
		})
		
		
		
	</script>
</body>
</html>