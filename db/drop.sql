-- ============================================================
-- CinemaInfo 프로젝트 DB 객체 전체 삭제 스크립트
-- ============================================================

-- 1. 트리거 삭제
BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_update_avg_rating';
    DBMS_OUTPUT.PUT_LINE('TRIGGER trg_update_avg_rating dropped.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -4080 THEN -- 트리거가 없는 경우
            DBMS_OUTPUT.PUT_LINE('TRIGGER trg_update_avg_rating does not exist. Skipped.');
        ELSE
            RAISE;
        END IF;
END;
/

-- 2. 테이블 삭제
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE reviews CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('TABLE reviews dropped.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -942 THEN -- 테이블이 없는 경우
            DBMS_OUTPUT.PUT_LINE('TABLE reviews does not exist. Skipped.');
        ELSE
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE movies CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('TABLE movies dropped.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -942 THEN
            DBMS_OUTPUT.PUT_LINE('TABLE movies does not exist. Skipped.');
        ELSE
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE users CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('TABLE users dropped.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -942 THEN
            DBMS_OUTPUT.PUT_LINE('TABLE users does not exist. Skipped.');
        ELSE
            RAISE;
        END IF;
END;
/

-- PURGE RECYCLEBIN;
-- DBMS_OUTPUT.PUT_LINE('Recycle bin purged.');

PROMPT drop.sql 실행 완료: 모든 관련 DB 객체가 성공적으로 삭제되었습니다.