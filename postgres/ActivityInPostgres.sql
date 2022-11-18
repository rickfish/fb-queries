select pid,backend_start,query_start,state_change,wait_event,STATE,wait_event_type,query from pg_stat_activity where application_name = 'HeidiSQL';
SELECT * from pg_stat_activity where application_name = 'HeidiSQL';
SELECT STATE, application_name, query_start, * from pg_stat_activity ORDER BY STATE, application_name, query_start;
SELECT distinct application_name, COUNT(*) from pg_stat_activity group by application_name ORDER BY application_name;
SELECT STATE, count(*) from pg_stat_activity group by state;
