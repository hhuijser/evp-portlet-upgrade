use master
exec sp_dboption 'lportal', 'allow nulls by default' , true
go

exec sp_dboption 'lportal', 'select into/bulkcopy/pllsort' , true
go

use lportal

create table KaleoAction (
	kaleoActionId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK decimal(20,0),
	kaleoDefinitionId decimal(20,0),
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description varchar(1000) null,
	executionType varchar(20) null,
	script text null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts varchar(1000) null,
	priority int
)
go

create table KaleoCondition (
	kaleoConditionId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoNodeId decimal(20,0),
	script text null,
	scriptLanguage varchar(75) null,
	scriptRequiredContexts varchar(1000) null
)
go

create table KaleoDefinition (
	kaleoDefinitionId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(200) null,
	title varchar(1000) null,
	description varchar(1000) null,
	content text null,
	version int,
	active_ int,
	startKaleoNodeId decimal(20,0)
)
go

create table KaleoInstance (
	kaleoInstanceId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoDefinitionName varchar(200) null,
	kaleoDefinitionVersion int,
	rootKaleoInstanceTokenId decimal(20,0),
	className varchar(200) null,
	classPK decimal(20,0),
	completed int,
	completionDate datetime null,
	workflowContext text null
)
go

create table KaleoInstanceToken (
	kaleoInstanceTokenId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoInstanceId decimal(20,0),
	parentKaleoInstanceTokenId decimal(20,0),
	currentKaleoNodeId decimal(20,0),
	currentKaleoNodeName varchar(200) null,
	className varchar(200) null,
	classPK decimal(20,0),
	completed int,
	completionDate datetime null
)
go

create table KaleoLog (
	kaleoLogId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK decimal(20,0),
	kaleoDefinitionId decimal(20,0),
	kaleoInstanceId decimal(20,0),
	kaleoInstanceTokenId decimal(20,0),
	kaleoTaskInstanceTokenId decimal(20,0),
	kaleoNodeName varchar(200) null,
	terminalKaleoNode int,
	kaleoActionId decimal(20,0),
	kaleoActionName varchar(200) null,
	kaleoActionDescription varchar(1000) null,
	previousKaleoNodeId decimal(20,0),
	previousKaleoNodeName varchar(200) null,
	previousAssigneeClassName varchar(200) null,
	previousAssigneeClassPK decimal(20,0),
	currentAssigneeClassName varchar(200) null,
	currentAssigneeClassPK decimal(20,0),
	type_ varchar(50) null,
	comment_ text null,
	startDate datetime null,
	endDate datetime null,
	duration decimal(20,0),
	workflowContext text null
)
go

create table KaleoNode (
	kaleoNodeId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	name varchar(200) null,
	metadata varchar(1000) null,
	description varchar(1000) null,
	type_ varchar(20) null,
	initial_ int,
	terminal int
)
go

create table KaleoNotification (
	kaleoNotificationId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK decimal(20,0),
	kaleoDefinitionId decimal(20,0),
	kaleoNodeName varchar(200) null,
	name varchar(200) null,
	description varchar(1000) null,
	executionType varchar(20) null,
	template text null,
	templateLanguage varchar(75) null,
	notificationTypes varchar(25) null
)
go

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoNotificationId decimal(20,0),
	recipientClassName varchar(200) null,
	recipientClassPK decimal(20,0),
	recipientRoleType int,
	address varchar(255) null
)
go

create table KaleoTask (
	kaleoTaskId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoNodeId decimal(20,0),
	name varchar(200) null,
	description varchar(1000) null
)
go

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK decimal(20,0),
	kaleoDefinitionId decimal(20,0),
	kaleoNodeId decimal(20,0),
	assigneeClassName varchar(200) null,
	assigneeClassPK decimal(20,0),
	assigneeActionId varchar(75) null,
	assigneeScript text null,
	assigneeScriptLanguage varchar(75) null,
	assigneeScriptRequiredContexts varchar(1000) null
)
go

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoInstanceId decimal(20,0),
	kaleoInstanceTokenId decimal(20,0),
	kaleoTaskInstanceTokenId decimal(20,0),
	kaleoTaskId decimal(20,0),
	kaleoTaskName varchar(200) null,
	assigneeClassName varchar(200) null,
	assigneeClassPK decimal(20,0),
	completed int,
	completionDate datetime null
)
go

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoInstanceId decimal(20,0),
	kaleoInstanceTokenId decimal(20,0),
	kaleoTaskId decimal(20,0),
	kaleoTaskName varchar(200) null,
	className varchar(200) null,
	classPK decimal(20,0),
	completionUserId decimal(20,0),
	completed int,
	completionDate datetime null,
	dueDate datetime null,
	workflowContext text null
)
go

create table KaleoTimer (
	kaleoTimerId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK decimal(20,0),
	kaleoDefinitionId decimal(20,0),
	name varchar(75) null,
	blocking int,
	description varchar(1000) null,
	duration float,
	scale varchar(75) null,
	recurrenceDuration float,
	recurrenceScale varchar(75) null
)
go

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName varchar(200) null,
	kaleoClassPK decimal(20,0),
	kaleoDefinitionId decimal(20,0),
	kaleoInstanceId decimal(20,0),
	kaleoInstanceTokenId decimal(20,0),
	kaleoTaskInstanceTokenId decimal(20,0),
	kaleoTimerId decimal(20,0),
	kaleoTimerName varchar(200) null,
	blocking int,
	completionUserId decimal(20,0),
	completed int,
	completionDate datetime null,
	workflowContext text null
)
go

create table KaleoTransition (
	kaleoTransitionId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId decimal(20,0),
	kaleoNodeId decimal(20,0),
	name varchar(200) null,
	description varchar(1000) null,
	sourceKaleoNodeId decimal(20,0),
	sourceKaleoNodeName varchar(200) null,
	targetKaleoNodeId decimal(20,0),
	targetKaleoNodeName varchar(200) null,
	defaultTransition int
)
go




