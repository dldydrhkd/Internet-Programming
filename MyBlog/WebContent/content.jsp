<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"
    import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, java.io.*, java.util.Date, java.util.Enumeration" 
	import="java.sql.*, mybean.db.*, javax.naming.*"
%>

<%
request.setCharacterEncoding("utf-8");

String idx=request.getParameter("idx");

Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";


try {
	Connection con;	
	PreparedStatement pstmt;
	ResultSet rs;
	
	con =DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	
	String sql = "SELECT * FROM sns WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(idx));
	
	rs=pstmt.executeQuery();
	rs.next();
	
	sns_Article art = new sns_Article();
	art.setTitle(rs.getString("title"));
	art.setName(rs.getString("name"));
	art.setPwd(rs.getString("pwd"));
	art.setFileName1(rs.getString("fileName1"));
	art.setFileName2(rs.getString("fileName2"));
	art.setFileName3(rs.getString("fileName3"));
	art.setContent(rs.getString("content"));
	art.setCreation_time(rs.getString("creation_time"));
	art.setLike_point(rs.getInt("like_point"));
	art.setView_point(rs.getInt("view_point"));
	art.setComment_num(rs.getInt("comment_num"));
	art.setIdx(Integer.parseInt(idx));
%>
<!DOCTYPE html>
<html>
<head>
<title> content page </title>
<style>
	body{
		text-align: center;
	}
	div#wrapper{
		min-width:1000px;
		width:auto;
		text-align: left;
		min-height: 300px;
		margin: 0 auto;
	}
	header, footer, nav, aside{
		border: 1px solid #999;
		margin: 5px;
		padding: 10px
	}
	header{
		background-color:#DAD9FF;
		font-family: Arial, "Trebuchet MS", sans-serif;
		min-width:700px;
		width: auto;
	}
	nav, section{
		float: left;
	}
	nav{
		background-color:lightgray;
		min-height:500px;
		min-width: 200px;
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
	aside{
		position: fixed;
		right:10px;
		width:100px;
		height:300px;
	}
	.moreDisplay {text-decoration: none; } 
	.content2 {display:none;}
	
</style>
<script>
function moreDisplay(id){
	var obj = document.getElementById(id);
	var obj1 = document.getElementById("myDiv2");
	var obj2 = document.getElementById("dis")
	if(obj.style.display=="none" || obj.style.display==""){
		obj.style.display="block";
		obj1.style.display="none";
		obj2.innerText="내용 감추기";
	}else{
		obj.style.display="none";
		obj1.style.display="block";
		obj2.innerText="내용 더보기";
	}
}

function moreDisplay1(id){
	var obj = document.getElementById(id);
	if(obj.style.display=="none" || obj.style.display==""){
		obj.style.display="block";
	}else{
		obj.style.display="none";
	}
}

</script>
</head>
<body>
<%
	if(session.getAttribute("id")==null){
%>
<div id= "wrapper">
<header>
	<div id="login">
	<form method="POST" action="login_ok.jsp">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id" placeholder="아이디입력" required>
	<label for="pwd">비밀번호</label>
	<input type ="password" name="pwd" id="pwd" placeholder="비밀번호입력" required>
	<input type="submit" value="로그인">
	<input type="button" onclick="location.href='add_user.jsp'" value="회원가입">
	</form>
	</div>
	<h1><%=session.getAttribute("id") %>의 블로그</h1>
</header>
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
		<li><a href="free_sns.jsp" style="background-color:#aabbcc;">자유게시판</a></li>
        <li><a href="anonymous_sns.jsp">익명게시판</a></li>
        <li><a href="advertise_sns.jsp">홍보게시판</a></li>
	</ul>
</nav>
<section id="content">
	<br>
	<div style="border: 1px solid #999; width:85%">
		<div style="text-align: left; float:left; width:50%" >&nbsp;&nbsp;&nbsp; 자유 게시판</div> 
		<div style="text-align: right;">
			<span id="button"> 
				<form method="post" action="add_sns.jsp">
					<input style="font-size:15px;" type="submit" value=" 글쓰기 ">
				</form>
			</span>
		</div>
	</div>
	<article>
	<div>
		<div class="imag">
			<table border="1" style="border-collapse:collapse; width:100%">
				<tr>
					<td><%=art.getTitle()%></td>
					<td align="right" style="border-left:hidden">작성자: <%=art.getName() %>
					<td align="right" style="width:30%;"><%=art.getCreation_time().substring(0,16) %></td>
				</tr>
				<%
					if(art.getFileName1()!=null){
				%>
				<tr>
					<td colspan="3">
					<img src="./upload/<%=art.getFileName1()%>"
							 width="480px" height="280px" alt="<%=art.getFileName1()%>" 
							 onmouseenter="zoomIn(event)"
							 onmouseleave="zoomOut(event)"
							 onclick="OnloadImg(this.src)">
							<script>
								function zoomIn(event){
									event.target.style.width ="600px";
									event.target.style.height = "336px";
									event.target.style.transition ="all 0.5s";
								}	
								function zoomOut(event){
									event.target.style.width ="480px";
									event.target.style.height ="280px";
									event.target.style.transition="all 0.5s";
								}
								function OnloadImg(url){

									  var img=new Image();
									  img.src=url;
									  var img_width=img.width+500;
									  var win_width=img.width+500;
									  var height=img.height+600;
									  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');
									  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
									 }
							</script>
					</td>
				</tr>
				<%
					}
				%>
				<%
					if(art.getFileName2()!=null){
				%>
				<tr>
					<td colspan="3">
					<img src="./upload/<%=art.getFileName2()%>"
							 width="480px" height="280px" alt="<%=art.getFileName2()%>" 
							 onmouseenter="zoomIn(event)"
							 onmouseleave="zoomOut(event)"
							 onclick="OnloadImg(this.src)">
							<script>
								function zoomIn(event){
									event.target.style.width ="600px";
									event.target.style.height = "336px";
									event.target.style.transition ="all 0.5s";
								}	
								function zoomOut(event){
									event.target.style.width ="480px";
									event.target.style.height ="280px";
									event.target.style.transition="all 0.5s";
								}
								function OnloadImg(url){

									  var img=new Image();
									  img.src=url;
									  var img_width=img.width+500;
									  var win_width=img.width+500;
									  var height=img.height+600;
									  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');
									  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
									 }
							</script>
					</td>
				</tr>
				<%
					}
				%>
				<%
					if(art.getFileName3()!=null){
				%>
				<tr>
					<td colspan="3">
					<img src="./upload/<%=art.getFileName3() %>"
							 width="480px" height="280px" alt="<%=art.getFileName3()%>" 
							 onmouseenter="zoomIn(event)"
							 onmouseleave="zoomOut(event)"
							 onclick="OnloadImg(this.src)">
							<script>
								function zoomIn(event){
									event.target.style.width ="600px";
									event.target.style.height = "336px";
									event.target.style.transition ="all 0.5s";
								}	
								function zoomOut(event){
									event.target.style.width ="480px";
									event.target.style.height ="280px";
									event.target.style.transition="all 0.5s";
								}
								function OnloadImg(url){

									  var img=new Image();
									  img.src=url;
									  var img_width=img.width+500;
									  var win_width=img.width+500;
									  var height=img.height+600;
									  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');
									  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
									 }
							</script>
					</td>
				</tr>
				<%
					}
				%>
				<tr style="height:50px;">
					<%
						if(art.getContent().length()>100){
					%>
						<td colspan="3"><pre id="myDiv2"><%=art.getContent().substring(0,100) %></pre>
						<pre id="myDiv1" class="content2"><%=art.getContent() %></pre>
						<a id="dis" class="moreDisplay" href="javascript:moreDisplay('myDiv1')">내용 더보기</a>
						</td>
					<%
						}else{
					%>
						<td colspan="3"><p><%=art.getContent() %></p>
					<%
						}
					%>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="left" style="height:50px; border-right:hidden;">
					<input type="button" value= "조 회 " onClick="location.href='increase_view.jsp?idx=<%=art.getIdx()%>'" disabled> 
					<%=art.getView_point()%>&nbsp;
					<input type="button" value=" 추 천 " onClick="location.href='like.jsp?idx=<%=art.getIdx()%>'" > 
					<%=art.getLike_point()%>&nbsp;
					<input type="button" value=" 댓 글 " onClick="javascript:moreDisplay1('co')">
					<%=art.getComment_num()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value=" 수 정 " onClick="location.href='modify_sns.jsp?idx=<%=art.getIdx()%>'">
					<input type="button" value=" 삭 제 " onClick="location.href='delete_sns.jsp?idx=<%=art.getIdx()%>'">
					</td>
					<td align="right">
					<input type="button" value=" 댓 글 작 성 " onClick="location.href='add_comment.jsp?idx=<%=art.getIdx() %>'"></td>
				</tr>
			</table>
			<table border="1" style="border-collapse:collapse; width:100%">
			<tr>
					<td colspan="3" id="co">
				<%
					PreparedStatement pstmt1 = null;
					ResultSet rs1=null;
					sql="select comments,name,creation_time from comment where idx=?";
					pstmt1 = con.prepareStatement(sql);
					pstmt1.setInt(1, rs.getInt("idx"));	
					
					rs1=pstmt1.executeQuery();
					while(rs1.next()){
				%>
						<div style="overflow:auto; max-width:520px; "><%=rs1.getString("name")%>: <%=rs1.getString("comments") %></div> 
						<span style="text-align:right; font-size:10px"> 작성일자:<%=rs1.getString("creation_time").substring(0,19)%></span>
						<br>
						<div style="text-align:right; font-size:10px;">
							<a href="comment_modify.jsp?commentIdx=<%=rs1.getInt("commentIdx")%>">수정</a>
							<a href="comment_delete.jsp?commentdx=<%=rs1.getInt("commentIdx")%>">삭제</a>
						</div>
						<hr>
				<%
					}
				%>
					</td>
				</tr>
			</table>
		</div>
	</div>
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