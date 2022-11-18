SELECT c.* FROM workflows w 
	inner join workflow_capabilities wc ON w.id = wc.workflowsid 
	INNER JOIN capabilities c ON wc.capabilitiesid = c.id
	WHERE w.DATA->>'name' = 'IMM_MMP_TRIGGERPROCESS_WF'
	AND w.status = 2
	AND w.environment = 'TEST';    
