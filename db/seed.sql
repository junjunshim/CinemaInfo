-- =================================================================
-- CinemaInfo 프로젝트 개발/테스트용 대용량 샘플 데이터 (seed.sql)
-- 5명의 유저, 3개 카테고리별 10개 영화(총 30개), 영화당 5개 리뷰(총 150개)
-- =================================================================

-- 1. 사용자 데이터 입력
INSERT INTO users (username, email, password) VALUES ('cinephile', 'cine@phile.com', 'pass1234');
INSERT INTO users (username, email, password) VALUES ('film_critic_wannabe', 'critic@wannabe.com', 'pass5678');
INSERT INTO users (username, email, password) VALUES ('casual_viewer', 'viewer@home.com', 'pass9876');
INSERT INTO users (username, email, password) VALUES ('horror_mania', 'ghost@love.com', 'pass1111');
INSERT INTO users (username, email, password) VALUES ('action_junkie', 'boom@action.com', 'pass2222');

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

    --------------------------------------------------------------------------------
    -- 카테고리 1: 드라마 (10편)
    --------------------------------------------------------------------------------

    -- 1-1. 기생충
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('기생충', TO_DATE('2019-05-30', 'YYYY-MM-DD'), 132, 10313560, '15세 이상 관람가', '드라마', '대한민국', '봉준호', '송강호|이선균|조여정|최우식|박소담', '전원백수인 ‘기택’네 장남 ‘기우’가 고액 과외 면접을 위해 ‘박사장’네 집에 발을 들이면서 시작되는 두 가족의 걷잡을 수 없는 만남.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '봉준호 감독의 정점. 모든 장면이 상징으로 가득하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '자본주의 사회의 계급 문제를 이토록 신랄하고 재치있게 풀어낼 수 있다니.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '웃다가 어느 순간 서늘해지는 영화. 보고나서 생각이 많아져요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '액션은 없지만 긴장감 하나는 최고네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '공포영화는 아니지만 지하실 장면은 정말 소름끼쳤어요.');

    -- 1-2. 미나리
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('미나리', TO_DATE('2021-03-03', 'YYYY-MM-DD'), 115, 1135293, '12세 이상 관람가', '드라마', '미국', '정이삭', '스티븐 연|한예리|윤여정|앨런 김', '1980년대, 아메리칸드림을 좇아 미 아칸소주로 이주한 한인 가정의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '가족의 의미를 다시 생각하게 하는 따뜻하고 아름다운 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '이민자들의 삶을 담담하지만 깊은 울림으로 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '윤여정 배우님 연기가 정말 좋았어요. 잔잔하게 감동적이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 사건은 없지만 계속 보게 되는 힘이 있네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '마음이 정화되는 느낌. 할머니 너무 귀여우심.');

    -- 1-3. 벌새
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('벌새', TO_DATE('2019-08-29', 'YYYY-MM-DD'), 138, 146603, '15세 이상 관람가', '드라마', '대한민국', '김보라', '박지후|김새벽', '1994년, 거대한 세계 앞에서 방황하는 14살 ‘은희’가 한문학원 선생님 ‘영지’를 만나 자신만의 세상을 찾아가는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '섬세한 감정선과 시대상이 어우러진 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '누구나 겪었을 법한 성장통을 담담하게 그려내어 큰 공감을 얻었다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '은희에게 너무 감정이입해서 봤네요. 마음이 아프면서도 따뜻해져요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '조용한 영화지만, 은희의 작은 날갯짓이 큰 파장을 일으키는 느낌.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '가정 폭력 장면은 어떤 공포 영화보다 현실적이라 무서웠다.');

    -- 1-4. 택시운전사
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('택시운전사', TO_DATE('2017-08-02', 'YYYY-MM-DD'), 137, 12189708, '15세 이상 관람가', '드라마|역사', '대한민국', '장훈', '송강호|토마스 크레치만|유해진|류준열', '1980년 5월, 서울의 택시운전사 ‘만섭’이 통금시간 전까지 광주에 다녀오면 큰 돈을 준다는 말에, 독일기자 ‘피터’를 태우고 아무것도 모른 채 광주로 가게 된 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '보고 나서 정말 많이 울었습니다. 꼭 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '아픈 역사를 대중의 눈높이에서 잘 풀어낸 상업영화의 좋은 예.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '송강호 배우의 페이소스가 빛을 발하며 역사의 비극을 효과적으로 전달한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '후반부 카체이싱 장면은 드라마 장르임에도 불구하고 긴장감이 넘쳤다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '실제 역사가 주는 공포와 슬픔이 어떤 영화보다 무겁게 다가왔다.');

    -- 1-5. 남매의 여름밤
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('남매의 여름밤', TO_DATE('2020-08-20', 'YYYY-MM-DD'), 104, 25292, '전체 관람가', '드라마', '대한민국', '윤단비', '최정운|양흥주|박현영', '여름 방학 동안, 아빠와 함께 할아버지 집에서 지내게 된 남매 옥주와 동주가 겪는 가족의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한여름밤의 꿈처럼 아름답고 아련한 가족 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '일상의 순간들을 섬세하게 포착하여 가족의 변화를 그려내는 연출이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '어릴 적 할아버지 댁에 놀러갔던 기억이 나서 좋았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '잔잔하지만 지루하지 않아요. 마음이 편안해지는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '특별한 사건은 없지만 가족이 해체될지도 모른다는 불안감이 스며있다.');

    -- 1-6. 8월의 크리스마스
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('8월의 크리스마스', TO_DATE('1998-01-24', 'YYYY-MM-DD'), 97, 422930, '15세 이상 관람가', '드라마|로맨스', '대한민국', '허진호', '한석규|심은하', '시한부 인생을 사는 사진사 정원과 주차단속요원 다림의 풋풋하고 애틋한 사랑 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '한국 멜로 영화의 교과서. 세월이 흘러도 변치 않는 감동.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '삶과 죽음, 사랑을 담담하게 그려내어 더욱 깊은 여운을 남긴다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '심은하 배우가 너무 예쁘고, 한석규 배우 연기는 마음을 울립니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '조용한 영화지만 감정의 파고가 상당하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '죽음을 앞둔 주인공의 시선이 너무나 담담해서 오히려 더 슬펐다.');

    -- 1-7. 우리들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('우리들', TO_DATE('2016-06-16', 'YYYY-MM-DD'), 95, 50228, '전체 관람가', '드라마', '대한민국', '윤가은', '최수인|설혜인|이서연', '혼자가 되고 싶지 않은 외톨이 선과 비밀을 가진 전학생 지아의 복잡미묘한 여름을 그린 영화.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '아이들의 세계를 통해 관계의 본질을 꿰뚫어보는 놀라운 통찰력.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '어른들의 세계보다 더 복잡하고 잔인한 아이들의 관계를 현실적으로 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '초등학생 때 생각이 나서 너무 공감됐어요. 어른이 되어서 봐도 많은 생각을 하게 되네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '아이들 사이의 미묘한 감정 싸움이 스릴러 영화 못지 않게 긴장감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '큰 움직임은 없지만 감정의 격돌이 대단한 영화.');

    -- 1-8. 소리도 없이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('소리도 없이', TO_DATE('2020-10-15', 'YYYY-MM-DD'), 99, 403126, '15세 이상 관람가', '드라마|범죄', '대한민국', '홍의정', '유아인|유재명', '범죄 조직의 뒤처리를 하며 살아가는 ‘태인’과 ‘창복’이 예기치 않게 유괴된 아이를 떠맡게 되면서 벌어지는 사건.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '대사 한 마디 없는 유아인의 연기가 모든 것을 말한다. 독특하고 신선한 범죄 드라마.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '아이러니한 상황 설정과 블랙코미디가 돋보이는 감독의 감각적인 데뷔작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 7.5, '조금 난해하긴 한데, 영화가 끝나고 곱씹어보게 되는 매력이 있어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 거의 없지만, 예측할 수 없는 전개가 긴장감을 유발한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '기묘하고 불편한 분위기가 영화 내내 계속된다. 독특한 스릴러.');

    -- 1-9. 찬실이는 복도 많지
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('찬실이는 복도 많지', TO_DATE('2020-03-05', 'YYYY-MM-DD'), 96, 28731, '12세 이상 관람가', '드라마|판타지', '대한민국', '김초희', '강말금|윤여정|김영민|윤승아', '일복만 터졌지 남자복은 없던 영화 프로듀서 찬실이 감독의 갑작스런 죽음으로 실직한 후 벌어지는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '사랑스러운 캐릭터와 재치 있는 연출이 돋보이는 힐링 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '영화와 삶에 대한 애정을 따뜻하고 유쾌한 판타지로 풀어냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보고나면 기분이 좋아져요. 찬실이 캐릭터 너무 사랑스러워요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 갈등은 없지만 소소한 재미가 가득합니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '장국영 귀신(?)이 나오는 장면이 코믹하면서도 묘한 분위기를 자아낸다.');

    -- 1-10. 봄날은 간다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('봄날은 간다', TO_DATE('2001-09-28', 'YYYY-MM-DD'), 115, 362481, '15세 이상 관람가', '드라마|로맨스', '대한민국', '허진호', '유지태|이영애', '사운드 엔지니어 상우와 지방 방송국 PD 은수가 만나 사랑에 빠지고 헤어지는 과정을 현실적으로 그린 멜로 영화.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '시간이 흘러 다시 볼 때마다 새로운 의미로 다가오는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '사랑이 변하는 과정을 소리와 풍경으로 섬세하게 담아낸 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '"어떻게 사랑이 변하니?" 라는 대사는 잊을 수가 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '현실적인 연애 이야기. 화려하진 않지만 공감가는 내용.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '사랑이 식어가는 과정이 너무 현실적이라 공포스럽게 느껴질 정도.');


    --------------------------------------------------------------------------------
    -- 카테고리 2: 액션/범죄 (10편)
    --------------------------------------------------------------------------------

    -- 2-1. 범죄도시2
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('범죄도시2', TO_DATE('2022-05-18', 'YYYY-MM-DD'), 106, 12693415, '15세 이상 관람가', '액션|범죄', '대한민국', '이상용', '마동석|손석구|최귀화|박지환', '가리봉동 소탕작전 4년 뒤, 금천서 강력반은 베트남 일대를 장악한 최강 빌런 강해상을 잡기 위해 나선다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '이게 액션이지! 마동석의 주먹은 모든 걸 해결한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '전형적인 서사지만 캐릭터의 힘으로 밀어붙인다. 킬링타임용으로 최고.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '너무 재밌어요! 시간 가는 줄 모르고 봤네요. 손석구 배우 완전 멋있어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '1편의 성공 공식을 그대로 따르지만, 그만큼의 재미는 보장한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '강해상 진짜 무서운 악당이네요. 마석도 아니었으면 큰일날 뻔.');

    -- 2-2. 베테랑
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('베테랑', TO_DATE('2015-08-05', 'YYYY-MM-DD'), 123, 13414484, '15세 이상 관람가', '액션', '대한민국', '류승완', '황정민|유아인|유해진|오달수', '안하무인 유아독존 재벌 3세를 쫓는 광역수사대의 활약을 그린 범죄오락액션.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '아트박스 사장님... 잊을 수 없다. 통쾌함의 극치!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '스트레스 확 풀리는 영화! 유아인 악역 연기 진짜 대박이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '사회 비판 메시지를 대중적인 오락 영화의 틀에 성공적으로 녹여냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '류승완 감독의 장기가 제대로 발휘된 작품. 캐릭터들이 살아있다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '조태오 진짜 소름끼치는 악역. 저런 사람이 있을까 무서웠음.');

    -- 2-3. 신세계
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('신세계', TO_DATE('2013-02-21', 'YYYY-MM-DD'), 134, 4682492, '청소년 관람불가', '범죄|느와르', '대한민국', '박훈정', '이정재|최민식|황정민', '경찰 잠입 수사 작전을 설계해 범죄 조직에 침투한 경찰과 그를 형제처럼 아끼는 조직의 2인자, 그리고 작전의 판을 짜는 경찰 사이에서 벌어지는 의리와 배신.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '느와르 장르의 멋이 폭발한다. 엘리베이터 씬은 전설.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '한국형 느와르의 새로운 지평을 연 작품. 캐릭터, 스토리, 연출 모두 완벽.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '클리셰를 영리하게 비틀어 장르적 쾌감을 극대화했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '"드루와~" 황정민 배우 연기 아직도 생각나요. 남자들이 왜 좋아하는지 알겠음.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '배신과 의심이 난무하는 분위기가 공포스럽기까지 하다.');

    -- 2-4. 극한직업
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('극한직업', TO_DATE('2019-01-23', 'YYYY-MM-DD'), 111, 16266338, '15세 이상 관람가', '코미디|액션', '대한민국', '이병헌', '류승룡|이하늬|진선규|이동휘|공명', '해체 위기의 마약반이 범죄조직 소탕을 위해 위장창업한 ‘마약치킨’이 일약 맛집으로 입소문을 타게 되면서 벌어지는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '아무 생각 없이 웃고 싶을 때 최고의 영화! 너무 웃어서 눈물 났어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '코미디인줄 알았는데 후반부 액션씬 퀄리티가 상당해서 놀랐다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '설정의 힘을 끝까지 밀어붙이는 영리한 코미디. 배우들의 합이 빛난다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '이병헌 감독 특유의 맛깔나는 대사(말맛)가 살아있는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '웃다가 끝나는 영화. 공포 요소는 전혀 없네요.');
    
    -- 2-5. 아저씨
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('아저씨', TO_DATE('2010-08-04', 'YYYY-MM-DD'), 119, 6178598, '청소년 관람불가', '액션|범죄', '대한민국', '이정범', '원빈|김새론', '아픔을 겪고 세상을 등진 채 살아가던 한 남자가 유일한 친구인 옆집 소녀가 범죄 조직에 납치되자, 그녀를 구하기 위해 세상 밖으로 다시 나오는 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '원빈의, 원빈에 의한, 원빈을 위한 영화. 한국 액션의 새로운 스타일을 보여줬다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '원빈 너무 멋있어요... 마지막 장면은 눈물 없인 볼 수 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '서사는 단순하지만, 스타일리시한 액션 연출과 원빈의 존재감이 모든 것을 압도한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '감성적인 드라마와 사실적인 액션을 효과적으로 결합했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '범죄 조직의 잔인함이 공포스럽게 느껴졌다. 특히 장기밀매 부분.');
    
    -- 2-6. 암살
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('암살', TO_DATE('2015-07-22', 'YYYY-MM-DD'), 140, 12706829, '15세 이상 관람가', '액션|시대극', '대한민국', '최동훈', '전지현|이정재|하정우', '1933년 조국이 사라진 시대, 대한민국 임시정부는 일본 측에 노출되지 않은 세 명을 암살작전에 지목한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '캐릭터 하나하나가 매력적이고, 액션씬도 볼거리가 풍부하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '배우들 보는 재미가 쏠쏠하고, 역사적인 내용이라 더 의미있게 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '최동훈 감독의 장기인 케이퍼 무비 스타일을 시대극에 성공적으로 이식했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '역사적 사실과 영화적 상상력을 균형감 있게 배합한 웰메이드 상업영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '독립운동가들을 배신하는 밀정의 존재가 서늘한 긴장감을 준다.');

    -- 2-7. 도둑들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('도둑들', TO_DATE('2012-07-25', 'YYYY-MM-DD'), 135, 12984682, '15세 이상 관람가', '범죄|액션', '대한민국', '최동훈', '김윤석|김혜수|이정재|전지현|김수현', '10인의 도둑, 1개의 다이아몬드. 그들이 움직이기 시작했다!')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '화려한 캐스팅, 화려한 액션. 눈이 즐거운 케이퍼 무비.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '좋아하는 배우들이 다 나와서 너무 좋았어요. 시간 가는 줄 모르고 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '복잡한 인물 관계와 반전이 매력적인 오락 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '각 캐릭터의 매력을 극대화하는 감독의 연출력이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '서로를 믿지 못하는 도둑들 사이의 긴장감이 스릴있다.');
    
    -- 2-8. 내부자들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('내부자들', TO_DATE('2015-11-19', 'YYYY-MM-DD'), 130, 9157293, '청소년 관람불가', '범죄|드라마', '대한민국', '우민호', '이병헌|조승우|백윤식', '대한민국 사회를 움직이는 숨겨진 권력가들의 의리와 배신을 담은 범죄드라마.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '배우들의 연기력이 영화 전체를 집어삼킨다. 특히 이병헌의 연기는 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '한국 사회의 부패한 권력층을 날카롭게 풍자한 웰메이드 범죄 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '화려한 액션은 없지만, 인물들 간의 팽팽한 기싸움이 액션보다 더 긴장감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '"모히또 가서 몰디브나 한잔 할라니까" 명대사가 너무 많아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '권력의 민낯이 이토록 추악하고 무서울 수 있다는 것을 보여준다.');

    -- 2-9. 황해
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('황해', TO_DATE('2010-12-22', 'YYYY-MM-DD'), 156, 2260512, '청소년 관람불가', '액션|스릴러', '대한민국', '나홍진', '하정우|김윤석', '빚을 갚기 위해 청부살인을 맡고 밀항한 한 남자가 살인자 누명을 쓴 채 지독한 놈들에게 쫓기면서 벌이는 절망적인 사투.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '처절하고 사실적인 액션. 도끼씬과 카체이싱은 정말 숨막힌다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한 남자의 절망적인 사투를 통해 인간의 본성을 처절하게 그려낸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '감독의 지독한 연출과 배우들의 신들린 연기가 만들어낸 압도적인 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '영화 전체에 흐르는 폭력과 절망의 기운이 어떤 공포영화보다 무섭다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 잔인해서 보기 힘들었지만, 하정우 배우의 먹방 연기는 인상 깊었다.');

    -- 2-10. 끝까지 간다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('끝까지 간다', TO_DATE('2014-05-29', 'YYYY-MM-DD'), 111, 3450305, '15세 이상 관람가', '범죄|액션', '대한민국', '김성훈', '이선균|조진웅', '한순간의 실수로 위기에 처한 형사가 자신이 저지른 사건을 은폐하기 시작하며 벌어지는 예측불허의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '처음부터 끝까지 멱살 잡고 끌고 가는 영화. 긴장감과 유머의 완벽한 조화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '장르적 쾌감을 극대화하는 영리한 각본과 훌륭한 리듬감의 연출.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '이선균과 조진웅, 두 배우의 팽팽한 연기 대결이 압권이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '손에 땀을 쥐고 봤어요. 어떻게 저런 상황이 계속 생기는지 ㅋㅋ');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '주인공이 처한 극한의 상황이 주는 압박감이 공포스럽다.');


    --------------------------------------------------------------------------------
    -- 카테고리 3: 공포/스릴러 (10편)
    --------------------------------------------------------------------------------

    -- 3-1. 곡성
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('곡성', TO_DATE('2016-05-12', 'YYYY-MM-DD'), 156, 6879988, '15세 이상 관람가', '미스터리|스릴러|공포', '대한민국', '나홍진', '곽도원|황정민|쿠니무라 준|천우희', '낯선 외지인이 나타난 후 벌어지는 의문의 연쇄 사건들로 마을이 발칵 뒤집힌다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '내 인생 최고의 공포영화. 현혹되지 마라.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '감독이 관객을 쥐고 흔든다. 영화가 끝나도 머릿속을 떠나지 않는 질문들.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '오컬트 장르를 한국적으로 완벽하게 재해석한 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 무서운데 궁금해서 끝까지 봤어요. 해석 찾아봐야 할 듯...');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 아니지만 긴장감이 처음부터 끝까지... 대단하네요.');

    -- 3-2. 부산행
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('부산행', TO_DATE('2016-07-20', 'YYYY-MM-DD'), 118, 11576783, '15세 이상 관람가', '액션|스릴러', '대한민국', '연상호', '공유|정유미|마동석|김수안', '정체불명의 바이러스가 전국으로 확산되고 대한민국 긴급재난경보령이 선포된 가운데, 부산행 KTX에 몸을 실은 사람들의 생존을 건 치열한 사투.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한국형 좀비 블록버스터의 시작! K-좀비는 달린다!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '마동석 좀비 때려잡을 때 속이 다 시원함. 최고의 액션.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '무서운데 슬프고 감동적이기까지... 시간 순삭이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '신파적인 요소가 있지만, 장르적 쾌감과 대중성을 잘 잡았다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '사회적 메시지를 좀비 아포칼립스 장르에 효과적으로 녹여낸 시도.');

    -- 3-3. 파묘
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('파묘', TO_DATE('2024-02-22', 'YYYY-MM-DD'), 134, 11913494, '15세 이상 관람가', '미스터리|공포', '대한민국', '장재현', '최민식|김고은|유해진|이도현', '미국 LA, 거액의 의뢰를 받은 무당 ‘화림’과 ‘봉길’은 기이한 병이 대물림되는 집안의 장손을 만난다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, 'K-오컬트의 새로운 경지. 전반부의 몰입감이 엄청나다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '풍수지리와 항일 코드를 오컬트 장르에 녹여낸 흥미로운 시도.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '전반부와 후반부의 장르적 변주가 호불호가 갈릴 수 있지만, 그 자체로도 매력적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '배우들 연기 진짜 미쳤어요. 특히 김고은 배우 굿하는 장면은 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '무서우면서도 후반부에는 액션 활극 같은 느낌도 드네요.');

    -- 3-4. 장화, 홍련
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('장화, 홍련', TO_DATE('2003-06-13', 'YYYY-MM-DD'), 118, 3148203, '15세 이상 관람가', '공포|미스터리', '대한민국', '김지운', '임수정|문근영|염정아|김갑수', '인적이 드문 시골, 이름 모를 꽃들이 소담하게 피어 있는 일본식 목재 가옥에 두 자매가 아버지와 함께 이사를 온다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '미장센, 사운드, 스토리 모든 것이 완벽한 공포 영화의 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '아름답고 슬픈 공포. 단순한 공포를 넘어선 하나의 예술 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '가족 드라마와 심리 스릴러, 공포를 정교하게 직조해냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '어릴 때 보고 너무 무서웠는데, 커서 보니 슬픈 이야기였네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '움직임은 적지만 심리적 압박감이 대단하다.');

    -- 3-5. 악마를 보았다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('악마를 보았다', TO_DATE('2010-08-12', 'YYYY-MM-DD'), 144, 1819672, '청소년 관람불가', '스릴러|범죄', '대한민국', '김지운', '이병헌|최민식', '국정원 경호요원 ‘수현’은 약혼녀가 잔인하게 살해당하자 자신 또한 괴물이 되기로 결심하고 연쇄살인마 ‘장경철’을 쫓는다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '인간의 광기가 어디까지 갈 수 있는지 보여주는 처절한 복수극. 너무 잔인해서 힘들지만 대단하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '이병헌과 최민식의 연기 대결만으로도 볼 가치가 있다. 액션이 처절하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '복수라는 주제를 극한까지 밀어붙여 관객에게 질문을 던진다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '폭력의 수위가 높아 논란의 여지가 있지만, 장르적 성취는 분명하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 7.5, '너무 잔인해서 눈 가리고 봤어요. 최민식 배우 연기가 진짜 악마 같아서 무서웠어요.');

    -- 3-6. 살인의 추억
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('살인의 추억', TO_DATE('2003-04-25', 'YYYY-MM-DD'), 132, 5255376, '15세 이상 관람가', '스릴러|범죄', '대한민국', '봉준호', '송강호|김상경|박해일', '1986년 경기도, 젊은 여인이 무참히 강간, 살해당한 시체로 발견된다. 2개월 후, 비슷한 수법의 강간살인사건이 연이어 발생하면서 사건은 세간의 주목을 받기 시작한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '봉준호 감독 최고의 걸작. 범죄 스릴러 장르를 넘어 시대의 초상을 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '범인을 잡지 못한 시대의 무력감과 분노를 스크린에 완벽하게 구현했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '범인이 잡히지 않았다는 사실 자체가 주는 현실적인 공포가 압도적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '마지막 송강호 배우의 눈빛은 한국 영화사에 길이 남을 명장면.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '액션은 없지만, 범인을 쫓는 형사들의 절박함이 엄청난 긴장감을 자아낸다.');

    -- 3-7. 올드보이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('올드보이', TO_DATE('2003-11-21', 'YYYY-MM-DD'), 120, 3269000, '청소년 관람불가', '스릴러|미스터리', '대한민국', '박찬욱', '최민식|유지태|강혜정', '술 좋아하고 떠들기 좋아하는 오대수는 아내와 어린 딸이 있는 평범한 가장. 어느 날, 그는 정체불명의 괴한에게 납치되어 사설 감금방에 갇히게 된다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '박찬욱 감독의 복수 3부작 중 최고. 스타일, 스토리, 연기 모든 것이 강렬하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '장도리 액션씬은 한국 영화 액션의 패러다임을 바꾼 명장면.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '파격적인 소재와 충격적인 반전, 감각적인 미장센이 돋보이는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '진실이 밝혀졌을 때의 충격과 공포는 잊을 수가 없다. 심리적 공포의 극치.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보고나서 며칠 동안 멍했어요. 굉장히 충격적인데 대단한 영화인 건 알겠어요.');

    -- 3-8. 추격자
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('추격자', TO_DATE('2008-02-14', 'YYYY-MM-DD'), 125, 5046096, '청소년 관람불가', '스릴러|범죄', '대한민국', '나홍진', '김윤석|하정우', '출장안마소를 운영하는 전직 형사 ‘중호’, 최근 데리고 있던 여자들이 잇달아 사라지는 일이 발생하고, 조금 전 나간 ‘미진’을 찾아 헤맨다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '숨 막히는 긴장감. 러닝타임 내내 관객을 몰아붙인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '처절한 추격전과 사실적인 액션이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '나홍진 감독의 놀라운 데뷔작. 스릴러 장르의 문법을 완벽하게 구사한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '김윤석과 하정우의 미친 연기력이 만들어낸 시너지.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보는 내내 심장이 쫄깃했어요. "4885" 아직도 기억남.');

    -- 3-9. 검은 사제들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('검은 사제들', TO_DATE('2015-11-05', 'YYYY-MM-DD'), 108, 5443260, '15세 이상 관람가', '미스터리|드라마', '대한민국', '장재현', '김윤석|강동원|박소담', '뺑소니 교통사고 이후 의문의 증상에 시달리는 한 소녀를 구하기 위해 모두의 반대와 의심 속에서 자신만의 계획을 준비하는 김신부와 그를 돕는 신학생 최부제의 이야기.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한국형 오컬트 영화의 본격적인 시작을 알린 작품. 후반부 구마 의식 장면이 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '강동원 사제복... 그것만으로도 볼 가치가 충분합니다. 영화도 무섭고 재밌어요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '낯선 소재를 대중적인 장르 영화의 틀 안에서 영리하게 풀어냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '박소담 배우의 신들린 연기가 영화의 긴장감을 극대화한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 액션은 없지만, 악령과의 사투가 주는 긴박감이 있다.');

    -- 3-10. 숨바꼭질
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description)
    VALUES ('숨바꼭질', TO_DATE('2013-08-14', 'YYYY-MM-DD'), 107, 5604106, '15세 이상 관람가', '스릴러', '대한민국', '허정', '손현주|문정희|전미선', '고급 아파트에서 완벽한 가정을 꾸리고 사는 성공한 사업가 ‘성수’는 어느 날 형의 실종 소식을 듣고, 수십 년 만에 찾아간 형의 아파트에서 집집마다 새겨진 이상한 암호를 발견한다.')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '현실적인 소재라서 더 무서운 스릴러. 우리 집 초인종도 다시 보게 된다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '손현주 배우의 스릴러 연기는 믿고 봅니다. 정말 심장 쫄깃했어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '주거 공간이라는 가장 안전해야 할 곳이 위협받는다는 설정이 효과적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '범인과 벌이는 사투가 긴박감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '후반부 전개가 다소 아쉽지만, 초중반의 긴장감은 훌륭하다.');

END;
/

COMMIT;

PROMPT seed.sql 실행 완료: 대용량 샘플 데이터 입력이 성공적으로 완료되었습니다.