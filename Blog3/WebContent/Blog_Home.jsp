<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 목록</title>
<style>
	#login{
		text-align:right;
	}
	#board_list{
		display:inline-block;
		background-color:lightgray;
		width:200px;
		min-height:1000px;
		padding:10px;
		margin:10px;
	}
	#content{
		display:inline-block;
		position:absolute;
		left:250px;
		font-family: Georgia;
		
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
	.imag{
		display:inline-block;
		border:0.1px solid black;
		width:40%
	}
	.writing{
		display:inline-block;
		border:0.1px solid black;
		width:30%
	}
	#content > div{
		height:250px;
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
<body>
<header>
	<form action="#" method="get">
	<div id="login"><img width="45" height="45"  src="images/lee.png"  alt="이용" />
        이용광님 <input type="button" value="로그아웃"> &nbsp; 게시판 관리</div>
	<h1>용광이의 블로그</h1>
	</form>
</header>

<nav id="board_list"><br>
	<h2 style="font-family: verdana;">게시판 목록</h2>
	<p>전체 게시글 보기</p>
	<ul class="menu">
		<li><a>자유게시판</a></li>
        <li><a>익명게시판</a></li>
        <li><a>홍보게시판</a></li>
	</ul>
</nav>

<section id="content">
	<p style="border: 0.1px solid black; width:550px"> 자유 게시판 <span> <input style="font-size:20px;" type="button" value=" 글쓰기 "></span></p>
	<div>
		<div class="imag">
			<table border="1" style="border-collapse:collapse;">
				<tr>
					<td >연습</td>
					<td align="right" style="width:30%;">2020/02/08/00:01:35</td>
				</tr>
				<tr>
					<td colspan="2">
						<img src="https://www.everdevel.com/material/images/HTML/asimo.png" alt="dance" width="49%" height="180px">
						<img src="https://s.pstatic.net/static/www/img/2018/sp_search.svg" alt="something" width="49%" height="180px">
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2">작성자: 이용광</td>
				</tr>
			</table>
		</div>
	
		<div class="writing">
			<table border="1" style="width:100%; border-collapse:collapse;">
				<tr>
					<td align="right">조회수 10</td>
				</tr>
				<tr style="height:184px;">
					<td><p>게시글 연습입니다.</p></td>
				</tr>
				<tr>
				<td colspan="3" align="right">
					<input type="button" value=" 추 천 "> 
					<output>25</output>
					<input type="button" value=" 댓 글 ">
					<output>14</output>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div>
		<div class="imag">
		<table border="1" style="width:100%; border-collapse:collapse;">
			<tr>
				<td style="width:70%;">example</td>
				<td align="right" style="width:30%;">2020/01/13/21:09:12</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src=example.jpg alt="예제입니다." width="99%" height="180px">
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">작성자: 이용광</td>
			</tr>
		</table>
	</div>
	<div class="writing">
		<table border="1" style="width:100%; border-collapse:collapse;">
			<tr>
				<td align="right">조회수 12</td>
			</tr>
			<tr style="height:184px;">
				<td><p>html문서의 하위더인 images에 있는 이미지를 상대경로로 출력합니다..</p></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				<input type="button" value=" 추 천 "> 
				<output>23</output>
				<input type="button" value=" 댓 글 ">
				<output>9</output>
				</td>
			</tr>
		</table>
	</div>
	</div>
	<div>
		<div class="imag">
		<table border="1" style="width:100%; border-collapse:collapse;">
			<tr>
				<td style="width:70%;">처음 나간 댄스배틀</td>
				<td align="right" style="width:30%;">2015/04/23/15:30:24</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="images/dance1.png" alt="dance battle 후기" width="99%" height="180px"/>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">작성자: 이용광</td>
			</tr>
		</table>
	</div>
	<div class="writing">
		<table border="1" style="width:100%; border-collapse:collapse;">
			<tr>
				<td align="right">조회수 5</td>
			</tr>
			<tr style="height:184px;">
				<td><p>사진을 캡쳐하여 현재 작성중인 html파일 폴더에 같이 넣어 상대경로로 출력했습니다.</p></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				<input type="button" value=" 추 천 "> 
				<output>7</output>
				<input type="button" value=" 댓 글 ">
				<output>4</output>
				</td>
			</tr>
		</table>
	</div>
	</div>
</section>
<footer>Copyright &copy; 2022 YongKwang Lee</footer>
</body>
</html>