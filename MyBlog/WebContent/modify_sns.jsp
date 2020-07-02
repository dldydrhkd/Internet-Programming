<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

int idx=Integer.parseInt(request.getParameter("idx"));

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

con= DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

String sql ="SELECT title, name, pwd, fileName1, fileName2, fileName3,content FROM sns WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);

rs= pstmt.executeQuery();
rs.next();

%>
<!DOCTYPE html>
<html>
<head>
<title> 사용자 수 </title>
<style>
	body{
		text-align: center;
	}
	div#wrapper{
		min-width:1200px;
		width:auto;
		text-align: left;
		min-height: 300px;
		margin: 0 auto;
	}
	header, footer, nav{
		border: 1px solid #999;
		margin: 5px;
		padding: 10px
	}
	header{
		background-color:#DAD9FF;
		font-family: Arial, "Trebuchet MS", sans-serif;
		min-width:1000px;
		width: auto;
	}
	nav,section{
		float:left;
	}
	nav{
		background-color:lightgray;
		min-height: 500px;
		width: 200px;
	}
	.menu a{
		text-decoration:none;
		color:#0000ff;
		font-family: "Nanum Gothic", snas-serif;
	}

	.menu li:hover{	
		background-color:#aabbcc;
	}
	#login{
		text-align:right;
	}
	footer{
		position: relative;
		background-color:#DAD9FF;
		left:0;
		bottom:20px;
		width:100%;
		text-align: center;
		color:white;
		font-size:90%;
		clear: both;
	}
	section{
		width:60%;
	}
	article{
		width: 90%;
		margin: 20px;
	}
</style>
</head>
<body>
<%
	if(session.getAttribute("id")==null){
%>
<script>
	alert("로그인 후 사용하실 수 있습니다.");
	location.href="user_login.jsp";
</script>
<%
}else {
%>
<div id="wrapper">
<header>
	<div id="login">
	<form action="user_logout.jsp" method="post">
        <%=session.getAttribute("id") %> <input type="submit" value="로그아웃"> &nbsp; 게시판 관리
    </form>
    </div>
	<h1><%=session.getAttribute("id") %>님의 블로그</h1>
</header>
<%
}
%>
<nav id="board_list"><br>
	<h2>게시판 목록</h2>
	<ul class="menu">
		<li><a href="sns_all.jsp">전체 게시글 보기</a></li>
		<li><a href="free_sns.jsp">자유게시판</a></li>
        <li><a href="anonymous_sns.jsp">익명게시판</a></li>
        <li><a href="advertise_sns.jsp">홍보게시판</a></li>
	</ul>
</nav>
<section id="content">
	<br>
	<div>
		<div style="text-align: left; float:left" >게시물 수정</div> 
	</div>
	<br>
	<article>
		<form method="POST" action="modify_sns_save.jsp" enctype="multipart/form-data">
	<table>
		<tr>
      		<td>&nbsp;</td>
      		<td style="min-width:90px" align="center">글번호</td>
      		<td><input type="text" name="idx" size="100%" value="<%=idx %>" readonly></td>
      		<td colspan="4"></td>
  			<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd">
     		<td colspan="4"></td>
     	</tr>
		<tr>
      		<td>&nbsp;</td>
      		<td align="center">제목</td>
      		<td><input type="text" id="title" size="100%" name="title" maxlength="100" value="<%=rs.getString("title")%>"></td>
  			<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd">
     		<td colspan="4"></td>
     	</tr>
    	<tr>
      		<td>&nbsp;</td>
      		<td align="center">작성자</td>
      		<td><input type="text" id="name" size="100%" name="name" maxlength="50" value="<%=rs.getString("name")%>"></td>
      		<td>&nbsp;</td>
     	</tr>
      	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    	<tr>
      		<td>&nbsp;</td>
      		<td align="center">비밀번호</td>
      		<td><input type="password" id="password" size="100%" name="password" maxlength="50" value="<%=rs.getString("pwd")%>"></td>
      		<td>&nbsp;</td>
    	</tr>
    	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
    	</tr>
    	<tr>
    		<td>&nbsp;</td>
    		<td align="center">썸네일 설정</td>
    		<td>
    		<div>
    		기존파일명: <%=rs.getString("fileName1")%><img src="./upload/<%=rs.getString("fileName1") %>" width="100" height="100"><br>
			변경할 사진 : <input type="file" name="fileName1"><br>
			</div>
			<hr>
			<div>
			기존파일명: <%=rs.getString("fileName2")%><img src="./upload/<%=rs.getString("fileName2") %>" width="100" height="100"><br>
			변경할 사진 : <input type="file" name="fileName2"><br> 
			</div>
			<hr>
			<div>
			기존파일명: <%=rs.getString("fileName3")%><img src="./upload/<%=rs.getString("fileName3") %>" width="100" height="100"><br>
			변경할 사진 : <input type="file" name="fileName3"><br> 
			</div>
    		</td>
    	</tr>
    	
    	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
    	</tr>
   	  	<tr>
      		<td>&nbsp;</td>
      		<td align="center">내용</td>
      		<td><textarea id="text" name="text" cols="100" rows="30" value="<%=rs.getString("content") %>"></textarea></td>
      		<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr align="right">
     		<td>&nbsp;</td>
      		<td><a href="user_login.jsp">#게시물 보기</a></td>
      		<td colspan="1">	
      			<input type="submit" value="수정">
       			<input type="button" value="취소" onClick="history.go(-1)">
     		<td>&nbsp;</td>
     	</tr>
	</table>
	</form>
	</article>
</section>
<footer>Copyright &copy; 2022 YongKwang Lee</footer>
</div>
</body>
</html>