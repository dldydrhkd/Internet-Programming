<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
	header{
		background-color:#DAD9FF;
		padding:10px;
		font-family: Arial, "Trebuchet MS", sans-serif;
	}
	input{
		width: 100%;
		height: 51px;
		position: relative;
		border: solid 1px;
		padiding: 21px 0 17px;
	}
	option{
		width:100%;
		height: 51px;
		position: relative;
		border: solid 1px;
		max-length;
	}
	select{
		width: 100%;
		height: 51px;
		border: solid 1px;
	}
	#content{
		width:460px;
		margin:0 auto;
	}
	#container{
		margin: 0 auto;
		max-width: 768px;
	}
	footer{
		position:abosolute;
		background-color:#DAD9FF;
		left:0;
		bottom:0;
		width:100%;
		padding: 15px 0;
		text-align: center;
		color:white;
		font-size:90%;
	}
</style>
</head>
<script>
function isSame(){
	var pwd1=document.getElementById("pwd1").value;
	var pwd2=document.getElementById("pwd2").value;
	if(pwd1.length<6 || pwd1.length >16){
		document.getElementById("check_pwd1").innerHTML='비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
		document.getElementById("check_pwd1").style.color='red'
	}
	else{
		document.getElementById("check_pwd1").innerHTML='';
	}
	if(pwd1!='' && pwd2!=''){
		if(pwd1==pwd2){
			document.getElementById("check_pwd2").innerHTML='비밀번호가 일치합니다.';
			document.getElementById("check_pwd2").style.color="green";
		}
		else{
			document.getElementById("check_pwd2").innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById("check_pwd2").style.color='red';
		}
	}
}
</script>
<body>
<header>
	<h1 style="text-align:center">블로그</h1>
</header>
<div id="container" style="width:100%; max-width: 768px">
	<div id="content">
	<form method="post" action="user_save.jsp">
		<h3>
		<label for="id">아이디</label>
		</h3>
		<span>
		<input type="text" id="id" name="id" placeholder="아이디"">
		</span>
		
		<h3>
		<label for="password1">비밀번호</label>
		</h3>
		<span>
			<input type="password" id="pwd1" name="pwd1" placeholder="비밀번호" onChange="isSame()">
			<span id="check_pwd1"></span>
		</span>
		
		<h3>
		<label for="password2">비밀번호 재확인</label>
		</h3>
		<span>
			<input type="password" id="pwd2" name="pwd2" onChange="isSame()">
			<span id="check_pwd2"></span>
		</span>
		
		<h3>
		<label for="name">이름</label>
		</h3>
		<span>
			<input type="text" id="name" name="name">
		</span>
		
		<h3>
		<label for="date">생년월일</label>
		</h3>
		<span>
			<input type="date" id="date" name="date">
		</span>
		
		<h3>
		<label for="gender">성별</label>
		</h3>
		<span>
			<select name="gender" id="gender">
			<option value selected>성별</option>
			<option value="M">남성</option>
			<option value="F">여성</option>
			</select>
		</span>
		<h3>
		<br>
		</h3>
		<input type="submit" value="가입하기" style="font-size:20px">
	</form>
	</div>
</div>
<footer>Copyright &copy; 2022 YongKwang Lee</footer>
</body>
</html>