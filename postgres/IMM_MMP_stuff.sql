select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_TASKINITIATION_WF' and w.created_on >= '2019-09-30T00:00:00';

select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_TASKINITIATION_WF' and w.created_on >= '2019-09-30T00:00:00' and w.json_data like '%"status":"COMPLETED"%';

select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_TASKINITIATION_WF';

select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_TASKINITIATION_WF' and (w.json_data like '%"status":"COMPLETED"%' OR w.json_data like '%"status":"FAILED"%');

select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_APPLYGLOBALRULES_TASK_WF';

select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_APPLYGLOBALRULES_TASK_WF' and (w.json_data like '%"status":"COMPLETED"%' OR w.json_data like '%"status":"FAILED"%');

select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_TASKINITIATION_WF' and w.created_on >= '2019-09-30T17:00:00' and w.json_data like '%"status":"COMPLETED"%';

select COUNT(*) from conductor_prod.task_in_progress where task_def_name = 'IMM_MMP_TASKDUPLICATECHECK_TASK' and in_progress_status = true;

select COUNT(*) from conductor_prod.task_in_progress where in_progress_status = true;

select TASK_ID, workflow_id, CREATED_ON, MODIFIED_ON from conductor_prod.task_in_progress where modified_on > '2019-09-30T17:00:00' 
	and task_def_name = 'IMM_MMP_TASKDUPLICATECHECK_TASK' ORDER BY created_on asc;

select TASK_ID, workflow_id, CREATED_ON, MODIFIED_ON from conductor_prod.task_scheduled 
	where task_key like 'JW_TaskDuplicateCheck%' ORDER BY modified_on asc;

select * from conductor_prod.task where task_id = '489161fd-7962-40ae-b5bc-6065dc4c25e0';

SELECT DISTINCT TASK_KEY FROM conductor_prod.task_scheduled;

select COUNT(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def = 'IMM_MMP_TASKINITIATION_WF' and w.created_on >= '2019-09-30T17:00:00';

select count(*) from conductor_stage.workflow w, conductor_stage.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def like 'IMM_%' AND w.created_on between '2019-09-20' and '2019-10-01';

select count(*) from conductor_prod.workflow_pending where workflow_id in (
select workflow_id from conductor_prod.workflow_def_to_workflow where workflow_def='IMM_MMP_TRIGGERTOTASK_WF');

select * from conductor_prod.workflow where json_data->>'status' = 'RUNNING';

select count(*) from conductor_prod.queue_message where queue_name like 'IMM%';
select count(*) from conductor_prod.queue_message where queue_name = 'IMM_MMP_TASKDUPLICATECHECK_TASK';
