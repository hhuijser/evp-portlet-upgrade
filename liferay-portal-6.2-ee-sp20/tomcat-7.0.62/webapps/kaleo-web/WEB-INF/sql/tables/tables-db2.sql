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
