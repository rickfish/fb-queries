select distinct wdw.workflow_def, count(wdw.workflow_def) from queue_message qm
	inner join workflow_def_to_workflow wdw on wdw.workflow_id = qm.message_id
	where qm.queue_name = '_deciderQueue' group by wdw.workflow_def;
