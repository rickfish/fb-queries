select count(*) from conductor_prod.workflow w, conductor_prod.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def like 'IMM_%' AND w.created_on between '2019-09-20' and '2019-10-01';

select count(*) from conductor_stage.workflow w, conductor_stage.workflow_def_to_workflow wd where w.workflow_id = wd.workflow_id 
	and wd.workflow_def like 'IMM_%' AND w.created_on between '2019-09-20' and '2019-10-01';
