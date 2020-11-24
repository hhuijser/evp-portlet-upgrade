drop database lportal;
create database lportal;

go

use lportal;

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


