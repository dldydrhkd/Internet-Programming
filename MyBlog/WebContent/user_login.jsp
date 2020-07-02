<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String page_idx=request.getParameter("page_idx");
String search=request.getParameter("search");
String sel=request.getParameter("sel");

Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
PreparedStatement pstmt = null;
ResultSet rs=null;
try {
	//1. DB 연결자 정보를 획득한다.
	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	//2. member 테이블에서 모든 필드의 레코드를 가져오는 퀴리 문자열을 구성한다.
	String sql;
	
	if(search==null){
		sql = "SELECT * FROM sns limit ?,?";
		pstmt = con.prepareStatement(sql);
		if(page_idx==null){
			page_idx="1";
		}
		pstmt.setInt(1,(Integer.parseInt(page_idx)-1)*3);
		pstmt.setInt(2, 3);
	}
	else{
		if(sel.equals("작성자")){
			sql="select * from sns where name like '%"+search+"%' limit ?,?";
			pstmt = con.prepareStatement(sql);
			if(page_idx==null){
				page_idx="1";
			}
			pstmt.setInt(1,(Integer.parseInt(page_idx)-1)*3);
			pstmt.setInt(2, 3);
		}
		else if(sel.equals("제목")){
			sql="select * from sns where title like '%"+search+"%' limit ?,?";
			pstmt = con.prepareStatement(sql);
			if(page_idx==null){
				page_idx="1";
			}
			pstmt.setInt(1,(Integer.parseInt(page_idx)-1)*3);
			pstmt.setInt(2, 3);
		}
		else if(sel.equals("내용")){
			sql="select * from sns where content like '%"+search+"%' limit ?,?";
			pstmt = con.prepareStatement(sql);
			if(page_idx==null){
				page_idx="1";
			}
			pstmt.setInt(1,(Integer.parseInt(page_idx)-1)*3);
			pstmt.setInt(2, 3);
		}else{
			sql = "SELECT * FROM sns limit ?,?";
			pstmt = con.prepareStatement(sql);
			if(page_idx==null){
				page_idx="1";
			}
			pstmt.setInt(1,(Integer.parseInt(page_idx)-1)*3);
			pstmt.setInt(2, 3);
		}
		
	}
	//4. 쿼리 실행
	rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<title> 로그인 페이지 </title>
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
	.paging {
        text-align: center;
    }
    .paging a {
        /*
        display: inline-block 인라인 요소의 특징과 블록 요소의 특징을 모두 갖는다
        크기를 가질 수 있으며 텍스트 정렬도 적용받는다
        */
        display: inline-block;
        
        font-weight: bold;
        text-decoration: none;
        padding: 5px 8px;
        border: 1px solid #ccc;
        color: #000;
        background-color: #F5F5DC;
    }
    /* 현재 페이징에 select 클래스를 적용한다*/
    .paging a.select {
        color: #fff;
        background-color: #FFA7A7;
    }
    .sort{
    	 text-align: center;
    	 padding: 5px 8px;
    }
	.moreDisplay {text-decoration: none; } 
	.content2 {display:none;}
	#co{display:none;}
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
<%
	if(session.getAttribute("id")==null){
%>
	<h1>블로그에 오신걸 환영합니다.</h1>
<%
	}else{
%>
	<h1><%=session.getAttribute("id") %>의 블로그</h1>
<%
	}
%>
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
		<li><a href="user_login.jsp" style="background-color:#aabbcc;">자유게시판</a></li>
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
<%
	while(rs.next()){
%>
	<div>
		<div class="imag">
			<table border="1" style="border-collapse:collapse; width:100%">
				<tr>
					<td><%=rs.getString("title")%></td>
					<td align="right" style="border-left:hidden; width:auto;">작성자: <%=rs.getString("name") %>
					<td align="right" style="width:30%;"><%=rs.getString("creation_time").substring(0,16) %></td>
				</tr>
				<tr>
					<td colspan="3">
						<%
							if(rs.getString("fileName2")==null && rs.getString("fileName1")!=null){
						%>
							<img src="./upload/<%=rs.getString("fileName1") %>"
							 width="100%" height="280px" alt="<%=rs.getString("fileName1")%>" 
							 onclick="OnloadImg(this.src)">
							<script>
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
						<%
							}else if(rs.getString("fileName1")!=null && rs.getString("fileName2")!=null){
						%>
							<img src="./upload/<%=rs.getString("fileName1") %>" 
							width="49%" height="200px" alt="<%=rs.getString("fileName1")%>" 
							onclick="OnloadImg(this.src)">
							<img src="./upload/<%=rs.getString("fileName2") %>" 
							width="49%" height="200px" alt="<%=rs.getString("fileName2")%>" 
							onclick="OnloadImg(this.src)">
						<%
							}else{}
						%>
					</td>
				</tr>
				<tr style="height:50px;">
					<%
						if(rs.getString("content").length()>100){
					%>
						<td colspan="3"><pre id="myDiv2"><%=rs.getString("content").substring(0,100) %></pre>
						<pre id="myDiv1" class="content2"><%=rs.getString("content") %></pre>
						<a id="dis" class="moreDisplay" href="javascript:moreDisplay('myDiv1')">내용 더보기</a>
						</td>
					<%
						}else{
					%>
						<td colspan="3"><pre><%=rs.getString("content") %></pre>
					<%
						}
					%>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="left" style="height:50px; border-right:hidden;">
					<input type="button" value= "조 회 " onClick="location.href='increase_view.jsp?idx=<%=rs.getInt("idx")%>'"> 
					<%=rs.getInt("view_point")%>&nbsp;
					<input type="button" value=" 추 천 " onClick="location.href='like.jsp?idx=<%=rs.getInt("idx")%>'" > 
					<%=rs.getInt("like_point")%>&nbsp;
					<input type="button" value=" 댓 글 " onClick="javascript:moreDisplay1('co')">
					<%=rs.getInt("comment_num")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value=" 수 정 " onClick="location.href='modify_sns.jsp?idx=<%=rs.getInt("idx")%>'">
					<input type="button" value=" 삭 제 " onClick="location.href='delete_sns.jsp?idx=<%=rs.getInt("idx")%>'">
					</td>
					<td align="right">
					<input type="button" value=" 댓 글 작 성 " onClick="location.href='add_comment.jsp?idx=<%=rs.getInt("idx") %>'"></td>
				</tr>
			</table>
			<div>
			<table border="1" style="border-collapse:collapse; width:100%">
			<tr>
					<td colspan="3" id="co">
				<%
					PreparedStatement pstmt1 = null;
					ResultSet rs1=null;
					sql="select commentIdx, comments,name,creation_time from comment where idx=?";
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
							<a href="comment_delete.jsp?commentIdx=<%=rs1.getInt("commentIdx")%>">삭제</a>
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
		<br><br>
	</div>
<%
	}
	rs.close();
	pstmt.close();
	con.close();
}catch(SQLException e) {
	out.println(e);
}
%>
	<div class="sort">
		<form action="user_login.jsp" method="post">
		<select id="mySel" name="sel">
			<option value="작성자">작성자</option>
			<option value="제목">제목</option>
			<option value="내용">내용</option>
		</select>
		<input type="text" name="search">
		<input type="submit" value="검색">
		</form>
	</div>
	<div class="paging">
<% 
	for(int i=1; i<=10; i++){
		if(i==Integer.parseInt(page_idx)){
%>
		<a class="select" href="user_login.jsp?page_idx=<%=i %>&search=<%=search%>&sel=<%=sel%>"><%=i %></a>
<%
		}else{
%>
		<a href="user_login.jsp?page_idx=<%=i %>&search=<%=search%>&sel=<%=sel%>"><%=i %></a>
<%
		}
	}
%>
	 </div>
	</article>
</section>

<footer>Copyright &copy; 2022 YongKwang Lee</footer>
</div>
</body>
</html>