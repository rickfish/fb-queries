ALTER TABLE task_in_progress DROP CONSTRAINT IF EXISTS unique_task_def_task_id1;
ALTER TABLE task_in_progress DROP CONSTRAINT IF EXISTS task_in_progress_pkey;
ALTER TABLE task_in_progress DROP COLUMN IF EXISTS id;
CREATE UNIQUE INDEX task_in_progress_pkey ON task_in_progress (task_def_name, task_id)
ALTER TABLE task_in_progress ADD CONSTRAINT unique_task_def_task_id1 PRIMARY KEY USING INDEX task_in_progress_pkey

ALTER TABLE task_scheduled DROP CONSTRAINT IF EXISTS unique_workflow_id_task_key;
ALTER TABLE task_scheduled DROP CONSTRAINT IF EXISTS task_scheduled_pkey;
ALTER TABLE task_scheduled DROP COLUMN IF EXISTS id;
CREATE UNIQUE INDEX task_scheduled_pkey ON task_scheduled (workflow_id, task_key)
ALTER TABLE task_scheduled ADD CONSTRAINT unique_workflow_id_task_key PRIMARY KEY USING INDEX task_scheduled_pkey

SELECT w.json_data FROM conductor_prod.workflow w LEFT JOIN conductor_prod.workflow_def_to_workflow wd ON w.workflow_id = wd.workflow_id WHERE w.correlation_id = '4-5992738' AND wd.workflow_def = 'EIT_EEB_BUS_EXCEPTION_WF' FOR SHARE SKIP LOCKED;
CREATE INDEX workflow_def_index ON workflow_def_to_workflow (workflow_def)
