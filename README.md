# 🎬 CinemaInfo (영화 정보 및 리뷰 커뮤니티)

**CinemaInfo**는 JSP와 Servlet을 기반으로 구축된 영화 정보 제공 및 리뷰 커뮤니티 웹 애플리케이션입니다.  
사용자는 영화 정보를 탐색하고, 스틸컷과 예고편을 감상하며, 평점과 리뷰를 남겨 다른 사용자와 소통할 수 있습니다.

## 🛠 Tech Stack

| 분류 | 기술 |
| :--- | :--- |
| **Language** | Java (JDK 17+), HTML5, CSS3, JavaScript |
| **Backend** | JSP, Servlet, JDBC |
| **Database** | Oracle Database 21c |
| **Server** | Apache Tomcat 10.1 |
| **Tool** | Eclipse IDE, SQL Developer, Git |

---

## 🏗 System Architecture (MVC Pattern)

이 프로젝트는 유지보수성과 확장성을 고려하여 **MVC (Model-View-Controller) 패턴**을 준수

* **Model (DAO, DTO)**: 데이터베이스와 통신하며 비즈니스 로직을 처리합니다. **싱글톤 패턴**과 **DBCP**를 사용하여 효율성을 높였습니다.
* **View (JSP)**: 사용자에게 보여지는 UI를 담당합니다. JSTL/EL을 사용하여 데이터를 표현하고, 모듈화된 CSS로 스타일을 관리합니다.
* **Controller (Servlet)**: 클라이언트의 요청(`*.do`)을 받아 적절한 모델을 호출하고 뷰로 포워딩합니다.

### 🔄 Request Flow Example
1.  **User Request**: `movieDetail.do?id=1` 요청
2.  **Controller**: `MovieDetailServlet`이 요청 수신
3.  **Model**: `MovieDAO`가 영화 정보를, `ReviewDAO`가 리뷰 목록을 DB에서 조회
4.  **View**: 조회된 데이터를 `request`에 담아 `detail.jsp`로 포워딩 및 렌더링

---

## 🗂 Database Structure (ERD)


### 1. USERS (사용자)
| Column | Type | Description | Key |
| :--- | :--- | :--- | :--- |
| `user_id` | NUMBER | 사용자 고유 번호 | PK |
| `username` | VARCHAR2 | 로그인 ID | UQ |
| `nickname` | VARCHAR2 | 닉네임 | |
| `email` | VARCHAR2 | 이메일 | |
| `password` | VARCHAR2 | 비밀번호 | |
| `join_date` | DATE | 가입일 | |

### 2. MOVIES (영화 정보)
| Column | Type | Description | Key |
| :--- | :--- | :--- | :--- |
| `movie_id` | NUMBER | 영화 고유 번호 | PK |
| `title` | VARCHAR2 | 영화 제목 | |
| `img_path` | VARCHAR2 | 영화 이미지 경로 | |
| `release_date`| DATE | 개봉일 | |
| `duration` | NUMBER | 영화 상영 시간 |  |
| `audience` | NUMBER | 관객 수 |  |
| `film_rating` | NUMBER | 상영 등급 |  |
| `category` | VARCHAR2 | 카테고리 |  |
| `country` | VARCHAR2 | 제작 국가 |  |
| `director` | VARCHAR2 | 감독 |  |
| `main_actor` | VARCHAR2 | 출연 배우 |  |
| `description`| VARCHAR2 | 줄거리 | |
| `video_path` | VARCHAR2 | 영화 예고편 경로 |  |
| `avg_rating` | NUMBER | 평균 평점 | |


### 3. REVIEWS (리뷰 및 평점)
| Column | Type | Description | Key |
| :--- | :--- | :--- | :--- |
| `review_id` | NUMBER | 리뷰 고유 번호 (Identity) | PK |
| `movie_id` | NUMBER | 영화 ID | FK (Movies) |
| `user_id` | NUMBER | 작성자 ID | FK (Users) |
| `rating` | NUMBER | 평점 (0.0 ~ 5.0) | |
| `review_comment`| VARCHAR2 | 리뷰 내용 | |
| `review_date` | DATE | 작성일 | |

### 4. MOVIE_IMAGES (스틸컷)
* *Note: 물리적 파일은 서버 디렉토리에 저장하며, `MovieDetailServlet`에서 동적으로 스캔하여 로드합니다.*

---

## 📂 Project Structure & Class Roles

### 1. `src/main/java/db`
* **`DBManager.java`**: JNDI를 통해 `context.xml`의 DataSource를 조회하고, **Connection Pool**을 관리합니다. `getConnection()` 및 `close()` 메소드를 제공하여 자원을 효율적으로 관리합니다.

### 2. `src/main/java/dto` (Data Transfer Object)
* 데이터 교환을 위한 자바 빈즈(Java Beans) 클래스입니다.
* **`User.java`**, **`Movie.java`**, **`Review.java`**: 테이블 컬럼과 1:1 매핑되는 필드와 Getter/Setter를 가집니다.

### 3. `src/main/java/dao` (Data Access Object)
* **`UserDAO.java`**: 회원가입, 로그인 인증, 비밀번호 검사, 프로필 수정(닉네임/비번 분기 처리) 로직을 수행합니다.
* **`MovieDAO.java`**:
    * `selectAllMovies()`: 메인 페이지 영화 목록 조회
    * `selectOneMovieById()`: 영화 상세 정보 조회
    * `selectMoviesByKeyword()`: 영화 제목 검색 (LIKE 연산)
* **`ReviewDAO.java`**:
    * `selectReviewsByUserId()`: 마이페이지 내 리뷰 목록 (Pagination 적용)
    * `insertReview()`: 리뷰 및 평점 등록 (Transaction)
    * `deleteReview()`: 리뷰 삭제

### 4. `src/main/java/controller` (Servlet)
* **`MovieListServlet.java` (`/main.do`)**: 메인 화면에 영화 목록을 최신순/평점순으로 로드합니다.
* **`MovieDetailServlet.java` (`/detail.do`)**:
    * GET: 영화 정보, 해당 영화의 리뷰 목록, 유튜브 예고편 URL 변환, 스틸컷 이미지 폴더 스캔 수행.
    * POST: 리뷰 등록 및 삭제 요청 처리.
* **`UserPageServlet.java` (`/userPage.do`)**: 마이페이지 대시보드(내 정보 + 최근 리뷰 요약)를 구성합니다.
* **`UserReviewServlet.java` (`/userReview.do`)**: 사용자가 작성한 모든 리뷰를 페이징 처리(Pagination Block)하여 보여줍니다.
* **`SearchServlet.java` (`/search.do`)**: 헤더의 검색창 입력을 처리하고 검색 결과 페이지로 이동합니다.

---

## ✨ Key Features

1.  **영화 상세 정보 & 미디어 갤러리**
    * 유튜브 링크(`watch?v=`)를 임베드 코드(`embed/`)로 자동 변환하여 재생.
    * 서버 내 이미지 폴더를 스캔하여 스틸컷 갤러리 자동 생성.
    * JavaScript Modal을 이용한 이미지 확대 보기 (Lightbox 효과).

2.  **리뷰 시스템**
    * 별점(0.5~10.0) 드래그 UI 구현.
    * 한 영화당 1개의 리뷰만 작성 가능하도록 중복 방지 로직 적용.
    * 본인이 작성한 리뷰만 삭제 가능.

3.  **마이페이지 & 회원 관리**
    * 프로필(닉네임, 비밀번호) 수정 기능 (유효성 검사 포함).
    * 내가 쓴 리뷰 목록 **페이지네이션(Pagination)** 구현 (5개씩 보기, 페이지 블록 이동).

4.  **반응형 UI/UX**
    * CSS Flexbox 및 Grid 시스템을 활용한 반응형 레이아웃.
    * `white-space: pre-wrap` 등을 활용한 텍스트 포맷팅 처리.

---

## 🚀 How to Run

1.  **Database Setup**
    * Oracle DB에 `schema.spl`을 통해서 `users`, `movies`, `reviews` 테이블 생성.
    * `seed.sql`을 실행하여 초기 더미 데이터 삽입.
2.  **Project Import**
    * Eclipse > Import > Dynamic Web Project.
3.  **Server Config**
    * `src/main/webapp/META-INF/context.xml` 파일에 본인의 DB 접속 정보(url, username, password) 설정.
4.  **Run**
    * Run on Server (Tomcat 10.1) > 접속 URL: `http://localhost:8080/CinemaInfo/main.do`

---

## 📝 License

This project is for educational purposes.