ALTER TABLE conductor_prod.workflow_def_to_workflow
	ALTER COLUMN date_str TYPE VARCHAR(60) USING date_str::varchar;
ALTER TABLE conductor_prod.queue_message
	ALTER COLUMN offset_time_seconds TYPE BIGINT USING offset_time_seconds::BIGINT;
ALTER TABLE conductor_prod.event_execution
	DROP CONSTRAINT unique_event_execution;
CREATE UNIQUE INDEX unique_event_execution ON conductor_prod.event_execution (event_handler_name,event_name,execution_id);
UPDATE conductor_prod.schema_version
	SET script = 'V1__initial_schema.sql', checksum = 1899847952
	WHERE script = 'P1__initial_schema.sql';
UPDATE conductor_prod.schema_version
	SET script = 'V2__1009_Fix_PostgresExecutionDAO_Index.sql', checksum = -1672007158, description = '1009 Fix PostgresExecutionDAO Index'
	WHERE script = 'P2__queue_add_priority.sql';	
commit;