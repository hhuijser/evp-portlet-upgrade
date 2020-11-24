create table KaleoAction (
	kaleoActionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoClassName varchar(200),
	kaleoClassPK int8,
	kaleoDefinitionId int8,
	kaleoNodeName varchar(200),
	name varchar(200),
	description lvarchar,
	executionType varchar(20),
	script text,
	scriptLanguage varchar(75),
	scriptRequiredContexts lvarchar,
	priority int
)
extent size 16 next size 16
lock mode row;

create table KaleoCondition (
	kaleoConditionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoNodeId int8,
	script text,
	scriptLanguage varchar(75),
	scriptRequiredContexts lvarchar
)
extent size 16 next size 16
lock mode row;

create table KaleoDefinition (
	kaleoDefinitionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(200),
	title lvarchar,
	description lvarchar,
	content text,
	version int,
	active_ boolean,
	startKaleoNodeId int8
)
extent size 16 next size 16
lock mode row;

create table KaleoInstance (
	kaleoInstanceId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoDefinitionName varchar(200),
	kaleoDefinitionVersion int,
	rootKaleoInstanceTokenId int8,
	className varchar(200),
	classPK int8,
	completed boolean,
	completionDate datetime YEAR TO FRACTION,
	workflowContext text
)
extent size 16 next size 16
lock mode row;

create table KaleoInstanceToken (
	kaleoInstanceTokenId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoInstanceId int8,
	parentKaleoInstanceTokenId int8,
	currentKaleoNodeId int8,
	currentKaleoNodeName varchar(200),
	className varchar(200),
	classPK int8,
	completed boolean,
	completionDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table KaleoLog (
	kaleoLogId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoClassName varchar(200),
	kaleoClassPK int8,
	kaleoDefinitionId int8,
	kaleoInstanceId int8,
	kaleoInstanceTokenId int8,
	kaleoTaskInstanceTokenId int8,
	kaleoNodeName varchar(200),
	terminalKaleoNode boolean,
	kaleoActionId int8,
	kaleoActionName varchar(200),
	kaleoActionDescription lvarchar,
	previousKaleoNodeId int8,
	previousKaleoNodeName varchar(200),
	previousAssigneeClassName varchar(200),
	previousAssigneeClassPK int8,
	currentAssigneeClassName varchar(200),
	currentAssigneeClassPK int8,
	type_ varchar(50),
	comment_ text,
	startDate datetime YEAR TO FRACTION,
	endDate datetime YEAR TO FRACTION,
	duration int8,
	workflowContext text
)
extent size 16 next size 16
lock mode row;

create table KaleoNode (
	kaleoNodeId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	name varchar(200),
	metadata lvarchar,
	description lvarchar,
	type_ varchar(20),
	initial_ boolean,
	terminal boolean
)
extent size 16 next size 16
lock mode row;

create table KaleoNotification (
	kaleoNotificationId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoClassName varchar(200),
	kaleoClassPK int8,
	kaleoDefinitionId int8,
	kaleoNodeName varchar(200),
	name varchar(200),
	description lvarchar,
	executionType varchar(20),
	template text,
	templateLanguage varchar(75),
	notificationTypes varchar(25)
)
extent size 16 next size 16
lock mode row;

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoNotificationId int8,
	recipientClassName varchar(200),
	recipientClassPK int8,
	recipientRoleType int,
	address varchar(255)
)
extent size 16 next size 16
lock mode row;

create table KaleoTask (
	kaleoTaskId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoNodeId int8,
	name varchar(200),
	description lvarchar
)
extent size 16 next size 16
lock mode row;

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoClassName varchar(200),
	kaleoClassPK int8,
	kaleoDefinitionId int8,
	kaleoNodeId int8,
	assigneeClassName varchar(200),
	assigneeClassPK int8,
	assigneeActionId varchar(75),
	assigneeScript text,
	assigneeScriptLanguage varchar(75),
	assigneeScriptRequiredContexts lvarchar
)
extent size 16 next size 16
lock mode row;

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoInstanceId int8,
	kaleoInstanceTokenId int8,
	kaleoTaskInstanceTokenId int8,
	kaleoTaskId int8,
	kaleoTaskName varchar(200),
	assigneeClassName varchar(200),
	assigneeClassPK int8,
	completed boolean,
	completionDate datetime YEAR TO FRACTION
)
extent size 16 next size 16
lock mode row;

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoInstanceId int8,
	kaleoInstanceTokenId int8,
	kaleoTaskId int8,
	kaleoTaskName varchar(200),
	className varchar(200),
	classPK int8,
	completionUserId int8,
	completed boolean,
	completionDate datetime YEAR TO FRACTION,
	dueDate datetime YEAR TO FRACTION,
	workflowContext text
)
extent size 16 next size 16
lock mode row;

create table KaleoTimer (
	kaleoTimerId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoClassName varchar(200),
	kaleoClassPK int8,
	kaleoDefinitionId int8,
	name varchar(75),
	blocking boolean,
	description lvarchar,
	duration float,
	scale varchar(75),
	recurrenceDuration float,
	recurrenceScale varchar(75)
)
extent size 16 next size 16
lock mode row;

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoClassName varchar(200),
	kaleoClassPK int8,
	kaleoDefinitionId int8,
	kaleoInstanceId int8,
	kaleoInstanceTokenId int8,
	kaleoTaskInstanceTokenId int8,
	kaleoTimerId int8,
	kaleoTimerName varchar(200),
	blocking boolean,
	completionUserId int8,
	completed boolean,
	completionDate datetime YEAR TO FRACTION,
	workflowContext text
)
extent size 16 next size 16
lock mode row;

create table KaleoTransition (
	kaleoTransitionId int8 not null primary key,
	groupId int8,
	companyId int8,
	userId int8,
	userName varchar(200),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	kaleoDefinitionId int8,
	kaleoNodeId int8,
	name varchar(200),
	description lvarchar,
	sourceKaleoNodeId int8,
	sourceKaleoNodeName varchar(200),
	targetKaleoNodeId int8,
	targetKaleoNodeName varchar(200),
	defaultTransition boolean
)
extent size 16 next size 16
lock mode row;
