<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<%@ include file="/include/bs_header.jsp" %>

<style>
	#message { 	font-size: 8px; color: red;}
</style>

</head>
<body>
	<div class="container">
		<h1>회원 가입</h1>
		<hr>
		<div>
			<form  id="memberForm" >
			  <div class="row  align-items-center  mb-3">
				  <div class=" col-10">
				    <label for="id" 	class="form-label">ID</label>
				    <input type="text" 	class="form-control" id="id" name="id" >
				    <div id="id_msg" 	class="form-text">4자이상 숫자와영문자혼영 첫자는 영문</div>
				  </div>
				  <div class="col-2">
				  	<input type="button" id="idCheck" class="btn btn-info btn-sm"  value="ID Check" />
				  </div>
				  <div id="message" class="fs-6"></div>
			  </div>
			  <div class="mb-3">
			    <label for="pwd" class="form-label">Password</label>
			    <input type="password" class="form-control" id="pwd" name="pwd">
			  </div>
  			  <div class="mb-3">
			    <label for="name" class="form-label">Name</label>
			    <input type="text" class="form-control" id="name" name="name" >
			    <div id="nameHelp" class="form-text">이름을 입력하세요.</div>
			  </div>
			  <div class="mb-3">
			    <label for="email" class="form-label">Email address</label>
			    <input type="email" class="form-control" id="email" name="email" >
			    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
			  </div>

			  <div>
			  	<button type="submit" class="btn btn-primary" id="send">Submit</button>
			  </div>
			</form>			
		</div>
	</div>
	
	
	<jsp:include page="/include/bs_footer.jsp" /><!--  jquery 연결 -->
	<script type="text/javascript">
		//var member_form =  document.querySelect('#memberForm');
	
	
		$('#id').focus(function(){
			$('#message').text("");
		});
	
		//  아이디 중복 체크 버튼
		$('#idCheck').click(function(){
			
			let id_check = $('#id').val();
			console.log('id: ', id_check)
			
			//서버에 전송 중복체크(등록여부확인)
			$.ajax({
				type:'post',
				url: "/member/idcheck",
				async: false,		//  false동기식, true:비동기식
				data: {id: id_check},
				dataType: "text",	// 전송받을 데이터형식 : json, xml,text,..
				
				success: function(data, textStatus){
					console.log("success...");
					console.log(data, textStatus);
					if (data=='true'){
						$('#message').text("사용중인 아이디입니다.");
					}else {
						$('#message').text("사용 가능한 아이디입니다.");
					}
					
				},
				error: function(){
					console.log("error...");
				},
				complete:function(){
					console.log("complete...");
				}
				
			});
			
			
		})// end  idcheck()
		
		// submit버튼 클릭
		$('#send').click(function(e){
			e.preventDefault();// 기본 이벤트 삭제
			
			// 유효성 체크
			
			let id = $('#id').val();
			if (id.length==0 || id ==''){
				alert('4자 이상 입력하세요');
				
				$('#id').focus();
				return false;
			}
			
			// jquery에서 form에 대한 속성을 설정
			//action="/member/insert" method="post"
			$('#memberForm').attr('action', '/member/insert');
			$('#memberForm').attr('method', 'post');
			$('#memberForm').submit();
			
			// javascript
			//member_form.action= "/member/insert";
			//member_form.method ="post";
			//member_form.submit();
		})

		
		
		
	</script>
</body>
</html>