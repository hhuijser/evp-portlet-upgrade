create table KaleoAction (
	kaleoActionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description longtext null,
	executionType varchar(20) null,
	script longtext null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts longtext null,
	priority integer
) engine InnoDB;

create table KaleoCondition (
	kaleoConditionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	script longtext null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts longtext null
) engine InnoDB;

create table KaleoDefinition (
	kaleoDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(200) null,
	title longtext null,
	description longtext null,
	content longtext null,
	version integer,
	active_ tinyint,
	startKaleoNodeId bigint
) engine InnoDB;

create table KaleoInstance (
	kaleoInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoDefinitionName varchar(200) null,
	kaleoDefinitionVersion integer,
	rootKaleoInstanceTokenId bigint,
	className varchar(200) null,
	classPK bigint,
	completed tinyint,
	completionDate datetime null,
	workflowContext longtext null
) engine InnoDB;

create table KaleoInstanceToken (
	kaleoInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	parentKaleoInstanceTokenId bigint,
	currentKaleoNodeId bigint,
	currentKaleoNodeName varchar(200) null,
	className varchar(200) null,
	classPK bigint,
	completed tinyint,
	completionDate datetime null
) engine InnoDB;

create table KaleoLog (
	kaleoLogId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
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
	kaleoActionDescription longtext null,
	previousKaleoNodeId bigint,
	previousKaleoNodeName varchar(200) null,
	previousAssigneeClassName varchar(200) null,
	previousAssigneeClassPK bigint,
	currentAssigneeClassName varchar(200) null,
	currentAssigneeClassPK bigint,
	type_ varchar(50) null,
	comment_ longtext null,
	startDate datetime null,
	endDate datetime null,
	duration bigint,
	workflowContext longtext null
) engine InnoDB;

create table KaleoNode (
	kaleoNodeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	name varchar(200) null,
	metadata longtext null,
	description longtext null,
	type_ varchar(20) null,
	initial_ tinyint,
	terminal tinyint
) engine InnoDB;

create table KaleoNotification (
	kaleoNotificationId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description longtext null,
	executionType varchar(20) null,
	template longtext null,
	templateLanguage varchar(75) null,
	notificationTypes varchar(25) null
) engine InnoDB;

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNotificationId bigint,
	recipientClassName varchar(200) null,
	recipientClassPK bigint,
	recipientRoleType integer,
	address varchar(255) null
) engine InnoDB;

create table KaleoTask (
	kaleoTaskId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200) null,
	description longtext null
) engine InnoDB;

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	assigneeClassName varchar(200) null,
	assigneeClassPK bigint,
	assigneeActionId varchar(75) null,
	assigneeScript longtext null,
	assigneeScriptLanguage varchar(75) null,
	assigneeScriptRequiredContexts longtext null
) engine InnoDB;

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200) null,
	assigneeClassName varchar(200) null,
	assigneeClassPK bigint,
	completed tinyint,
	completionDate datetime null
) engine InnoDB;

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName varchar(200) null,
	className varchar(200) null,
	classPK bigint,
	completionUserId bigint,
	completed tinyint,
	completionDate datetime null,
	dueDate datetime null,
	workflowContext longtext null
) engine InnoDB;

create table KaleoTimer (
	kaleoTimerId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	name varchar(75) null,
	blocking tinyint,
	description longtext null,
	duration double,
	scale varchar(75) null,
	recurrenceDuration double,
	recurrenceScale varchar(75) null
) engine InnoDB;

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
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
	completionDate datetime null,
	workflowContext longtext null
) engine InnoDB;

create table KaleoTransition (
	kaleoTransitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name varchar(200) null,
	description longtext null,
	sourceKaleoNodeId bigint,
	sourceKaleoNodeName varchar(200) null,
	targetKaleoNodeId bigint,
	targetKaleoNodeName varchar(200) null,
	defaultTransition tinyint
) engine InnoDB;
