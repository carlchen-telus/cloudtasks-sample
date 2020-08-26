CREATE TABLE IF NOT EXISTS  TASK_QUEUE (
  ID  SERIAL,
  ATTEMPTS INTEGER NOT NULL ,
  CREATE_TIMESTAMP TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CREATE_USER VARCHAR(30) NOT NULL ,
  REFERENCE_ID VARCHAR(30),
  REFERENCE_TYPE VARCHAR(30),
  OPERATION_NAME VARCHAR(30),
  SYNC_ID VARCHAR(100)  NOT NULL ,
  PROCESS_MESSAGE TEXT,
  REQUEST_MESSAGE JSON NOT NULL ,
  SOURCE VARCHAR(50) NOT NULL ,
  STATUS VARCHAR(20)E NOT NULL ,
  TARGET VARCHAR(50) NOT NULL ,
  TARGET_URL VARCHAR(255) NOT NULL ,
  TRANSACTION_ID VARCHAR(100),
  UPDATE_TIMESTAMP TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID, CREATE_TIMESTAMP),
  UNIQUE (CREATE_TIMESTAMP)
  ) PARTITION BY RANGE (CREATE_TIMESTAMP);

CREATE INDEX TASK_QUEUE_REFERENCE_ID_INDEX ON TASK_QUEUE(REFERENCE_ID);
CREATE INDEX TASK_QUEUE_REFERENCE_TYPE_INDEX ON TASK_QUEUE(REFERENCE_TYPE);
CREATE INDEX TASK_QUEUE_SYNC_ID_INDEX ON TASK_QUEUE(SYNC_ID);
CREATE INDEX TASK_QUEUE_SOURCE_INDEX ON TASK_QUEUE(SOURCE);
CREATE INDEX TASK_QUEUE_TARGET_INDEX ON TASK_QUEUE(TARGET);
CREATE INDEX TASK_QUEUE_TRANSACTION_ID_INDEX ON TASK_QUEUE(TRANSACTION_ID);
CREATE INDEX TASK_QUEUE_STATUS_INDEX ON TASK_QUEUE(STATUS);
CREATE INDEX TASK_QUEUE_OPERATION_NAME_INDEX ON TASK_QUEUE(OPERATION_NAME);
  
CREATE TABLE TASK_QUEUE_2020_09 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2020-09-01') TO ('2020-09-30');
CREATE TABLE TASK_QUEUE_2020_10 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2020-10-01') TO ('2020-10-31');
CREATE TABLE TASK_QUEUE_2020_11 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2020-11-01') TO ('2020-11-30');
CREATE TABLE TASK_QUEUE_2020_12 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2020-12-01') TO ('2020-12-31');
CREATE TABLE TASK_QUEUE_2021_01 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-01-01') TO ('2021-01-31');
CREATE TABLE TASK_QUEUE_2021_02 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-02-01') TO ('2021-02-28');
CREATE TABLE TASK_QUEUE_2021_03 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-03-01') TO ('2021-03-31');
CREATE TABLE TASK_QUEUE_2021_04 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-04-01') TO ('2021-04-30');
CREATE TABLE TASK_QUEUE_2021_05 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-05-01') TO ('2021-05-31');
CREATE TABLE TASK_QUEUE_2021_06 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-06-01') TO ('2021-06-30');
CREATE TABLE TASK_QUEUE_2021_07 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-07-01') TO ('2021-07-31');
CREATE TABLE TASK_QUEUE_2021_08 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-08-01') TO ('2021-08-31');
CREATE TABLE TASK_QUEUE_2021_09 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-09-01') TO ('2021-09-30');
CREATE TABLE TASK_QUEUE_2021_10 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-10-01') TO ('2021-10-31');
CREATE TABLE TASK_QUEUE_2021_11 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-11-01') TO ('2021-11-30');
CREATE TABLE TASK_QUEUE_2021_12 PARTITION OF TASK_QUEUE
   FOR VALUES FROM ('2021-12-01') TO ('2021-12-31');

   
CREATE TABLE TASK_QUEUE_DEFAULT PARTITION OF TASK_QUEUE DEFAULT;