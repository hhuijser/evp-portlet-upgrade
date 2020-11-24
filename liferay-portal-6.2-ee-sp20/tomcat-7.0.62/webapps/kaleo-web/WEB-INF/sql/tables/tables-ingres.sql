create table KaleoAction (
	kaleoActionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description varchar(1000) null,
	executionType varchar(20) null,
	script long varchar null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts varchar(1000) null,
	priority integer
);

create table KaleoCondition (
	kaleoConditionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	script long varchar null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts varchar(1000) null
);

create table KaleoDefinition (
	kaleoDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(200) null,
	title varchar(1000) null,
	description varchar(1000) null,
	content long varchar null,
	version integer,
	active_ tinyint,
	startKaleoNodeId bigint
);

create table KaleoInstance (
	kaleoInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	kaleoDefinitionName varchar(200) null,
	kaleoDefinitionVersion integer,
	rootKaleoInstanceTokenId bigint,
	className varchar(200) null,
	classPK bigint,
	completed tinyint,
	completionDate timestamp null,
	workflowContext long varchar null
);

create table KaleoInstanceToken (
	kaleoInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	parentKaleoInstanceTokenId bigint,
	currentKaleoNodeId bigint,
	currentKaleoNodeName varchar(200) null,
	className varchar(200) null,
	classPK bigint,
	completed tinyint,
	completionDate timestamp null
);

create table KaleoLog (
	kaleoLogId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoNodeName varchar(200) null,
	terminalKaleoNode tinyint,
	kaleoActionId bigint,
	kaleoActionName varchar(200) null,
	kaleoActionDescription varchar(1000) null,
	previousKaleoNodeId bigint,
	previousKaleoNodeName varchar(200) null,
	previousAssigneeClassName varchar(200) null,
	previousAssigneeClassPK bigint,
	currentAssigneeClassName varchar(200) null,
	currentAssigneeClassPK bigint,
	type_ varchar(50) null,
	comment_ long varchar null,
	startDate timestamp null,
	endDate timestamp null,
	duration bigint,
	workflowContext long varchar null
);

create table KaleoNode (
	kaleoNodeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	name varchar(200) null,
	metadata varchar(1000) null,
	description varchar(1000) null,
	type_ varchar(20) null,
	initial_ tinyint,
	terminal tinyint
);

create table KaleoNotification (
	kaleoNotificationId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description varchar(1000) null,
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
	createDate timestamp null,
	modifiedDate timestamp null,
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
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200) null,
	description varchar(1000) null
);

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	assigneeClassName varchar(200) null,
	assigneeClassPK bigint,
	assigneeActionId varchar(75) null,
	assigneeScript long varchar null,
	assigneeScriptLanguage varchar(75) null,
	assigneeScriptRequiredContexts varchar(1000) null
);

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200) null,
	assigneeClassName varchar(200) null,
	assigneeClassPK bigint,
	completed tinyint,
	completionDate timestamp null
);

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200) null,
	className varchar(200) null,
	classPK bigint,
	completionUserId bigint,
	completed tinyint,
	completionDate timestamp null,
	dueDate timestamp null,
	workflowContext long varchar null
);

create table KaleoTimer (
	kaleoTimerId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	name varchar(75) null,
	blocking tinyint,
	description varchar(1000) null,
	duration float,
	scale varchar(75) null,
	recurrenceDuration float,
	recurrenceScale varchar(75) null
);

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTimerId bigint,
	kaleoTimerName varchar(200) null,
	blocking tinyint,
	completionUserId bigint,
	completed tinyint,
	completionDate timestamp null,
	workflowContext long varchar null
);

create table KaleoTransition (
	kaleoTransitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200) null,
	description varchar(1000) null,
	sourceKaleoNodeId bigint,
	sourceKaleoNodeName varchar(200) null,
	targetKaleoNodeId bigint,
	targetKaleoNodeName varchar(200) null,
	defaultTransition tinyint
);
