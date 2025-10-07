package dto;

import java.io.Serializable;
import java.sql.Date;

//리뷰 데이터 관리를 위한 Review 클래스
public class Review implements Serializable {
	//리뷰 id
	private long review_id;
	//영화 id
	private long movie_id;
	//유저 id
	private long user_id;
	//평점
	private double rating;
	//리뷰 내용
	private String review_comment;
	//작성일
	private Date review_date;
	
	//(추가)영화 이름, 유저 이름
	private String movie_title;
	private String userName;
	
	//생성자
	public Review() {
		super();
	}
	
	public Review(long review_id, long movie_id, long user_id, double rating, String review_comment, Date review_date,
			String movie_title, String userName) {
		super();
		this.review_id = review_id;
		this.movie_id = movie_id;
		this.user_id = user_id;
		this.rating = rating;
		this.review_comment = review_comment;
		this.review_date = review_date;
		this.movie_title = movie_title;
		this.userName = userName;
	}
	
	//setter and getter
	public long getReview_id() {
		return review_id;
	}
	public void setReview_id(long review_id) {
		this.review_id = review_id;
	}
	public long getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(long movie_id) {
		this.movie_id = movie_id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
