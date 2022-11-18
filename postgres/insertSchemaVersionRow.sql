INSERT INTO schema_version (installed_rank, VERSION, description, TYPE, script, checksum, installed_by, installed_on, execution_time, success)
	VALUES(6, '5', 'new queue message pk', 'SQL', 'V5__new_queue_message_pk.sql', 2055329264, 'svc-sioetdp', '2021-03-21 20:48:03.493515'::timestamp, 7052, 'true');
INSERT INTO schema_version (installed_rank, VERSION, description, TYPE, script, checksum, installed_by, installed_on, execution_time, success)
	VALUES(7, '6', 'update pk', 'SQL', 'V6__update_pk.sql', -2071804862, 'svc-sioetdp', '2021-03-21 21:10:06.818857'::timestamp, 1063686, 'true');
INSERT INTO schema_version (installed_rank, VERSION, description, TYPE, script, checksum, installed_by, installed_on, execution_time, success)
	VALUES(8, '7', 'new qm index desc priority', 'SQL', 'V7__new_qm_index_desc_priority.sql', 259619550, 'svc-sioetdp', '2021-03-21 21:27:51.064071'::timestamp, 2539, 'true');
