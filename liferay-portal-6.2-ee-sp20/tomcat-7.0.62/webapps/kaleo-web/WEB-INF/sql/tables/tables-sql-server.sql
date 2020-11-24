create table KaleoAction (
	kaleoActionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName nvarchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName nvarchar(200) null,
	name nvarchar(200) null,
	description nvarchar(2000) null,
	executionType nvarchar(20) null,
	script nvarchar(max) null,
	scriptLanguage nvarchar(75) null,
	scriptRequiredContexts nvarchar(2000) null,
	priority int
);

create table KaleoCondition (
	kaleoConditionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	script nvarchar(max) null,
	scriptLanguage nvarchar(75) null,
	scriptRequiredContexts nvarchar(2000) null
);

create table KaleoDefinition (
	kaleoDefinitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	name nvarchar(200) null,
	title nvarchar(2000) null,
	description nvarchar(2000) null,
	content nvarchar(max) null,
	version int,
	active_ bit,
	startKaleoNodeId bigint
);

create table KaleoInstance (
	kaleoInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoDefinitionName nvarchar(200) null,
	kaleoDefinitionVersion int,
	rootKaleoInstanceTokenId bigint,
	className nvarchar(200) null,
	classPK bigint,
	completed bit,
	completionDate datetime null,
	workflowContext nvarchar(max) null
);

create table KaleoInstanceToken (
	kaleoInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	parentKaleoInstanceTokenId bigint,
	currentKaleoNodeId bigint,
	currentKaleoNodeName nvarchar(200) null,
	className nvarchar(200) null,
	classPK bigint,
	completed bit,
	completionDate datetime null
);

create table KaleoLog (
	kaleoLogId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName nvarchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoNodeName nvarchar(200) null,
	terminalKaleoNode bit,
	kaleoActionId bigint,
	kaleoActionName nvarchar(200) null,
	kaleoActionDescription nvarchar(2000) null,
	previousKaleoNodeId bigint,
	previousKaleoNodeName nvarchar(200) null,
	previousAssigneeClassName nvarchar(200) null,
	previousAssigneeClassPK bigint,
	currentAssigneeClassName nvarchar(200) null,
	currentAssigneeClassPK bigint,
	type_ nvarchar(50) null,
	comment_ nvarchar(max) null,
	startDate datetime null,
	endDate datetime null,
	duration bigint,
	workflowContext nvarchar(max) null
);

create table KaleoNode (
	kaleoNodeId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	name nvarchar(200) null,
	metadata nvarchar(2000) null,
	description nvarchar(2000) null,
	type_ nvarchar(20) null,
	initial_ bit,
	terminal bit
);

create table KaleoNotification (
	kaleoNotificationId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName nvarchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeName nvarchar(200) null,
	name nvarchar(200) null,
	description nvarchar(2000) null,
	executionType nvarchar(20) null,
	template nvarchar(max) null,
	templateLanguage nvarchar(75) null,
	notificationTypes nvarchar(25) null
);

create table KaleoNotificationRecipient (
	kaleoNotificationRecipientId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNotificationId bigint,
	recipientClassName nvarchar(200) null,
	recipientClassPK bigint,
	recipientRoleType int,
	address nvarchar(255) null
);

create table KaleoTask (
	kaleoTaskId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name nvarchar(200) null,
	description nvarchar(2000) null
);

create table KaleoTaskAssignment (
	kaleoTaskAssignmentId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName nvarchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	assigneeClassName nvarchar(200) null,
	assigneeClassPK bigint,
	assigneeActionId nvarchar(75) null,
	assigneeScript nvarchar(max) null,
	assigneeScriptLanguage nvarchar(75) null,
	assigneeScriptRequiredContexts nvarchar(2000) null
);

create table KaleoTaskAssignmentInstance (
	kaleoTaskAssignmentInstanceId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName nvarchar(200) null,
	assigneeClassName nvarchar(200) null,
	assigneeClassPK bigint,
	completed bit,
	completionDate datetime null
);

create table KaleoTaskInstanceToken (
	kaleoTaskInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskId bigint,
	kaleoTaskName nvarchar(200) null,
	className nvarchar(200) null,
	classPK bigint,
	completionUserId bigint,
	completed bit,
	completionDate datetime null,
	dueDate datetime null,
	workflowContext nvarchar(max) null
);

create table KaleoTimer (
	kaleoTimerId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName nvarchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	name nvarchar(75) null,
	blocking bit,
	description nvarchar(2000) null,
	duration float,
	scale nvarchar(75) null,
	recurrenceDuration float,
	recurrenceScale nvarchar(75) null
);

create table KaleoTimerInstanceToken (
	kaleoTimerInstanceTokenId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoClassName nvarchar(200) null,
	kaleoClassPK bigint,
	kaleoDefinitionId bigint,
	kaleoInstanceId bigint,
	kaleoInstanceTokenId bigint,
	kaleoTaskInstanceTokenId bigint,
	kaleoTimerId bigint,
	kaleoTimerName nvarchar(200) null,
	blocking bit,
	completionUserId bigint,
	completed bit,
	completionDate datetime null,
	workflowContext nvarchar(max) null
);

create table KaleoTransition (
	kaleoTransitionId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(200) null,
	createDate datetime null,
	modifiedDate datetime null,
	kaleoDefinitionId bigint,
	kaleoNodeId bigint,
	name nvarchar(200) null,
	description nvarchar(2000) null,
	sourceKaleoNodeId bigint,
	sourceKaleoNodeName nvarchar(200) null,
	targetKaleoNodeId bigint,
	targetKaleoNodeName nvarchar(200) null,
	defaultTransition bit
);
