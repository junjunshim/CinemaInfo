package dto;

import java.io.Serializable;
import java.sql.Date;

//유저 데이터 관리를 위한 User 클래스
public class User implements Serializable {
	//유저 id(식별용 id값)
	private long user_id;
	//유저 이름(유저 아이디)
	private String userName;
	//유저 닉네임(이름)
	private String nickName;
	//유저 passwd
	private String userPasswd;
	//유저 이메일
	private String userEmail;
	//유저 가입일
	private Date join_date;
	
	//생성자
	public User() {
		super();
	}
	
	public User(long user_id, String userName, String userPasswd, String userEmail, Date join_date) {
		super();
		this.user_id = user_id;
		this.userName = userName;
		this.userPasswd = userPasswd;
		this.userEmail = userEmail;
		this.join_date = join_date;
	}

	//setter and getter
	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public String getUserPasswd() {
		return userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
}
