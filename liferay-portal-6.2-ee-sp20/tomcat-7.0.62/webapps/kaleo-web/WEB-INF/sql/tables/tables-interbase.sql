create table KaleoAction (
	kaleoActionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK int64,
	kaleoDefinitionId int64,
	kaleoNodeName varchar(200),
	name varchar(200),
	description varchar(4000),
	executionType varchar(20),
	script blob,
	scriptLanguage varchar(75),
	scriptRequiredContexts varchar(4000),
	priority integer
);

create table KaleoCondition (
	kaleoConditionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoNodeId int64,
	script blob,
	scriptLanguage varchar(75),
	scriptRequiredContexts varchar(4000)
);

create table KaleoDefinition (
	kaleoDefinitionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(200),
	title varchar(4000),
	description varchar(4000),
	content blob,
	version integer,
	active_ smallint,
	startKaleoNodeId int64
);

create table KaleoInstance (
	kaleoInstanceId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoDefinitionName varchar(200),
	kaleoDefinitionVersion integer,
	rootKaleoInstanceTokenId int64,
	className varchar(200),
	classPK int64,
	completed smallint,
	completionDate timestamp,
	workflowContext blob
);

create table KaleoInstanceToken (
	kaleoInstanceTokenId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoInstanceId int64,
	parentKaleoInstanceTokenId int64,
	currentKaleoNodeId int64,
	currentKaleoNodeName varchar(200),
	className varchar(200),
	classPK int64,
	completed smallint,
	completionDate timestamp
);

create table KaleoLog (
	kaleoLogId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK int64,
	kaleoDefinitionId int64,
	kaleoInstanceId int64,
	kaleoInstanceTokenId int64,
	kaleoTaskInstanceTokenId int64,
	kaleoNodeName varchar(200),
	terminalKaleoNode smallint,
	kaleoActionId int64,
	kaleoActionName varchar(200),
	kaleoActionDescription varchar(4000),
	previousKaleoNodeId int64,
	previousKaleoNodeName varchar(200),
	previousAssigneeClassName varchar(200),
	previousAssigneeClassPK int64,
	currentAssigneeClassName varchar(200),
	currentAssigneeClassPK int64,
	type_ varchar(50),
	comment_ blob,
	startDate timestamp,
	endDate timestamp,
	duration int64,
	workflowContext blob
);

create table KaleoNode (
	kaleoNodeId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	name varchar(200),
	metadata varchar(4000),
	description varchar(4000),
	type_ varchar(20),
	initial_ smallint,
	terminal smallint
);

create table KaleoNotification (
	kaleoNotificationId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK int64,
	kaleoDefinitionId int64,
	kaleoNodeName varchar(200),
	name varchar(200),
	description varchar(4000),
	executionType varchar(20),
	template blob,
	templateLanguage varchar(75),
	notificationTypes varchar(25)
);

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoNotificationId int64,
	recipientClassName varchar(200),
	recipientClassPK int64,
	recipientRoleType integer,
	address varchar(255)
);

create table KaleoTask (
	kaleoTaskId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoNodeId int64,
	name varchar(200),
	description varchar(4000)
);

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK int64,
	kaleoDefinitionId int64,
	kaleoNodeId int64,
	assigneeClassName varchar(200),
	assigneeClassPK int64,
	assigneeActionId varchar(75),
	assigneeScript blob,
	assigneeScriptLanguage varchar(75),
	assigneeScriptRequiredContexts varchar(4000)
);

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoInstanceId int64,
	kaleoInstanceTokenId int64,
	kaleoTaskInstanceTokenId int64,
	kaleoTaskId int64,
	kaleoTaskName varchar(200),
	assigneeClassName varchar(200),
	assigneeClassPK int64,
	completed smallint,
	completionDate timestamp
);

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoInstanceId int64,
	kaleoInstanceTokenId int64,
	kaleoTaskId int64,
	kaleoTaskName varchar(200),
	className varchar(200),
	classPK int64,
	completionUserId int64,
	completed smallint,
	completionDate timestamp,
	dueDate timestamp,
	workflowContext blob
);

create table KaleoTimer (
	kaleoTimerId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK int64,
	kaleoDefinitionId int64,
	name varchar(75),
	blocking smallint,
	description varchar(4000),
	duration double precision,
	scale varchar(75),
	recurrenceDuration double precision,
	recurrenceScale varchar(75)
);

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoClassName varchar(200),
	kaleoClassPK int64,
	kaleoDefinitionId int64,
	kaleoInstanceId int64,
	kaleoInstanceTokenId int64,
	kaleoTaskInstanceTokenId int64,
	kaleoTimerId int64,
	kaleoTimerName varchar(200),
	blocking smallint,
	completionUserId int64,
	completed smallint,
	completionDate timestamp,
	workflowContext blob
);

create table KaleoTransition (
	kaleoTransitionId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(200),
	createDate timestamp,
	modifiedDate timestamp,
	kaleoDefinitionId int64,
	kaleoNodeId int64,
	name varchar(200),
	description varchar(4000),
	sourceKaleoNodeId int64,
	sourceKaleoNodeName varchar(200),
	targetKaleoNodeId int64,
	targetKaleoNodeName varchar(200),
	defaultTransition smallint
);
