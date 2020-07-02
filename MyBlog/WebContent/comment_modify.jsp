<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String commentIdx=request.getParameter("commentIdx");

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	
	con =DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	
	String sql = "SELECT * FROM comment WHERE commentIdx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(commentIdx));
	
	rs=pstmt.executeQuery();
	rs.next();
	
%>
<!DOCTYPE html>
<html>
<head>
<title> 댓글 수정 </title>
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
}else if(!session.getAttribute("id").equals(rs.getString("id"))){
%>
<script>x
	alert("수정 권한이 없습니다.");
	loaction.href="user_login.jsp";
</script>
<%
}else{
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
	<article>
		<form action="comment_modify_save.jsp" method="post">
	<table style="width:40%">
		<tr>
      		<td>&nbsp;</td>
      		<td style="min-width:90px" align="center">댓글 수정</td>
      		<td colspan="4"></td>
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
     	<tr height="1" bgcolor="#dddddd">
     		<td colspan="4"></td>
     	</tr>
   	  	<tr>
      		<td>&nbsp;</td>
      		<td align="center">댓글 내용</td>
      		<td><textarea id="text" name="text" cols="100" rows="30"><%=rs.getString("comments")%></textarea></td>
      		<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr>
     		<td>&nbsp;</td>
      		<td align="center">댓글 번호</td>
      		<td><input type="text" name="idx" size="100%" value="<%=commentIdx %>" readonly></td>
      		<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr align="right">
     		<td>&nbsp;</td>
      		<td><a href="user_login.jsp">#게시물 보기</a></td>
      		<td colspan="1">	
      			<input type="submit" value="수정">
       			<input type="reset" value="취소">
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
<%
rs.close();
pstmt.close();
con.close();
}catch(SQLException e) {
	out.print(e);
	return;
}
%>