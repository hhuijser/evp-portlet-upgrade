drop database lportal;
create database lportal pagesize 8192;
connect to lportal;
create table KaleoAction (
	kaleoActionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200),
	name varchar(200),
	description varchar(750),
	executionType varchar(20),
	script clob,
	scriptLanguage varchar(75),
	scriptRequiredContexts varchar(750),
	priority integer
);

create table KaleoCondition (
	kaleoConditionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	script clob,
	scriptLanguage varchar(75),
	scriptRequiredContexts varchar(750)
);

create table KaleoDefinition (
	kaleoDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(200),
	title varchar(750),
	description varchar(750),
	content clob,
	version integer,
	active_ smallint,
	startKaleoNodeId bigint
);

create table KaleoInstance (
	kaleoInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoDefinitionName varchar(200),
	kaleoDefinitionVersion integer,
	rootKaleoInstanceTokenId bigint,
	className varchar(200),
	classPK bigint,
	completed smallint,
	completionDate timestamp,
	workflowContext clob
);

create table KaleoInstanceToken (
	kaleoInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	parentKaleoInstanceTokenId bigint,
	currentKaleoNodeId bigint,
	currentKaleoNodeName varchar(200),
	className varchar(200),
	classPK bigint,
	completed smallint,
	completionDate timestamp
);

create table KaleoLog (
	kaleoLogId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoNodeName varchar(200),
	terminalKaleoNode smallint,
	kaleoActionId bigint,
	kaleoActionName varchar(200),
	kaleoActionDescription varchar(750),
	previousKaleoNodeId bigint,
	previousKaleoNodeName varchar(200),
	previousAssigneeClassName varchar(200),
	previousAssigneeClassPK bigint,
	currentAssigneeClassName varchar(200),
	currentAssigneeClassPK bigint,
	type_ varchar(50),
	comment_ clob,
	startDate timestamp,
	endDate timestamp,
	duration bigint,
	workflowContext clob
);

create table KaleoNode (
	kaleoNodeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	name varchar(200),
	metadata varchar(750),
	description varchar(750),
	type_ varchar(20),
	initial_ smallint,
	terminal smallint
);

create table KaleoNotification (
	kaleoNotificationId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200),
	name varchar(200),
	description varchar(750),
	executionType varchar(20),
	template clob,
	templateLanguage varchar(75),
	notificationTypes varchar(25)
);

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoNotificationId bigint,
	recipientClassName varchar(200),
	recipientClassPK bigint,
	recipientRoleType integer,
	address varchar(255)
);

create table KaleoTask (
	kaleoTaskId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200),
	description varchar(750)
);

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	assigneeClassName varchar(200),
	assigneeClassPK bigint,
	assigneeActionId varchar(75),
	assigneeScript clob,
	assigneeScriptLanguage varchar(75),
	assigneeScriptRequiredContexts varchar(750)
);

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200),
	assigneeClassName varchar(200),
	assigneeClassPK bigint,
	completed smallint,
	completionDate timestamp
);

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200),
	className varchar(200),
	classPK bigint,
	completionUserId bigint,
	completed smallint,
	completionDate timestamp,
	dueDate timestamp,
	workflowContext clob
);

create table KaleoTimer (
	kaleoTimerId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	name varchar(75),
	blocking smallint,
	description varchar(750),
	duration double,
	scale varchar(75),
	recurrenceDuration double,
	recurrenceScale varchar(75)
);

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTimerId bigint,
	kaleoTimerName varchar(200),
	blocking smallint,
	completionUserId bigint,
	completed smallint,
	completionDate timestamp,
	workflowContext clob
);

create table KaleoTransition (
	kaleoTransitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200),
	description varchar(750),
	sourceKaleoNodeId bigint,
	sourceKaleoNodeName varchar(200),
	targetKaleoNodeId bigint,
	targetKaleoNodeName varchar(200),
	defaultTransition smallint
);


create index IX_50E9112C on KaleoAction (companyId);
create index IX_170EFD7A on KaleoAction (kaleoClassName, kaleoClassPK);
create index IX_4B2545E8 on KaleoAction (kaleoClassName, kaleoClassPK, executionType);
create index IX_F95A622 on KaleoAction (kaleoDefinitionId);

create index IX_FEE46067 on KaleoCondition (companyId);
create index IX_DC978A5D on KaleoCondition (kaleoDefinitionId);
create index IX_86CBD4C on KaleoCondition (kaleoNodeId);

create index IX_40B9112F on KaleoDefinition (companyId);
create index IX_408542BA on KaleoDefinition (companyId, active_);
create index IX_76C781AE on KaleoDefinition (companyId, name);
create index IX_4C23F11B on KaleoDefinition (companyId, name, active_);
create index IX_EC14F81A on KaleoDefinition (companyId, name, version);

create index IX_58D85ECB on KaleoInstance (className, classPK);
create index IX_5F2FCD2D on KaleoInstance (companyId);
create index IX_BF5839F8 on KaleoInstance (companyId, kaleoDefinitionName, kaleoDefinitionVersion, completionDate);
create index IX_C6D7A867 on KaleoInstance (companyId, userId);
create index IX_4DA4D123 on KaleoInstance (kaleoDefinitionId);
create index IX_ACF16238 on KaleoInstance (kaleoDefinitionId, completed);

create index IX_153721BE on KaleoInstanceToken (companyId);
create index IX_4A86923B on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId);
create index IX_360D34D9 on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId, completionDate);
create index IX_7BDB04B4 on KaleoInstanceToken (kaleoDefinitionId);
create index IX_F42AAFF6 on KaleoInstanceToken (kaleoInstanceId);

create index IX_73B5F4DE on KaleoLog (companyId);
create index IX_E66A153A on KaleoLog (kaleoClassName, kaleoClassPK, kaleoInstanceTokenId, type_);
create index IX_6C64B7D4 on KaleoLog (kaleoDefinitionId);
create index IX_5BC6AB16 on KaleoLog (kaleoInstanceId);
create index IX_470B9FF8 on KaleoLog (kaleoInstanceTokenId, type_);
create index IX_B0CDCA38 on KaleoLog (kaleoTaskInstanceTokenId);

create index IX_C4E9ACE0 on KaleoNode (companyId);
create index IX_F28C443E on KaleoNode (companyId, kaleoDefinitionId);
create index IX_32E94DD6 on KaleoNode (kaleoDefinitionId);

create index IX_38829497 on KaleoNotification (companyId);
create index IX_902D342F on KaleoNotification (kaleoClassName, kaleoClassPK);
create index IX_F3362E93 on KaleoNotification (kaleoClassName, kaleoClassPK, executionType);
create index IX_4B968E8D on KaleoNotification (kaleoDefinitionId);

create index IX_2C8C4AF4 on KaleoNotificationRecipient (companyId);
create index IX_AA6697EA on KaleoNotificationRecipient (kaleoDefinitionId);
create index IX_7F4FED02 on KaleoNotificationRecipient (kaleoNotificationId);

create index IX_E1F8B23D on KaleoTask (companyId);
create index IX_3FFA633 on KaleoTask (kaleoDefinitionId);
create index IX_77B3F1A2 on KaleoTask (kaleoNodeId);

create index IX_611732B0 on KaleoTaskAssignment (companyId);
create index IX_D835C576 on KaleoTaskAssignment (kaleoClassName, kaleoClassPK);
create index IX_1087068E on KaleoTaskAssignment (kaleoClassName, kaleoClassPK, assigneeClassName);
create index IX_575C03A6 on KaleoTaskAssignment (kaleoDefinitionId);

create index IX_945F4EB7 on KaleoTaskAssignmentInstance (assigneeClassName);
create index IX_3BD436FD on KaleoTaskAssignmentInstance (assigneeClassName, assigneeClassPK);
create index IX_6E3CDA1B on KaleoTaskAssignmentInstance (companyId);
create index IX_38A47B17 on KaleoTaskAssignmentInstance (groupId, assigneeClassPK);
create index IX_C851011 on KaleoTaskAssignmentInstance (kaleoDefinitionId);
create index IX_67A9EE93 on KaleoTaskAssignmentInstance (kaleoInstanceId);
create index IX_D4C2235B on KaleoTaskAssignmentInstance (kaleoTaskInstanceTokenId);

create index IX_A3271995 on KaleoTaskInstanceToken (className, classPK);
create index IX_997FE723 on KaleoTaskInstanceToken (companyId);
create index IX_608E9519 on KaleoTaskInstanceToken (kaleoDefinitionId);
create index IX_2CE1159B on KaleoTaskInstanceToken (kaleoInstanceId);
create index IX_B857A115 on KaleoTaskInstanceToken (kaleoInstanceId, kaleoTaskId);

create index IX_4DE6A889 on KaleoTimer (kaleoClassName, kaleoClassPK);
create index IX_1A479F32 on KaleoTimer (kaleoClassName, kaleoClassPK, blocking);

create index IX_DB96C55B on KaleoTimerInstanceToken (kaleoInstanceId);
create index IX_DB279423 on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed);
create index IX_9932524C on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed, blocking);
create index IX_13A5BA2C on KaleoTimerInstanceToken (kaleoInstanceTokenId, kaleoTimerId);

create index IX_41D6C6D on KaleoTransition (companyId);
create index IX_479F3063 on KaleoTransition (kaleoDefinitionId);
create index IX_A392DFD2 on KaleoTransition (kaleoNodeId);
create index IX_A38E2194 on KaleoTransition (kaleoNodeId, defaultTransition);
create index IX_85268A11 on KaleoTransition (kaleoNodeId, name);


