package myBean;

public class show {
	private String title;
	private String name;
	private String password;
	private String text;
	
	public show() {
		
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	
	public String getTitle() {
		return title;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}
	
	public String getText() {
		return text;
	}

	public String getPrint() {
		String str="";
		str+=("제목은"+title+"입니다.\n");
		str+=("이름은"+name+"입니다.\n");
		str+=("비밀번호는"+password+"입니다.\n");
		str+=("입력하신 글은"+text+"입니다.\n");
		
		return str;
	}
}
