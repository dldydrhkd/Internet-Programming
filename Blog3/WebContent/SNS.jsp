<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 등록</title>
<style>
	#login{
		text-align:right;
	}
	#board_list{
		display:inline-block;
		background-color:lightgray;
		width:200px;
		height:900px;
		padding:10px;
		margin:10px;
	}
	#main{
		left:250px;
	}
	header{
		background-color:#DAD9FF;
		padding:10px;
		font-family: Arial, "Trebuchet MS", sans-serif;
	}
	.menu a{
		text-decoration:none;
		color:#0000ff;
		font-family: "Nanum Gothic", snas-serif;
	}

	.menu li:hover{	
		background-color:#aabbcc;
	}
	#content{
		display:inline-block;
		position:absolute;
		left:250px;
		font-family: Georgia;
		
	}
	footer{
		position:abosolute;
		left:0;
		bottom:0;
		width:100%;
		padding: 15px 0;
		text-align: center;
		color:white;
		background-color:#DAD9FF;
		font-size:90%;
	}
</style>
<script>
function showData(){
	var str;
	var title = document.getElementById("title");
	str="제목: "+title.value+"\n";
	var name = document.getElementById("name");
	str+="작성자: "+title.value+"\n";
	var password = document.getElementById("password");
	str+="비밀번호: "+password.value+"\n";
	var image_name = document.getElementById("file").files;
	for(idx=0; idx<image_name.length; idx++){
		str+=(idx+1)+". 이미지 이름: "+image_name[idx].name + "\n";
	}
	var contents=document.getElementById("text");
	str+="내용: "+contents.value;
	alert(str)
	return false;
}
</script>
</head>
<body>
<header>
	<div id="login"><img width="45" height="45"  src="images/lee.png"  alt="이용광" />
        이용광님 <input type="button" value="로그아웃"> &nbsp; 게시판 관리</div>
	<h1>용광이의 블로그</h1>
</header>

<nav id="board_list"><br>
	<h2>게시판 목록</h2>
	<p>전체 게시글 보기</p>
	<ul class="menu">
		<li><a>자유게시판</a></li>
        <li><a>익명게시판</a></li>
        <li><a>홍보게시판</a></li>
	</ul>
</nav>
<section id="content">
	<p style="border: 0.1px solid black; width:550px"> 게시물 등록 </p>
	<form action="sns_view.jsp" method="get">
	<table>
		<tr>
      		<td>&nbsp;</td>
      		<td align="center">글쓰기</td>
      		<td colspan="4"></td>
  			<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd">
     		<td colspan="4"></td>
     	</tr>
		<tr>
      		<td>&nbsp;</td>
      		<td align="center">제목</td>
      		<td><input type="text" id="title" name="title" size="100%" maxlength="100"></td>
  			<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd">
     		<td colspan="4"></td>
     	</tr>
    	<tr>
      		<td>&nbsp;</td>
      		<td align="center">작성자</td>
      		<td><input type="text" id="name" name="name" size="100%" maxlength="50"></td>
      		<td>&nbsp;</td>
     	</tr>
      	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    	<tr>
      		<td>&nbsp;</td>
      		<td align="center">비밀번호</td>
      		<td><input type="password" id="password" name="password" size="100%" maxlength="50"></td>
      		<td>&nbsp;</td>
    	</tr>
    	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
    	</tr>
    	<tr>
    		<td>&nbsp;</td>
    		<td align="center">썸네일 설정</td>
    		<td><input id="file" type="file" accept="image/jpeg,image/gif,image/png" name="filename" multiple></td>
    	
    	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
    	</tr>
   	  	<tr>
      		<td>&nbsp;</td>
      		<td align="center">내용</td>
      		<td><textarea id="text" name="text" cols="100" rows="30"></textarea></td>
      		<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr align="right">
     		<td>&nbsp;</td>
      		<td>#게시물 보기</td>
      		<td colspan="1">	
      			<input type="submit" value="등록">
       			<input type="reset" value="취소">
     		<td>&nbsp;</td>
     	</tr>
	</table>
	</form>
</section>
<footer>Copyright &copy; 2022 YongKwang Lee</footer>
</body>
</html>