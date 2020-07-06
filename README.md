# SNS-Blog-internet-programming
internet programming practice with java,html,jsp,css

## 구현 환경
MariaDB 10.4.13 version
Java Eclipse 4.14.0 version
Tomcat 9.0 for server


## 라이브러리 사용
mariadb-java-client-2.5.4.jar
  -for sql
cos.jar
  -for file upload(com.oreilly.servlet에서 다운)
  

## 사용법
login_ok.jsp 부터 실행하면 됩니다.

## 구현
  1)게시글 출력
	  -작성자, 글제목, 그림, 글내용, 작성시간이 출력됩니다.
		-글 내용이 100자 이상일 시 <더보기>가 나타나고 감출 수도 있습니다.
		-메인에는 이미지가 2개만 출력됩니다.

	2)회원가입
		-아이디, 비밀번호, 이름, 생년월일 , 성별을 입력해야합니다.
		-비밀번호는 재확인이 있으며 틀릴 경우 경고문이 뜹니다.
		-비밀번호는 6~12자여야 합니다.
	
	3)로그인
		-로그인을 합니다.
	
	4)로그아웃
		-로그아웃 합니다.
	
	5)게시글 조회
		-게시글 조회 시 모든 댓글과 모든 이미지가 다 보입니다.
		-조회수가 올라갑니다.

	6)추천
		-추천을 누를 시 추천수가 올라갑니다.
	
	7)검색 기능
		-제목, 내용, 작성자로 keyword 검색이 가능합니다.
		
	8)게시글 수정 및 삭제
		-게시글 수정, 삭제는 작성자만 가능합니다.
	
	9)댓글 작성
		-로그인을 해야마나 댓글 작성이 가능합니다.

	10)댓글 수정, 삭제
		-댓글 작성자만 수정, 삭제가 가능합니다.

	11)페이지 기능
		-한 페이지에는 최대 3개의 게시물만 보입니다.

	12)게시판
		-게시판을 누를 시 원래 메인으로 돌아갑니다.
    
##각 프로그램 파일에 대한 기능/역할 설명
	
	1)user_login
		-가장 먼저 접속하는 파일입니다.
		-메인 메뉴가 나타납니다.
	
	2)add_comment
		-comment를 추가할 수 있도록 작성 페이지가 나옵니다.

	3)add_sns
		-sns 작성 가능 페이지가 나옵니다.
	
	4)add_user
		-회원가입 페이지가 나옵니다.
	
	5)comment_delete
		-작성자일 경우 댓글을 삭제할 수 있습니다.

	6)comment_modify_save
		-수정한 댓글을 저장합니다.

	7)comment_modify
		-댓글 수정 페이지가 나옵니다.

	8)comment_save
		-댓글 추가 후 저장하는 페이지입니다.

	9)content
		-게시글 하나를 골라 볼 수 있습니다.

	10)delete_sns_do
		-게시글을 삭제합니다.
	
	11)delete_sns
		-비밀번호를 입력해야하며 게시글 삭제 여부를 묻습니다.

	12)increase_view
		-조회수를 늘립니다.
	
	13)like
		-추천수를 늘립니다.

	14)login_ok
		-회원인지 확인합니다.

	15)modify_sns_save
		-수정한 게시글을 저장합니다.

	16)modify_sns
		-게시글을 수정하는 페이지가 나옵니다.
    
	17)sns_save
		-등록한 게시글을 저장합니다.
	
	18)user_logout
		-로그아웃을 합니다.
	
	19)user_save
		-회원가입 후 데이터베이스에 저장합니다.
