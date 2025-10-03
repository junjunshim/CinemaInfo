-- ============================================================
-- CinemaInfo 프로젝트 DB 객체 전체 삭제 스크립트 (drop.sql)
-- ============================================================

-- 객체가 존재하지 않을 때 오류가 발생하는 것을 방지하기 위해 PL/SQL 블록 사용

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
-- 참조 관계의 역순으로 삭제하는 것이 좋지만, CASCADE CONSTRAINTS 옵션을 사용하면 순서에 상관없이 삭제 가능합니다.
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

-- Oracle 휴지통 비우기 (선택 사항)
-- DROP TABLE을 실행하면 객체들이 바로 삭제되지 않고 휴지통으로 이동합니다.
-- 완전히 삭제하여 공간을 확보하려면 아래 명령어를 실행할 수 있습니다.
-- PURGE RECYCLEBIN;
-- DBMS_OUTPUT.PUT_LINE('Recycle bin purged.');

PROMPT drop.sql 실행 완료: 모든 관련 DB 객체가 성공적으로 삭제되었습니다.