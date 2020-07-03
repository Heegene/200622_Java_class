-- emp-sal 변경 체크하는 트리거 생성 예제

create or replace TRIGGER check_salary
BEFORE UPDATE OR DELETE OR INSERT ON emp

BEGIN 
      -- 금요일이나 일요일이면(수업날이 금요일이라 임의로) 
      IF (TO_CHAR(sysdate,'D') IN ('6', '1')) THEN 
        RAISE_APPLICATION_ERROR(-20500, '주말에는 변경할 수 없습니다.');
      
      END IF;

END;

-- 트리거 생성 두번째 예제


CREATE OR REPLACE TRIGGER triger_test
BEFORE UPDATE ON dept
FOR EACH ROW -- old, new를 사용하기 위해 각 줄 

BEGIN
      DBMS_OUTPUT.ENABLE;
      DBMS_OUTPUT.PUT_LINE('변경 전 컬럼값 : ' || : old.dname);
      DBMS_OUTPUT.PUT_LINE('변경 후 컬럼값 : ' || : new.dname);
END;



-- sample
UPDATE dept 
SET dname = '자재팀'
WHERE dname = '자재ㄹ';



-- 트리거 또다른 예제
-- emp 테이블에 insert, update, delete문이 하루에 몇 건의 row만큼 발생했는지
-- 확인하여 emp_audit_row에
-- 사용자이름, 작업구분, 작업시간, 사원번호, 이전급여, 갱신급여 저장하는 트리거

-- 시퀀스 생성 
DROP SEQUENCE emp_row_seq;
CREATE SEQUENCE emp_row_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999999
    MINVALUE 1
    NOCYCLE
    NOCACHE;

-- 데이터 변경 로그를 위한 audit 테이블 생성 
DROP TABLE emp_row_audit;
CREATE TABLE emp_row_audit(
      e_id    NUMBER(6) CONSTRAINT emp_row_pk PRIMARY KEY,
      e_name  VARCHAR2(30),
      e_gubun VARCHAR2(10),
      e_date  DATE);
      
      
-- audit 테이블에 데이터를 넣는 트리거 생성
CREATE OR REPLACE TRIGGER emp_row_aud
    AFTER INSERT OR UPDATE OR DELETE ON emp
    FOR EACH ROW
    
BEGIN
    IF INSERTING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_seq.NEXTVAL, :old.ename, 'inserting', sysdate);
    ELSIF UPDATING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_sseq.NEXTVAL, :old.ename, 'updating', sysdate);
    ELSIF DELETING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_seq.NEXTVAL, :old.ename, 'deleting', sysdate);
    END IF;
END;



