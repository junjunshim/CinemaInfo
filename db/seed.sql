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
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('기생충', TO_DATE('2019-05-30', 'YYYY-MM-DD'), 132, 10313560, '15세 이상 관람가', '드라마', '대한민국', '봉준호', '송강호|이선균|조여정|최우식|박소담',
    '“폐 끼치고 싶진 않았어요"
    
전원백수로 살 길 막막하지만 사이는 좋은 기택(송강호) 가족.
장남 기우(최우식)에게 명문대생 친구가 연결시켜 준 고액 과외 자리는
모처럼 싹튼 고정수입의 희망이다.
온 가족의 도움과 기대 속에 박사장(이선균) 집으로 향하는 기우.
글로벌 IT기업 CEO인 박사장의 저택에 도착하자
젊고 아름다운 사모님 연교(조여정)가 기우를 맞이한다.

그러나 이렇게 시작된 두 가족의 만남 뒤로,
걷잡을 수 없는 사건이 기다리고 있었으니…', 'https://www.youtube.com/watch?v=jBdRhhSt3Bc')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '봉준호 감독의 정점. 모든 장면이 상징으로 가득하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '자본주의 사회의 계급 문제를 이토록 신랄하고 재치있게 풀어낼 수 있다니.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '웃다가 어느 순간 서늘해지는 영화. 보고나서 생각이 많아져요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '액션은 없지만 긴장감 하나는 최고네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '공포영화는 아니지만 지하실 장면은 정말 소름끼쳤어요.');

    -- 미나리
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('미나리', TO_DATE('2021-03-03', 'YYYY-MM-DD'), 115, 1135293, '12세 이상 관람가', '드라마', '미국', '정이삭', '스티븐 연|한예리|윤여정|앨런 김', 
    '2021년 전 세계가 기다린
어느 한국 가족의 원더풀한 이야기

"미나리는 어디서든 잘 자라"

낯선 미국, 아칸소로 떠나온 한국 가족.
가족들에게 뭔가 해내는 걸 보여주고 싶은 아빠 ''제이콥''(스티븐 연)은
자신만의 농장을 가꾸기 시작하고 엄마 ''모니카''(한예리)도 다시 일자리를 찾는다.

아직 어린 아이들을 위해 ‘모니카’의 엄마 ‘순자’(윤여정)가 함께 살기로 하고
가방 가득 고춧가루, 멸치, 한약 그리고 미나리씨를 담은 할머니가 도착한다.

의젓한 큰딸 ''앤''(노엘 케이트 조)과 장난꾸러기 막내아들 ''데이빗''(앨런 김)은
여느 그랜마같지 않은 할머니가 영- 못마땅한데…

함께 있다면, 새로 시작할 수 있다는 희망으로
하루하루 뿌리 내리며 살아가는
어느 가족의 아주 특별한 여정이 시작된다!', 'https://www.youtube.com/watch?v=PbLzeyGrwmI')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '가족의 의미를 다시 생각하게 하는 따뜻하고 아름다운 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '이민자들의 삶을 담담하지만 깊은 울림으로 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '윤여정 배우님 연기가 정말 좋았어요. 잔잔하게 감동적이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 사건은 없지만 계속 보게 되는 힘이 있네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '마음이 정화되는 느낌. 할머니 너무 귀여우심.');

    -- 벌새
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('벌새', TO_DATE('2019-08-29', 'YYYY-MM-DD'), 138, 146603, '15세 이상 관람가', '드라마', '대한민국', '김보라', '박지후|김새벽', 
    '나는 이 세계가 궁금했다

1994년, 알 수 없는 거대한 세계와 마주한 14살 ‘은희’의
아주- 보편적이고 가장- 찬란한 기억의 이야기', 'https://www.youtube.com/watch?v=EtcoPK91YxY')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '섬세한 감정선과 시대상이 어우러진 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '누구나 겪었을 법한 성장통을 담담하게 그려내어 큰 공감을 얻었다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '은희에게 너무 감정이입해서 봤네요. 마음이 아프면서도 따뜻해져요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '조용한 영화지만, 은희의 작은 날갯짓이 큰 파장을 일으키는 느낌.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '가정 폭력 장면은 어떤 공포 영화보다 현실적이라 무서웠다.');

    -- 택시운전사
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('택시운전사', TO_DATE('2017-08-02', 'YYYY-MM-DD'), 137, 12189708, '15세 이상 관람가', '드라마|역사', '대한민국', '장훈', '송강호|토마스 크레치만|유해진|류준열', 
    '1980년 5월, 서울 택시운전사.
“광주? 돈 워리, 돈 워리! 아이 베스트 드라이버”
택시운전사 만섭(송강호)은 외국손님을 태우고
광주에 갔다 통금 전에 돌아오면
밀린 월세를 갚을 수 있는 거금 10만원을 준다는 말에
독일기자 피터(토마스 크레취만)를 태우고
영문도 모른 채 길을 나선다.

광주 그리고 사람들.
“모르겄어라, 우덜도 우덜한테 와 그라는지…”
어떻게든 택시비를 받아야 하는 만섭의 기지로
검문을 뚫고 겨우 들어선 광주.
위험하니 서울로 돌아가자는 만섭의 만류에도
피터는 대학생 재식(류준열)과
황기사(유해진)의 도움 속에 촬영을 시작한다.
그러나 상황은 점점 심각해지고 만섭은
집에 혼자 있을 딸 걱정에 점점 초조해지는데…', 'https://www.youtube.com/watch?v=ZjVK09RDRY0')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '보고 나서 정말 많이 울었습니다. 꼭 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '아픈 역사를 대중의 눈높이에서 잘 풀어낸 상업영화의 좋은 예.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '송강호 배우의 페이소스가 빛을 발하며 역사의 비극을 효과적으로 전달한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '후반부 카체이싱 장면은 드라마 장르임에도 불구하고 긴장감이 넘쳤다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '실제 역사가 주는 공포와 슬픔이 어떤 영화보다 무겁게 다가왔다.');

    -- 남매의 여름밤
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('남매의 여름밤', TO_DATE('2020-08-20', 'YYYY-MM-DD'), 104, 25292, '전체 관람가', '드라마', '대한민국', '윤단비', '최정운|양흥주|박현영', 
    '방학 동안, 아빠와 함께 할아버지 집에서 지내게 된 남매 옥주와 동주,
그렇게 오래된 2층 양옥집에서의 여름이 시작되고
한동안 못 만났던 고모까지 합세하면서
기억에 남을 온 가족의 이야기가 펼쳐진다.', 'https://www.youtube.com/watch?v=2wmcpgA1bJo')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한여름밤의 꿈처럼 아름답고 아련한 가족 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '일상의 순간들을 섬세하게 포착하여 가족의 변화를 그려내는 연출이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '어릴 적 할아버지 댁에 놀러갔던 기억이 나서 좋았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '잔잔하지만 지루하지 않아요. 마음이 편안해지는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '특별한 사건은 없지만 가족이 해체될지도 모른다는 불안감이 스며있다.');

    -- 8월의 크리스마스
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('8월의 크리스마스', TO_DATE('1998-01-24', 'YYYY-MM-DD'), 97, 422930, '15세 이상 관람가', '드라마|로맨스', '대한민국', '허진호', '한석규|심은하', 
    '“사랑도 언젠가는 추억으로 그친다는 걸 알고 있습니다.
하지만 당신만은 추억이 되질 않습니다.”

“좋아하는 남자 친구 없어요?” 그 남자 l 한석규
변두리 사진관에서 아버지를 모시고 사는 노총각 ‘정원’.
시한부 인생을 받아들이고 가족, 친구들과 담담한 이별을 준비하던 어느 날,
주차단속요원 ‘다림’을 만나게 되고 차츰 평온했던 일상이 흔들리기 시작한다.

“아저씨, 왜 나만 보면 웃어요?” 그 여자 l 심은하
밝고 씩씩하지만 무료한 일상에 지쳐가던 스무 살 주차 단속요원 ‘다림’.
단속차량 사진의 필름을 맡기기 위해 드나들던 사진관의 주인 ‘정원’에게
어느새 특별한 감정을 갖게 되는데...

2013년 가을, 사랑을 간직한 채 떠나갔던 그 사람이 다시 돌아옵니다.', 'https://www.youtube.com/watch?v=KB9TOgYNjQA')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '한국 멜로 영화의 교과서. 세월이 흘러도 변치 않는 감동.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '삶과 죽음, 사랑을 담담하게 그려내어 더욱 깊은 여운을 남긴다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '심은하 배우가 너무 예쁘고, 한석규 배우 연기는 마음을 울립니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '조용한 영화지만 감정의 파고가 상당하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '죽음을 앞둔 주인공의 시선이 너무나 담담해서 오히려 더 슬펐다.');

    -- 우리들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('우리들', TO_DATE('2016-06-16', 'YYYY-MM-DD'), 95, 50228, '전체 관람가', '드라마', '대한민국', '윤가은', '최수인|설혜인|이서연', 
    '언제나 혼자인 외톨이 선은 모두가 떠나고
홀로 교실에 남아있던 방학식 날, 전학생 지아를 만난다.
서로의 비밀을 나누며 순식간에
세상 누구보다 친한 사이가 된 선과 지아는
생애 가장 반짝이는 여름을 보내는데,
개학 후 학교에서 만난 지아는 어쩐 일인지
선에게 차가운 얼굴을 하고 있다.

선을 따돌리는 보라의 편에 서서 선을 외면하는 지아와
다시 혼자가 되고 싶지 않은 선.
어떻게든 관계를 회복해보려 노력하던 선은
결국 지아의 비밀을 폭로해버리고 마는데...

선과 지아.
우리는 다시 ''우리''가 될 수 있을까?', 'https://www.youtube.com/watch?v=Yl0Aap0ByWs')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '아이들의 세계를 통해 관계의 본질을 꿰뚫어보는 놀라운 통찰력.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '어른들의 세계보다 더 복잡하고 잔인한 아이들의 관계를 현실적으로 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '초등학생 때 생각이 나서 너무 공감됐어요. 어른이 되어서 봐도 많은 생각을 하게 되네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '아이들 사이의 미묘한 감정 싸움이 스릴러 영화 못지 않게 긴장감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '큰 움직임은 없지만 감정의 격돌이 대단한 영화.');

    -- 소리도 없이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('소리도 없이', TO_DATE('2020-10-15', 'YYYY-MM-DD'), 99, 403126, '15세 이상 관람가', '드라마|범죄', '대한민국', '홍의정', '유아인|유재명', 
    '악의 없이, 계획에 없던 유괴범이 되다!

범죄 조직의 하청을 받아
근면성실하고 전문적으로 시체 수습을 하며 살아가는 ‘태인’과 ‘창복’.
어느 날 단골이었던 범죄 조직의 실장 ‘용석’에게 부탁을 받고
유괴된 11살 아이 ‘초희’를 억지로 떠맡게 된다.

그런데 다음 날 다시 아이를 돌려주려던 두 사람 앞에 ‘용석’이 시체로 나타나고,
두 사람은 예기치 못한 사건에 휘말리게 되는데…', 'https://www.youtube.com/watch?v=fQhVJHbATU0')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '대사 한 마디 없는 유아인의 연기가 모든 것을 말한다. 독특하고 신선한 범죄 드라마.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '아이러니한 상황 설정과 블랙코미디가 돋보이는 감독의 감각적인 데뷔작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 7.5, '조금 난해하긴 한데, 영화가 끝나고 곱씹어보게 되는 매력이 있어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 거의 없지만, 예측할 수 없는 전개가 긴장감을 유발한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '기묘하고 불편한 분위기가 영화 내내 계속된다. 독특한 스릴러.');

    -- 찬실이는 복도 많지
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('찬실이는 복도 많지', TO_DATE('2020-03-05', 'YYYY-MM-DD'), 96, 28731, '12세 이상 관람가', '드라마|판타지', '대한민국', '김초희', '강말금|윤여정|김영민|윤승아', 
    '“아 망했다. 왜 그리 일만 하고 살았을꼬?”

집도 없고, 남자도 없고, 갑자기 일마저 똑 끊겨버린 영화 프로듀서 ‘찬실’.
현생은 망했다 싶지만, 친한 배우 ‘소피’네 가사도우미로 취직해 살길을 도모한다.
그런데 ‘소피’의 불어 선생님 ‘영’이 누나 마음을 설레게 하더니
장국영이라 우기는 비밀스런 남자까지 등장!
새로 이사간 집주인 할머니도 정이 넘쳐 흐른다.
평생 일복만 터져왔는데, 영화를 그만두니 전에 없던 ‘복’도 들어오는 걸까?', 'https://www.youtube.com/watch?v=s8Gdl-71igQ')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '사랑스러운 캐릭터와 재치 있는 연출이 돋보이는 힐링 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '영화와 삶에 대한 애정을 따뜻하고 유쾌한 판타지로 풀어냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보고나면 기분이 좋아져요. 찬실이 캐릭터 너무 사랑스러워요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 갈등은 없지만 소소한 재미가 가득합니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '장국영 귀신(?)이 나오는 장면이 코믹하면서도 묘한 분위기를 자아낸다.');

    -- 봄날은 간다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('봄날은 간다', TO_DATE('2001-09-28', 'YYYY-MM-DD'), 115, 362481, '15세 이상 관람가', '드라마|로맨스', '대한민국', '허진호', '유지태|이영애', 
    '사랑이 이만큼 다가왔다고 느끼는 순간

이젠… 왜 날 사랑하지 않아?

사운드 엔지니어 상우(유지태)는 치매에 걸린 할머니와
젊은 시절 상처한 아버지, 고모와 함께 살고 있다.
어느 겨울 그는 강릉방송국 라디오PD 은수를 만난다.
자연의 소리를 채집해 틀어주는 라디오 프로그램을 준비하는 은수는
상우와 녹음 여행을 떠난다.
자연스레 가까워지는 두 사람은 어느날 은수의 아파트에서 밤을 보낸다.
너무 쉽게 사랑에 빠진 상우는 주체할 수 없을 정도로 그녀에게 빨려든다.

그러나 겨울에 만난 두 사람의 관계는
봄을 지나 여름을 맞으면서 삐걱거린다.
이혼 경험이 있는 은수는 상우에게 결혼할 생각이 없다며
부담스러운 표정을 내비친다.
“어떻게 사랑이 변하니”라고 말하는 상우에게
은수는 그저 “헤어져”라고 단호하게 말한다.
영원히 변할 것 같지 않던 사랑이 변하고,
그 사실을 받아들이지 못하는 상우는 어찌 할 바를 모른다.

은수를 잊지 못하는 상우는
미련과 집착의 감정을 이기지 못하고 서울과 강릉을 오간다.', 'https://www.youtube.com/watch?v=8YXkdkpxGPU')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '시간이 흘러 다시 볼 때마다 새로운 의미로 다가오는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '사랑이 변하는 과정을 소리와 풍경으로 섬세하게 담아낸 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '"어떻게 사랑이 변하니?" 라는 대사는 잊을 수가 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '현실적인 연애 이야기. 화려하진 않지만 공감가는 내용.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '사랑이 식어가는 과정이 너무 현실적이라 공포스럽게 느껴질 정도.');
    
    -- 서울의 봄
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('서울의 봄', TO_DATE('2023-11-22', 'YYYY-MM-DD'), 141, 13128096, '12세 이상 관람가', '드라마|역사', '대한민국', '김성수', '황정민|정우성|이성민|박해준|김성균', 
    '1979년 12월 12일, 수도 서울 군사반란 발생
그날, 대한민국의 운명이 바뀌었다

대한민국을 뒤흔든 10월 26일 이후, 서울에 새로운 바람이 불어온 것도 잠시
12월 12일, 보안사령관 전두광이 반란을 일으키고
군 내 사조직을 총동원하여 최전선의 전방부대까지 서울로 불러들인다.

권력에 눈이 먼 전두광의 반란군과
이에 맞선 수도경비사령관 이태신을 비롯한 진압군 사이,
일촉즉발의 9시간이 흘러가는데…

목숨을 건 두 세력의 팽팽한 대립
오늘 밤, 대한민국 수도에서 가장 치열한 전쟁이 펼쳐진다!', 'https://www.youtube.com/watch?v=-AZ7cnwn2YI')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '역사를 잊은 민족에게 미래는 없다. 반드시 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.8, '보는 내내 분노가 치밀어 오르게 만드는 연출과 연기.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '심장이 터질 것 같은 긴장감. 시간 가는 줄 몰랐습니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '총격씬은 없지만 그 어떤 액션 영화보다 박진감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '성공한 쿠데타는 처벌할 수 없다는 말이 공포 그 자체.');
    
    -- 다음 소희
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('다음 소희', TO_DATE('2023-02-08', 'YYYY-MM-DD'), 138, 128966, '15세 이상 관람가', '드라마', '대한민국', '정주리', '배두나|김시은', 
    '“나 이제 사무직 여직원이다?”

춤을 좋아하는 씩씩한 열여덟 고등학생 소희.
졸업을 앞두고 현장실습을 나가게 되면서 점차 변하기 시작한다.

“막을 수 있었잖아. 근데 왜 보고만 있었냐고”
오랜만에 복직한 형사 유진.
사건을 조사하던 중, 새로운 사실을 발견하고 그 자취를 쫓는다.

같은 공간 다른 시간, 언젠가 마주쳤던 두 사람의 이야기.
우리는 모두 그 애를 만난 적이 있다.', 'https://www.youtube.com/watch?v=wu9epe97BDU')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '사회의 구조적 문제를 묵직하게 담아낸 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '담담한 시선으로 그려내어 더욱 가슴 아픈 현실.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '보는 내내 마음이 너무 아팠습니다. 우리 모두가 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '큰 사건 없이도 이 정도의 몰입감을 주다니 대단하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '현실이 공포보다 무섭다는 것을 보여주는 영화.');
    
    -- 변호인
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('변호인', TO_DATE('2013-12-18', 'YYYY-MM-DD'), 127, 11374892, '15세 이상 관람가', '드라마', '대한민국', '양우석', '송강호|김영애|오달수|곽도원|임시완', 
    '“제가 하께요, 변호인. 하겠습니더”

돈 없고, 빽 없고, 가방끈도 짧은 세무 변호사 ‘송변’
그의 인생을 송두리째 바꿀 다섯 번의 공판이 시작된다!

1980년대 초 부산. 빽도 없고, 돈도 없고,
가방끈도 짧은 세무 변호사 송우석(송강호).
부동산 등기부터 세금 자문까지
남들이 뭐라든 탁월한 사업수완으로 승승장구하며
부산에서 제일 잘나가고 돈 잘 버는 변호사로 이름을 날린다.
10대 건설 기업의 스카우트 제의까지 받으며
전국구 변호사 데뷔를 코 앞에 둔 송변.
하지만 우연히 7년 전 밥값 신세를 지며 정을 쌓은
국밥집 아들 진우(임시완)가 뜻하지 않은 사건에 휘말려
재판을 앞두고 있다는 소식을 듣는다.
국밥집 아줌마 순애(김영애)의 간절한 부탁을 외면할 수 없어
구치소 면회만이라도 도와주겠다고 나선 송변.
하지만 그곳에서 마주한 진우의 믿지 못할 모습에
충격을 받은 송변은 모두가 회피하기 바빴던 사건의
변호를 맡기로 결심하는데...', 'https://www.youtube.com/watch?v=joVeSBlFW80')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '송강호의, 송강호에 의한, 송강호를 위한 영화. 법정씬은 전율 그 자체.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '뜨거운 시대의 아픔을 스크린에 완벽하게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.8, '보는 내내 눈물이 났습니다. 잊지 말아야 할 역사.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '액션은 없지만, 신념을 위한 싸움이 주는 감동이 컸습니다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.8, '국가가 개인에게 가하는 폭력이 얼마나 무서운지 보여줍니다.');
    
    -- 범죄도시2
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('범죄도시2', TO_DATE('2022-05-18', 'YYYY-MM-DD'), 106, 12693415, '15세 이상 관람가', '액션|범죄', '대한민국', '이상용', '마동석|손석구|최귀화|박지환', 
    '가리봉동 소탕작전 후 4년 뒤,
금천서 강력반은 베트남으로 도주한 용의자를
인도받아 오라는 미션을 받는다.

괴물형사 ‘마석도’(마동석)와 ‘전일만’(최귀화) 반장은
현지 용의자에게서 수상함을 느끼고,
그의 뒤에 무자비한 악행을 벌이는
‘강해상’(손석구)이 있음을 알게 된다.

‘마석도’와 금천서 강력반은 한국과 베트남을 오가며
역대급 범죄를 저지르는 ‘강해상’을 본격적으로 쫓기 시작하는데…

나쁜 놈들 잡는 데 국경 없다!
통쾌하고 화끈한 범죄 소탕 작전이 다시 펼쳐진다!', 'https://www.youtube.com/watch?v=DfqBfjboSNE')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '이게 액션이지! 마동석의 주먹은 모든 걸 해결한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '전형적인 서사지만 캐릭터의 힘으로 밀어붙인다. 킬링타임용으로 최고.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '너무 재밌어요! 시간 가는 줄 모르고 봤네요. 손석구 배우 완전 멋있어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '1편의 성공 공식을 그대로 따르지만, 그만큼의 재미는 보장한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '강해상 진짜 무서운 악당이네요. 마석도 아니었으면 큰일날 뻔.');

    -- 베테랑
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('베테랑', TO_DATE('2015-08-05', 'YYYY-MM-DD'), 123, 13414484, '15세 이상 관람가', '액션', '대한민국', '류승완', '황정민|유아인|유해진|오달수', 
    '한 번 꽂힌 것은 무조건 끝을 보는 행동파 ‘서도철’(황정민),
20년 경력의 승부사 ‘오팀장’(오달수),
위장 전문 홍일점 ‘미스봉’(장윤주), 육체파 ‘왕형사’(오대환),
막내 ‘윤형사’(김시후)까지
겁 없고, 못 잡는 것 없고,
봐주는 것 없는 특수 강력사건 담당 광역수사대.

오랫동안 쫓던 대형 범죄를 해결한 후 숨을 돌리려는 찰나,
서도철은 재벌 3세 ‘조태오’(유아인)를 만나게 된다.
세상 무서울 것 없는 안하무인의 조태오와
언제나 그의 곁을 지키는 오른팔 ‘최상무’(유해진).
서도철은 의문의 사건을 쫓던 중
그들이 사건의 배후에 있음을 직감한다.

건들면 다친다는 충고에도 불구하고
포기하지 않는 서도철의 집념에
판은 걷잡을 수 없이 커져가고
조태오는 이를 비웃기라도 하듯
유유히 포위망을 빠져 나가는데…

베테랑 광역수사대 VS 유아독존 재벌 3세
2015년 여름, 자존심을 건 한판 대결이 시작된다!', 'https://www.youtube.com/watch?v=hcKp68DtBb0')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '아트박스 사장님... 잊을 수 없다. 통쾌함의 극치!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '스트레스 확 풀리는 영화! 유아인 악역 연기 진짜 대박이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '사회 비판 메시지를 대중적인 오락 영화의 틀에 성공적으로 녹여냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '류승완 감독의 장기가 제대로 발휘된 작품. 캐릭터들이 살아있다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '조태오 진짜 소름끼치는 악역. 저런 사람이 있을까 무서웠음.');

    -- 신세계
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('신세계', TO_DATE('2013-02-21', 'YYYY-MM-DD'), 134, 4682492, '청소년 관람불가', '범죄|느와르', '대한민국', '박훈정', '이정재|최민식|황정민', 
    '“너, 나하고 일 하나 같이 하자“
경찰청 수사 기획과 강과장(최민식)은
국내 최대 범죄 조직인 ‘골드문’이
기업형 조직으로 그 세력이 점점 확장되자
신입경찰 이자성(이정재)에게 잠입수사를 명한다.
그리고 8년, 자성은 골드문의 2인자이자
그룹 실세인 정청(황정민)의 오른팔이 되기에 이른다.

“우리 브라더는 그냥 딱, 이 형님만 믿으면 돼야!”
골드문 회장이 갑자기 사망하자, 강과장(최민식)은
후계자 결정에 직접 개입하는 ‘신세계’ 작전을 설계한다.
피도 눈물도 없는 후계자 전쟁의 한 가운데,
정청(황정민)은 8년 전, 고향 여수에서 처음 만나
지금까지 친형제처럼 모든 순간을 함께 해 온 자성(이정재)에게
더욱 강한 신뢰를 보낸다.

“약속 했잖습니까... 이번엔 진짜 끝이라고”
한편, 작전의 성공만 생각하는 강과장(최민식)은
계속해서 자성(이정재)의 목을 조여만 간다.
시시각각 신분이 노출될 위기에 처한 자성(이정재)은
언제 자신을 배신할 지 모르는 경찰과,
형제의 의리로 대하는 정청(황정민) 사이에서 갈등하게 되는데…', 'https://www.youtube.com/watch?v=rvLMVcRkRfY')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '느와르 장르의 멋이 폭발한다. 엘리베이터 씬은 전설.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '한국형 느와르의 새로운 지평을 연 작품. 캐릭터, 스토리, 연출 모두 완벽.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '클리셰를 영리하게 비틀어 장르적 쾌감을 극대화했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '"드루와~" 황정민 배우 연기 아직도 생각나요. 남자들이 왜 좋아하는지 알겠음.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '배신과 의심이 난무하는 분위기가 공포스럽기까지 하다.');

    -- 극한직업
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('극한직업', TO_DATE('2019-01-23', 'YYYY-MM-DD'), 111, 16266338, '15세 이상 관람가', '코미디|액션', '대한민국', '이병헌', '류승룡|이하늬|진선규|이동휘|공명', 
    '불철주야 달리고 구르지만 실적은 바닥,
급기야 해체 위기를 맞는 마약반!
더 이상 물러설 곳이 없는 팀의 맏형 고반장은
국제 범죄조직의 국내 마약 밀반입 정황을 포착하고
장형사, 마형사, 영호, 재훈까지
4명의 팀원들과 함께 잠복 수사에 나선다.
마약반은 24시간 감시를 위해
범죄조직의 아지트 앞 치킨집을 인수해 위장 창업을 하게 되고,
뜻밖의 절대미각을 지닌 마형사의 숨은 재능으로
치킨집은 일약 맛집으로 입소문이 나기 시작한다.
수사는 뒷전, 치킨장사로 눈코 뜰 새 없이 바빠진 마약반에게
어느 날 절호의 기회가 찾아오는데…

범인을 잡을 것인가, 닭을 잡을 것인가!', 'https://www.youtube.com/watch?v=xM1CIQd_X4c')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '아무 생각 없이 웃고 싶을 때 최고의 영화! 너무 웃어서 눈물 났어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '코미디인줄 알았는데 후반부 액션씬 퀄리티가 상당해서 놀랐다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '설정의 힘을 끝까지 밀어붙이는 영리한 코미디. 배우들의 합이 빛난다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '이병헌 감독 특유의 맛깔나는 대사(말맛)가 살아있는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '웃다가 끝나는 영화. 공포 요소는 전혀 없네요.');
    
    -- 아저씨
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('아저씨', TO_DATE('2010-08-04', 'YYYY-MM-DD'), 119, 6178598, '청소년 관람불가', '액션|범죄', '대한민국', '이정범', '원빈|김새론', 
    '불행한 사건으로 아내를 잃고 세상을 등진 채 전당포를 운영하며 외롭게 살아가는 전직 특수요원 태식.
찾아오는 사람이라곤 전당포에 물건 맡기러 오는 사람들과 옆집 소녀 소미 뿐이다.
엄마의 보살핌을 받지 못하고 언제나 혼자 있는 소미와 보내는 시간이 많아지면서 태식은 소미에게 점점 마음을 열게 된다.
그러던 중 소미의 엄마가 범죄에 연루되고, 범죄조직은 소미를 인질로 잡아가고 만다.

“소미를 찾아도 너희는 죽는다”

소미의 행방을 쫓아 다시 세상 밖으로 나오게 된 태식.
태식은 소미를 구하기 위해 범죄조직과 거래를 하게 되고, 이로 인해 경찰마저 태식을 추격하게 된다.
한 걸음씩 한 걸음씩 범죄조직의 중심에 다가서면서 베일에 싸여있던 태식의 비밀스런 과거도 함께 드러나게 되는데…', 'https://www.youtube.com/watch?v=4rsaQ0cDUYg') 
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '원빈의, 원빈에 의한, 원빈을 위한 영화. 한국 액션의 새로운 스타일을 보여줬다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '원빈 너무 멋있어요... 마지막 장면은 눈물 없인 볼 수 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '서사는 단순하지만, 스타일리시한 액션 연출과 원빈의 존재감이 모든 것을 압도한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '감성적인 드라마와 사실적인 액션을 효과적으로 결합했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '범죄 조직의 잔인함이 공포스럽게 느껴졌다. 특히 장기밀매 부분.');
    
    -- 암살
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('암살', TO_DATE('2015-07-22', 'YYYY-MM-DD'), 140, 12706829, '15세 이상 관람가', '액션|시대극', '대한민국', '최동훈', '전지현|이정재|하정우', 
    '1933년 조국이 사라진 시대
대한민국 임시정부는 일본 측에 노출되지 않은 세 명을
암살작전에 지목한다. 한국 독립군 저격수 안옥윤,
신흥무관학교 출신 속사포, 폭탄 전문가 황덕삼!
김구의 두터운 신임을 받는 임시정부 경무국 대장 염석진은
이들을 찾아 나서기 시작한다. 암살단의 타깃은
조선주둔군 사령관 카와구치 마모루와 친일파 강인국.
한편, 누군가에게 거액의 의뢰를 받은
청부살인업자 하와이 피스톨이 암살단의 뒤를 쫓는데…

친일파 암살작전을 둘러싼 이들의
예측할 수 없는 운명이 펼쳐진다!', 'https://www.youtube.com/watch?v=RnGxpZ75zFU')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '캐릭터 하나하나가 매력적이고, 액션씬도 볼거리가 풍부하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '배우들 보는 재미가 쏠쏠하고, 역사적인 내용이라 더 의미있게 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '최동훈 감독의 장기인 케이퍼 무비 스타일을 시대극에 성공적으로 이식했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '역사적 사실과 영화적 상상력을 균형감 있게 배합한 웰메이드 상업영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '독립운동가들을 배신하는 밀정의 존재가 서늘한 긴장감을 준다.');

    -- 도둑들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('도둑들', TO_DATE('2012-07-25', 'YYYY-MM-DD'), 135, 12984682, '15세 이상 관람가', '범죄|액션', '대한민국', '최동훈', '김윤석|김혜수|이정재|전지현|김수현', 
    '한 팀으로 활동 중인 한국의 도둑 뽀빠이와 예니콜, 씹던껌, 잠파노.
미술관을 터는데 멋지게 성공한 이들은
뽀빠이의 과거 파트너였던 마카오박이 제안한
홍콩에서의 새로운 계획을 듣게 된다.
여기에 마카오박이 초대하지 않은 손님,
감옥에서 막 출소한 금고털이 팹시가 합류하고
5명은 각자 인생 최고의 반전을 꿈꾸며 홍콩으로 향한다.

홍콩에서 한국 도둑들을 기다리고 있는 4인조 중국도둑 첸,
앤드류, 쥴리, 조니. 최고의 전문가들이 세팅된 가운데
서로에 대한 경계를 늦추지 않는 한국과 중국의 도둑들.
팽팽히 흐르는 긴장감 속에 나타난 마카오박은
자신이 계획한 목표물을 밝힌다.
그것은 마카오 카지노에 숨겨진 희대의 다이아몬드 <태양의 눈물>.
성공을 장담할 수 없는 위험천만한 계획이지만
2천만 달러의 달콤한 제안을 거부할 수 없는 이들은
태양의 눈물을 훔치기 위한 작업에 착수한다.

그러나 진짜 의도를 알 수 없는 비밀스런 마카오박과
그런 마카오박의 뒤통수를 노리는 뽀빠이,
마카오박에게 배신당한 과거의 기억을 잊지 못하는 팹시와
팀보다 눈 앞의 현찰을 먼저 챙기는 예니콜,
그리고 한국 도둑들을 믿지 않는 첸과 중국 도둑들까지.
훔치기 위해 모였지만 목적은 서로 다른 10인의 도둑들은
서서히 자신만의 플랜을 세우기 시작하는데…', 'https://www.youtube.com/watch?v=CJnDTSAyOrw')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '화려한 캐스팅, 화려한 액션. 눈이 즐거운 케이퍼 무비.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '좋아하는 배우들이 다 나와서 너무 좋았어요. 시간 가는 줄 모르고 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '복잡한 인물 관계와 반전이 매력적인 오락 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '각 캐릭터의 매력을 극대화하는 감독의 연출력이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '서로를 믿지 못하는 도둑들 사이의 긴장감이 스릴있다.');
    
    -- 내부자들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('내부자들', TO_DATE('2015-11-19', 'YYYY-MM-DD'), 130, 9157293, '청소년 관람불가', '범죄|드라마', '대한민국', '우민호', '이병헌|조승우|백윤식', 
    '“복수극으로 가자고, 화끈하게”
유력한 대통령 후보와 재벌 회장,
그들을 돕는 정치깡패 안상구(이병헌).
거래의 판을 짠 이는 대한민국 여론을 움직이는
유명 논설주간 이강희(백윤식)다.
더 큰 성공을 원한 안상구는
이들의 비자금 파일로 거래를 준비하다 발각되고,
이 일로 폐인이 되어 버려진다.

“넌 복수를 원하고, 난 정의를 원한다. 그림 좋잖아?”
빽 없고 족보가 없어 늘 승진을 눈 앞에 두고
주저 앉는 검사 우장훈(조승우).
마침내 대선을 앞둔 대대적인 비자금 조사의
저격수가 되는 기회를 잡는다.
그러나 비자금 파일을 가로챈 안상구 때문에 수사는 종결되고,
우장훈은 책임을 떠안고 좌천된다.

자신을 폐인으로 만든 일당에게 복수를 계획하는 정치깡패 안상구
비자금 파일과 안상구라는 존재를 이용해
성공하고 싶은 무족보 검사 우장훈
그리고 비자금 스캔들을 덮어야 하는 대통령 후보와 재벌,
그들의 설계자 이강희

과연 살아남는 자는 누가 될 것인가?', 'https://www.youtube.com/watch?v=UCduDb1Pb0A')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '배우들의 연기력이 영화 전체를 집어삼킨다. 특히 이병헌의 연기는 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '한국 사회의 부패한 권력층을 날카롭게 풍자한 웰메이드 범죄 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '화려한 액션은 없지만, 인물들 간의 팽팽한 기싸움이 액션보다 더 긴장감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '"모히또 가서 몰디브나 한잔 할라니까" 명대사가 너무 많아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '권력의 민낯이 이토록 추악하고 무서울 수 있다는 것을 보여준다.');

    -- 황해
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('황해', TO_DATE('2010-12-22', 'YYYY-MM-DD'), 156, 2260512, '청소년 관람불가', '액션|스릴러', '대한민국', '나홍진', '하정우|김윤석', 
    '황해를 건너 온 남자, 모두가 그를 쫓는다!
연변에서 택시를 운전하며 구질구질한 일상을 살아가는 구남.
한국으로 돈 벌러 간 아내는 6개월째 소식이 없고,
돈을 불리기 위해 마작판에 드나들지만 항상 잃을 뿐이다.
그러던 어느 날, 살인청부업자 면가에게서
한국에 가서 누군가를 죽이고 오라는 제안을 받게 된 구남은
빚을 갚기 위해, 그리고 아내를 만나기 위해 황해를 건너는데…

매서운 바다를 건너 서울로 온 구남은
살인 기회를 노리는 동시에 아내의 행방을 수소문한다.
하지만 목표물은 구남의 눈앞에서 살해 당하고,
구남은 현장에서 도주하지만
살인자 누명을 쓴 채 경찰에 쫓기게 된다.
이에 청부살인을 의뢰했던 태원은 증거 인멸을 위해
구남을 없애려 하고, 연변에 있던 면가 또한 황해를 건너와
구남을 쫓기 시작하는데…

지독한 놈들에게서 벗어나기 위한, 절박한 사투가 시작된다!', 'https://www.youtube.com/watch?v=wxYAg7to52A')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '처절하고 사실적인 액션. 도끼씬과 카체이싱은 정말 숨막힌다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한 남자의 절망적인 사투를 통해 인간의 본성을 처절하게 그려낸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '감독의 지독한 연출과 배우들의 신들린 연기가 만들어낸 압도적인 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '영화 전체에 흐르는 폭력과 절망의 기운이 어떤 공포영화보다 무섭다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 잔인해서 보기 힘들었지만, 하정우 배우의 먹방 연기는 인상 깊었다.');

    -- 끝까지 간다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('끝까지 간다', TO_DATE('2014-05-29', 'YYYY-MM-DD'), 111, 3450305, '15세 이상 관람가', '범죄|액션', '대한민국', '김성훈', '이선균|조진웅', 
    '완벽하게 숨긴 줄 알았다…!

어머니의 장례식 날, 급한 연락을 받고 경찰서로 향하던 형사 ‘고건수’(이선균).
아내의 이혼 통보, 갑작스런 내사 소식까지, 스트레스 폭발 직전의 건수는
실수로 사람을 치는 사고를 일으키고 만다.

되돌릴 수 없는 상황!
어떻게든 모면해야 하는 건수는 누구도 찾을 수 없는 곳,
바로 어머니의 관 속에 시체를 숨긴다.

끝났다고 생각한 순간, 놈이 나타났다!
하지만 곧 경찰 내부에서 실종 및 뺑소니 사건에 대한 수사가 시작되고
범인이 다름아닌 자기 자신인 건수는 이를 은폐하기 위해 애쓴다.
그러던 어느 날, 사건의 모든 걸 알고 있다는
정체불명의 목격자 ‘박창민’(조진웅)이 등장하고,
목적을 감춘 채 건수를 조여오는 창민의 협박 속 건수의 상황은
예측할 수 없는 위기로 치달아 가는데…!

절체절명 형사의 마지막 반격.
되돌릴 수 없다면, 끝까지 간다!', 'https://www.youtube.com/watch?v=H8-FPkguiKE')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '처음부터 끝까지 멱살 잡고 끌고 가는 영화. 긴장감과 유머의 완벽한 조화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '장르적 쾌감을 극대화하는 영리한 각본과 훌륭한 리듬감의 연출.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '이선균과 조진웅, 두 배우의 팽팽한 연기 대결이 압권이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '손에 땀을 쥐고 봤어요. 어떻게 저런 상황이 계속 생기는지 ㅋㅋ');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '주인공이 처한 극한의 상황이 주는 압박감이 공포스럽다.');

    -- 육사오(6/45)
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('육사오(6/45)', TO_DATE('2022-08-24', 'YYYY-MM-DD'), 113, 1980755, '12세 이상 관람가', '코미디', '대한민국', '박규태', '고경표|이이경|음문석|박세완|곽동연', 
    '바람을 타고 군사분계선을 넘어간 1등 당첨 로또.
주운 자가 임자? 
아니면 원래 주인에게? 비공식 남북 공동 로또 수령 작전!', 'https://www.youtube.com/watch?v=LF-oW7e5jI8')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '설정은 흥미롭지만, 조금 더 과감했으면 하는 아쉬움.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '남북 소재 코미디의 전형성을 크게 벗어나지 못했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '아무 생각 없이 웃고 싶을 때 보기 좋은 영화!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '배우들 티키타카가 정말 재밌네요. 특히 이이경 배우!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.8, '로또 때문에 벌어지는 소동이 귀엽고 유쾌했어요.');
    
    -- 파일럿
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('파일럿', TO_DATE('2024-07-31', 'YYYY-MM-DD'), 115, 2200000, '15세 이상 관람가', '코미디', '대한민국', '김한결', '조정석|이주명|한선화|신승호', 
    '최고의 비행 실력을 갖춘 스타 파일럿이자
뜨거운 인기로 유명 TV쇼에도 출연할 만큼
고공행진 하던 ‘한정우’(조정석)는
순간의 잘못으로 하루아침에 모든 것을 잃고
실직까지 하게 된다.

블랙 리스트에 오른 그를
다시 받아줄 항공사는 어느 곳도 없었고
궁지에 몰린 한정우는 여동생의 신분으로 완벽히 변신,
마침내 재취업에 성공한다.

그러나 기쁨도 잠시!
또다시 예상치 못한 난관에 부딪히게 되는데…
인생 순항을 꿈꾸던 그의 삶은 무사히 이륙할 수 있을까?', 'https://www.youtube.com/watch?v=amI9ujTxtH4')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '조정석의 하드캐리. 역시 코미디 연기는 최고.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '예상 가능한 스토리지만, 조정석이 살렸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '진짜 배꼽 빠지게 웃었네요. 스트레스 풀리는 영화!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '큰 액션은 없지만 소소하게 웃긴 장면이 많아요.');
    
    -- 럭키
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('럭키', TO_DATE('2016-10-13', 'YYYY-MM-DD'), 112, 6975290, '15세 이상 관람가', '코미디', '대한민국', '이계벽', '유해진|이준|조윤희|임지연', 
    '성공률 100% 완벽한 킬러!
목욕탕 Key 때문에 무명배우로 삶이 뒤바뀌다?!

냉혹한 킬러 형욱(유해진)은 사건 처리 후
우연히 들른 목욕탕에서 비누를 밟고 넘어져 과거의 기억을 잃게 된다.
인기도, 삶의 의욕도 없어 죽기로 결심한 무명배우 재성(이준)은
신변 정리를 위해 들른 목욕탕에서 그런 형욱을 보게 되고,
자신과 그의 목욕탕 키를 바꿔 도망친다.

인생에 단 한번 찾아온 초대형 기회! 초특급 반전!
이것이 LUCK.KEY 다!', 'https://www.youtube.com/watch?v=G2zyFe4Z5w0')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '유해진의 코미디 연기는 역시 믿고 본다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '일본 원작을 한국적으로 잘 각색한 영리한 코미디.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '킬링타임용으로 최고! 유해진 배우 너무 웃겨요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '킬러였던 주인공의 액션 본능이 나올 때마다 웃음이 터짐.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.8, '가볍게 즐기기 좋은 유쾌한 영화였습니다.');

    -- 곡성
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('곡성', TO_DATE('2016-05-12', 'YYYY-MM-DD'), 156, 6879988, '15세 이상 관람가', '미스터리|스릴러|공포', '대한민국', '나홍진', '곽도원|황정민|쿠니무라 준|천우희', 
    '낯선 외지인이 나타난 후 벌어지는
의문의 연쇄 사건들로 마을이 발칵 뒤집힌다.
경찰은 집단 야생 버섯 중독으로 잠정적 결론을 내리지만
모든 사건의 원인이 그 외지인 때문이라는 소문과
의심이 걷잡을 수 없이 퍼져 나간다.

경찰 ‘종구’(곽도원)는 현장을 목격했다는
여인 ‘무명’(천우희)을 만나면서
외지인에 대한 소문을 확신하기 시작한다.
딸 ‘효진’이 피해자들과 비슷한 증상으로 아파오기 시작하자
다급해진 ‘종구’. 외지인을 찾아 난동을 부리고,
무속인 ‘일광’(황정민)을 불러 들이는데...', 'https://www.youtube.com/watch?v=Ej25zrnaTXk')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '내 인생 최고의 공포영화. 현혹되지 마라.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '감독이 관객을 쥐고 흔든다. 영화가 끝나도 머릿속을 떠나지 않는 질문들.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '오컬트 장르를 한국적으로 완벽하게 재해석한 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 무서운데 궁금해서 끝까지 봤어요. 해석 찾아봐야 할 듯...');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 아니지만 긴장감이 처음부터 끝까지... 대단하네요.');

    -- 부산행
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('부산행', TO_DATE('2016-07-20', 'YYYY-MM-DD'), 118, 11576783, '15세 이상 관람가', '액션|스릴러', '대한민국', '연상호', '공유|정유미|마동석|김수안', 
    '전대미문의 재난이 대한민국을 덮친다!

정체불명의 바이러스가 전국으로 확산되고
대한민국 긴급재난경보령이 선포된 가운데,
열차에 몸을 실은 사람들은 단 하나의 안전한 도시 부산까지
살아가기 위한 치열한 사투를 벌이게 된다.

서울에서 부산까지의 거리 442KM
지키고 싶은, 지켜야만 하는 사람들의 극한의 사투!', 'https://www.youtube.com/watch?v=UOTOjA0ngmk')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한국형 좀비 블록버스터의 시작! K-좀비는 달린다!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '마동석 좀비 때려잡을 때 속이 다 시원함. 최고의 액션.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '무서운데 슬프고 감동적이기까지... 시간 순삭이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '신파적인 요소가 있지만, 장르적 쾌감과 대중성을 잘 잡았다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '사회적 메시지를 좀비 아포칼립스 장르에 효과적으로 녹여낸 시도.');

    -- 파묘
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('파묘', TO_DATE('2024-02-22', 'YYYY-MM-DD'), 134, 11913494, '15세 이상 관람가', '미스터리|공포', '대한민국', '장재현', '최민식|김고은|유해진|이도현', 
    '미국 LA, 거액의 의뢰를 받은
무당 ‘화림’(김고은)과 ‘봉길’(이도현)은
기이한 병이 대물림되는 집안의 장손을 만난다.
조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고,
돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과
장의사 ‘영근’(유해진)이 합류한다.

“전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지”

절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘.
‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만,
‘화림’의 설득으로 결국 파묘가 시작되고…

나와서는 안될 것이 나왔다.', 'https://www.youtube.com/watch?v=rjW9E1BR_30')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, 'K-오컬트의 새로운 경지. 전반부의 몰입감이 엄청나다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '풍수지리와 항일 코드를 오컬트 장르에 녹여낸 흥미로운 시도.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '전반부와 후반부의 장르적 변주가 호불호가 갈릴 수 있지만, 그 자체로도 매력적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '배우들 연기 진짜 미쳤어요. 특히 김고은 배우 굿하는 장면은 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '무서우면서도 후반부에는 액션 활극 같은 느낌도 드네요.');

    -- 장화, 홍련
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('장화, 홍련', TO_DATE('2003-06-13', 'YYYY-MM-DD'), 118, 3148203, '15세 이상 관람가', '공포|미스터리', '대한민국', '김지운', '임수정|문근영|염정아|김갑수', 
    '우리 집에 놀러 오세요

인적이 드문 시골, 이름 모를 들꽃들이 소담하게 피어 있는 신작로 끝에
일본식 목재 가옥이 홀로 서 있다.
낮이면 피아노 소리가 들려 올 듯 아름다운 그 집은
어둠이 내리면 귀기 서린 음산함을 뿜기 시작한다.
예사롭지 않은 기운이 서려 있는 이 집에서
어른도 아이도 아닌 아름다운 두 자매 수미, 수연이,
아름답지만 신경이 예민한 새엄마와 함께 살게 된 그날, 그 가족의 괴담이 시작된다.

수연, 수미 자매가 서울에서 오랜 요양을 마치고 돌아오던 날.
새엄마 은주는 눈에 띄게 아이들을 반기지만, 자매는 그녀를 꺼리는 기색이 역력하다.
함께 살게 된 첫날부터 집안에는 이상한 기운이 감돌고
가족들은 환영을 보거나 악몽에 시달린다.

수미는 죽은 엄마를 대신해 아버지 무현과 동생 수연을 손수 챙기려들고,
생모를 똑 닮은 수연은 늘 겁에 질려있다.
신경이 예민한 은주는 그런 두 자매와 번번히 다투게 되고,
아버지 무현은 그들의 불화를 그저 관망만 한다.
은주는 정서불안 증세를 보이며 집안을 공포 분위기로 몰아가고,
동생을 지키기 위해 안간힘을 쓰는 수미가 이에 맞서는 가운데,
집안 곳곳에서 괴이한 일들이 잇달아 벌어지기 시작하는데...', 'https://www.youtube.com/watch?v=jfRJv7VNMB4')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '미장센, 사운드, 스토리 모든 것이 완벽한 공포 영화의 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '아름답고 슬픈 공포. 단순한 공포를 넘어선 하나의 예술 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '가족 드라마와 심리 스릴러, 공포를 정교하게 직조해냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '어릴 때 보고 너무 무서웠는데, 커서 보니 슬픈 이야기였네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '움직임은 적지만 심리적 압박감이 대단하다.');

    -- 악마를 보았다
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('악마를 보았다', TO_DATE('2010-08-12', 'YYYY-MM-DD'), 144, 1819672, '청소년 관람불가', '스릴러|범죄', '대한민국', '김지운', '이병헌|최민식', 
    '악마 같은 연쇄 살인마 그리고…
그에게 약혼녀를 잃고 그 고통을 뼛속 깊이 되갚아 주려는 한남자

그들의 광기 어린 대결이 시작된다

국정원 경호요원 ‘수현(이병헌)’은
약혼녀 주연이 잔인하게 살해당하자
자신에게 가장 소중한 사람을 지켜내지 못했다는 자괴감과 분노로
가장 고통스러운 복수를 다짐한다.
수현은 연쇄 살인마 ‘장경철(최민식)’이 범인임을 알아내고
죽을 만큼의 고통만 가하고 놓아주기를 반복하며
처절한 응징을 시작한다.
그러나, 악마보다 더 악랄한 살인마 장경철은
난생 처음 만난 대등한 적수의 출현을 즐기며
반격에 나서기 시작하는데…', 'https://www.youtube.com/watch?v=bKpWkAmHV1A')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '인간의 광기가 어디까지 갈 수 있는지 보여주는 처절한 복수극. 너무 잔인해서 힘들지만 대단하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '이병헌과 최민식의 연기 대결만으로도 볼 가치가 있다. 액션이 처절하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '복수라는 주제를 극한까지 밀어붙여 관객에게 질문을 던진다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '폭력의 수위가 높아 논란의 여지가 있지만, 장르적 성취는 분명하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 7.5, '너무 잔인해서 눈 가리고 봤어요. 최민식 배우 연기가 진짜 악마 같아서 무서웠어요.');

    -- 살인의 추억
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('살인의 추억', TO_DATE('2003-04-25', 'YYYY-MM-DD'), 132, 5255376, '15세 이상 관람가', '스릴러|범죄', '대한민국', '봉준호', '송강호|김상경|박해일', 
    '당신은 지금 어디에 있는가

선 보러 집 나갔던 처녀, 배수관서 알몸시체로…
사건 잇다르자 날 저물면 부녀자들 외출 꺼려

1986년 경기도. 젊은 여인이 무참히 강간, 살해 당한 시체로 발견된다.
2개월 후, 비슷한 수법의 강간살인사건이 연이어 발생하면서
사건은 세간의 주목을 받기 시작하고,
일대는 연쇄살인이라는 생소한 범죄의 공포에 휩싸인다.

특별수사본부, 서울 시경 형사 투입…
수사는 아직도 제자리 걸음

사건발생지역에 특별수사본부가 설치되고, 수사본부는 구희봉 반장(변희봉)을 필두로
지역토박이 형사 박두만(송강호)과 조용구(김뢰하),
그리고 서울 시경에서 자원해 온 서태윤(김상경)이 배치된다.
육감으로 대표되는 박두만은 동네 양아치들을 족치며 자백을 강요하고,
서태윤은 사건 서류를 꼼꼼히 검토하며 사건의 실마리를 찾아가지만
스타일이 다른 두 사람은 처음부터 팽팽한 신경전을 벌인다.
용의자가 검거되고 사건의 끝이 보일 듯 하더니,
매스컴이 몰려든 현장 검증에서 용의자가 범행 사실을 부인하면서
현장은 아수라장이 되고, 구반장은 파면 당한다.

연쇄살인범은 누구인가… 치밀한 뒷처리, 흔적 전무

수사진이 아연실색할 정도로 범인은 자신의 흔적을 남기지 않는다.
살해하거나 결박할 때도 모두 피해자가 착용했거나 사용하는 물품을 이용한다.
심지어 강간 살인의 경우, 대부분 피살자의 몸에 떨어져 있기 마련인
범인의 음모조차 단 하나도 발견되지 않는다.

후임으로 신동철 반장(송재호)이 부임하면서 수사는 활기를 띠기 시작한다.
박두만은 현장에 털 한 오라기 남기지 않는다는 점에 착안,
근처의 절과 목욕탕을 뒤지며 무모증인 사람을 찾아 나서고,
사건 파일을 검토하던 서태윤은 비오는 날,
빨간 옷을 입은 여자가 범행 대상이라는 공통점을 밝혀낸다.

어둡고 긴 미스터리…
미궁 속 10번째 부녀자 연쇄피살, 공포 언제까지

선제공격에 나선 형사들은 비 오는 밤,
여경에게 빨간 옷을 입히고 함정수사를 벌인다.
그러나 다음날 아침 돌아오는 것은 음부에 우산이 꽂힌 또 다른 여인의 사체.
사건은 해결의 실마리를 다시 감추고
냄비처럼 들끓는 언론은 일선 형사들의 무능을 지적하면서
형사들을 더욱 강박증에 몰아 넣는다.', 'https://www.youtube.com/watch?v=MZjr-ciVlK4')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '봉준호 감독 최고의 걸작. 범죄 스릴러 장르를 넘어 시대의 초상을 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '범인을 잡지 못한 시대의 무력감과 분노를 스크린에 완벽하게 구현했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '범인이 잡히지 않았다는 사실 자체가 주는 현실적인 공포가 압도적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '마지막 송강호 배우의 눈빛은 한국 영화사에 길이 남을 명장면.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '액션은 없지만, 범인을 쫓는 형사들의 절박함이 엄청난 긴장감을 자아낸다.');

    -- 올드보이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('올드보이', TO_DATE('2003-11-21', 'YYYY-MM-DD'), 120, 3269000, '청소년 관람불가', '스릴러|미스터리', '대한민국', '박찬욱', '최민식|유지태|강혜정', 
    '15년의 감금, 5일의 추적

“내 이름이요, 오늘만 대충 수습하며 산다해서 오.대.수라구요”
술 좋아하고 떠들기 좋아하는 오.대.수.
본인의 이름풀이를 ‘오늘만 대충 수습하며 살자’라고 이죽거리는 이 남자는
아내와 어린 딸아이를 가진 지극히 평범한 샐러리맨이다.
어느 날, 술이 거나하게 취해 집에 돌아가는 길에
존재를 알 수 없는 누군가에게 납치, 사설 감금방에 갇히게 되는데...

“ 그 때 그들이 ‘십오년’이라고 말해줬다면 조금이라도 견디기 쉬었을까?”
언뜻 보면 싸구려 호텔방을 연상케 하는 감금방.
중국집 군만두만을 먹으며 8평이라는 제한된 공간에서
그가 할 수 있는 일이라곤, 텔레비전 보는 게 전부.
그렇게 1년이 지났을 무렵, 뉴스를 통해 나오는 아내의 살해소식.
게다가 아내의 살인범으로 자신이 지목되고 있음을 알게 된 오대수는
자살을 감행하지만 죽는 것조차 그에겐 용납 되지 않는다.
오대수는 복수를 위해 체력단련을 비롯,
자신을 가둘만한 사람들, 사건들을 모조리 기억 속에서 꺼내 ‘악행의 자서전’을 기록한다.
한편, 탈출을 위해 감금방 한쪽 구석을 쇠젓가락으로 파기도 하는데...
감금 15년을 맞이하는 해,
마침내 사람 몸 하나 빠져나갈 만큼의 탈출구가 생겼을 때,
어이없게도 15년 전 납치됐던 바로 그 장소로 풀려나 있는 자신을 발견하게 된다.

“내가 누군지, 왜 가뒀는지 밝혀내면…내가 죽어줄께요”
우연히 들른 일식집에서 갑자기 정신을 잃어버린 오대수는
보조 요리사 미도 집으로 가게 되고,
미도는 오대수에게 연민에서 시작한 사랑의 감정을 키워나가게 된다.
한편 감금방에서 먹던 군만두에서 나온 ‘청룡’이란 전표 하나로 찾아낸
7.5층 감금방의 정체를 찾아내고...

마침내, 첫 대면을 하는 날 복수심으로 들끓는 대수에게
우진은 너무나 냉정하게 게임을 제안한다.
자신이 가둔 이유를 5일 안에 밝혀내면 스스로 죽어주겠다는 것.
대수는 이 지독한 비밀을 풀기 위해,
사랑하는 연인, 미도를 잃지 않기 위해
5일 간의 긴박한 수수께끼를 풀어나가야 한다.
도대체 이우진은 누구이며?
이우진이 오대수를 15년 동안이나 감금한 이유는 뭘까?
밝혀진 비밀 앞에 두 남자의 운명은 과연 어떻게 되는 것일까?', 'https://www.youtube.com/watch?v=2HkjrJ6IK5E')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '박찬욱 감독의 복수 3부작 중 최고. 스타일, 스토리, 연기 모든 것이 강렬하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '장도리 액션씬은 한국 영화 액션의 패러다임을 바꾼 명장면.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '파격적인 소재와 충격적인 반전, 감각적인 미장센이 돋보이는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '진실이 밝혀졌을 때의 충격과 공포는 잊을 수가 없다. 심리적 공포의 극치.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보고나서 며칠 동안 멍했어요. 굉장히 충격적인데 대단한 영화인 건 알겠어요.');

    -- 추격자
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('추격자', TO_DATE('2008-02-14', 'YYYY-MM-DD'), 125, 5046096, '청소년 관람불가', '스릴러|범죄', '대한민국', '나홍진', '김윤석|하정우', 
    '“4885… 너지? 넌 잡히면 죽는다”
보도방을 운영하는 전직 형사 ‘중호’,
최근 데리고 있던 여자들이 잇달아 사라지는 일이 발생하고,
조금 전 나간 미진을 불러낸 손님의 전화 번호와
사라진 여자들이 마지막으로 통화한 번호가 일치함을 알아낸다.
하지만 미진 마저도 연락이 두절되고...
미진을 찾아 헤매던 중 우연히 ‘영민’과 마주친 중호,
옷에 묻은 피를 보고 영민이 바로 그놈인 것을 직감하고
추격 끝에 그를 붙잡는다.

“안 팔았어요. 죽였어요… 근데 그 여잔 아직 살아있을걸요?”
실종된 여자들을 모두 죽였다는 충격적인 고백을
담담히 털어 놓는 영민에 의해 경찰서는 발칵 뒤집어진다.
우왕좌왕하는 경찰들 앞에서
미진은 아직 살아 있을 거라며 태연하게 미소 짓는 영민.
그러나 영민을 잡아둘 수 있는 증거는 아무것도 없다.
공세우기에 혈안이 된 경찰은
미진의 생사보다는 증거를 찾기에만 급급해 하고,
미진이 살아 있다고 믿는 단 한 사람 중호는 미진을 찾아 나서는데…

대한민국을 뒤흔든 희대의 살인마,
그가 잡히던 그 날 밤… 놈을 쫓던 단 한 명의 <추격자>', 'https://www.youtube.com/watch?v=hu8NitXoPS0')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '숨 막히는 긴장감. 러닝타임 내내 관객을 몰아붙인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '처절한 추격전과 사실적인 액션이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '나홍진 감독의 놀라운 데뷔작. 스릴러 장르의 문법을 완벽하게 구사한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '김윤석과 하정우의 미친 연기력이 만들어낸 시너지.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보는 내내 심장이 쫄깃했어요. "4885" 아직도 기억남.');

    -- 검은 사제들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('검은 사제들', TO_DATE('2015-11-05', 'YYYY-MM-DD'), 108, 5443260, '15세 이상 관람가', '미스터리|드라마', '대한민국', '장재현', '김윤석|강동원|박소담', 
    '2015년 서울, 뺑소니 교통사고 이후
의문의 증상에 시달리는 한 소녀(박소담).
잦은 돌출 행동으로 교단의 눈 밖에 난 ‘김신부’(김윤석)는
모두의 반대와 의심 속,
소녀를 구하기 위한 자신만의 계획을 준비한다.
이를 위해선 모든 자격에 부합하는 또 한 명의 사제가 필요한 상황,
모두가 기피하는 가운데 신학생인 ‘최부제’(강동원)가 선택되고,
그는 ‘김신부’를 돕는 동시에 감시하라는 미션을 받게 된다.
그리고 마침내 소녀를 구할 수 있는 단 하루의 기회,
김신부와 최부제는 모두의 목숨을 잃을 수도 있는
위험한 예식을 시작하는데…

“절대 쳐다보지마. 이제부터 넌 여기 없는 거야”', 'https://www.youtube.com/watch?v=Jd-EXmSxV2A')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한국형 오컬트 영화의 본격적인 시작을 알린 작품. 후반부 구마 의식 장면이 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '강동원 사제복... 그것만으로도 볼 가치가 충분합니다. 영화도 무섭고 재밌어요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '낯선 소재를 대중적인 장르 영화의 틀 안에서 영리하게 풀어냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '박소담 배우의 신들린 연기가 영화의 긴장감을 극대화한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '큰 액션은 없지만, 악령과의 사투가 주는 긴박감이 있다.');

    -- 숨바꼭질
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('숨바꼭질', TO_DATE('2013-08-14', 'YYYY-MM-DD'), 107, 5604106, '15세 이상 관람가', '스릴러', '대한민국', '허정', '손현주|문정희|전미선', 
    '우리 집에 낯선 사람이 숨어 살고 있다면...?

숨바꼭질 암호 □1○1△2
고급 아파트에서 완벽한 가정을 꾸리고 사는
성공한 사업가 ‘성수’(손현주)는
하나 뿐인 형에 대한 비밀과 지독한 결벽증을 갖고 있다.
어느 날 그는 형의 실종 소식을 듣고
수십 년 만에 찾아간 형의 아파트에서
집집마다 새겨진 이상한 암호와
형을 알고 있는 ‘주희’(문정희) 가족을 만난다.

“제발 그 사람한테 제 딸 좀 그만 훔쳐보라고 하세요”
어린 딸과 단 둘이 살고 있는 ‘주희’는
자신의 집을 훔쳐보는 누군가의 존재를 느끼며 두려움에 떨고 있다.
낡은 아파트의 암호를 찬찬히 살펴보던 ‘성수’는 그것이
그 집에 사는 사람의 성별과 수를 뜻하는 것을 알게 된다.

우리 집에 나 말고 다른 사람이 살고 있다!
형의 아파트를 뒤로한 채 자신의 안락한 집으로 돌아온 그 날,
‘성수’는 형의 아파트에서 봤던 암호가 자신의 집 초인종 옆에서
새겨진 것을 발견한다.

사라진 형. 숨바꼭질 암호.
서로 다른 두 가족에게 찾아온 충격적 진실.
가족을 지키기 위한 두 가장의 숨가쁜 사투가 시작된다!', 'https://www.youtube.com/watch?v=a5Q2m-3AfOY')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '현실적인 소재라서 더 무서운 스릴러. 우리 집 초인종도 다시 보게 된다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '손현주 배우의 스릴러 연기는 믿고 봅니다. 정말 심장 쫄깃했어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '주거 공간이라는 가장 안전해야 할 곳이 위협받는다는 설정이 효과적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '범인과 벌이는 사투가 긴박감 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '후반부 전개가 다소 아쉽지만, 초중반의 긴장감은 훌륭하다.');
    
    -- 잠
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('잠', TO_DATE('2023-09-06', 'YYYY-MM-DD'), 94, 1470200, '15세 이상 관람가', '공포|미스터리', '대한민국', '유재선', '정유미|이선균', 
    '행복한 신혼부부 ‘현수’(이선균)와 ‘수진’(정유미).
어느 날, 옆에 잠든 남편 ‘현수’가 이상한 말을 중얼거린다.
“누가 들어왔어”

그날 이후, 잠들면 마치 다른 사람처럼 변하는 ‘현수’.
깨어나면 아무것도 기억하지 못하는 ‘현수’는 잠들면 가족들을 해칠까 두려움을 느끼고
‘수진’은 매일 잠드는 순간 시작되는 끔찍한 공포 때문에 잠들지 못한다.
치료도 받아보지만 ‘현수’의 수면 중 이상 행동은 점점 더 위험해져가고
‘수진’은 곧 태어날 아이까지 위험에 빠질지도 모른다는 생각에
갖은 노력을 다해보는데…', 'https://www.youtube.com/watch?v=aRxQDCXnfOc')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '신선한 소재와 뛰어난 연출. 장르적 쾌감이 상당하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '전반부의 빌드업은 훌륭하나, 후반부 전개가 다소 급작스럽다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '배우들 연기가 정말 현실적이어서 더 무서웠어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '액션은 없지만 심리적 압박감이 엄청나네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '가장 일상적인 공간인 집과 잠이 가장 무서운 공포의 대상이 된다.');
    
    -- 밀수
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('밀수', TO_DATE('2023-07-26', 'YYYY-MM-DD'), 129, 5143254, '15세 이상 관람가', '액션|범죄', '대한민국', '류승완', '김혜수|염정아|조인성|박정민', 
    '열길 물속은 알아도 한길 사람 속은 모른다!

평화롭던 바닷가 마을 군천에 화학 공장이 들어서면서
하루아침에 일자리를 잃은 해녀들.
먹고 살기 위한 방법을 찾던 승부사 ''춘자''(김혜수)는
바다 속에 던진 물건을 건져 올리기만 하면 큰돈을 벌 수 있다는
밀수의 세계를 알게 되고 해녀들의 리더 ''진숙''(염정아)에게 솔깃한 제안을 한다.
위험한 일임을 알면서도 생계를 위해 과감히 결단을 내린 해녀 ''진숙''은
전국구 밀수왕 ''권 상사''를 만나게 되면서 확 커진 밀수판에 본격적으로 빠지게 된다.
그러던 어느 날, 일확천금을 얻을 수 있는 일생일대의 기회가 찾아오고
사람들은 서로를 속고 속이며 거대한 밀수판 속으로 휩쓸려 들어가기 시작하는데...

물길을 아는 자가 돈길의 주인이 된다!', 'https://www.youtube.com/watch?v=Yh7J-HhXZjw')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '역시 류승완 감독! 수중 액션씬이 정말 신선하고 통쾌했어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '배우들의 케미가 돋보이는 웰메이드 케이퍼 무비. 70년대 레트로 감성도 훌륭하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '김혜수, 염정아 배우 조합 최고! 시간 가는 줄 모르고 봤네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '익숙한 서사지만, 캐릭터의 힘과 노련한 연출로 장르적 쾌감을 극대화했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '바다 속에서 벌어지는 밀수 장면은 스릴러 못지않게 긴장감이 넘쳤다.');

    -- 범죄도시3
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('범죄도시3', TO_DATE('2023-05-31', 'YYYY-MM-DD'), 105, 10682813, '15세 이상 관람가', '액션|범죄', '대한민국', '이상용', '마동석|이준혁|아오키 무네타카', 
    '베트남 납치 살해범 검거 후 7년 뒤,
‘마석도’(마동석)는 새로운 팀원들과 함께 살인사건을 조사한다.
사건 조사 중, ‘마석도’는 신종 마약 사건이 연루되었음을
알게 되고 수사를 확대한다.
한편, 마약 사건의 배후인 ''주성철''(이준혁)은 계속해서 판을 키워가고
약을 유통하던 일본 조직과 ''리키''(아오키 무네타카)까지
한국에 들어오며 사건의 규모는 점점 더 커져가는데...

나쁜 놈들 잡는 데 이유 없고 제한 없다
커진 판도 시원하게 싹 쓸어버린다!', 'https://www.youtube.com/watch?v=4p7WZmM3Bk8')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '마석도의 시원한 액션은 여전하다! 스트레스 해소에 이만한 영화가 없다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '이번에도 너무 재밌었어요! 초롱이 캐릭터 진짜 웃겨요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '전작들의 성공 공식을 그대로 따라가지만, 그만큼의 재미는 보장한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 6.5, '캐릭터의 매력에 지나치게 의존하는 경향이 보이지만, 대중적인 오락 영화로서의 미덕은 갖췄다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '이준혁 배우의 빌런 연기가 인상 깊었다. 마석도에게 대항하는 모습이 꽤나 위협적이었음.');

    -- 존 윅 4
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('존 윅 4', TO_DATE('2023-04-12', 'YYYY-MM-DD'), 169, 1924294, '청소년 관람불가', '액션', '미국', '채드 스타헬스키', '키아누 리브스|견자단|빌 스카스가드', 
    '죽을 위기에서 살아난 ‘존 윅’은
‘최고 회의’를 쓰러트릴 방법을 찾아낸다.

비로소 완전한 자유의 희망을 보지만,
NEW 빌런 ‘그라몽 후작’과 전 세계의 최강 연합은
‘존 윅’의 오랜 친구까지 적으로 만들어 버리고,

새로운 위기에 놓인 ‘존 윅’은
최후의 반격을 준비하는데,,

레전드 액션 블록버스터 <존 윅>의
새로운 챕터가 열린다!', 'https://www.youtube.com/watch?v=ly3QrgEZaQY')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '액션의 정점. 3시간에 가까운 러닝타임이 전혀 지루하지 않다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '액션 시퀀스의 설계와 연출이 예술의 경지에 이르렀다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '서사를 포기하고 액션에 모든 것을 쏟아부은 영리한 선택. 장르의 쾌감을 극한까지 끌어올렸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '견자단 배우 너무 멋있어요! 개선문 카체이싱 씬은 정말 역대급.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '끊임없이 몰아치는 액션에 숨 막힐 지경. 주인공이 겪는 고통이 느껴져서 공포스러울 정도.');

    -- 공작
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('공작', TO_DATE('2018-08-08', 'YYYY-MM-DD'), 137, 4974513, '12세 이상 관람가', '드라마|첩보', '대한민국', '윤종빈', '황정민|이성민|조진웅|주지훈', 
    '북으로 간 스파이, 암호명 흑금성

1993년, 북한 핵 개발을 둘러싸고 한반도의 위기가 고조된다.
정보사 소령 출신으로 안기부에 스카우트된 박석영(황정민)은
‘흑금성’이라는 암호명으로 북핵의 실체를 캐기 위해
북의 고위층 내부로 잠입하라는 지령을 받는다.
안기부 해외실장 최학성(조진웅)과 대통령 외에는
가족조차도 그의 실체를 모르는 가운데 대북사업가로 위장해
베이징 주재 북 고위간부 리명운(이성민)에게 접근한 흑금성.
그는 수 년에 걸친 공작 끝에, 리명운과 두터운 신의를 쌓고
그를 통해서, 북한 권력층의 신뢰를 얻는데 성공한다.
그러나, 1997년. 남의 대선 직전에 흑금성은
남과 북의 수뇌부 사이 은밀한 거래를 감지한다.
조국을 위해 굳은 신념으로 모든 것을 걸고 공작을 수행했던 그는
걷잡을 수 없는 갈등에 휩싸이는데…', 'https://www.youtube.com/watch?v=XyEJxOfKaCw')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '총성 없는 전쟁터. 대화만으로도 이렇게 긴장감 넘치는 첩보 영화를 만들 수 있다니.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '실화를 바탕으로 한 묵직한 서사와 배우들의 명연기가 어우러진 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '냉전 시대의 이념 대립과 그 속에서 피어난 인간적인 교감을 설득력 있게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '황정민, 이성민 배우의 연기 대결이 정말 압권입니다. 마지막 장면의 여운이 길게 남아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '언제 정체가 탄로 날지 모르는 스파이의 삶이 주는 압박감이 공포스럽다.');

    -- 강철비
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('강철비', TO_DATE('2017-12-14', 'YYYY-MM-DD'), 139, 4452899, '15세 이상 관람가', '액션|드라마', '대한민국', '양우석', '정우성|곽도원', 
    '북한 쿠데타 발생
북한 1호가 남한으로 내려왔다!

쿠데타 발생 직후 최정예요원 ‘엄철우’(정우성)는
치명상을 입은 북한 1호와 함께 남한으로 내려온다.
그 사이 북한은 대한민국과 미국을 상대로 선전포고를,
남한은 계엄령을 선포한다.
이때 북한 1호가 남한으로 내려왔다는 정보를 입수한 외교안보수석 ‘곽철우’(곽도원)는
전쟁을 막기 위해 이들에게 긴밀한 접근을 시도하는데....', 'https://www.youtube.com/watch?v=4G8RU1y2Blc')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '묵직한 주제를 다루면서도 액션 영화로서의 재미를 놓치지 않았다. 특히 후반부 전투씬이 인상적.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '남북 분단 현실에 대한 날카로운 통찰과 과감한 상상력이 돋보이는 블록버스터.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '정우성과 곽도원, 남북의 두 남자가 보여주는 의외의 케미가 영화의 가장 큰 매력.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '조금 어려운 내용일 줄 알았는데, 중간중간 유머도 있고 재밌게 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '핵전쟁의 위기가 주는 공포가 현실적으로 다가와서 정말 무서웠다.');

    -- 써니
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('써니', TO_DATE('2011-05-04', 'YYYY-MM-DD'), 124, 7453715, '15세 이상 관람가', '코미디|드라마', '대한민국', '강형철', '유호정|심은경|강소라|고수희|김민영', 
    '나의 친구 우리들의 추억 ‘써니’
가장 찬란한 순간, 우리는 하나였다!

전라도 벌교 전학생 나미는 긴장하면 터져 나오는 사투리 탓에
첫날부터 날라리들의 놀림감이 된다.
이때 범상치 않는 포스의 친구들이 어리버리한 그녀를 도와주는데…
그들은 진덕여고 의리짱 춘화, 쌍꺼풀에 목숨 건 못난이 장미,
욕배틀 대표주자 진희, 괴력의 다구발 문학소녀 금옥,
미스코리아를 꿈꾸는 사차원 복희 그리고 도도한 얼음공주 수지.
나미는 이들의 새 멤버가 되어
경쟁그룹 ‘소녀시대’와의 맞짱대결에서
할머니로부터 전수받은 사투리 욕 신공으로
위기상황을 모면하는 대활약을 펼친다.
일곱 명의 단짝 친구들은 언제까지나 함께 하자는 맹세로
칠공주 ‘써니’를 결성하고
학교축제 때 선보일 공연을 야심차게 준비하지만
축제 당일, 뜻밖의 사고가 일어나 뿔뿔이 흩어지게 된다.

그로부터 25년 후, 잘 나가는 남편과 예쁜 딸을 둔 나미의 삶은
무언가 2프로 부족하다. 어느 날 ‘써니짱’ 춘화와 마주친 나미는
재회의 기쁨을 나누며, ‘써니’ 멤버들을 찾아 나서기로 결심하는데…
가족에게만 매어있던 일상에서 벗어나
추억 속 친구들을 찾아나선 나미는
그 시절 눈부신 우정을 떠올리며
가장 행복했던 순간의 자신과 만나게 된다.', 'https://www.youtube.com/watch?v=v8yKqG7ibd0')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '웃다가 울다가... 제 학창 시절 생각나서 너무 좋았어요. 인생 영화!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '과거와 현재를 오가는 능숙한 편집과 80년대 대중문화를 소환하는 방식이 탁월하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '복고 코드를 통해 세대적 공감을 이끌어내는 데 성공한 상업영화의 좋은 예.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '여고생들의 패싸움 장면이 의외로 박진감 넘치고 재밌었다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '본드 흡입 장면은 시대상을 보여주지만 조금 섬뜩했어요.');
    
    -- 과속스캔들
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('과속스캔들', TO_DATE('2008-12-03', 'YYYY-MM-DD'), 108, 8245597, '12세 이상 관람가', '코미디|드라마', '대한민국', '강형철', '차태현|박보영|왕석현', 
    '마약, 성형, 섹스 스캔들보다 무서운

2008년, 사건 사고는 아직 시작되지 않았다!
마약, 성형, 섹스 스캔들보다 더 무서운 과속 스캔들이 온다!

한때 아이돌 스타로 10대 소녀 팬들의 영원한 우상이었던 남현수(차태현).
지금은 서른 중반의 나이지만, 그래도 아직까지는 잘나가는 연예인이자,
청취율 1위의 인기 라디오 DJ.

어느 날 애청자를 자처하며
하루도 빠짐없이 라디오에 사연을 보내오던 황.정.남(박보영)이 느닷없이 찾아와
자신이 현수가 과속해서 낳은 딸이라며 바득바득 우겨대기 시작하는데!!
그것도 애까지 달고 나타나서…
현수의 집은 물론 나와바리인 방송국까지.
어디든 물불 안 가리고 쫓아다니는 스토커 정남으로 인해
완벽했던 인생에 태클 한방 제대로 걸린 현수.
설상가상 안 그래도 머리 복잡한 그에게 정남과 스캔들까지 휩싸이게 되는데…

나 이제, 이거 한방 터지면 정말 끝이다! 끝!', 'https://www.youtube.com/watch?v=NCn-FJf513I')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '정말 배꼽 빠지게 웃었어요! 박보영 배우는 너무 사랑스럽고 왕석현 군은 너무 귀여워요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '예상 가능한 설정이지만, 재치 있는 대사와 배우들의 호연으로 유쾌한 코미디를 완성했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '강형철 감독의 감각적인 연출과 음악 활용이 돋보이는 데뷔작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '유치원 싸움 장면이 이 영화의 유일한 액션씬? ㅋㅋ 가볍게 보기 좋아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '하루아침에 할아버지가 된다는 설정이 남자 주인공에겐 공포였을지도.');

    -- 스물
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('스물', TO_DATE('2015-03-25', 'YYYY-MM-DD'), 115, 3045183, '15세 이상 관람가', '코미디|드라마', '대한민국', '이병헌', '김우빈|이준호|강하늘', 
    '인기만 많은 놈 ‘치호’
생활력만 강한 놈 ‘동우’
공부만 잘하는 놈 ‘경재’

아무것도 하지 않는 잉여의 삶을 지향하는 인기절정의 백수,
만화가가 되겠다는 꿈을 위해
쉴 틈 없이 준비하는 생활력 강한 재수생,
대기업 입사가 목표인 최강 스펙의 엄친아지만
술만 마시면 돌변하는 새내기 대학생까지
인생의 가장 부끄러운 순간을 함께 한
스무살 동갑내기 세 친구의 자체발광 코미디!', 'https://www.youtube.com/watch?v=jH6-ZBUbg-M')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '남자들의 대화가 이렇게 웃긴지 몰랐어요 ㅋㅋ 철없지만 귀여운 세 친구 이야기.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '이병헌 감독 특유의 ‘말맛’이 살아있는 대사가 일품. B급 감성의 향연.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '가볍고 유치하지만, 그 시절의 청춘을 재기 발랄하게 담아냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '소소반점 싸움 씬이 가장 기억에 남네요. 어설픈 액션이 웃음 포인트.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '공포는 없지만, 미래에 대한 막막함이 스무 살에겐 공포였을 수도.');

    -- 형
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('형', TO_DATE('2016-11-23', 'YYYY-MM-DD'), 110, 2982637, '12세 이상 관람가', '코미디|드라마', '대한민국', '권수경', '조정석|디오|박신혜', 
    '“살다 보니까 니가 내 인생에 도움이 되는 날이 온다?”
뻔뻔한 사기꾼, 동생 핑계로 가석방의 기회를 물었다!

유도 국가대표 고두영(도경수)은 경기 도중 불의의 사고를 당하게 되고
이 소식을 들은 사기전과 10범의 형 고두식(조정석)은 눈물의 석방 사기극을 펼친다!

“형은 개뿔, 제발 내 인생에서 꺼져!”
형이 돌아오고 인생이 더 깜깜해졌다!

하루 아침에 앞이 깜깜해진 동생을 핑계로 1년간 보호자 자격으로 가석방 된 두식!.
15년동안 단 한번도 연락이 없던 뻔뻔한 형이 집으로 돌아오고
보호자 노릇은커녕 ‘두영’의 삶을 더 엉망진창으로 만드는데….

남보다 못한 형제의 예측불허 동거가 시작된다!', 'https://www.youtube.com/watch?v=FLQDRwRyDLk')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '조정석 배우 코미디 연기는 정말 믿고 봅니다. 웃기다가 마지막엔 엄청 울었네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '전형적인 신파 코미디 공식을 따르지만, 조정석의 하드캐리가 영화를 살렸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '두 주연 배우의 브로맨스 케미가 영화의 가장 큰 동력.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 6.5, '큰 액션은 없지만, 조정석 배우의 찰진 욕설이 타격감이 있네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '갑자기 시력을 잃게 된 주인공의 절망감이 공포스럽게 다가왔다.');
    
    -- 결혼전야
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('결혼전야', TO_DATE('2013-11-21', 'YYYY-MM-DD'), 118, 1214840, '15세 이상 관람가', '코미디|로맨스', '대한민국', '홍지영', '김강우|김효진|이연희|옥택연|마동석', 
    '“너의 과거가 나를 미치게 해!” _과거남녀 태규,주영
한번 헤어진 후 다시 만난 전직 야구선수 태규(김강우)와
비뇨기과 의사 주영(김효진)
결혼식 일주일 전, 서로의 충격적인 과거를 알게 되다?!

“우리 사랑하는거 맞아?” _권태남녀 원철,소미
연애 7년차, 스타 쉐프 원철(옥택연)과 네일 아티스트 소미(이연희)
우리가 결혼하는 이유? 오래 사귀었으니까!

“그녀와의 밤이 두려워...” _국제남녀 건호,비카
순수한 꽃집 노총각 건호(마동석)와
우크라이나에서 온 절세미녀 비카(구잘)
국경과 나이도 초월한 두 사람의 사랑을 방해하는 것은?
건호의 몸에 찾아온 이상징후!

“이 결혼 절대 못해!” _충돌남녀 대복,이라
만남에서부터 결혼까지 LTE급 속도로 진행 중인
‘파파걸’ 이라(고준희)와 ‘마마보이’ 대복(이희준)
그러나 결혼은 현실!
혼수준비, 신혼여행, 종교, 집안문제까지 달라도 너무 다르다!

그리고......

“이대로 도망가고 싶다” _흔들남녀 경수,소미
여행사 실수로 부녀회 단체여행에 합류한 소미(이연희)와
티격태격하는 제주도 여행가이드 경수(주지훈)
결혼식 일주일 전, 운명적인 사랑에 이끌리다!

과연 이들은 메리지 블루를 극복하고
무사히 결혼에 골인할 수 있을까?', 'https://www.youtube.com/watch?v=q6LlpM9zZsU')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '여러 커플들 이야기 보는 재미가 쏠쏠했어요. 마동석 배우가 특히 웃겼어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '옴니버스 구성으로 다양한 결혼의 모습을 보여주려는 시도가 좋았다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 6.5, '각 커플의 갈등이 다소 피상적으로 다뤄진 점은 아쉽지만, 가볍게 즐기기 좋은 로맨틱 코미디.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '마동석 배우가 요트에서 보여주는 액션(?)이 제일 인상 깊었네요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '결혼 직전에 겪는 심리적 불안감, 메리지 블루가 일종의 공포일 수 있겠네요.');

    -- 헤어질 결심
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('헤어질 결심', TO_DATE('2022-06-29', 'YYYY-MM-DD'), 138, 1899147, '15세 이상 관람가', '미스터리|로맨스', '대한민국', '박찬욱', '박해일|탕웨이', 
    '산 정상에서 추락한 한 남자의 변사 사건.
담당 형사 ‘해준’(박해일)은 사망자의 아내 ‘서래’(탕웨이)와 마주하게 된다.

“산에 가서 안 오면 걱정했어요, 마침내 죽을까 봐.”

남편의 죽음 앞에서 특별한 동요를 보이지 않는 ‘서래’.
경찰은 보통의 유가족과는 다른 ‘서래’를 용의선상에 올린다.
‘해준’은 사건 당일의 알리바이 탐문과 신문, 잠복수사를 통해
‘서래’를 알아가면서 그녀에 대한 관심이 점점 커져가는 것을 느낀다.

한편, 좀처럼 속을 짐작하기 어려운 ‘서래’는
상대가 자신을 의심한다는 것을 알면서도
조금의 망설임도 없이 ‘해준’을 대하는데….

진심을 숨기는 용의자
용의자에게 의심과 관심을 동시에 느끼는 형사
그들의 <헤어질 결심>', 'https://www.youtube.com/watch?v=i50tT8n9fp8')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '박찬욱 감독의 미장센과 연출이 정점에 달한 작품. 품격 있는 미스터리 로맨스.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '수사극의 외피를 쓴 멜로드라마. 안개처럼 모호한 인물들의 감정선을 섬세하게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '보고 나면 여운이 정말 길게 남는 영화. 대사 하나하나가 시 같아요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '진실이 무엇인지 알 수 없는 불확실성과 인물들의 미스터리한 분위기가 공포감을 자아낸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '액션은 거의 없지만, 용의자를 쫓는 형사의 집요한 추격 과정이 긴장감 넘친다.');

    -- 독전
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('독전', TO_DATE('2018-05-22', 'YYYY-MM-DD'), 123, 5202476, '15세 이상 관람가', '범죄|액션', '대한민국', '이해영', '조진웅|류준열|김주혁|김성령|박해준', 
    '의문의 폭발 사고 후,
오랫동안 마약 조직을 추적해온
형사 ‘원호’(조진웅)의 앞에
조직의 후견인 ‘오연옥’(김성령)과
버림받은 조직원 ‘락’(류준열)이 나타난다.

그들의 도움으로 아시아 마약 시장의 거물 ‘진하림’(김주혁)과
조직의 숨겨진 인물 ‘브라이언’(차승원)을 만나게 되면서
그 실체에 대한 결정적 단서를 잡게 되는데…', 'https://www.youtube.com/watch?v=8asOmw3UnMw')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '스타일리시한 연출과 강렬한 캐릭터들의 향연. 특히 故 김주혁 배우의 연기는 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '장르적 쾌감을 극대화한 캐릭터 무비. 원작의 장점을 영리하게 한국적으로 변주했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '긴장감 넘치는 심리전과 더불어 후반부 액션씬도 훌륭하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '배우들 연기 보는 맛이 있는 영화. 누가 진짜 ‘이선생’일지 계속 추리하면서 봤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '마약에 중독된 인물들의 광기가 공포스럽게 느껴졌다.');

    -- 사라진 밤
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('사라진 밤', TO_DATE('2018-03-07', 'YYYY-MM-DD'), 101, 1315663, '15세 이상 관람가', '스릴러|미스터리', '대한민국', '이창희', '김상경|김강우|김희애', 
    '아내(김희애)를 살해하고 완전범죄를 계획한 남편(김강우).
몇 시간 후, 국과수 사체보관실에서 그녀의 시체가 흔적도 없이 사라진다.
그리고 남편에게 도착한 문자 한 통.
“우리의 비밀을 묻은 곳에서 기다릴게”

남편을 의심하기 시작한 형사(김상경)와
이 모든 것이 아내의 계획이라고 주장하는 남편.
그녀는 정말 죽은 걸까? 사라진 걸까?', 'https://www.youtube.com/watch?v=cMpWP5P_f2s')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '탄탄한 원작을 바탕으로 한 군더더기 없는 스릴러. 제한된 공간에서의 서스펜스 구축이 뛰어나다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '죽은 아내가 살아 돌아왔을지도 모른다는 설정 자체가 주는 공포감이 상당하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '반전이 정말 대박이에요. 마지막까지 긴장을 놓을 수 없었어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.0, '장르적 재미에 충실한 웰메이드 스릴러. 배우들의 연기 앙상블도 좋다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 6.5, '몸으로 싸우는 액션은 없지만, 범인을 잡으려는 형사와 진실을 숨기려는 남편의 심리전이 격렬하다.');
    
    -- 화차
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('화차', TO_DATE('2012-03-08', 'YYYY-MM-DD'), 117, 2436594, '15세 이상 관람가', '미스터리', '대한민국', '변영주', '이선균|김민희|조성하', 
    '그녀가 사라졌다!
결혼 한 달 전, 부모님 댁에 내려가던 중 휴게소에 들른 문호와 선영. 커피를 사러 간 사이 선영은 한 통의 전화를 받고 급하게 나가고, 돌아온 문호를 기다리고 있는 건 문이 열린 채 공회전 중인 차 뿐이다. 몇 번을 걸어봐도 꺼져있는 휴대폰, 내리는 빗속으로 약혼녀가 사라졌다.

그녀의 모든 것은 가짜다!
미친 듯 선영을 찾는 문호. 돌아온 그녀의 집은 급하게 치운 흔적이 역력하고 다니던 회사의 이력서까지 허위다. 단서가 사라질 즈음, 선영이 개인파산을 했었고 정작 면책 서류에 남은 그녀의 필적과 사진은 다른 사람의 것이라는 충격적인 사실이 밝혀진다.

가족도 없고… 친구도 없고… 지문도 없다! 내가 사랑했던 그녀는 누구인가?
그녀를 찾으려면 진짜 이름부터 알아내야 하는 문호는 전직 강력계 형사인 사촌 형 종근에게 도움을 청한다. 통장 잔액을 인출하고, 지문까지 지우고 완벽하게 사라진 그녀의 행적에 범상치 않은 사건임을 직감하는 종근. 결국 그는 선영의 실종이 살인사건과 연관되어 있음을 본능적으로 느끼는데...

추적하면 할수록 드러나는 충격적 진실
과연, 그녀의 정체는 무엇인가.', 'https://www.youtube.com/watch?v=djalBoyQJnc')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '사라진 여인의 흔적을 따라가며 한국 사회의 어두운 단면을 파고드는 수작. 김민희의 재발견.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '미야베 미유키의 원작을 한국적 현실에 맞게 훌륭하게 각색했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '한 사람의 인생이 통째로 뒤바뀔 수 있다는 사실과 사채의 무서움이 공포 그 자체.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '보는 내내 너무 안타깝고 마음 아팠어요. 결말이 너무 슬퍼요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '사라진 약혼녀를 쫓는 주인공의 추적이 긴장감 넘친다.');

    -- 거미집
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('거미집', TO_DATE('2023-09-27', 'YYYY-MM-DD'), 132, 313170, '15세 이상 관람가', '코미디|드라마', '대한민국', '김지운', '송강호|임수정|오정세|전여빈|정수정', 
    '“결말만 바꾸면 걸작이 된다, 딱 이틀이면 돼!”

1970년대 꿈도 예술도 검열당하던 시대
성공적이었던 데뷔작 이후,
악평과 조롱에 시달리던 김감독(송강호)은
촬영이 끝난 영화 ‘거미집’의
새로운 결말에 대한 영감을 주는 꿈을 며칠째 꾸고 있다.
그대로만 찍으면 틀림없이 걸작이 된다는 예감,
그는 딱 이틀 간의 추가 촬영을 꿈꾼다.
그러나 대본은 심의에 걸리고,
제작자 백회장(장영남)은 촬영을 반대한다.
제작사 후계자인 신미도(전여빈)를 설득한 김감독은
베테랑 배우 이민자(임수정), 톱스타 강호세(오정세),
떠오르는 스타 한유림(정수정)까지 불러 모아 촬영을 강행하지만,
스케줄 꼬인 배우들은 불만투성이다.
설상가상 출장 갔던 제작자와 검열 담당자까지 들이닥치면서
현장은 아수라장이 되는데…

과연 ‘거미집’은 세기의 걸작으로 완성될 수 있을까?', 'https://www.youtube.com/watch?v=nZF0thXhKvk')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '영화 만들기에 대한 광기와 열정을 담은 블랙코미디의 걸작. 김지운 감독의 자기 고백서.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '액자식 구성과 앙상블 캐스트의 호연, 70년대 영화 현장을 완벽하게 재현한 미장센이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '웃기고 정신없는데, 영화에 대한 애정이 느껴져서 좋았어요. 배우들 연기 대박이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '영화 촬영 현장에서 벌어지는 소동이 마치 한 편의 액션 활극 같다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '결말을 바꿔야 한다는 감독의 강박과 광기가 공포스럽게 느껴졌다.');

    -- 마당을 나온 암탉
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('마당을 나온 암탉', TO_DATE('2011-07-28', 'YYYY-MM-DD'), 93, 2202631, '전체 관람가', '애니메이션', '대한민국', '오성윤', '문소리|유승호|최민식|박철민', 
    '“나 마당으로 나가고 말 거야 꼭!”

좁은 양계장에 갇혀 품지도 못할 알만 낳던 암탉 ‘잎싹’
진짜 알을 품어보겠다는 꿈을 위해 용기 있게 양계장을 탈출한다.
듬직한 친구 ‘나그네’와 ‘달수’의 도움으로 버려진 알을 품어낸 ‘잎싹’.
그 품에서 태어난 아기 청둥오리 ‘초록’은
‘잎싹’을 단 하나뿐인 엄마로 여긴다.
하지만 겨울이 다가오고, 굶주린 족제비의 위협이 가까워지자
‘잎싹’과 ‘초록’은 더 넓은 세상을 찾아 여정을 떠나게 되는데…

과연 이들은 자유를 향해 날아갈 수 있을까?', 'https://www.youtube.com/watch?v=yhlMqP0Q6k4')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한국 애니메이션의 저력을 보여준 작품. 아름다운 그림체와 감동적인 서사가 일품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '모성애라는 보편적인 주제를 통해 전 세대를 아우르는 감동을 선사한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '아이와 함께 봤는데 제가 더 많이 울었어요. 너무 감동적이에요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '족제비와의 추격전 장면은 웬만한 액션 영화 못지않게 긴장감이 넘쳤다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '자연의 냉혹한 약육강식 세계를 보여주는 장면들은 아이들에게는 꽤나 공포스러울 수 있다.');

    -- 돼지의 왕
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('돼지의 왕', TO_DATE('2011-11-03', 'YYYY-MM-DD'), 97, 19282, '청소년 관람불가', '애니메이션|스릴러', '대한민국', '연상호', '양익준|오정세|김혜나', 
    '이제서야 밝혀지는 끔찍한 이야기
세상이 버렸던 15년 전 그날, 그 끔찍한 이야기가 다시 시작된다.


회사 부도 후 충동적으로 아내를 살인한 ‘경민(오정세)’은
자신의 분노를 감추고 중학교 동창이었던 ‘종석(양익준)’을 찾아 나선다.
소설가가 되지 못해 자서전 대필작가로 근근히 먹고 사는 종석은
15년 만에 찾아온 경민의 방문에 당황한다.
경민은 무시당하고 짓밟혀 지우고 싶었던 중학교 시절과
자신들의 우상이었던 ‘철이(김혜나)’ 이야기를 종석에게 꺼낸다.
그리고 경민은 학창시절의 교정으로 종석을 이끌어,
15년 전 그날의 충격적인 진실을 밝히려 하는데…..', 'https://www.youtube.com/watch?v=tetGI_Dz954')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '애니메이션이라는 매체를 통해 학교 폭력과 계급 사회의 문제를 극단까지 파고든 문제작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '연상호 감독의 날카로운 사회 비판 의식이 담긴 충격적인 데뷔작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '그 어떤 공포 영화보다 현실적이고 잔인하다. 보고 나면 기분이 몹시 불편하지만, 그만큼 강렬하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '너무 충격적이고 어두워서 보기 힘들었지만, 많은 생각을 하게 만드는 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '폭력 묘사가 굉장히 사실적이고 처절하다.');
    
    -- 서울역
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('서울역', TO_DATE('2016-08-17', 'YYYY-MM-DD'), 92, 147138, '15세 이상 관람가', '애니메이션|공포', '대한민국', '연상호', '류승룡|심은경|이준', 
    '대한민국의 사회, 역사, 시대를 관통하는 서울역
어느 날, 치유가 불가능한 상태의 노숙자가 비틀거리는 가운데
집을 나온 소녀(심은경)와 남자친구(이준),
그리고 딸을 찾는 아버지(류승룡)가 이 곳에 함께 한다.
이윽고 서울역을 시작으로 이상 바이러스가 퍼지기 시작하고,
서울은 삽시간에 통제불능 상태가 되는데…

2016년 여름, 대한민국을 뜨겁게 달군
전대미문 재난의 시작이 밝혀진다!', 'https://www.youtube.com/watch?v=B6EZycjTHgo')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '부산행의 시작을 알리는 절망적인 프리퀄. 좀비보다 무서운 것은 인간이라는 메시지가 더 강렬하게 다가온다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '실사 영화 못지않은 속도감과 긴장감을 보여준다. 감독의 사회 비판적 시선이 돋보인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '디스토피아적 세계관을 통해 우리 사회의 가장 어두운 민낯을 드러낸다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '부산행 보고 봤는데, 내용이 이어져서 흥미로웠어요. 근데 너무 꿈도 희망도 없어서 슬펐어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '좀비로부터 도망치는 장면들의 연출이 박진감 넘친다.');
    
    -- 언더독
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('언더독', TO_DATE('2019-01-16', 'YYYY-MM-DD'), 102, 196843, '전체 관람가', '애니메이션', '대한민국', '오성윤|이춘백', '디오|박소담|박철민', 
    '견생역전을 꿈꾸는 댕댕이들의 위대한 모험이 시작된다!

하루아침에 운명이 바뀐 강아지 ‘뭉치’는
우연히 만난 거리 생활의 고참 ‘짱아’ 일당을 만나
목숨을 구하게 된다.

차츰 ‘짱아’ 무리의 스트릿 라이프에 적응하던 찰나
그들의 소중한 아지트가 사라질 위기에 처하고,
마침내 그들은 진정한 자유를 찾기 위한
모험을 떠나기로 결심하는데…', 'https://www.youtube.com/watch?v=Xn7ur9jgaKU')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.0, '한국적인 정서를 담아낸 로드무비 애니메이션. 아름다운 작화와 따뜻한 메시지가 좋다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '강아지들이 너무 귀엽고 용감해서 감동받았어요. 반려동물을 키우는 사람이라면 꼭 보세요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.5, '유기견 문제를 무겁지 않게 다루면서도 생명의 소중함이라는 주제를 놓치지 않는다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '사냥꾼에게 쫓기는 장면들이 꽤나 긴장감 있다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '주인에게 버려진 강아지들의 슬픔과 야생의 위험이 현실적으로 그려져 마음 아팠다.');

    -- 태일이
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('태일이', TO_DATE('2021-12-01', 'YYYY-MM-DD'), 100, 117769, '12세 이상 관람가', '애니메이션|드라마', '대한민국', '홍준표', '장동윤|염혜란|진선규', 
    '평화시장에서 재단사 보조로 취직한 태일이는
정식 재단사가 되어 가족의 생계도 꾸리고
동생들 공부도 시키는 것이 꿈이다.

그러나 열심히 일해 재단사가 된 태일이의 눈에 띈 것은
죽도록 일하고 커피 한 잔 값도 받지 못한 채
피를 토하는 어린 여공들의 얼굴이다.
동료를 위하는 따뜻한 마음만으로는 아무것도 바꿀 수 없고,
‘근로기준법’이 있어도 지켜지지 않는 현실 앞에서
스물두 살 청년 태일이는 스스로 희망의 불꽃이 되기를 결심한다.

“근로기준법을 준수하라! 우리는 기계가 아니다!”', 'https://www.youtube.com/watch?v=2L0TW0l3q3w')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '전태일 열사의 삶을 애니메이션으로 진정성 있게 담아냈다. 묵직한 울림을 주는 작품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '역사적 인물을 다루는 사려 깊은 태도와 따뜻한 그림체가 인상적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '잘 몰랐던 역사에 대해 알게 되었고, 너무 감동받았습니다. 꼭 봐야 할 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '당시 노동자들의 비참한 현실이 어떤 공포 영화보다 무섭고 가슴 아프게 다가왔다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '부당한 현실에 맞서 싸우는 주인공의 모습이 큰 감동을 준다.');

    -- 곤지암
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('곤지암', TO_DATE('2018-03-28', 'YYYY-MM-DD'), 94, 2675775, '15세 이상 관람가', '공포', '대한민국', '정범식', '위하준|박지현|오아연|문예원|박성훈', 
    '공포 체험의 성지 ‘곤지암 정신병원’

1979년 환자 42명의 집단 자살과 병원장의 실종 이후,
섬뜩한 괴담으로 둘러싸인 곤지암 정신병원으로 공포체험을 떠난 7명의 멤버들

원장실, 집단 치료실, 실험실, 열리지 않는 402호…
괴담의 실체를 담아내기 위해 병원 내부를 촬영하기 시작하던 멤버들에게
상상도 못한 기이하고 공포스러운 일들이 실제로 벌어지기 시작 하는데…

가지 말라는 곳에는 반드시 이유가 있다.
소름 끼치는 ‘곤지암 정신병원’ 의 실체를 체험하라!', 'https://www.youtube.com/watch?v=CjcVZVxL_3c')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '한국 공포영화의 새로운 지평을 연 파운드 푸티지. 샬롬 장면은 정말 역대급.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '영화관에서 소리 지르면서 봤어요. 너무 무서워서 팝콘 다 쏟았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '체험형 공포라는 장르적 특성을 영리하게 활용하여 극강의 몰입감을 선사한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '전반부의 빌드업이 다소 길지만, 후반 30분 동안 몰아치는 공포가 압도적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '도망치는 장면들에서 배우들의 필사적인 움직임이 공포감을 더한다.');

    -- 알포인트
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('알포인트', TO_DATE('2004-08-20', 'YYYY-MM-DD'), 106, 1689300, '15세 이상 관람가', '공포|전쟁', '대한민국', '공수창', '감우성|손병호|박원상', 
    '1972년, 베트남 전쟁의 막바지.
200명의 부대원 중, 혼자 살아 남은 혼바우 전투의 생존자
최태인 중위(감우성)는 악몽에 시달리며 괴로워한다.
그러나 그의 본대 복귀 요청은 철회되고,
CID 부대장은 그에게 비밀 수색 명령을 내린다.

1월 30일 밤 10시.
이날도 사단본부 통신부대의 무전기엔
“당나귀 삼공...”을 외치는 비명이 들어오고 있다.
6개월 전 작전 지역명 ‘로미오 포인트’에서 사망한 것으로 추정되는
18명의 수색대원들로부터 구조요청이 오고 있었던 것.
그 흔적 없는 병사들의 생사를 확인할 수 있는 증거물을
확보하는 것이 이번 작전의 목표다.

3일 후.
좌표 63도 32분, 53도 27분 _ 로미오 포인트 입구.
어둠이 밀려오는 밀림으로 들어가는 9명의 병사들 뒤로
나뭇잎에 가려졌던 낡은 비문이 드러난다.

不歸! 손에 피 묻힌 자, 돌아갈 수 없다!!
7일간의 작전, 첫 야영지엔 10명!! 의 병사가 보이고....
그러나 이제 하루가 시작되고 있을 뿐이다.', 'https://www.youtube.com/watch?v=mh4Mz5oukJE')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 10.0, '보이지 않는 존재가 주는 심리적 공포의 극치. 한국 공포 영화의 레전드.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '전쟁이라는 극한 상황과 미지의 공간이 주는 공포를 탁월하게 결합했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '전쟁의 비극과 인간의 광기를 심리적 공포로 풀어낸 수작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '귀신이 직접 나오는 장면보다 분위기만으로도 이렇게 무서울 수 있다는 걸 처음 알았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '전쟁 영화인 줄 알았는데... 총격씬보다 심리전이 더 무서운 영화.');

    -- 기담
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('기담', TO_DATE('2007-08-01', 'YYYY-MM-DD'), 98, 642959, '15세 이상 관람가', '공포|미스터리', '대한민국', '정가형제', '진구|이동규|김태우|김보경', 
    '경성 최고의 의료기술이 갖춰진 ‘안생병원’
동경 유학 중이던 엘리트 의사 부부 ‘인영’(김보경)과
‘동원’(김태우)이 부임하고

병원 원장 딸과의 정략결혼을 앞둔 의대 실습생 ‘정남’(진구)
유년 시절 사고로 다리를 저는 천재 의사 ‘수인’(이동규)과 함께
경성에서의 생활을 시작한다.

그러나 저마다 비밀스런 사랑에 빠져든 이들은
점점 지독한 파멸의 공포와 마주하게 되는데…

1942년 경성 안생병원
우리는 죽은 자와 사랑을 시작했다', 'https://www.youtube.com/watch?v=Mu8lneSoBSE')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.5, '엄마 귀신 장면은 한국 공포영화사에 길이 남을 명장면. 아름답고 서늘한 공포.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '시대적 배경과 어우러진 미장센이 압도적인 작품. 공포를 넘어 예술의 경지에 이르렀다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '옴니버스 형식으로 엮인 각각의 이야기가 유기적으로 연결되며 깊은 여운을 남긴다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '무서운데 너무 슬픈 이야기. 영상미가 정말 아름다워요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '움직임은 적지만, 분위기가 모든 것을 압도하는 영화.');

    -- 사바하
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('사바하', TO_DATE('2019-02-20', 'YYYY-MM-DD'), 122, 2398595, '15세 이상 관람가', '미스터리|스릴러', '대한민국', '장재현', '이정재|박정민|이재인', 
    '한 시골 마을에서 쌍둥이 자매가 태어난다.
온전치 못한 다리로 태어난 ‘금화’(이재인)와
모두가 오래 살지 못할 것이라고 했던 언니 ‘그것’.
하지만 그들은 올해로 16살이 되었다.

신흥 종교 비리를 찾아내는 종교문제연구소 ‘박목사’(이정재)는
사슴동산이라는 새로운 종교 단체를 조사 중이다.
영월 터널에서 여중생이 사체로 발견되는 사건이 발생하고
이를 쫓던 경찰과 우연히 사슴동산에서 마주친 박목사는
이번 건이 심상치 않음을 직감한다.

하지만 진실이 밝혀지기 전 터널 사건의 용의자는 자살하고,
그가 죽기 전 마지막으로 만난
실체를 알 수 없는 정비공 ‘나한’(박정민)과
16년 전 태어난 쌍둥이 동생 금화의 존재까지
사슴동산에 대해 파고들수록
박목사는 점점 더 많은 미스터리와 마주하게 되는데…!

그것이 태어나고 모든 사건이 시작되었다', 'https://www.youtube.com/watch?v=eeXvL2qQmWM')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '검은 사제들, 파묘를 잇는 K-오컬트의 진수. 묵직하고 음산한 분위기가 일품.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '종교와 믿음이라는 주제를 깊이 파고드는 지적인 미스터리 스릴러.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '촘촘하게 짜인 서사와 상징들이 곱씹어볼수록 새로운 의미를 발견하게 한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.5, '조금 어렵긴 한데, 분위기가 정말 압도적이에요. 배우들 연기도 너무 좋았어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '정적인 영화지만, 진실을 파헤쳐 가는 과정이 스릴 넘친다.');

    -- 변신
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('변신', TO_DATE('2019-08-21', 'YYYY-MM-DD'), 113, 1804689, '15세 이상 관람가', '공포|스릴러', '대한민국', '김홍선', '배성우|성동일|장영남', 
    '"어제 밤에는 아빠가 두 명이었어요"

사람의 모습으로 변신하는 악마가 우리 가족 안에 숨어들면서
기이하고 섬뜩한 사건들이 벌어진다.
서로 의심하고 증오하고 분노하는 가운데
구마 사제인 삼촌 ''중수''가 예고없이 찾아오는데...

2019년 극강의 공포스릴러, 절대 믿지도 듣지도 마라', 'https://www.youtube.com/watch?v=mZEhR68Y8N0')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '가족이라는 가장 안전한 울타리가 무너지는 공포. 악마가 가족의 모습으로 나타난다는 설정이 정말 소름 끼친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 8.0, '성동일, 장영남 배우 연기가 너무 현실적이어서 더 무서웠어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 7.0, '익숙한 오컬트 장르의 공식을 따르지만, 가족 드라마와 결합하여 차별점을 만들었다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 7.5, '배우들의 열연이 영화의 공포를 한층 더 끌어올린다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.0, '후반부 구마 의식 장면에서 벌어지는 사투가 긴박감 있다.');

    -- 타짜
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('타짜', TO_DATE('2006-09-28', 'YYYY-MM-DD'), 139, 5685715, '청소년 관람불가', '범죄|드라마', '대한민국', '최동훈', '조승우|김혜수|백윤식|유해진|김윤석', 
    '낯선 자를 조심해라..!

가구공장에서 일하며 남루한 삶을 사는 고니는
대학보다 가난을 벗어나게 해줄 돈이 우선인 열혈 천방지축 청년!
어느 날 고니는, 가구공장 한 켠에서 박무석 일행이 벌이는 화투판에 끼게 된다.
스무장의 화투로 벌이는 ‘섯다’ 한 판!
하지만 고니는 그 판에서 삼년 동안 모아두었던 돈 전부를 날리고 만다.
그것이 전문도박꾼 타짜들이 짜고 친 판이었단 사실을 뒤늦게 안 고니는
박무석 일행을 찾아나서고, 도박으로 시비가 붙은 한 창고에서
우연인 듯 필연처럼 전설의 타짜 평경장을 만난다.
그리고 잃었던 돈의 다섯 배를 따면 화투를 그만두겠단 약속을 하고,
그와 함께 본격적인 꽃싸움에 몸을 던지기 위한 동행길에 오른다.

영원한 친구도, 영원한 원수도 없다..!

드디어 타짜의 길로 들어선 고니!
평경장과 지방원정을 돌던 중 도박판의 꽃, 설계자 정마담을 소개 받고
둘은 서로에게서 범상치 않은 승부욕과 욕망의 기운을 느끼게 된다.
고니는 정마담이 미리 설계해 둔 판에서 큰 돈을 따게 되고,
결국 커져 가는 욕망을 이기지 못한 채 평경장과의 약속을 어기고 만다.
정마담과의 화려한 도박인생, 평경장과의 헤어짐을 택한 고니.
유유자적 기차에 오르는 평경장과 마지막 인사를 나눈 고니는
그 기차역에서 극악무도한 독종이자 죽음의 타짜란 아귀를 스치듯 만난다.
이후 고니는, 정마담의 술집에서 벌어진 한 화투판에서
요란스러운 입담으로 판을 흔드는 고광렬을 만나고,
경찰의 단속을 피하던 중 그와 함께 정마담을 떠나게 된다.
고광렬은 고니와는 달리 남들 버는 만큼만 따면 된다는
직장인 마인드의 인간미 넘치는 타짜!
둘은 환상의 호흡을 자랑하며 전국의 화투판을 휩쓴다.

너를 노린다, 목숨을 건 마지막 승부...!

함께 원정을 뛰며 나름의 도박인생을 꾸려가는 고니와 고광렬.
원정 중 우연히 들린 한 술집에서 고니는
술집주인 화란을 만나고 둘은 첫눈에 서로에게 끌리지만
한없이 떠도는 타짜의 인생에 사랑은 그리 쉬운 일이 아니다.
한편, 고니는 자신을 이 세계에 발 담그게 한 장본인 박무석과
그를 조종하는 인물 곽철용을 찾게 되고,
드디어 보기 좋게 한 판 복수에 성공한다.
하지만 곽철용의 수하는 복수가 낳은 복수를 위해 아귀에게 도움을 청하고,
아귀는 고니에게 애증을 가진 정마담을 미끼로 고니와 고광렬을 화투판으로 끌어들인다.
기차역에서 스쳤던 아귀를 기억해내며 그것이 ‘죽음의 한 판’이란 것을 느끼는 고니.
하지만 고니는 이를 거절하지 않는다.
고광렬의 만류도 뿌리친 채,
그리고 처음으로 평범한 삶을 꿈꾸게 한 여자
화란과의 사랑도 뒤로 한 채, 고니는 그렇게 죽음의 판이 펼쳐질 배에 스스로 오르는데….
물러설 곳 없는 꽃들의 전쟁...!
각자의 원한과 욕망, 그리고 덧없는 희망,
이 모든 것이 뒤엉킨 한 판이 시작된다...!

“겁날 것도, 억울할 것도 없다.
내가 아는 모든 사람이 그랬던 것처럼, 언젠가는 나도 다치거나 죽는다.
그게 타짜이니까…”', 'https://www.youtube.com/watch?v=vLHyh8F-vQo')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '한국형 케이퍼 무비의 교과서. 캐릭터, 대사, 연출 어느 하나 빠지는 것이 없는 걸작.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '허영만 화백의 원작을 스크린에 완벽하게 구현하며 자신만의 스타일을 구축했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '아직도 회자되는 명대사가 너무 많아요. 배우들 연기 보는 재미가 최고!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '화투판에서의 심리전이 총격씬보다 더 긴장감 넘친다. 아귀의 망치 액션은 덤.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '밑장 빼다 걸리면 손모가지 날아가는 도박판의 살벌함이 공포 그 자체.');

    -- 부당거래
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('부당거래', TO_DATE('2010-10-28', 'YYYY-MM-DD'), 119, 2765380, '청소년 관람불가', '범죄|드라마', '대한민국', '류승완', '황정민|류승범|유해진', 
    '2010년 대한민국을 뒤흔든 이벤트!
범인을 잡지 못하면 만들어라!

온 국민을 충격으로 몰아넣은 연쇄 살인 사건. 계속된 검거 실패로 대통령이 직접 사건에 개입하고, 수사 도중 유력한 용의자가 사망하는 사고가 발생하자 경찰청은 마지막 카드를 꺼내든다. 가짜 범인인 ‘배우’를 만들어 사건을 종결 짓는 것!

이번 사건의 담당으로 지목된 광역수사대 에이스 최철기(황정민). 경찰대 출신이 아니라는 이유 때문에 줄도, 빽도 없던 그는 승진을 보장해주겠다는 상부의 조건을 받아들이고 사건에 뛰어들게 된다. 그는 스폰서인 해동 장석구(유해진)를 이용해 ‘배우’를 세우고 대국민을 상대로 한 이벤트를 완벽하게 마무리 짓는다.

한편, 부동산 업계의 큰 손 태경 김회장으로부터 스폰을 받는 검사 주양(류승범)은 최철기가 입찰 비리건으로 김회장을 구속시켰다는 사실에 분개해 그의 뒤를 캐기 시작한다. 때마침 자신에게 배정된 연쇄 살인 사건의 범인을 조사하던 주양은 조사 과정에서 최철기와 장석구 사이에 거래가 있었음을 알아차리고, 최철기에게 또 다른 거래를 제안하는데..

각본쓰는 검사, 연출하는 경찰, 연기하는 스폰서..
더럽게 엮이고 지독하게 꼬인 그들의 거래가 시작된다!', 'https://www.youtube.com/watch?v=55Ky3pc1bWI')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '한국 사회의 부패 사슬을 날카롭게 파고드는 류승완 감독의 걸작. 각본과 연기가 완벽하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '경찰, 검찰, 스폰서 간의 먹이사슬을 통해 권력의 속성을 적나라하게 보여준다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '"호의가 계속되면, 그게 권리인 줄 알아요." 류승범 배우 연기 진짜 미쳤어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '시스템 자체가 악이 되어버린 현실이 주는 공포와 씁쓸함이 대단하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '물리적 액션보다 인물들 간의 팽팽한 기 싸움과 두뇌 싸움이 더 격렬하다.');

    -- 친구
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('친구', TO_DATE('2001-03-31', 'YYYY-MM-DD'), 118, 8181377, '청소년 관람불가', '드라마|액션', '대한민국', '곽경택', '유오성|장동건|서태화|정운택', 
    '준석(유오성), 동수(장동건), 상택(서태화), 중호(정운택)
네 친구는 초등학교 때부터 친했던 친구들.
고등학교에 갔을 때 모범생이 된 상택과 달리
준석과 동수는 학교에서 가장 잘 싸우는 녀석들이 됐다.
아버지가 왕년에 폭력조직 보스였던 준석은
또래에서 맏형 노릇을 하고
장의사집 아들 동수는 준석의 든든한 오른팔이 된다.
상택이 다른 학교 깡패들한테 얻어터질 때
준석과 동수는 친구를 위해 물불 안 가리고 싸운다.
단체관람용 영화를 보던 그날도 그랬다.
준석과 동수는 떼로 몰려드는 타학교 학생들과
혈전을 벌이고 퇴학당한다. 자기 때문에 벌어진 싸움이건만
평소 모범생이던 자신만 유기정학을 당하자
상택은 가출을 결심한다. 준석은 그런 상택을 만류하고
고등학교를 졸업하면서 네 친구는 각자 다른 길을 걷게 된다.
상택과 중호는 대학생이 되고
준석과 동수는 각기 다른 폭력조직에 들어간다.
어떤 상황이 기다리고 있는지 모른 채
준석과 동수는 조직의 명령에 충실한 중간보스로 성장한다.', 'https://www.youtube.com/watch?v=HS16w9OKupE')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '한국형 느와르의 한 획을 그은 작품. 남자들의 우정과 배신을 거칠게 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '시대적 배경과 부산이라는 공간의 특성을 잘 살려내어 영화의 리얼리티를 높였다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '"내가 니 시다바리가?" 장동건 배우의 연기 변신이 충격적이었고, 너무 멋있었어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.0, '날 것 그대로의 거친 액션과 칼부림 장면들이 인상적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '어제의 친구가 오늘의 적이 되는 조폭 세계의 비정함이 공포스럽게 다가온다.');

    -- 범죄와의 전쟁: 나쁜놈들 전성시대
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('범죄와의 전쟁: 나쁜놈들 전성시대', TO_DATE('2012-02-02', 'YYYY-MM-DD'), 133, 4720050, '청소년 관람불가', '범죄|드라마', '대한민국', '윤종빈', '최민식|하정우|조진웅|마동석|곽도원', 
    '비리 세관 공무원 최익현, 보스 최형배를 만나다!
1982년 부산. 해고될 위기에 처한 비리 세관원 최익현(최민식)은
순찰 중 적발한 히로뽕을 일본으로 밀수출,
마지막으로 한 탕 하기 위해
부산 최대 조직의 젊은 보스 최형배(하정우)와 손을 잡는다.

머리 쓰는 나쁜 놈과 주먹 쓰는 나쁜 놈, 부산을 접수하다!
익현은 탁월한 임기응변과 특유의 친화력으로
형배의 신뢰를 얻는 데 성공한다.
주먹 넘버원 형배와 로비의 신 익현은 함께 힘을 합쳐
부산을 접수하기 시작하고,
두 남자 앞에 나쁜 놈들의 전성시대가 펼쳐진다.

넘버원이 되고 싶은 나쁜 놈들의 한판 승부. 범죄와의 전쟁
하지만 1990년 범죄와의 전쟁이 선포되자
조직의 의리는 금이 가고 넘버원이 되고 싶은
나쁜 놈들 사이의 배신이 시작된다.
살아남기 위해 벌이는 치열한 한판 승부,
최후에 웃는 자는 과연 누가 될 것인가?', 'https://www.youtube.com/watch?v=9bu_FJGpAWU')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '80년대 한국 사회를 배경으로 펼쳐지는 한 편의 대서사시. 최민식의 인생 연기.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '혈연, 지연, 학연으로 얽힌 한국형 권력의 형성과 몰락을 예리하게 포착했다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '하정우 먹방의 시작! 배우들 연기 보는 맛이 일품인 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.5, '남자들의 거친 액션과 기 싸움이 영화 내내 팽팽한 긴장감을 유지한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '믿었던 사람에게 배신당하는 것이 가장 무서운 법. 권력 다툼의 비정함을 보여준다.');

    -- 다만 악에서 구하소서
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('다만 악에서 구하소서', TO_DATE('2020-08-05', 'YYYY-MM-DD'), 108, 4357803, '15세 이상 관람가', '범죄|액션', '대한민국', '홍원찬', '황정민|이정재|박정민', 
    '태국에서 충격적인 납치사건이 발생하고
마지막 청부살인 미션을 끝낸 암살자 인남(황정민)은
그것이 자신과 관계된 것임을 알게 된다.
인남은 곧바로 태국으로 향하고,
조력자 유이(박정민)를 만나 사건을 쫓기 시작한다.
한편, 자신의 형제가 인남에게 암살당한 것을 알게 된 레이(이정재).
무자비한 복수를 계획한 레이는
인남을 추격하기 위해 태국으로 향하는데...

처절한 암살자 VS 무자비한 추격자
멈출 수 없는 두 남자의 지독한 추격이 시작된다!', 'https://www.youtube.com/watch?v=919GruRSZzE')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 9.5, '스타일리시하고 처절한 하드보일드 액션의 진수. 황정민과 이정재의 추격전이 압권.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '신세계 이후 다시 만난 두 배우의 케미가 폭발한다. 박정민의 연기 변신도 놀랍다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '단순한 서사를 압도적인 액션과 캐릭터의 힘으로 밀어붙인다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '이정재 배우 정말 무섭게 나와요. 액션이 너무 시원시원해서 재밌었어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.5, '자비 없는 복수귀 레이의 추격이 공포 영화 못지않게 무서웠다.');

    -- 비긴 어게인
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('비긴 어게인', TO_DATE('2014-08-13', 'YYYY-MM-DD'), 104, 3479768, '15세 이상 관람가', '드라마|로맨스|뮤직', '미국', '존 카니', '키이라 나이틀리|마크 러팔로|애덤 리바인', 
    '싱어송라이터인 ‘그레타’(키이라 나이틀리)는
남자친구 ‘데이브’(애덤 리바인)가 메이저 음반회사와
계약을 하게 되면서 뉴욕으로 오게 된다.

그러나 행복도 잠시, 오랜 연인이자 음악적 파트너로서
함께 노래를 만들고 부르는 것이 좋았던 그레타와 달리
스타가 된 데이브의 마음은 어느새 변해버린다.

스타 음반 프로듀서였지만 이제는 해고된 ‘댄’(마크 러팔로)은
미치기 일보 직전 들른 뮤직바에서 그레타의 자작곡을 듣게 되고
아직 녹슬지 않은 촉을 살려 음반 제작을 제안한다.

거리 밴드를 결성한 그들은 뉴욕의 거리를
스튜디오 삼아 진짜로 부르고 싶었던 노래를 만들어가는데…', 'https://www.youtube.com/watch?v=98wK1kFDEAo')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.0, '음악이 어떻게 사람을 치유하고 연결하는지 보여주는 사랑스러운 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '노래가 너무 좋아서 영화 보고 나서 계속 들었어요. OST 맛집!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.5, '뉴욕의 거리를 스튜디오 삼아 음악을 만들어가는 과정이 낭만적으로 그려졌다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '큰 사건은 없지만, 음악의 힘이 영화를 끝까지 끌고 간다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.0, '주인공들이 겪는 실패와 좌절이 현실적이어서 마음 아팠다.');

    -- 라라랜드
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('라라랜드', TO_DATE('2016-12-07', 'YYYY-MM-DD'), 127, 3624009, '12세 이상 관람가', '드라마|뮤지컬|로맨스', '미국', '데이미언 셔젤', '라이언 고슬링|엠마 스톤', 
    '황홀한 사랑, 순수한 희망, 격렬한 열정…
이 곳에서 모든 감정이 폭발한다!

꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’.
재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤),
인생에서 가장 빛나는 순간 만난 두 사람은
미완성인 서로의 무대를 만들어가기 시작한다.', 'https://www.youtube.com/watch?v=Dt5hFexM5BI')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 10.0, '고전 뮤지컬에 대한 경의와 현대적인 감각이 어우러진 마법 같은 영화.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.5, '꿈과 사랑에 대한 달콤하고도 씁쓸한 통찰. 황홀한 음악과 영상미가 압도적이다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.5, '영상도, 노래도, 이야기도 모두 완벽했어요. 마지막 10분은 정말 잊을 수가 없어요.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 8.0, '꿈과 현실 사이에서 갈등하는 주인공들의 모습이 안타까웠고, 이루어지지 못한 사랑이 슬펐다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 7.5, '화려한 춤과 움직임이 가득한, 눈과 귀가 즐거운 영화.');

    -- 위플래쉬
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('위플래쉬', TO_DATE('2015-03-12', 'YYYY-MM-DD'), 106, 1588669, '15세 이상 관람가', '드라마', '미국', '데이미언 셔젤', '마일즈 텔러|JK 시몬스|멜리사 베노이스트',
    '뉴욕의 명문 음악 학교에 다니지만
특별히 주목받지 못하던 드러머 앤드류.
최고의 드러머를 꿈꾸며 연습에만 매진하던 그는 어느 날,
우연히 교내 최고의 밴드를 이끄는 플레쳐 교수의 눈에 띄어
그의 밴드에 발탁된다.

그러나 모욕적인 폭언과 폭력을 휘두르며
완벽을 강요하는 플레쳐 교수의 무자비한 교수법으로 인해
앤드류는 능력을 증명해야 한다는 생각에 점차 미쳐가고,
앤드류가 광기에 휩싸일수록
플레쳐 교수의 완벽을 향한 집념 역시 높아지는데…!

“세상에서 제일 해로운 말이 뭔지 알아? ‘그 정도면 잘했어’야”
미친놈 vs 미친놈, 집념과 광기가 폭발한다!', 'https://www.youtube.com/watch?v=Qsbu5Phz6u8')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 9.5, '광기 어린 재능과 집요한 교육이 만났을 때의 폭발적인 시너지. 마지막 10분은 전율 그 자체.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 10.0, '이건 음악 영화가 아니라 액션 영화다. 드럼 스틱으로 벌이는 처절한 전투.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 9.0, '천재를 갈망하는 인간의 욕망과 광기를 숨 막히는 리듬감으로 그려냈다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 9.0, '플레쳐 교수의 언어폭력과 정신적 학대는 어떤 공포 영화보다 무섭고 압박감이 심하다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 9.0, '보는 내내 손에 땀을 쥐었어요. 정말 미친 영화라는 말밖에 안 나와요.');

    -- 보헤미안 랩소디
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('보헤미안 랩소디', TO_DATE('2018-10-31', 'YYYY-MM-DD'), 134, 9948386, '12세 이상 관람가', '드라마', '미국|영국', '브라이언 싱어', '라미 말렉|조셉 마젤로|마이크 마이어스',
    '공항에서 수하물 노동자로 일하며 음악의 꿈을 키우던
이민자 출신의 아웃사이더 ‘파록버사라’
보컬을 구하던 로컬 밴드에 들어가게 되면서
‘프레디 머큐리’라는 이름으로 밴드 ‘퀸’을 이끌게 된다.

시대를 앞서가는 독창적인 음악과 화려한 퍼포먼스로
관중들을 사로잡으며 성장하던 ‘퀸’은
라디오와 방송에서 외면을 받을 것이라는
음반사의 반대에도 불구하고
무려 6분 동안 이어지는 실험적인 곡 ‘보헤미안 랩소디’로
대성공을 거두며 월드스타 반열에 오른다.

그러나 독보적인 존재감을 뿜어내던 ‘프레디 머큐리’는
솔로 데뷔라는 유혹에 흔들리게 되고
결국 오랜 시간 함께 해왔던 멤버들과 결별을 선언하게 되는데…

세상에서 소외된 아웃사이더에서 전설의 록밴드 ‘퀸’ 되기까지,
우리가 몰랐던 그들의 진짜 이야기가 시작된다!', 'https://www.youtube.com/watch?v=XTZko22Ze3o')
    RETURNING movie_id INTO v_movie_id;
    UPDATE movies SET image_path = '/images/' || v_movie_id || '/' WHERE movie_id = v_movie_id;
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_viewer, 10.0, '퀸의 노래를 잘 몰랐는데도 너무 재밌었어요. 마지막 라이브 에이드 장면은 정말 콘서트장에 있는 것 같았어요!');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_cinephile, 8.5, '전형적인 전기 영화의 틀을 따르지만, 퀸의 음악과 라미 말렉의 신들린 연기가 모든 것을 압도한다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_critic, 8.0, '음악의 힘이 얼마나 위대한지 증명하는 영화. 관객을 열광시키는 방법을 정확히 알고 있다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_action, 8.0, '프레디 머큐리의 무대 위 퍼포먼스는 그 어떤 액션보다 역동적이고 에너지가 넘친다.');
    INSERT INTO reviews (movie_id, user_id, rating, review_comment) VALUES (v_movie_id, v_user_horror, 7.5, '성공 뒤에 가려진 그의 외로움과 고통이 마음 아프게 다가왔다.');

    -- 스윙키즈
    INSERT INTO movies (title, release_date, duration, audience, film_rating, category, country, director, main_actor, description, video_path)
    VALUES ('스윙키즈', TO_DATE('2018-12-19', 'YYYY-MM-DD'), 133, 1474276, '12세 이상 관람가', '드라마', '대한민국', '강형철', '디오|자레드 그라임스|박혜수|오정세', 
    '“여기서 댄스단 하나 만들어 보는 거 어때? 포로들로”

1951년 한국전쟁, 최대 규모의 거제 포로수용소.
새로 부임해 온 소장은 수용소의 대외적 이미지 메이킹을 위해
전쟁 포로들로 댄스단을 결성하는 프로젝트를 계획한다.

수용소 내 최고 트러블메이커 ‘로기수’(도경수),
무려 4개 국어가 가능한 무허가 통역사 ‘양판래’(박혜수),
잃어버린 아내를 찾기 위해
유명해져야 하는 사랑꾼 ‘강병삼’(오정세),
반전 댄스실력 갖춘 영양실조 춤꾼 ‘샤오팡’(김민호),
그리고 이들의 리더,
전직 브로드웨이 탭댄서 ‘잭슨’(자레드 그라임스)까지
우여곡절 끝에 한 자리에 모인 그들의 이름은 ‘스윙키즈’!

각기 다른 사연을 갖고 춤을 추게 된 그들에게
첫 데뷔 무대가 다가오지만, 국적, 언어, 이념, 춤 실력,
모든 것이 다른 오합지졸 댄스단의 앞날은 캄캄하기만 한데…!', 'https://www.youtube.com/watch?v=9KDxLantLUw')
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