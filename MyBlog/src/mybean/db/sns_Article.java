package mybean.db;

public class sns_Article {
	private int idx;
	private String title;
	private String name;
	private String pwd;
	private String fileName1;
	private String fileName2;
	private String fileName3;
	private String content;
	private String creation_time;
	private int view_point;
	private int like_point;
	private int comment_num;
	
	public sns_Article() {}

	/**
	 * @return the idx
	 */
	public int getIdx() {
		return idx;
	}

	/**
	 * @param idx the idx to set
	 */
	public void setIdx(int idx) {
		this.idx = idx;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}

	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * @return the fileName1
	 */
	public String getFileName1() {
		return fileName1;
	}

	/**
	 * @return the fileName3
	 */
	public String getFileName3() {
		return fileName3;
	}

	/**
	 * @param fileName3 the fileName3 to set
	 */
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}

	/**
	 * @param fileName1 the fileName1 to set
	 */
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}

	/**
	 * @return the fileName2
	 */
	public String getFileName2() {
		return fileName2;
	}

	/**
	 * @param fileName2 the fileName2 to set
	 */
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the creation_time
	 */
	public String getCreation_time() {
		return creation_time;
	}

	/**
	 * @param creation_time the creation_time to set
	 */
	public void setCreation_time(String creation_time) {
		this.creation_time = creation_time;
	}

	/**
	 * @return the view_point
	 */
	public int getView_point() {
		return view_point;
	}

	/**
	 * @param view_point the view_point to set
	 */
	public void setView_point(int view_point) {
		this.view_point = view_point;
	}

	/**
	 * @return the like_point
	 */
	public int getLike_point() {
		return like_point;
	}

	/**
	 * @param like_point the like_point to set
	 */
	public void setLike_point(int like_point) {
		this.like_point = like_point;
	}

	/**
	 * @return the comment_num
	 */
	public int getComment_num() {
		return comment_num;
	}

	/**
	 * @param comment_num the comment_num to set
	 */
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
}
