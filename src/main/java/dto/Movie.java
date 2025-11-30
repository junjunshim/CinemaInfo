package dto;

import java.io.Serializable;
import java.sql.Date;

//영화 데이터 관리를 위한 Movie 클래스
public class Movie implements Serializable {
	//영화 id
	private long movie_id;
	//영화 제목
	private String movie_title;
	//영화 이미지 경로
	private String img_path;
	//영화 개봉일
	private Date release_date;
	//영화 상영 시간
	private int duration;
	//관객 수
	private long audience;
	//영화 관람 등급
	private String film_rating;
	//영화 카테고리
	private String category;
	//제작 국가
	private String country;
	//감독
	private String director;
	//영화 주연
	private String main_actor;
	//영화 시놉시스
	private String description;
	//영화 예고편 경로
	private String video_path;
	//영화 평균 평점
	private double avg_rating;
	
	//생성자
	public Movie() {
		super();
	}
	
	public Movie(long movie_id, String movie_title, String img_path, Date release_date, int duration, long audience,
			String film_rating, String category, String country, String director, String main_actor, String description,
			String video_path, double avg_rating) {
		super();
		this.movie_id = movie_id;
		this.movie_title = movie_title;
		this.img_path = img_path;
		this.release_date = release_date;
		this.duration = duration;
		this.audience = audience;
		this.film_rating = film_rating;
		this.category = category;
		this.country = country;
		this.director = director;
		this.main_actor = main_actor;
		this.description = description;
		this.video_path = video_path;
		this.avg_rating = avg_rating;
	}
	
	//setter and getter
	public long getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(long movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public Date getRelease_date() {
		return release_date;
	}
	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public long getAudience() {
		return audience;
	}
	public void setAudience(long audience) {
		this.audience = audience;
	}
	public String getFilm_rating() {
		return film_rating;
	}
	public void setFilm_rating(String film_rating) {
		this.film_rating = film_rating;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getMain_actor() {
		return main_actor;
	}
	public void setMain_actor(String main_actor) {
		this.main_actor = main_actor;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getVideo_path() {
		return this.video_path;
	}
	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}
	public double getAvg_rating() {
		return avg_rating;
	}
	public void setAvg_rating(double avg_rating) {
		this.avg_rating = avg_rating;
	}
	
}
