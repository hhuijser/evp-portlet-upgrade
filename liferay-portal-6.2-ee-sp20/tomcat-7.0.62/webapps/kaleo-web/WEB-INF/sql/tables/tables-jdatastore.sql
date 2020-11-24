create table KaleoAction (
	kaleoActionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description long varchar null,
	executionType varchar(20) null,
	script long varchar null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts long varchar null,
	priority integer
);

create table KaleoCondition (
	kaleoConditionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	script long varchar null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts long varchar null
);

create table KaleoDefinition (
	kaleoDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	name varchar(200) null,
	title long varchar null,
	description long varchar null,
	content long varchar null,
	version integer,
	active_ boolean,
	startKaleoNodeId bigint
);

create table KaleoInstance (
	kaleoInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoDefinitionName varchar(200) null,
	kaleoDefinitionVersion integer,
	rootKaleoInstanceTokenId bigint,
	className varchar(200) null,
	classPK bigint,
	completed boolean,
	completionDate date null,
	workflowContext long varchar null
);

create table KaleoInstanceToken (
	kaleoInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	parentKaleoInstanceTokenId bigint,
	currentKaleoNodeId bigint,
	currentKaleoNodeName varchar(200) null,
	className varchar(200) null,
	classPK bigint,
	completed boolean,
	completionDate date null
);

create table KaleoLog (
	kaleoLogId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoNodeName varchar(200) null,
	terminalKaleoNode boolean,
	kaleoActionId bigint,
	kaleoActionName varchar(200) null,
	kaleoActionDescription long varchar null,
	previousKaleoNodeId bigint,
	previousKaleoNodeName varchar(200) null,
	previousAssigneeClassName varchar(200) null,
	previousAssigneeClassPK bigint,
	currentAssigneeClassName varchar(200) null,
	currentAssigneeClassPK bigint,
	type_ varchar(50) null,
	comment_ long varchar null,
	startDate date null,
	endDate date null,
	duration bigint,
	workflowContext long varchar null
);

create table KaleoNode (
	kaleoNodeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	name varchar(200) null,
	metadata long varchar null,
	description long varchar null,
	type_ varchar(20) null,
	initial_ boolean,
	terminal boolean
);

create table KaleoNotification (
	kaleoNotificationId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description long varchar null,
	executionType varchar(20) null,
	template long varchar null,
	templateLanguage varchar(75) null,
	notificationTypes varchar(25) null
);

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoNotificationId bigint,
	recipientClassName varchar(200) null,
	recipientClassPK bigint,
	recipientRoleType integer,
	address varchar(255) null
);

create table KaleoTask (
	kaleoTaskId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200) null,
	description long varchar null
);

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	assigneeClassName varchar(200) null,
	assigneeClassPK bigint,
	assigneeActionId varchar(75) null,
	assigneeScript long varchar null,
	assigneeScriptLanguage varchar(75) null,
	assigneeScriptRequiredContexts long varchar null
);

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200) null,
	assigneeClassName varchar(200) null,
	assigneeClassPK bigint,
	completed boolean,
	completionDate date null
);

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200) null,
	className varchar(200) null,
	classPK bigint,
	completionUserId bigint,
	completed boolean,
	completionDate date null,
	dueDate date null,
	workflowContext long varchar null
);

create table KaleoTimer (
	kaleoTimerId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	name varchar(75) null,
	blocking boolean,
	description long varchar null,
	duration double,
	scale varchar(75) null,
	recurrenceDuration double,
	recurrenceScale varchar(75) null
);

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTimerId bigint,
	kaleoTimerName varchar(200) null,
	blocking boolean,
	completionUserId bigint,
	completed boolean,
	completionDate date null,
	workflowContext long varchar null
);

create table KaleoTransition (
	kaleoTransitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate date null,
	modifiedDate date null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200) null,
	description long varchar null,
	sourceKaleoNodeId bigint,
	sourceKaleoNodeName varchar(200) null,
	targetKaleoNodeId bigint,
	targetKaleoNodeName varchar(200) null,
	defaultTransition boolean
);
