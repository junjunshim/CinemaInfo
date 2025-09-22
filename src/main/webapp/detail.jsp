<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>영화 상세 정보</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- header include -->
    <jsp:include page="header.jsp" />

    <!-- main -->
    <main class="detail-container">
        <div class="detail-card">
            <img src="https://via.placeholder.com/300x450" alt="영화 포스터" class="detail-poster">
            <div class="detail-info">
                <h1>예시 영화 제목</h1>
                <p><strong>장르:</strong> 액션, 드라마</p>
                <p><strong>개봉일:</strong> 2025-08-15</p>
                <p><strong>감독:</strong> 홍길동</p>
                <p><strong>출연:</strong> 김철수, 이영희, 박민수</p>
                <p class="detail-description">
                    이 영화는 주인공이 거대한 음모에 휘말리며 펼쳐지는 액션과 감동적인 드라마를 담고 있습니다.
                    화려한 비주얼과 감동적인 스토리로 관객을 사로잡습니다.
                </p>
                <a href="index.jsp" class="back-button">← 돌아가기</a>
            </div>
        </div>
    </main>

    <!-- footer include -->
    <jsp:include page="footer.jsp" />
</body>
</html>
