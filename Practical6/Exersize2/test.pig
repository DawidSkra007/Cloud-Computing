A = LOAD 'hdfs://namenode:9000/test/input/web_access.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') as 
(id:int, host:chararray, m_time:long, method:chararray, url:chararray, response:int, bytes:int);
B = FOREACH A GENERATE ToString(ToDate(m_time*1000), 'yyyy-MM-dd') AS m_time, bytes;

D = GROUP B BY m_time;
result = FOREACH D GENERATE FLATTEN(group) AS (m_time), SUM(B.bytes) AS total_Bytes;

ordered = ORDER result BY total_Bytes DESC;
final = LIMIT ordered 3;
STORE final INTO 'hdfs://namenode:9000/test/output/pig/res9' USING PigStorage (',');

