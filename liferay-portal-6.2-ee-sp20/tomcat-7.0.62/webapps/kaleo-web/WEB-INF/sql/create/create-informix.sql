database sysmaster;
drop database lportal;
create database lportal WITH LOG;

create procedure 'lportal'.isnull(test_string varchar)
returning boolean;
IF test_string IS NULL THEN
	RETURN 't';
ELSE
	RETURN 'f';
END IF
end procedure;


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


