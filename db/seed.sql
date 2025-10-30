-- =================================================================
-- CinemaInfo 프로젝트 개발/테스트용 대용량 샘플 데이터 (seed.sql)
-- 5명의 유저, 3개 카테고리별 10개 영화(총 30개), 영화당 5개 리뷰(총 150개)
-- =================================================================

-- 1. 사용자 데이터 입력
INSERT INTO users (username, nickname, email, password) VALUES ('cinephile', 'movielover', 'cine@phile.com', 'pass1234');
INSERT INTO users (username, nickname, email, password) VALUES ('film_critic_wannabe', 'storyfighter', 'critic@wannabe.com', 'pass5678');
INSERT INTO users (username, nickname, email, password) VALUES ('casual_viewer', 'wantauthor', 'viewer@home.com', 'pass9876');
INSERT INTO users (username, nickname, email, password) VALUES ('horror_mania', 'heavyrain', 'ghost@love.com', 'pass1111');
INSERT INTO users (username, nickname, email, password) VALUES ('action_junkie', 'bananaking', 'boom@action.com', 'pass2222');

-- 2. 영화 및 리뷰 데이터 입력
DECLARE
    v_movie_id NUMBER;
    v_user_cinephile NUMBER;
    v_user_critic NUMBER;
    v_user_viewer NUMBER;
    v_user_horror NUMBER;
    v_user_action NUMBER;
BEGIN
    SELECT user_id INTO v_user_cinephile FROM users WHERE username = 'cinephile';
    SELECT user_id INTO v_user_critic FROM users WHERE username = 'film_critic_wannabe';
    SELECT user_id INTO v_user_viewer FROM users WHERE username = 'casual_viewer';
    SELECT user_id INTO v_user_horror FROM users WHERE username = 'horror_mania';
    SELECT user_id INTO v_user_action FROM users WHERE username = 'action_junkie';

    
    -- 기생충
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('기생충', TO_DATE('2019-05-30', 'YYYY-MM-DD'), 132, 10313560, '15세 이상 관람가', '드라마', '대한민국', '봉준호', '송강호|이선균|조여정|최우식|박소담', '전원백수인 ‘기택’네 장남 ‘기우’가 고액 과외 면접을 위해 ‘박사장’네 집에 발을 들이면서 시작되는 두 가족의 걷잡을 수 없는 만남.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '봉준호 감독의 정점. 모든 장면이 상징으로 가득하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '자본주의 사회의 계급 문제를 이토록 신랄하고 재치있게 풀어낼 수 있다니.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '웃다가 어느 순간 서늘해지는 영화. 보고나서 생각이 많아져요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '액션은 없지만 긴장감 하나는 최고네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '공포영화는 아니지만 지하실 장면은 정말 소름끼쳤어요.');

    -- 미나리
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('미나리', TO_DATE('2021-03-03', 'YYYY-MM-DD'), 115, 1135293, '12세 이상 관람가', '드라마', '미국', '정이삭', '스티븐 연|한예리|윤여정|앨런 김', '1980년대, 아메리칸드림을 좇아 미 아칸소주로 이주한 한인 가정의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '가족의 의미를 다시 생각하게 하는 따뜻하고 아름다운 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '이민자들의 삶을 담담하지만 깊은 울림으로 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '윤여정 배우님 연기가 정말 좋았어요. 잔잔하게 감동적이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 사건은 없지만 계속 보게 되는 힘이 있네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '마음이 정화되는 느낌. 할머니 너무 귀여우심.');

    -- 벌새
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('벌새', TO_DATE('2019-08-29', 'YYYY-MM-DD'), 138, 146603, '15세 이상 관람가', '드라마', '대한민국', '김보라', '박지후|김새벽', '1994년, 거대한 세계 앞에서 방황하는 14살 ‘은희’가 한문학원 선생님 ‘영지’를 만나 자신만의 세상을 찾아가는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '섬세한 감정선과 시대상이 어우러진 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '누구나 겪었을 법한 성장통을 담담하게 그려내어 큰 공감을 얻었다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '은희에게 너무 감정이입해서 봤네요. 마음이 아프면서도 따뜻해져요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '조용한 영화지만, 은희의 작은 날갯짓이 큰 파장을 일으키는 느낌.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '가정 폭력 장면은 어떤 공포 영화보다 현실적이라 무서웠다.');

    -- 택시운전사
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('택시운전사', TO_DATE('2017-08-02', 'YYYY-MM-DD'), 137, 12189708, '15세 이상 관람가', '드라마|역사', '대한민국', '장훈', '송강호|토마스 크레치만|유해진|류준열', '1980년 5월, 서울의 택시운전사 ‘만섭’이 통금시간 전까지 광주에 다녀오면 큰 돈을 준다는 말에, 독일기자 ‘피터’를 태우고 아무것도 모른 채 광주로 가게 된 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '보고 나서 정말 많이 울었습니다. 꼭 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '아픈 역사를 대중의 눈높이에서 잘 풀어낸 상업영화의 좋은 예.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '송강호 배우의 페이소스가 빛을 발하며 역사의 비극을 효과적으로 전달한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '후반부 카체이싱 장면은 드라마 장르임에도 불구하고 긴장감이 넘쳤다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '실제 역사가 주는 공포와 슬픔이 어떤 영화보다 무겁게 다가왔다.');

    -- 남매의 여름밤
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('남매의 여름밤', TO_DATE('2020-08-20', 'YYYY-MM-DD'), 104, 25292, '전체 관람가', '드라마', '대한민국', '윤단비', '최정운|양흥주|박현영', '여름 방학 동안, 아빠와 함께 할아버지 집에서 지내게 된 남매 옥주와 동주가 겪는 가족의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한여름밤의 꿈처럼 아름답고 아련한 가족 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '일상의 순간들을 섬세하게 포착하여 가족의 변화를 그려내는 연출이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '어릴 적 할아버지 댁에 놀러갔던 기억이 나서 좋았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '잔잔하지만 지루하지 않아요. 마음이 편안해지는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '특별한 사건은 없지만 가족이 해체될지도 모른다는 불안감이 스며있다.');

    -- 8월의 크리스마스
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('8월의 크리스마스', TO_DATE('1998-01-24', 'YYYY-MM-DD'), 97, 422930, '15세 이상 관람가', '드라마|로맨스', '대한민국', '허진호', '한석규|심은하', '시한부 인생을 사는 사진사 정원과 주차단속요원 다림의 풋풋하고 애틋한 사랑 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '한국 멜로 영화의 교과서. 세월이 흘러도 변치 않는 감동.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '삶과 죽음, 사랑을 담담하게 그려내어 더욱 깊은 여운을 남긴다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '심은하 배우가 너무 예쁘고, 한석규 배우 연기는 마음을 울립니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '조용한 영화지만 감정의 파고가 상당하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '죽음을 앞둔 주인공의 시선이 너무나 담담해서 오히려 더 슬펐다.');

    -- 우리들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('우리들', TO_DATE('2016-06-16', 'YYYY-MM-DD'), 95, 50228, '전체 관람가', '드라마', '대한민국', '윤가은', '최수인|설혜인|이서연', '혼자가 되고 싶지 않은 외톨이 선과 비밀을 가진 전학생 지아의 복잡미묘한 여름을 그린 영화.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '아이들의 세계를 통해 관계의 본질을 꿰뚫어보는 놀라운 통찰력.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '어른들의 세계보다 더 복잡하고 잔인한 아이들의 관계를 현실적으로 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '초등학생 때 생각이 나서 너무 공감됐어요. 어른이 되어서 봐도 많은 생각을 하게 되네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '아이들 사이의 미묘한 감정 싸움이 스릴러 영화 못지 않게 긴장감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '큰 움직임은 없지만 감정의 격돌이 대단한 영화.');

    -- 소리도 없이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('소리도 없이', TO_DATE('2020-10-15', 'YYYY-MM-DD'), 99, 403126, '15세 이상 관람가', '드라마|범죄', '대한민국', '홍의정', '유아인|유재명', '범죄 조직의 뒤처리를 하며 살아가는 ‘태인’과 ‘창복’이 예기치 않게 유괴된 아이를 떠맡게 되면서 벌어지는 사건.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '대사 한 마디 없는 유아인의 연기가 모든 것을 말한다. 독특하고 신선한 범죄 드라마.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '아이러니한 상황 설정과 블랙코미디가 돋보이는 감독의 감각적인 데뷔작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 7.5, '조금 난해하긴 한데, 영화가 끝나고 곱씹어보게 되는 매력이 있어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 거의 없지만, 예측할 수 없는 전개가 긴장감을 유발한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '기묘하고 불편한 분위기가 영화 내내 계속된다. 독특한 스릴러.');

    -- 찬실이는 복도 많지
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('찬실이는 복도 많지', TO_DATE('2020-03-05', 'YYYY-MM-DD'), 96, 28731, '12세 이상 관람가', '드라마|판타지', '대한민국', '김초희', '강말금|윤여정|김영민|윤승아', '일복만 터졌지 남자복은 없던 영화 프로듀서 찬실이 감독의 갑작스런 죽음으로 실직한 후 벌어지는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '사랑스러운 캐릭터와 재치 있는 연출이 돋보이는 힐링 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '영화와 삶에 대한 애정을 따뜻하고 유쾌한 판타지로 풀어냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보고나면 기분이 좋아져요. 찬실이 캐릭터 너무 사랑스러워요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 갈등은 없지만 소소한 재미가 가득합니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '장국영 귀신(?)이 나오는 장면이 코믹하면서도 묘한 분위기를 자아낸다.');

    -- 봄날은 간다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('봄날은 간다', TO_DATE('2001-09-28', 'YYYY-MM-DD'), 115, 362481, '15세 이상 관람가', '드라마|로맨스', '대한민국', '허진호', '유지태|이영애', '사운드 엔지니어 상우와 지방 방송국 PD 은수가 만나 사랑에 빠지고 헤어지는 과정을 현실적으로 그린 멜로 영화.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '시간이 흘러 다시 볼 때마다 새로운 의미로 다가오는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '사랑이 변하는 과정을 소리와 풍경으로 섬세하게 담아낸 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '"어떻게 사랑이 변하니?" 라는 대사는 잊을 수가 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '현실적인 연애 이야기. 화려하진 않지만 공감가는 내용.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '사랑이 식어가는 과정이 너무 현실적이라 공포스럽게 느껴질 정도.');
    
    -- 서울의 봄
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('서울의 봄', TO_DATE('2023-11-22', 'YYYY-MM-DD'), 141, 13128096, '12세 이상 관람가', '드라마|역사', '대한민국', '김성수', '황정민|정우성|이성민|박해준|김성균', '1979년 12월 12일, 수도 서울 군사반란 발생 그날 밤, 대한민국의 운명이 바뀌었다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '역사를 잊은 민족에게 미래는 없다. 반드시 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.8, '보는 내내 분노가 치밀어 오르게 만드는 연출과 연기.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '심장이 터질 것 같은 긴장감. 시간 가는 줄 몰랐습니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '총격씬은 없지만 그 어떤 액션 영화보다 박진감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '성공한 쿠데타는 처벌할 수 없다는 말이 공포 그 자체.');
    
    -- 다음 소희
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('다음 소희', TO_DATE('2023-02-08', 'YYYY-MM-DD'), 138, 128966, '15세 이상 관람가', '드라마', '대한민국', '정주리', '배두나|김시은', '춤을 좋아하는 씩씩한 열여덟 고등학생 소희. 졸업을 앞두고 콜센터로 현장실습을 나가게 되지만, 회사는 고객의 해지를 막는 팀에 소희를 배치하고 실적 압박을 가하기 시작한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '사회의 구조적 문제를 묵직하게 담아낸 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '담담한 시선으로 그려내어 더욱 가슴 아픈 현실.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '보는 내내 마음이 너무 아팠습니다. 우리 모두가 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '큰 사건 없이도 이 정도의 몰입감을 주다니 대단하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '현실이 공포보다 무섭다는 것을 보여주는 영화.');
    
    -- 변호인
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('변호인', TO_DATE('2013-12-18', 'YYYY-MM-DD'), 127, 11374892, '15세 이상 관람가', '드라마', '대한민국', '양우석', '송강호|김영애|오달수|곽도원|임시완', '1980년대 초 부산. 빽 없고, 돈 없고, 가방끈도 짧은 세무 변호사 송우석. 부동산 등기, 세금 자문으로 돈을 벌던 그의 인생을 송두리째 뒤흔든 한 사건을 마주하게 된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '송강호의, 송강호에 의한, 송강호를 위한 영화. 법정씬은 전율 그 자체.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '뜨거운 시대의 아픔을 스크린에 완벽하게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.8, '보는 내내 눈물이 났습니다. 잊지 말아야 할 역사.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '액션은 없지만, 신념을 위한 싸움이 주는 감동이 컸습니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.8, '국가가 개인에게 가하는 폭력이 얼마나 무서운지 보여줍니다.');
    
    -- 범죄도시2
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('범죄도시2', TO_DATE('2022-05-18', 'YYYY-MM-DD'), 106, 12693415, '15세 이상 관람가', '액션|범죄', '대한민국', '이상용', '마동석|손석구|최귀화|박지환', '가리봉동 소탕작전 4년 뒤, 금천서 강력반은 베트남 일대를 장악한 최강 빌런 강해상을 잡기 위해 나선다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '이게 액션이지! 마동석의 주먹은 모든 걸 해결한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '전형적인 서사지만 캐릭터의 힘으로 밀어붙인다. 킬링타임용으로 최고.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '너무 재밌어요! 시간 가는 줄 모르고 봤네요. 손석구 배우 완전 멋있어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '1편의 성공 공식을 그대로 따르지만, 그만큼의 재미는 보장한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '강해상 진짜 무서운 악당이네요. 마석도 아니었으면 큰일날 뻔.');

    -- 베테랑
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('베테랑', TO_DATE('2015-08-05', 'YYYY-MM-DD'), 123, 13414484, '15세 이상 관람가', '액션', '대한민국', '류승완', '황정민|유아인|유해진|오달수', '안하무인 유아독존 재벌 3세를 쫓는 광역수사대의 활약을 그린 범죄오락액션.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '아트박스 사장님... 잊을 수 없다. 통쾌함의 극치!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '스트레스 확 풀리는 영화! 유아인 악역 연기 진짜 대박이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '사회 비판 메시지를 대중적인 오락 영화의 틀에 성공적으로 녹여냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '류승완 감독의 장기가 제대로 발휘된 작품. 캐릭터들이 살아있다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '조태오 진짜 소름끼치는 악역. 저런 사람이 있을까 무서웠음.');

    -- 신세계
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('신세계', TO_DATE('2013-02-21', 'YYYY-MM-DD'), 134, 4682492, '청소년 관람불가', '범죄|느와르', '대한민국', '박훈정', '이정재|최민식|황정민', '경찰 잠입 수사 작전을 설계해 범죄 조직에 침투한 경찰과 그를 형제처럼 아끼는 조직의 2인자, 그리고 작전의 판을 짜는 경찰 사이에서 벌어지는 의리와 배신.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '느와르 장르의 멋이 폭발한다. 엘리베이터 씬은 전설.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '한국형 느와르의 새로운 지평을 연 작품. 캐릭터, 스토리, 연출 모두 완벽.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '클리셰를 영리하게 비틀어 장르적 쾌감을 극대화했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '"드루와~" 황정민 배우 연기 아직도 생각나요. 남자들이 왜 좋아하는지 알겠음.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '배신과 의심이 난무하는 분위기가 공포스럽기까지 하다.');

    -- 극한직업
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('극한직업', TO_DATE('2019-01-23', 'YYYY-MM-DD'), 111, 16266338, '15세 이상 관람가', '코미디|액션', '대한민국', '이병헌', '류승룡|이하늬|진선규|이동휘|공명', '해체 위기의 마약반이 범죄조직 소탕을 위해 위장창업한 ‘마약치킨’이 일약 맛집으로 입소문을 타게 되면서 벌어지는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '아무 생각 없이 웃고 싶을 때 최고의 영화! 너무 웃어서 눈물 났어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '코미디인줄 알았는데 후반부 액션씬 퀄리티가 상당해서 놀랐다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '설정의 힘을 끝까지 밀어붙이는 영리한 코미디. 배우들의 합이 빛난다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '이병헌 감독 특유의 맛깔나는 대사(말맛)가 살아있는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '웃다가 끝나는 영화. 공포 요소는 전혀 없네요.');
    
    -- 아저씨
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('아저씨', TO_DATE('2010-08-04', 'YYYY-MM-DD'), 119, 6178598, '청소년 관람불가', '액션|범죄', '대한민국', '이정범', '원빈|김새론', '아픔을 겪고 세상을 등진 채 살아가던 한 남자가 유일한 친구인 옆집 소녀가 범죄 조직에 납치되자, 그녀를 구하기 위해 세상 밖으로 다시 나오는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '원빈의, 원빈에 의한, 원빈을 위한 영화. 한국 액션의 새로운 스타일을 보여줬다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '원빈 너무 멋있어요... 마지막 장면은 눈물 없인 볼 수 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '서사는 단순하지만, 스타일리시한 액션 연출과 원빈의 존재감이 모든 것을 압도한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '감성적인 드라마와 사실적인 액션을 효과적으로 결합했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '범죄 조직의 잔인함이 공포스럽게 느껴졌다. 특히 장기밀매 부분.');
    
    -- 암살
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('암살', TO_DATE('2015-07-22', 'YYYY-MM-DD'), 140, 12706829, '15세 이상 관람가', '액션|시대극', '대한민국', '최동훈', '전지현|이정재|하정우', '1933년 조국이 사라진 시대, 대한민국 임시정부는 일본 측에 노출되지 않은 세 명을 암살작전에 지목한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '캐릭터 하나하나가 매력적이고, 액션씬도 볼거리가 풍부하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '배우들 보는 재미가 쏠쏠하고, 역사적인 내용이라 더 의미있게 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '최동훈 감독의 장기인 케이퍼 무비 스타일을 시대극에 성공적으로 이식했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '역사적 사실과 영화적 상상력을 균형감 있게 배합한 웰메이드 상업영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '독립운동가들을 배신하는 밀정의 존재가 서늘한 긴장감을 준다.');

    -- 도둑들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('도둑들', TO_DATE('2012-07-25', 'YYYY-MM-DD'), 135, 12984682, '15세 이상 관람가', '범죄|액션', '대한민국', '최동훈', '김윤석|김혜수|이정재|전지현|김수현', '10인의 도둑, 1개의 다이아몬드. 그들이 움직이기 시작했다!')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '화려한 캐스팅, 화려한 액션. 눈이 즐거운 케이퍼 무비.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '좋아하는 배우들이 다 나와서 너무 좋았어요. 시간 가는 줄 모르고 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '복잡한 인물 관계와 반전이 매력적인 오락 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '각 캐릭터의 매력을 극대화하는 감독의 연출력이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '서로를 믿지 못하는 도둑들 사이의 긴장감이 스릴있다.');
    
    -- 내부자들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('내부자들', TO_DATE('2015-11-19', 'YYYY-MM-DD'), 130, 9157293, '청소년 관람불가', '범죄|드라마', '대한민국', '우민호', '이병헌|조승우|백윤식', '대한민국 사회를 움직이는 숨겨진 권력가들의 의리와 배신을 담은 범죄드라마.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '배우들의 연기력이 영화 전체를 집어삼킨다. 특히 이병헌의 연기는 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '한국 사회의 부패한 권력층을 날카롭게 풍자한 웰메이드 범죄 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '화려한 액션은 없지만, 인물들 간의 팽팽한 기싸움이 액션보다 더 긴장감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '"모히또 가서 몰디브나 한잔 할라니까" 명대사가 너무 많아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '권력의 민낯이 이토록 추악하고 무서울 수 있다는 것을 보여준다.');

    -- 황해
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('황해', TO_DATE('2010-12-22', 'YYYY-MM-DD'), 156, 2260512, '청소년 관람불가', '액션|스릴러', '대한민국', '나홍진', '하정우|김윤석', '빚을 갚기 위해 청부살인을 맡고 밀항한 한 남자가 살인자 누명을 쓴 채 지독한 놈들에게 쫓기면서 벌이는 절망적인 사투.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '처절하고 사실적인 액션. 도끼씬과 카체이싱은 정말 숨막힌다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한 남자의 절망적인 사투를 통해 인간의 본성을 처절하게 그려낸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '감독의 지독한 연출과 배우들의 신들린 연기가 만들어낸 압도적인 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '영화 전체에 흐르는 폭력과 절망의 기운이 어떤 공포영화보다 무섭다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 잔인해서 보기 힘들었지만, 하정우 배우의 먹방 연기는 인상 깊었다.');

    -- 끝까지 간다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('끝까지 간다', TO_DATE('2014-05-29', 'YYYY-MM-DD'), 111, 3450305, '15세 이상 관람가', '범죄|액션', '대한민국', '김성훈', '이선균|조진웅', '한순간의 실수로 위기에 처한 형사가 자신이 저지른 사건을 은폐하기 시작하며 벌어지는 예측불허의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '처음부터 끝까지 멱살 잡고 끌고 가는 영화. 긴장감과 유머의 완벽한 조화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '장르적 쾌감을 극대화하는 영리한 각본과 훌륭한 리듬감의 연출.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '이선균과 조진웅, 두 배우의 팽팽한 연기 대결이 압권이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '손에 땀을 쥐고 봤어요. 어떻게 저런 상황이 계속 생기는지 ㅋㅋ');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '주인공이 처한 극한의 상황이 주는 압박감이 공포스럽다.');

    -- 육사오(6/45)
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('육사오(6/45)', TO_DATE('2022-08-24', 'YYYY-MM-DD'), 113, 1980755, '12세 이상 관람가', '코미디', '대한민국', '박규태', '고경표|이이경|음문석|박세완|곽동연', '바람을 타고 군사분계선을 넘어간 1등 당첨 로또. 주운 자가 임자? 아니면 원래 주인에게? 비공식 남북 공동 로또 수령 작전!')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '설정은 흥미롭지만, 조금 더 과감했으면 하는 아쉬움.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '남북 소재 코미디의 전형성을 크게 벗어나지 못했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '아무 생각 없이 웃고 싶을 때 보기 좋은 영화!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '배우들 티키타카가 정말 재밌네요. 특히 이이경 배우!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.8, '로또 때문에 벌어지는 소동이 귀엽고 유쾌했어요.');
    
    -- 파일럿
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('파일럿', TO_DATE('2024-07-31', 'YYYY-MM-DD'), 115, 2200000, '15세 이상 관람가', '코미디', '대한민국', '김한결', '조정석|이주명|한선화|신승호', '스타 파일럿에서 하루아침에 해고자가 된 ‘한정우’. 위기를 벗어나기 위해 그는 상상초월의 변신을 시도하며 재취업에 성공한다!')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '조정석의 하드캐리. 역시 코미디 연기는 최고.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '예상 가능한 스토리지만, 조정석이 살렸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '진짜 배꼽 빠지게 웃었네요. 스트레스 풀리는 영화!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '큰 액션은 없지만 소소하게 웃긴 장면이 많아요.');
    
    -- 럭키
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('럭키', TO_DATE('2016-10-13', 'YYYY-MM-DD'), 112, 6975290, '15세 이상 관람가', '코미디', '대한민국', '이계벽', '유해진|이준|조윤희|임지연', '냉혹한 킬러 형욱이 목욕탕 키 때문에 무명배우 재성과 인생이 뒤바뀌면서 벌어지는 초특급 반전 코미디.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '유해진의 코미디 연기는 역시 믿고 본다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '일본 원작을 한국적으로 잘 각색한 영리한 코미디.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '킬링타임용으로 최고! 유해진 배우 너무 웃겨요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '킬러였던 주인공의 액션 본능이 나올 때마다 웃음이 터짐.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.8, '가볍게 즐기기 좋은 유쾌한 영화였습니다.');

    -- 곡성
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('곡성', TO_DATE('2016-05-12', 'YYYY-MM-DD'), 156, 6879988, '15세 이상 관람가', '미스터리|스릴러|공포', '대한민국', '나홍진', '곽도원|황정민|쿠니무라 준|천우희', '낯선 외지인이 나타난 후 벌어지는 의문의 연쇄 사건들로 마을이 발칵 뒤집힌다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '내 인생 최고의 공포영화. 현혹되지 마라.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '감독이 관객을 쥐고 흔든다. 영화가 끝나도 머릿속을 떠나지 않는 질문들.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '오컬트 장르를 한국적으로 완벽하게 재해석한 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 무서운데 궁금해서 끝까지 봤어요. 해석 찾아봐야 할 듯...');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 아니지만 긴장감이 처음부터 끝까지... 대단하네요.');

    -- 부산행
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('부산행', TO_DATE('2016-07-20', 'YYYY-MM-DD'), 118, 11576783, '15세 이상 관람가', '액션|스릴러', '대한민국', '연상호', '공유|정유미|마동석|김수안', '정체불명의 바이러스가 전국으로 확산되고 대한민국 긴급재난경보령이 선포된 가운데, 부산행 KTX에 몸을 실은 사람들의 생존을 건 치열한 사투.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한국형 좀비 블록버스터의 시작! K-좀비는 달린다!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '마동석 좀비 때려잡을 때 속이 다 시원함. 최고의 액션.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '무서운데 슬프고 감동적이기까지... 시간 순삭이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '신파적인 요소가 있지만, 장르적 쾌감과 대중성을 잘 잡았다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '사회적 메시지를 좀비 아포칼립스 장르에 효과적으로 녹여낸 시도.');

    -- 파묘
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('파묘', TO_DATE('2024-02-22', 'YYYY-MM-DD'), 134, 11913494, '15세 이상 관람가', '미스터리|공포', '대한민국', '장재현', '최민식|김고은|유해진|이도현', '미국 LA, 거액의 의뢰를 받은 무당 ‘화림’과 ‘봉길’은 기이한 병이 대물림되는 집안의 장손을 만난다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, 'K-오컬트의 새로운 경지. 전반부의 몰입감이 엄청나다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '풍수지리와 항일 코드를 오컬트 장르에 녹여낸 흥미로운 시도.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '전반부와 후반부의 장르적 변주가 호불호가 갈릴 수 있지만, 그 자체로도 매력적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '배우들 연기 진짜 미쳤어요. 특히 김고은 배우 굿하는 장면은 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '무서우면서도 후반부에는 액션 활극 같은 느낌도 드네요.');

    -- 장화, 홍련
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('장화, 홍련', TO_DATE('2003-06-13', 'YYYY-MM-DD'), 118, 3148203, '15세 이상 관람가', '공포|미스터리', '대한민국', '김지운', '임수정|문근영|염정아|김갑수', '인적이 드문 시골, 이름 모를 꽃들이 소담하게 피어 있는 일본식 목재 가옥에 두 자매가 아버지와 함께 이사를 온다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '미장센, 사운드, 스토리 모든 것이 완벽한 공포 영화의 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '아름답고 슬픈 공포. 단순한 공포를 넘어선 하나의 예술 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '가족 드라마와 심리 스릴러, 공포를 정교하게 직조해냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '어릴 때 보고 너무 무서웠는데, 커서 보니 슬픈 이야기였네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '움직임은 적지만 심리적 압박감이 대단하다.');

    -- 악마를 보았다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('악마를 보았다', TO_DATE('2010-08-12', 'YYYY-MM-DD'), 144, 1819672, '청소년 관람불가', '스릴러|범죄', '대한민국', '김지운', '이병헌|최민식', '국정원 경호요원 ‘수현’은 약혼녀가 잔인하게 살해당하자 자신 또한 괴물이 되기로 결심하고 연쇄살인마 ‘장경철’을 쫓는다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '인간의 광기가 어디까지 갈 수 있는지 보여주는 처절한 복수극. 너무 잔인해서 힘들지만 대단하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '이병헌과 최민식의 연기 대결만으로도 볼 가치가 있다. 액션이 처절하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '복수라는 주제를 극한까지 밀어붙여 관객에게 질문을 던진다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '폭력의 수위가 높아 논란의 여지가 있지만, 장르적 성취는 분명하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 7.5, '너무 잔인해서 눈 가리고 봤어요. 최민식 배우 연기가 진짜 악마 같아서 무서웠어요.');

    -- 살인의 추억
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('살인의 추억', TO_DATE('2003-04-25', 'YYYY-MM-DD'), 132, 5255376, '15세 이상 관람가', '스릴러|범죄', '대한민국', '봉준호', '송강호|김상경|박해일', '1986년 경기도, 젊은 여인이 무참히 강간, 살해당한 시체로 발견된다. 2개월 후, 비슷한 수법의 강간살인사건이 연이어 발생하면서 사건은 세간의 주목을 받기 시작한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '봉준호 감독 최고의 걸작. 범죄 스릴러 장르를 넘어 시대의 초상을 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '범인을 잡지 못한 시대의 무력감과 분노를 스크린에 완벽하게 구현했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '범인이 잡히지 않았다는 사실 자체가 주는 현실적인 공포가 압도적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '마지막 송강호 배우의 눈빛은 한국 영화사에 길이 남을 명장면.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '액션은 없지만, 범인을 쫓는 형사들의 절박함이 엄청난 긴장감을 자아낸다.');

    -- 올드보이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('올드보이', TO_DATE('2003-11-21', 'YYYY-MM-DD'), 120, 3269000, '청소년 관람불가', '스릴러|미스터리', '대한민국', '박찬욱', '최민식|유지태|강혜정', '술 좋아하고 떠들기 좋아하는 오대수는 아내와 어린 딸이 있는 평범한 가장. 어느 날, 그는 정체불명의 괴한에게 납치되어 사설 감금방에 갇히게 된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '박찬욱 감독의 복수 3부작 중 최고. 스타일, 스토리, 연기 모든 것이 강렬하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '장도리 액션씬은 한국 영화 액션의 패러다임을 바꾼 명장면.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '파격적인 소재와 충격적인 반전, 감각적인 미장센이 돋보이는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '진실이 밝혀졌을 때의 충격과 공포는 잊을 수가 없다. 심리적 공포의 극치.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보고나서 며칠 동안 멍했어요. 굉장히 충격적인데 대단한 영화인 건 알겠어요.');

    -- 추격자
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('추격자', TO_DATE('2008-02-14', 'YYYY-MM-DD'), 125, 5046096, '청소년 관람불가', '스릴러|범죄', '대한민국', '나홍진', '김윤석|하정우', '출장안마소를 운영하는 전직 형사 ‘중호’, 최근 데리고 있던 여자들이 잇달아 사라지는 일이 발생하고, 조금 전 나간 ‘미진’을 찾아 헤맨다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '숨 막히는 긴장감. 러닝타임 내내 관객을 몰아붙인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '처절한 추격전과 사실적인 액션이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '나홍진 감독의 놀라운 데뷔작. 스릴러 장르의 문법을 완벽하게 구사한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '김윤석과 하정우의 미친 연기력이 만들어낸 시너지.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보는 내내 심장이 쫄깃했어요. "4885" 아직도 기억남.');

    -- 검은 사제들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('검은 사제들', TO_DATE('2015-11-05', 'YYYY-MM-DD'), 108, 5443260, '15세 이상 관람가', '미스터리|드라마', '대한민국', '장재현', '김윤석|강동원|박소담', '뺑소니 교통사고 이후 의문의 증상에 시달리는 한 소녀를 구하기 위해 모두의 반대와 의심 속에서 자신만의 계획을 준비하는 김신부와 그를 돕는 신학생 최부제의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한국형 오컬트 영화의 본격적인 시작을 알린 작품. 후반부 구마 의식 장면이 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '강동원 사제복... 그것만으로도 볼 가치가 충분합니다. 영화도 무섭고 재밌어요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '낯선 소재를 대중적인 장르 영화의 틀 안에서 영리하게 풀어냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '박소담 배우의 신들린 연기가 영화의 긴장감을 극대화한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 액션은 없지만, 악령과의 사투가 주는 긴박감이 있다.');

    -- 숨바꼭질
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('숨바꼭질', TO_DATE('2013-08-14', 'YYYY-MM-DD'), 107, 5604106, '15세 이상 관람가', '스릴러', '대한민국', '허정', '손현주|문정희|전미선', '고급 아파트에서 완벽한 가정을 꾸리고 사는 성공한 사업가 ‘성수’는 어느 날 형의 실종 소식을 듣고, 수십 년 만에 찾아간 형의 아파트에서 집집마다 새겨진 이상한 암호를 발견한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '현실적인 소재라서 더 무서운 스릴러. 우리 집 초인종도 다시 보게 된다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '손현주 배우의 스릴러 연기는 믿고 봅니다. 정말 심장 쫄깃했어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '주거 공간이라는 가장 안전해야 할 곳이 위협받는다는 설정이 효과적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '범인과 벌이는 사투가 긴박감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '후반부 전개가 다소 아쉽지만, 초중반의 긴장감은 훌륭하다.');
    
    -- 잠
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('잠', TO_DATE('2023-09-06', 'YYYY-MM-DD'), 94, 1470200, '15세 이상 관람가', '공포|미스터리', '대한민국', '유재선', '정유미|이선균', '행복한 신혼부부 현수와 수진. 어느 날, 옆에 잠든 남편 현수가 이상한 말을 중얼거린다. 잠들면 다른 사람으로 변해 끔찍한 행동을 저지르는 현수. 수진은 매일 밤 잠드는 순간 시작되는 공포에 잠들지 못한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '신선한 소재와 뛰어난 연출. 장르적 쾌감이 상당하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '전반부의 빌드업은 훌륭하나, 후반부 전개가 다소 급작스럽다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '배우들 연기가 정말 현실적이어서 더 무서웠어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 없지만 심리적 압박감이 엄청나네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '가장 일상적인 공간인 집과 잠이 가장 무서운 공포의 대상이 된다.');
    
    -- 밀수
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('밀수', TO_DATE('2023-07-26', 'YYYY-MM-DD'), 129, 5143254, '15세 이상 관람가', '액션|범죄', '대한민국', '류승완', '김혜수|염정아|조인성|박정민', '평화롭던 바닷가 마을 군천에 화학 공장이 들어서면서 하루아침에 일자리를 잃은 해녀들. 먹고살기 위한 방법을 찾던 승부사 춘자는 바다 속에 던진 물건을 건져 올리기만 하면 큰돈을 벌 수 있다는 밀수의 세계를 알게 되고 해녀들의 리더 진숙에게 솔깃한 제안을 한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '역시 류승완 감독! 수중 액션씬이 정말 신선하고 통쾌했어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '배우들의 케미가 돋보이는 웰메이드 케이퍼 무비. 70년대 레트로 감성도 훌륭하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '김혜수, 염정아 배우 조합 최고! 시간 가는 줄 모르고 봤네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '익숙한 서사지만, 캐릭터의 힘과 노련한 연출로 장르적 쾌감을 극대화했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '바다 속에서 벌어지는 밀수 장면은 스릴러 못지않게 긴장감이 넘쳤다.');

    -- 범죄도시3
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('범죄도시3', TO_DATE('2023-05-31', 'YYYY-MM-DD'), 105, 10682813, '15세 이상 관람가', '액션|범죄', '대한민국', '이상용', '마동석|이준혁|아오키 무네타카', '대체불가 괴물형사 마석도, 서울 광수대로 발탁! 베트남 납치 살인사건 해결 7년 뒤, 새로운 팀원들과 함께 살인사건을 조사하던 중, 사건의 배후에 신종 마약 사건이 연루되어 있음을 알게 된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '마석도의 시원한 액션은 여전하다! 스트레스 해소에 이만한 영화가 없다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '이번에도 너무 재밌었어요! 초롱이 캐릭터 진짜 웃겨요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '전작들의 성공 공식을 그대로 따라가지만, 그만큼의 재미는 보장한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 6.5, '캐릭터의 매력에 지나치게 의존하는 경향이 보이지만, 대중적인 오락 영화로서의 미덕은 갖췄다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '이준혁 배우의 빌런 연기가 인상 깊었다. 마석도에게 대항하는 모습이 꽤나 위협적이었음.');

    -- 존 윅 4
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('존 윅 4', TO_DATE('2023-04-12', 'YYYY-MM-DD'), 169, 1924294, '청소년 관람불가', '액션', '미국', '채드 스타헬스키', '키아누 리브스|견자단|빌 스카스가드', '죽을 위기에서 살아난 ‘존 윅’은 ‘최고 회의’를 쓰러트릴 방법을 찾아낸다. 비로소 완전한 자유의 희망을 보지만, NEW 빌런 ‘그라몽 후작’과 전 세계의 최강 연합은 ‘존 윅’의 목에 거액의 현상금을 걸고 그를 추격한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '액션의 정점. 3시간에 가까운 러닝타임이 전혀 지루하지 않다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '액션 시퀀스의 설계와 연출이 예술의 경지에 이르렀다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '서사를 포기하고 액션에 모든 것을 쏟아부은 영리한 선택. 장르의 쾌감을 극한까지 끌어올렸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '견자단 배우 너무 멋있어요! 개선문 카체이싱 씬은 정말 역대급.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '끊임없이 몰아치는 액션에 숨 막힐 지경. 주인공이 겪는 고통이 느껴져서 공포스러울 정도.');

    -- 공작
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('공작', TO_DATE('2018-08-08', 'YYYY-MM-DD'), 137, 4974513, '12세 이상 관람가', '드라마|첩보', '대한민국', '윤종빈', '황정민|이성민|조진웅|주지훈', '1993년, 북한 핵 개발을 둘러싸고 한반도의 위기가 고조된다. 정보사 소령 출신으로 안기부에 스카우트된 박석영은 ‘흑금성’이라는 암호명으로 북 고위층 내부로 잠입하라는 지령을 받는다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '총성 없는 전쟁터. 대화만으로도 이렇게 긴장감 넘치는 첩보 영화를 만들 수 있다니.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '실화를 바탕으로 한 묵직한 서사와 배우들의 명연기가 어우러진 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '냉전 시대의 이념 대립과 그 속에서 피어난 인간적인 교감을 설득력 있게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '황정민, 이성민 배우의 연기 대결이 정말 압권입니다. 마지막 장면의 여운이 길게 남아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '언제 정체가 탄로 날지 모르는 스파이의 삶이 주는 압박감이 공포스럽다.');

    -- 강철비
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('강철비', TO_DATE('2017-12-14', 'YYYY-MM-DD'), 139, 4452899, '15세 이상 관람가', '액션|드라마', '대한민국', '양우석', '정우성|곽도원', '북한 내 쿠데타 발생! 북한 1호가 남한으로 긴급히 넘어온다! 쿠데타 발생 직후 최정예 요원 엄철우는 치명상을 입은 북한 1호와 함께 남한으로 내려온다. 그 사이 북한은 대한민국과 미국을 상대로 선전포고를, 남한은 계엄령을 선포한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '묵직한 주제를 다루면서도 액션 영화로서의 재미를 놓치지 않았다. 특히 후반부 전투씬이 인상적.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '남북 분단 현실에 대한 날카로운 통찰과 과감한 상상력이 돋보이는 블록버스터.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '정우성과 곽도원, 남북의 두 남자가 보여주는 의외의 케미가 영화의 가장 큰 매력.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '조금 어려운 내용일 줄 알았는데, 중간중간 유머도 있고 재밌게 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '핵전쟁의 위기가 주는 공포가 현실적으로 다가와서 정말 무서웠다.');

    -- 써니
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('써니', TO_DATE('2011-05-04', 'YYYY-MM-DD'), 124, 7453715, '15세 이상 관람가', '코미디|드라마', '대한민국', '강형철', '유호정|심은경|강소라|고수희|김민영', '가장 찬란한 순간, 우리는 하나였다! 전라도 벌교 전학생 나미는 긴장하면 터져 나오는 사투리 탓에 첫날부터 날라리들의 놀림감이 된다. 이때 범상치 않은 포스의 친구들이 어리버리한 그녀를 도와주는데…')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '웃다가 울다가... 제 학창 시절 생각나서 너무 좋았어요. 인생 영화!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '과거와 현재를 오가는 능숙한 편집과 80년대 대중문화를 소환하는 방식이 탁월하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '복고 코드를 통해 세대적 공감을 이끌어내는 데 성공한 상업영화의 좋은 예.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '여고생들의 패싸움 장면이 의외로 박진감 넘치고 재밌었다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '본드 흡입 장면은 시대상을 보여주지만 조금 섬뜩했어요.');
    
    -- 과속스캔들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('과속스캔들', TO_DATE('2008-12-03', 'YYYY-MM-DD'), 108, 8245597, '12세 이상 관람가', '코미디|드라마', '대한민국', '강형철', '차태현|박보영|왕석현', '한때 아이돌 스타로 10대 소녀 팬들의 영원한 우상이었던 남현수. 지금은 서른 중반의 라디오 DJ. 어느 날 애청자를 자처하며 하루도 빠짐없이 라디오에 사연을 보내오는 황정남이라는 여자애가 나타나 자신이 현수의 딸이라 주장한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '정말 배꼽 빠지게 웃었어요! 박보영 배우는 너무 사랑스럽고 왕석현 군은 너무 귀여워요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '예상 가능한 설정이지만, 재치 있는 대사와 배우들의 호연으로 유쾌한 코미디를 완성했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '강형철 감독의 감각적인 연출과 음악 활용이 돋보이는 데뷔작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '유치원 싸움 장면이 이 영화의 유일한 액션씬? ㅋㅋ 가볍게 보기 좋아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '하루아침에 할아버지가 된다는 설정이 남자 주인공에겐 공포였을지도.');

    -- 스물
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('스물', TO_DATE('2015-03-25', 'YYYY-MM-DD'), 115, 3045183, '15세 이상 관람가', '코미디|드라마', '대한민국', '이병헌', '김우빈|이준호|강하늘', '인생의 가장 부끄러운 순간을 함께 한 스무 살 동갑내기 세 친구의 자체발광 코미디! 무엇이든 될 수 있고, 누구도 사랑할 수 있는, 무한대의 가능성이 열리는 나이 스물을 맞이한 혈기 왕성한 세 친구의 사랑과 우정을 그린 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '남자들의 대화가 이렇게 웃긴지 몰랐어요 ㅋㅋ 철없지만 귀여운 세 친구 이야기.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '이병헌 감독 특유의 ‘말맛’이 살아있는 대사가 일품. B급 감성의 향연.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '가볍고 유치하지만, 그 시절의 청춘을 재기 발랄하게 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '소소반점 싸움 씬이 가장 기억에 남네요. 어설픈 액션이 웃음 포인트.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '공포는 없지만, 미래에 대한 막막함이 스무 살에겐 공포였을 수도.');

    -- 형
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('형', TO_DATE('2016-11-23', 'YYYY-MM-DD'), 110, 2982637, '12세 이상 관람가', '코미디|드라마', '대한민국', '권수경', '조정석|디오|박신혜', '유도 국가대표 고두영은 경기 도중 불의의 사고를 당하게 되고 이 소식을 들은 사기전과 10범의 형 고두식은 눈물의 석방 사기극을 펼친다! 하루아침에 앞이 깜깜해진 동생을 핑계로 1년간 보호자 자격으로 가석방된 두식. 15년 동안 단 한 번도 연락이 없던 뻔뻔한 형이 집으로 돌아오고, 보호자 노릇은커녕 ‘동생’ 팔아먹기 좋은 세상을 다시 만난 두식은 개털 같은 내일을 위해 두영을 귀찮게 하기 시작하는데...')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '조정석 배우 코미디 연기는 정말 믿고 봅니다. 웃기다가 마지막엔 엄청 울었네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '전형적인 신파 코미디 공식을 따르지만, 조정석의 하드캐리가 영화를 살렸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '두 주연 배우의 브로맨스 케미가 영화의 가장 큰 동력.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 6.5, '큰 액션은 없지만, 조정석 배우의 찰진 욕설이 타격감이 있네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '갑자기 시력을 잃게 된 주인공의 절망감이 공포스럽게 다가왔다.');
    
    -- 결혼전야
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('결혼전야', TO_DATE('2013-11-21', 'YYYY-MM-DD'), 118, 1214840, '15세 이상 관람가', '코미디|로맨스', '대한민국', '홍지영', '김강우|김효진|이연희|옥택연|마동석', '결혼 7일전, 4커플의 메리지 블루! 우리는 과연 결혼할 수 있을까? 세상 누구보다 행복해야 할 결혼식 일주일 전, 생애 최악의 위기를 맞이한 4커플의 파란만장한 메리지 블루를 그린 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '여러 커플들 이야기 보는 재미가 쏠쏠했어요. 마동석 배우가 특히 웃겼어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '옴니버스 구성으로 다양한 결혼의 모습을 보여주려는 시도가 좋았다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 6.5, '각 커플의 갈등이 다소 피상적으로 다뤄진 점은 아쉽지만, 가볍게 즐기기 좋은 로맨틱 코미디.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '마동석 배우가 요트에서 보여주는 액션(?)이 제일 인상 깊었네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '결혼 직전에 겪는 심리적 불안감, 메리지 블루가 일종의 공포일 수 있겠네요.');

    -- 헤어질 결심
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('헤어질 결심', TO_DATE('2022-06-29', 'YYYY-MM-DD'), 138, 1899147, '15세 이상 관람가', '미스터리|로맨스', '대한민국', '박찬욱', '박해일|탕웨이', '산 정상에서 추락한 한 남자의 변사 사건. 담당 형사 해준은 사망자의 아내 서래와 마주하게 된다. 남편의 죽음 앞에서 특별한 동요를 보이지 않는 서래. 경찰은 그녀를 용의선상에 올리지만, 해준은 그녀를 탐문하며 서서히 그녀에게 빠져든다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '박찬욱 감독의 미장센과 연출이 정점에 달한 작품. 품격 있는 미스터리 로맨스.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '수사극의 외피를 쓴 멜로드라마. 안개처럼 모호한 인물들의 감정선을 섬세하게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '보고 나면 여운이 정말 길게 남는 영화. 대사 하나하나가 시 같아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '진실이 무엇인지 알 수 없는 불확실성과 인물들의 미스터리한 분위기가 공포감을 자아낸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '액션은 거의 없지만, 용의자를 쫓는 형사의 집요한 추격 과정이 긴장감 넘친다.');

    -- 독전
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('독전', TO_DATE('2018-05-22', 'YYYY-MM-DD'), 123, 5202476, '15세 이상 관람가', '범죄|액션', '대한민국', '이해영', '조진웅|류준열|김주혁|김성령|박해준', '의문의 폭발 사고 후, 오랫동안 마약 조직을 추적해온 형사 원호의 앞에 조직의 후견인인 오연옥과 버림받은 조직원 락이 나타난다. 그들의 도움으로 아시아 마약 시장의 거물 진하림과 조직의 숨겨진 인물 브라이언을 만나게 되는데…')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '스타일리시한 연출과 강렬한 캐릭터들의 향연. 특히 故 김주혁 배우의 연기는 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '장르적 쾌감을 극대화한 캐릭터 무비. 원작의 장점을 영리하게 한국적으로 변주했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '긴장감 넘치는 심리전과 더불어 후반부 액션씬도 훌륭하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '배우들 연기 보는 맛이 있는 영화. 누가 진짜 ‘이선생’일지 계속 추리하면서 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '마약에 중독된 인물들의 광기가 공포스럽게 느껴졌다.');

    -- 사라진 밤
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('사라진 밤', TO_DATE('2018-03-07', 'YYYY-MM-DD'), 101, 1315663, '15세 이상 관람가', '스릴러|미스터리', '대한민국', '이창희', '김상경|김강우|김희애', '국과수 사체보관실에서 재벌가의 회장 윤설희의 시체가 사라진다. 사건을 수사하던 형사 우중식은 남편 박진한을 유력한 용의자로 지목한다. 진한은 아내를 살해했지만 시체를 훔치지는 않았다고 주장하며, 그녀가 살아있을지도 모른다는 불안에 떤다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '탄탄한 원작을 바탕으로 한 군더더기 없는 스릴러. 제한된 공간에서의 서스펜스 구축이 뛰어나다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '죽은 아내가 살아 돌아왔을지도 모른다는 설정 자체가 주는 공포감이 상당하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '반전이 정말 대박이에요. 마지막까지 긴장을 놓을 수 없었어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '장르적 재미에 충실한 웰메이드 스릴러. 배우들의 연기 앙상블도 좋다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 6.5, '몸으로 싸우는 액션은 없지만, 범인을 잡으려는 형사와 진실을 숨기려는 남편의 심리전이 격렬하다.');
    
    -- 화차
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('화차', TO_DATE('2012-03-08', 'YYYY-MM-DD'), 117, 2436594, '15세 이상 관람가', '미스터리', '대한민국', '변영주', '이선균|김민희|조성하', '결혼 한 달 전, 부모님 댁에 내려가던 중 휴게소에 들른 문호와 선영. 커피를 사러 간 문호를 기다리던 선영이 갑자기 사라진다. 그녀를 찾기 위해 전직 강력계 형사인 사촌 형 종근에게 도움을 청한 문호는, 그녀의 모든 것이 가짜였다는 사실을 알게 된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '사라진 여인의 흔적을 따라가며 한국 사회의 어두운 단면을 파고드는 수작. 김민희의 재발견.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '미야베 미유키의 원작을 한국적 현실에 맞게 훌륭하게 각색했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한 사람의 인생이 통째로 뒤바뀔 수 있다는 사실과 사채의 무서움이 공포 그 자체.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보는 내내 너무 안타깝고 마음 아팠어요. 결말이 너무 슬퍼요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '사라진 약혼녀를 쫓는 주인공의 추적이 긴장감 넘친다.');

    -- 거미집
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('거미집', TO_DATE('2023-09-27', 'YYYY-MM-DD'), 132, 313170, '15세 이상 관람가', '코미디|드라마', '대한민국', '김지운', '송강호|임수정|오정세|전여빈|정수정', '1970년대, 다 찍은 영화 ‘거미집’의 결말을 다시 찍으면 더 좋아질 거라는 강박에 빠진 김감독. 하지만 바뀐 대본을 이해하지 못하는 배우와 제작자의 반대에 부딪히며 촬영은 아수라장이 되는데…')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '영화 만들기에 대한 광기와 열정을 담은 블랙코미디의 걸작. 김지운 감독의 자기 고백서.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '액자식 구성과 앙상블 캐스트의 호연, 70년대 영화 현장을 완벽하게 재현한 미장센이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '웃기고 정신없는데, 영화에 대한 애정이 느껴져서 좋았어요. 배우들 연기 대박이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '영화 촬영 현장에서 벌어지는 소동이 마치 한 편의 액션 활극 같다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '결말을 바꿔야 한다는 감독의 강박과 광기가 공포스럽게 느껴졌다.');

    -- 마당을 나온 암탉
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('마당을 나온 암탉', TO_DATE('2011-07-28', 'YYYY-MM-DD'), 93, 2202631, '전체 관람가', '애니메이션', '대한민국', '오성윤', '문소리|유승호|최민식|박철민', '양계장을 탈출해 세상 밖으로 나온 암탉 ‘잎싹’과 청둥오리 ‘초록’의 꿈과 자유를 향한 용감한 도전을 그린 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한국 애니메이션의 저력을 보여준 작품. 아름다운 그림체와 감동적인 서사가 일품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '모성애라는 보편적인 주제를 통해 전 세대를 아우르는 감동을 선사한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '아이와 함께 봤는데 제가 더 많이 울었어요. 너무 감동적이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '족제비와의 추격전 장면은 웬만한 액션 영화 못지않게 긴장감이 넘쳤다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '자연의 냉혹한 약육강식 세계를 보여주는 장면들은 아이들에게는 꽤나 공포스러울 수 있다.');

    -- 돼지의 왕
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('돼지의 왕', TO_DATE('2011-11-03', 'YYYY-MM-DD'), 97, 19282, '청소년 관람불가', '애니메이션|스릴러', '대한민국', '연상호', '양익준|오정세|김혜나', '성공한 사업가가 된 경민은 아내를 살해하고, 중학교 동창이었던 종석을 찾아간다. 그들은 15년 전, 그들의 우상이었던 ‘돼지의 왕’ 철이와 함께했던 충격적인 과거를 이야기하기 시작한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '애니메이션이라는 매체를 통해 학교 폭력과 계급 사회의 문제를 극단까지 파고든 문제작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '연상호 감독의 날카로운 사회 비판 의식이 담긴 충격적인 데뷔작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '그 어떤 공포 영화보다 현실적이고 잔인하다. 보고 나면 기분이 몹시 불편하지만, 그만큼 강렬하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 충격적이고 어두워서 보기 힘들었지만, 많은 생각을 하게 만드는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '폭력 묘사가 굉장히 사실적이고 처절하다.');
    
    -- 서울역
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('서울역', TO_DATE('2016-08-17', 'YYYY-MM-DD'), 92, 147138, '15세 이상 관람가', '애니메이션|공포', '대한민국', '연상호', '류승룡|심은경|이준', '어느 날, 서울역에 이상한 바이러스가 퍼지기 시작하고, 도시 전체가 아비규환이 된다. 집을 나온 소녀 혜선과 그녀를 찾는 아버지, 그리고 남자친구의 생존을 건 사투가 시작된다. (영화 ‘부산행’의 프리퀄)')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '부산행의 시작을 알리는 절망적인 프리퀄. 좀비보다 무서운 것은 인간이라는 메시지가 더 강렬하게 다가온다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '실사 영화 못지않은 속도감과 긴장감을 보여준다. 감독의 사회 비판적 시선이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '디스토피아적 세계관을 통해 우리 사회의 가장 어두운 민낯을 드러낸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '부산행 보고 봤는데, 내용이 이어져서 흥미로웠어요. 근데 너무 꿈도 희망도 없어서 슬펐어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '좀비로부터 도망치는 장면들의 연출이 박진감 넘친다.');
    
    -- 언더독
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('언더독', TO_DATE('2019-01-16', 'YYYY-MM-DD'), 102, 196843, '전체 관람가', '애니메이션', '대한민국', '오성윤|이춘백', '디오|박소담|박철민', '하루아침에 운명이 바뀐 강아지 ‘뭉치’가 개성 강한 거리의 견공들과 함께 진정한 자유를 찾아 떠나는 위대한 모험을 그린 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '한국적인 정서를 담아낸 로드무비 애니메이션. 아름다운 작화와 따뜻한 메시지가 좋다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '강아지들이 너무 귀엽고 용감해서 감동받았어요. 반려동물을 키우는 사람이라면 꼭 보세요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '유기견 문제를 무겁지 않게 다루면서도 생명의 소중함이라는 주제를 놓치지 않는다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '사냥꾼에게 쫓기는 장면들이 꽤나 긴장감 있다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '주인에게 버려진 강아지들의 슬픔과 야생의 위험이 현실적으로 그려져 마음 아팠다.');

    -- 태일이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('태일이', TO_DATE('2021-12-01', 'YYYY-MM-DD'), 100, 117769, '12세 이상 관람가', '애니메이션|드라마', '대한민국', '홍준표', '장동윤|염혜란|진선규', '1970년 평화시장, 재단사 ‘태일’은 열악한 노동 환경 속에서 고통받는 어린 여공들을 보며 현실을 바꾸기 위해 노력한다. 그의 뜨거웠던 삶을 그린 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '전태일 열사의 삶을 애니메이션으로 진정성 있게 담아냈다. 묵직한 울림을 주는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '역사적 인물을 다루는 사려 깊은 태도와 따뜻한 그림체가 인상적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '잘 몰랐던 역사에 대해 알게 되었고, 너무 감동받았습니다. 꼭 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '당시 노동자들의 비참한 현실이 어떤 공포 영화보다 무섭고 가슴 아프게 다가왔다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '부당한 현실에 맞서 싸우는 주인공의 모습이 큰 감동을 준다.');

    -- 곤지암
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('곤지암', TO_DATE('2018-03-28', 'YYYY-MM-DD'), 94, 2675775, '15세 이상 관람가', '공포', '대한민국', '정범식', '위하준|박지현|오아연|문예원|박성훈', '1979년 환자 42명의 집단 자살과 병원장의 실종 이후, 섬뜩한 괴담으로 둘러싸인 곤지암 정신병원으로 공포체험을 떠난 7명의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '한국 공포영화의 새로운 지평을 연 파운드 푸티지. 샬롬 장면은 정말 역대급.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '영화관에서 소리 지르면서 봤어요. 너무 무서워서 팝콘 다 쏟았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '체험형 공포라는 장르적 특성을 영리하게 활용하여 극강의 몰입감을 선사한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '전반부의 빌드업이 다소 길지만, 후반 30분 동안 몰아치는 공포가 압도적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '도망치는 장면들에서 배우들의 필사적인 움직임이 공포감을 더한다.');

    -- 알포인트
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('알포인트', TO_DATE('2004-08-20', 'YYYY-MM-DD'), 106, 1689300, '15세 이상 관람가', '공포|전쟁', '대한민국', '공수창', '감우성|손병호|박원상', '1972년, 베트남 전쟁 막바지, 6개월 전 작전 지역에서 실종된 18명의 수색대원들로부터 계속적인 구조요청이 오자, 수색 명령을 받은 9명의 군인들이 ‘로미오 포인트’(알포인트)로 향한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '보이지 않는 존재가 주는 심리적 공포의 극치. 한국 공포 영화의 레전드.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '전쟁이라는 극한 상황과 미지의 공간이 주는 공포를 탁월하게 결합했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '전쟁의 비극과 인간의 광기를 심리적 공포로 풀어낸 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '귀신이 직접 나오는 장면보다 분위기만으로도 이렇게 무서울 수 있다는 걸 처음 알았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '전쟁 영화인 줄 알았는데... 총격씬보다 심리전이 더 무서운 영화.');

    -- 기담
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('기담', TO_DATE('2007-08-01', 'YYYY-MM-DD'), 98, 642959, '15세 이상 관람가', '공포|미스터리', '대한민국', '정가형제', '진구|이동규|김태우|김보경', '1942년 경성, 서양식 병원 ‘안생병원’을 배경으로 벌어지는 세 가지 기이하고 슬픈 사랑 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '엄마 귀신 장면은 한국 공포영화사에 길이 남을 명장면. 아름답고 서늘한 공포.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '시대적 배경과 어우러진 미장센이 압도적인 작품. 공포를 넘어 예술의 경지에 이르렀다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '옴니버스 형식으로 엮인 각각의 이야기가 유기적으로 연결되며 깊은 여운을 남긴다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '무서운데 너무 슬픈 이야기. 영상미가 정말 아름다워요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '움직임은 적지만, 분위기가 모든 것을 압도하는 영화.');

    -- 사바하
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('사바하', TO_DATE('2019-02-20', 'YYYY-MM-DD'), 122, 2398595, '15세 이상 관람가', '미스터리|스릴러', '대한민국', '장재현', '이정재|박정민|이재인', '신흥 종교 집단을 쫓던 ‘박목사’가 의문의 인물과 사건들을 마주하게 되며 시작되는 미스터리 스릴러.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '검은 사제들, 파묘를 잇는 K-오컬트의 진수. 묵직하고 음산한 분위기가 일품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '종교와 믿음이라는 주제를 깊이 파고드는 지적인 미스터리 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '촘촘하게 짜인 서사와 상징들이 곱씹어볼수록 새로운 의미를 발견하게 한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '조금 어렵긴 한데, 분위기가 정말 압도적이에요. 배우들 연기도 너무 좋았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '정적인 영화지만, 진실을 파헤쳐 가는 과정이 스릴 넘친다.');

    -- 변신
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('변신', TO_DATE('2019-08-21', 'YYYY-MM-DD'), 113, 1804689, '15세 이상 관람가', '공포|스릴러', '대한민국', '김홍선', '배성우|성동일|장영남', '사람의 모습으로 변신하는 악마가 가족 안에 숨어들면서 기이하고 섬뜩한 사건들이 벌어진다. 서로 의심하고 증오하게 되는 가운데, 구마사제인 삼촌 ‘중수’가 그들을 돕기 위해 나선다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '가족이라는 가장 안전한 울타리가 무너지는 공포. 악마가 가족의 모습으로 나타난다는 설정이 정말 소름 끼친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '성동일, 장영남 배우 연기가 너무 현실적이어서 더 무서웠어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '익숙한 오컬트 장르의 공식을 따르지만, 가족 드라마와 결합하여 차별점을 만들었다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '배우들의 열연이 영화의 공포를 한층 더 끌어올린다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '후반부 구마 의식 장면에서 벌어지는 사투가 긴박감 있다.');

    -- 타짜
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('타짜', TO_DATE('2006-09-28', 'YYYY-MM-DD'), 139, 5685715, '청소년 관람불가', '범죄|드라마', '대한민국', '최동훈', '조승우|김혜수|백윤식|유해진|김윤석', '가구공장에서 일하며 남루한 삶을 사는 ‘고니’. 대학보다 짜릿한 것이 있다는 화투판에 뛰어든 그는 삼 년 만에 모든 것을 날리고, 우연히 전설의 타짜 ‘평경장’을 만난다. 그를 만나면서 고니는 새로운 인생을 시작하는데...')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '한국형 케이퍼 무비의 교과서. 캐릭터, 대사, 연출 어느 하나 빠지는 것이 없는 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '허영만 화백의 원작을 스크린에 완벽하게 구현하며 자신만의 스타일을 구축했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '아직도 회자되는 명대사가 너무 많아요. 배우들 연기 보는 재미가 최고!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '화투판에서의 심리전이 총격씬보다 더 긴장감 넘친다. 아귀의 망치 액션은 덤.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '밑장 빼다 걸리면 손모가지 날아가는 도박판의 살벌함이 공포 그 자체.');

    -- 부당거래
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('부당거래', TO_DATE('2010-10-28', 'YYYY-MM-DD'), 119, 2765380, '청소년 관람불가', '범죄|드라마', '대한민국', '류승완', '황정민|류승범|유해진', '온 국민을 충격으로 몰아넣은 연쇄 살인 사건. 계속된 검거 실패로 대통령까지 직접 사건에 개입하자, 경찰청은 가짜 범인을 만들어 사건을 종결시키려 한다. 이번 사건의 담당으로 지목된 형사 최철기. 그는 스폰서인 건설업자 장석구의 도움으로 유력한 용의자를 잡아 사건을 해결하는 듯 보이지만, 또 다른 거래가 시작된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '한국 사회의 부패 사슬을 날카롭게 파고드는 류승완 감독의 걸작. 각본과 연기가 완벽하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '경찰, 검찰, 스폰서 간의 먹이사슬을 통해 권력의 속성을 적나라하게 보여준다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '"호의가 계속되면, 그게 권리인 줄 알아요." 류승범 배우 연기 진짜 미쳤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '시스템 자체가 악이 되어버린 현실이 주는 공포와 씁쓸함이 대단하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '물리적 액션보다 인물들 간의 팽팽한 기 싸움과 두뇌 싸움이 더 격렬하다.');

    -- 친구
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('친구', TO_DATE('2001-03-31', 'YYYY-MM-DD'), 118, 8181377, '청소년 관람불가', '드라마|액션', '대한민국', '곽경택', '유오성|장동건|서태화|정운택', '1976년 부산. 한 동네에서 자란 네 친구. 언제까지나 함께 할 것 같았던 그들은 성장하며 서로 다른 길을 걷게 되고, 피할 수 없는 숙명의 소용돌이에 휘말리게 된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한국형 느와르의 한 획을 그은 작품. 남자들의 우정과 배신을 거칠게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '시대적 배경과 부산이라는 공간의 특성을 잘 살려내어 영화의 리얼리티를 높였다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '"내가 니 시다바리가?" 장동건 배우의 연기 변신이 충격적이었고, 너무 멋있었어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '날 것 그대로의 거친 액션과 칼부림 장면들이 인상적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '어제의 친구가 오늘의 적이 되는 조폭 세계의 비정함이 공포스럽게 다가온다.');

    -- 범죄와의 전쟁: 나쁜놈들 전성시대
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('범죄와의 전쟁: 나쁜놈들 전성시대', TO_DATE('2012-02-02', 'YYYY-MM-DD'), 133, 4720050, '청소년 관람불가', '범죄|드라마', '대한민국', '윤종빈', '최민식|하정우|조진웅|마동석|곽도원', '1982년 부산. 해고될 위기에 처한 비리 세관원 최익현은 순찰 중 적발한 필로폰을 일본으로 밀수출, 부산 최대 조직의 젊은 보스 최형배와 손을 잡는다. 익현은 탁월한 임기응변과 특유의 친화력으로 형배의 신뢰를 얻는 데 성공하는데…')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '80년대 한국 사회를 배경으로 펼쳐지는 한 편의 대서사시. 최민식의 인생 연기.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '혈연, 지연, 학연으로 얽힌 한국형 권력의 형성과 몰락을 예리하게 포착했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '하정우 먹방의 시작! 배우들 연기 보는 맛이 일품인 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '남자들의 거친 액션과 기 싸움이 영화 내내 팽팽한 긴장감을 유지한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '믿었던 사람에게 배신당하는 것이 가장 무서운 법. 권력 다툼의 비정함을 보여준다.');

    -- 다만 악에서 구하소서
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('다만 악에서 구하소서', TO_DATE('2020-08-05', 'YYYY-MM-DD'), 108, 4357803, '15세 이상 관람가', '범죄|액션', '대한민국', '홍원찬', '황정민|이정재|박정민', '태국에서 충격적인 납치사건이 발생하고 마지막 청부살인 미션을 끝낸 암살자 인남은 그것이 자신과 관계된 것임을 알게 된다. 한편, 자신의 형제가 인남에게 암살됐다는 것을 알게 된 레이. 무자비한 복수를 계획한 레이는 인남을 쫓기 시작하는데…')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '스타일리시하고 처절한 하드보일드 액션의 진수. 황정민과 이정재의 추격전이 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '신세계 이후 다시 만난 두 배우의 케미가 폭발한다. 박정민의 연기 변신도 놀랍다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '단순한 서사를 압도적인 액션과 캐릭터의 힘으로 밀어붙인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '이정재 배우 정말 무섭게 나와요. 액션이 너무 시원시원해서 재밌었어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '자비 없는 복수귀 레이의 추격이 공포 영화 못지않게 무서웠다.');

    -- 비긴 어게인
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('비긴 어게인', TO_DATE('2014-08-13', 'YYYY-MM-DD'), 104, 3479768, '15세 이상 관람가', '드라마|로맨스|뮤직', '미국', '존 카니', '키이라 나이틀리|마크 러팔로|애덤 리바인', '싱어송라이터인 ‘그레타’는 남자친구 ‘데이브’가 스타가 되면서 이별 통보를 받는다. 한편, 왕년의 스타 프로듀서였던 ‘댄’은 회사에서 해고당한 날, 그레타의 자작곡을 듣게 되고 그녀에게 음반 제작을 제안한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '음악이 어떻게 사람을 치유하고 연결하는지 보여주는 사랑스러운 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '노래가 너무 좋아서 영화 보고 나서 계속 들었어요. OST 맛집!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '뉴욕의 거리를 스튜디오 삼아 음악을 만들어가는 과정이 낭만적으로 그려졌다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '큰 사건은 없지만, 음악의 힘이 영화를 끝까지 끌고 간다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '주인공들이 겪는 실패와 좌절이 현실적이어서 마음 아팠다.');

    -- 라라랜드
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('라라랜드', TO_DATE('2016-12-07', 'YYYY-MM-DD'), 127, 3624009, '12세 이상 관람가', '드라마|뮤지컬|로맨스', '미국', '데이미언 셔젤', '라이언 고슬링|엠마 스톤', '꿈을 꾸는 사람들을 위한 별들의 도시, ‘라 라 랜드’. 재즈 피아니스트 ‘세바스찬’과 배우 지망생 ‘미아’, 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '고전 뮤지컬에 대한 경의와 현대적인 감각이 어우러진 마법 같은 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '꿈과 사랑에 대한 달콤하고도 씁쓸한 통찰. 황홀한 음악과 영상미가 압도적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '영상도, 노래도, 이야기도 모두 완벽했어요. 마지막 10분은 정말 잊을 수가 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '꿈과 현실 사이에서 갈등하는 주인공들의 모습이 안타까웠고, 이루어지지 못한 사랑이 슬펐다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '화려한 춤과 움직임이 가득한, 눈과 귀가 즐거운 영화.');

    -- 위플래쉬
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('위플래쉬', TO_DATE('2015-03-12', 'YYYY-MM-DD'), 106, 1588669, '15세 이상 관람가', '드라마', '미국', '데이미언 셔젤', '마일즈 텔러|J.K. 시몬스', '최고의 드러머가 되기 위해 무엇이든 할 각오가 되어 있는 신입생 ‘앤드류’는 최고의 실력자이지만 동시에 최악의 폭군인 ‘플레쳐’ 교수의 밴드에 들어가게 된다. 광기가 폭발하는 두 남자의 대결이 시작된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '광기 어린 재능과 집요한 교육이 만났을 때의 폭발적인 시너지. 마지막 10분은 전율 그 자체.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '이건 음악 영화가 아니라 액션 영화다. 드럼 스틱으로 벌이는 처절한 전투.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '천재를 갈망하는 인간의 욕망과 광기를 숨 막히는 리듬감으로 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '플레쳐 교수의 언어폭력과 정신적 학대는 어떤 공포 영화보다 무섭고 압박감이 심하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '보는 내내 손에 땀을 쥐었어요. 정말 미친 영화라는 말밖에 안 나와요.');

    -- 보헤미안 랩소디
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('보헤미안 랩소디', TO_DATE('2018-10-31', 'YYYY-MM-DD'), 134, 9948386, '12세 이상 관람가', '드라마', '미국|영국', '브라이언 싱어', '라미 말렉|루시 보인턴|귈림 리', '공항에서 수하물 노동자로 일하며 음악의 꿈을 키우던 이민자 출신의 아웃사이더 ‘프레디 머큐리’. 그의 천재적인 재능을 알아본 기타리스트, 드러머와 함께 록 밴드 ‘퀸’을 결성한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '퀸의 노래를 잘 몰랐는데도 너무 재밌었어요. 마지막 라이브 에이드 장면은 정말 콘서트장에 있는 것 같았어요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '전형적인 전기 영화의 틀을 따르지만, 퀸의 음악과 라미 말렉의 신들린 연기가 모든 것을 압도한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '음악의 힘이 얼마나 위대한지 증명하는 영화. 관객을 열광시키는 방법을 정확히 알고 있다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '프레디 머큐리의 무대 위 퍼포먼스는 그 어떤 액션보다 역동적이고 에너지가 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '성공 뒤에 가려진 그의 외로움과 고통이 마음 아프게 다가왔다.');

    -- 스윙키즈
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('스윙키즈', TO_DATE('2018-12-19', 'YYYY-MM-DD'), 133, 1474276, '12세 이상 관람가', '드라마', '대한민국', '강형철', '디오|자레드 그라임스|박혜수|오정세', '1951년 거제도 포로수용소, 새로 부임해 온 소장은 수용소의 대외적 이미지 메이킹을 위해 전쟁 포로들로 댄스단을 결성하는 프로젝트를 계획한다. 우여곡절 끝에 결성된 댄스단의 이름은 ‘스윙키즈’!')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '이념 대립이라는 비극적 현실 속에서 춤을 통해 희망을 이야기하는 역설의 미학.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '강형철 감독 특유의 재기 발랄한 연출과 신나는 음악, 화려한 탭댄스가 어우러진 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '정말 신나고 흥겨운데, 마지막엔 눈물이 펑펑 났어요. 여운이 깊은 영화예요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '탭댄스 장면들의 타격감과 에너지가 정말 대단하다. 최고의 액션!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '전쟁이라는 비극적 상황과 이념이 개인의 꿈을 어떻게 짓밟는지 보여주는 현실이 공포스러웠다.');
END;
/

COMMIT;

PROMPT seed.sql 실행 완료: 대용량 샘플 데이터 입력이 성공적으로 완료되었습니다.