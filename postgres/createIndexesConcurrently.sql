-- 3) workflow_to_task
ALTER TABLE workflow_to_task DROP CONSTRAINT IF EXISTS workflow_to_task_id;
ALTER TABLE workflow_to_task DROP CONSTRAINT IF EXISTS workflow_to_task_pkey;
ALTER TABLE workflow_to_task DROP COLUMN IF EXISTS id;
-- ALTER TABLE workflow_to_task ADD PRIMARY KEY (workflow_id, task_id);
CREATE UNIQUE INDEX CONCURRENTLY workflow_to_task_pkey ON workflow_to_task (workflow_id, task_id)
ALTER TABLE workflow_to_task ADD CONSTRAINT workflow_to_task_id PRIMARY KEY USING INDEX workflow_to_task_pkey

-- 4) workflow_pending
ALTER TABLE workflow_pending DROP CONSTRAINT IF EXISTS unique_workflow_type_workflow_id;
ALTER TABLE workflow_pending DROP CONSTRAINT IF EXISTS workflow_pending_pkey;
ALTER TABLE workflow_pending DROP COLUMN IF EXISTS id;
-- ALTER TABLE workflow_pending ADD PRIMARY KEY (workflow_type, workflow_id);
CREATE UNIQUE INDEX CONCURRENTLY workflow_pending_pkey ON workflow_pending (workflow_type, workflow_id)
ALTER TABLE workflow_pending ADD CONSTRAINT unique_workflow_type_workflow_id PRIMARY KEY USING INDEX workflow_pending_pkey

-- 5) workflow_def_to_workflow
ALTER TABLE workflow_def_to_workflow DROP CONSTRAINT IF EXISTS unique_workflow_def_date_str;
ALTER TABLE workflow_def_to_workflow DROP CONSTRAINT IF EXISTS workflow_def_to_workflow_pkey;
ALTER TABLE workflow_def_to_workflow DROP COLUMN IF EXISTS id;
-- ALTER TABLE workflow_def_to_workflow ADD PRIMARY KEY (workflow_def, date_str, workflow_id);
CREATE UNIQUE INDEX CONCURRENTLY workflow_def_to_workflow_pkey ON workflow_def_to_workflow (workflow_def, date_str, workflow_id)
ALTER TABLE workflow_def_to_workflow ADD CONSTRAINT unique_workflow_def_date_str PRIMARY KEY USING INDEX workflow_def_to_workflow_pkey

-- 6) workflow
ALTER TABLE workflow DROP CONSTRAINT IF EXISTS unique_workflow_id;
ALTER TABLE workflow DROP CONSTRAINT IF EXISTS workflow_pkey;
ALTER TABLE workflow DROP COLUMN IF EXISTS id;
-- ALTER TABLE workflow ADD PRIMARY KEY (workflow_id);
CREATE UNIQUE INDEX CONCURRENTLY workflow_pkey ON workflow (workflow_id)
ALTER TABLE workflow ADD CONSTRAINT unique_workflow_id PRIMARY KEY USING INDEX workflow_pkey

-- 7) task
ALTER TABLE task DROP CONSTRAINT IF EXISTS unique_task_id;
ALTER TABLE task DROP CONSTRAINT IF EXISTS task_pkey;
ALTER TABLE task DROP COLUMN IF EXISTS id;
-- ALTER TABLE task ADD PRIMARY KEY (task_id);
CREATE UNIQUE INDEX CONCURRENTLY task_pkey ON task (task_id)
ALTER TABLE task ADD CONSTRAINT unique_task_id PRIMARY KEY USING INDEX task_pkey

-- 8) task_in_progress
ALTER TABLE task_in_progress DROP CONSTRAINT IF EXISTS unique_task_def_task_id1;
ALTER TABLE task_in_progress DROP CONSTRAINT IF EXISTS task_in_progress_pkey;
ALTER TABLE task_in_progress DROP COLUMN IF EXISTS id;
-- ALTER TABLE task_in_progress ADD PRIMARY KEY (task_def_name, task_id);
CREATE UNIQUE INDEX CONCURRENTLY task_in_progress_pkey ON task_in_progress (task_def_name, task_id)
ALTER TABLE task_in_progress ADD CONSTRAINT unique_task_def_task_id1 PRIMARY KEY USING INDEX task_in_progress_pkey

-- 9) task_scheduled
ALTER TABLE task_scheduled DROP CONSTRAINT IF EXISTS unique_workflow_id_task_key;
ALTER TABLE task_scheduled DROP CONSTRAINT IF EXISTS task_scheduled_pkey;
ALTER TABLE task_scheduled DROP COLUMN IF EXISTS id;
-- ALTER TABLE task_scheduled ADD PRIMARY KEY (workflow_id, task_key);
CREATE UNIQUE INDEX CONCURRENTLY task_scheduled_pkey ON task_scheduled (workflow_id, task_key)
ALTER TABLE task_scheduled ADD CONSTRAINT unique_workflow_id_task_key PRIMARY KEY USING INDEX task_scheduled_pkey

-- 10) poll_data
ALTER TABLE poll_data DROP CONSTRAINT IF EXISTS unique_poll_data;
ALTER TABLE poll_data DROP CONSTRAINT IF EXISTS poll_data_pkey;
ALTER TABLE poll_data DROP COLUMN IF EXISTS id;
-- ALTER TABLE poll_data ADD PRIMARY KEY (queue_name, domain);
CREATE UNIQUE INDEX CONCURRENTLY poll_data_pkey ON poll_data (queue_name, domain)
ALTER TABLE poll_data ADD CONSTRAINT unique_poll_data PRIMARY KEY USING INDEX poll_data_pkey

-- 11) event_execution
ALTER TABLE event_execution DROP CONSTRAINT IF EXISTS unique_event_execution;
ALTER TABLE event_execution DROP CONSTRAINT IF EXISTS event_execution_pkey;
ALTER TABLE event_execution DROP COLUMN IF EXISTS id;
-- ALTER TABLE event_execution ADD PRIMARY KEY (event_handler_name, event_name, execution_id);
CREATE UNIQUE INDEX CONCURRENTLY event_execution_pkey ON event_execution (event_handler_name, event_name, execution_id)
ALTER TABLE event_execution ADD CONSTRAINT unique_event_execution PRIMARY KEY USING INDEX event_execution_pkey

-- 12) meta_workflow_def
ALTER TABLE meta_workflow_def DROP CONSTRAINT IF EXISTS unique_name_version;
ALTER TABLE meta_workflow_def DROP CONSTRAINT IF EXISTS meta_workflow_def_pkey;
ALTER TABLE meta_workflow_def DROP COLUMN IF EXISTS id;
-- ALTER TABLE meta_workflow_def ADD PRIMARY KEY (name, version);
CREATE UNIQUE INDEX CONCURRENTLY meta_workflow_def_pkey ON meta_workflow_def (name, version)
ALTER TABLE meta_workflow_def ADD CONSTRAINT unique_name_version PRIMARY KEY USING INDEX meta_workflow_def_pkey

-- 13) meta_task_def
ALTER TABLE meta_task_def DROP CONSTRAINT IF EXISTS unique_task_def_name;
ALTER TABLE meta_task_def DROP CONSTRAINT IF EXISTS meta_task_def_pkey;
ALTER TABLE meta_task_def DROP COLUMN IF EXISTS id;
-- ALTER TABLE meta_task_def ADD PRIMARY KEY (name);
CREATE UNIQUE INDEX CONCURRENTLY meta_task_def_pkey ON meta_task_def (name)
ALTER TABLE meta_task_def ADD CONSTRAINT unique_task_def_name PRIMARY KEY USING INDEX meta_task_def_pkey
