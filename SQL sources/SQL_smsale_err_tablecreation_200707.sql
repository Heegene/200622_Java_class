CREATE TABLE smsale_err
        ( yymm        VARCHAR2(6), -- �Ǹ� ���
          item_code   VARCHAR2(4), -- ��ǰ��ȣ
          mmsum30_qty NUMBER(8), -- ����������
          smsale_qty  NUMBER(8), -- �Ǹż���
          sawonid     VARCHAR2(4), -- �ǸŻ���ڵ�
          regdate     DATE-- ������� 
          );
          
ALTER TABLE smsale_err
    ADD CONSTRAINT PK_SMSALE_ERR PRIMARY KEY(yymm, item_code); 