SELECT COUNT(modified_on) FROM conductor_stage.task WHERE modified_on > '2020-05-01';
SELECT COUNT(modified_on) FROM conductor_stage.task WHERE modified_on BETWEEN '2020-01-01' AND '2020-04-01';
SELECT * FROM conductor_stage.task WHERE modified_on > '2020-05-01';
SELECT * FROM conductor_stage.task WHERE modified_on BETWEEN '2020-03-01' AND '2020-04-01';
EXPLAIN SELECT COUNT(modified_on) FROM conductor_stage.task WHERE modified_on > '2020-05-01';
EXPLAIN ANALYZE SELECT COUNT(modified_on) FROM conductor_stage.task WHERE modified_on > '2020-05-01';

SELECT * FROM pg_indexes WHERE schemaname = 'conductor_stage' ORDER BY tablename, indexname;

DROP INDEX conductor_stage.task_modified;
CREATE INDEX concurrently task_modified ON conductor_stage.task (modified_on);
EXPLAIN ANALYZE SELECT * FROM conductor_stage.task WHERE modified_on BETWEEN '2020-01-01' AND '2020-04-01';
Finalize Aggregate  (cost=1105146.90..1105146.91 rows=1 width=8) (actual time=362025.939..362025.939 rows=1 loops=1)
  ->  Gather  (cost=1105146.28..1105146.89 rows=6 width=8) (actual time=361608.228..362042.111 rows=7 loops=1)
        Workers Planned: 6
        Workers Launched: 6		
        ->  Partial Aggregate  (cost=1104146.28..1104146.29 rows=1 width=8) (actual time=361745.772..361745.773 rows=1 loops=7)
        ->  Parallel Index Only Scan using task_modified on task  (cost=0.56..1099973.27 rows=1669202 width=8) (actual time=16.100..361448.965 rows=1430361 loops=7)		
            Index Cond: ((modified_on >= '2020-01-01 00:00:00'::timestamp without time zone) AND (modified_on <= '2020-04-01 00:00:00'::timestamp without time zone))
            Heap Fetches: 1516746
Planning Time: 0.392 ms
Execution Time: 362049.978 ms			

DROP INDEX conductor_stage.task_modified;
CREATE INDEX concurrently task_modified ON conductor_stage.task USING BRIN (modified_on);
EXPLAIN ANALYZE SELECT * FROM conductor_stage.task WHERE modified_on BETWEEN '2020-01-01' AND '2020-04-01';
Finalize Aggregate  (cost=6585636.18..6585636.19 rows=1 width=8) (actual time=69092.648..69092.649 rows=1 loops=1)
  ->  Gather  (cost=6585635.35..6585636.16 rows=8 width=8) (actual time=69033.423..69199.039 rows=9 loops=1)
      Workers Planned: 8
      Workers Launched: 8		
      ->  Partial Aggregate  (cost=6584635.35..6584635.36 rows=1 width=8) (actual time=69012.039..69012.039 rows=1 loops=9)		
         ->  Parallel Bitmap Heap Scan on task  (cost=3477.32..6581505.39 rows=1251982 width=8) (actual time=277.091..68657.912 rows=1112503 loops=9)		
             Recheck Cond: ((modified_on >= '2020-01-01 00:00:00'::timestamp without time zone) AND (modified_on <= '2020-04-01 00:00:00'::timestamp without time zone))		
             Rows Removed by Index Recheck: 1644807
             Heap Blocks: lossy=583523
             ->  Bitmap Index Scan on task_modified  (cost=0.00..973.35 rows=11052044 width=0) (actual time=274.572..274.572 rows=52555520 loops=1)					
				Index Cond: ((modified_on >= '2020-01-01 00:00:00'::timestamp without time zone) AND (modified_on <= '2020-04-01 00:00:00'::timestamp without time zone))
Planning Time: 0.377 ms
Execution Time: 69199.117 ms
							  
DROP INDEX conductor_stage.task_modified;
EXPLAIN ANALYZE SELECT * FROM conductor_stage.task WHERE modified_on BETWEEN '2020-01-01' AND '2020-04-01';
Finalize Aggregate  (cost=7844259.59..7844259.60 rows=1 width=8) (actual time=124617.354..124617.354 rows=1 loops=1)
  ->  Gather  (cost=7844258.76..7844259.57 rows=8 width=8) (actual time=124576.358..124725.622 rows=9 loops=1)
      Workers Planned: 8
      Workers Launched: 8		  
      ->  Partial Aggregate  (cost=7843258.76..7843258.77 rows=1 width=8) (actual time=124539.410..124539.410 rows=1 loops=9)	
		->  Parallel Seq Scan on task  (cost=0.00..7840128.81 rows=1251982 width=8) (actual time=6.973..124174.249 rows=1112503 loops=9)		
            Filter: ((modified_on >= '2020-01-01 00:00:00'::timestamp without time zone) AND (modified_on <= '2020-04-01 00:00:00'::timestamp without time zone))			  
            Rows Removed by Filter: 2314240
Planning Time: 0.313 ms					
Execution Time: 124725.690 ms